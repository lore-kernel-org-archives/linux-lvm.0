From: Eric Sandeen <sandeen@sgi.com>
In-Reply-To: <3DB97752.EBA18F0F@splentec.com>
References: <3DB97752.EBA18F0F@splentec.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1035573423.25939.6.camel@stout.americas.sgi.com>
Mime-Version: 1.0
Subject: [linux-lvm] Re: Recent dissections
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Oct 25 14:22:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Luben Tuikov <luben@splentec.com>
Cc: linux-xfs <linux-xfs@oss.sgi.com>, linux-lvm <linux-lvm@sistina.com>

We do special handling of LVM and md in xfs_super.c:xfs_alloc_buftarg(),
(and page_buf.c:_pagebuf_page_io()) using only sector-sized buffer heads
for pagebufs in the LVM case, and only aligned I/O in the md case.

If you had xfs -> md -> lvm -> scsi, then I think this might explain
your problem, since XFS thinks it's talking to md, when in fact there is
LVM (more restrictive I/O) underneath it.

However, you say that you have xfs -> lvm -> md -> scsi, so I am still
confused...  Just for fun, you could try always setting 

btp->pbr_flags = PBR_SECTOR_ONLY;

in xfs_alloc_buftarg, and see if it makes a difference?

-Eric

On Fri, 2002-10-25 at 11:54, Luben Tuikov wrote:
> As the folks on linux-xfs know, I've recently tried to
> get xfs on top of lvm on top of raid5 on top of some
> scsi disks to work.
> 
> Here are some recent curiosities which for now seem
> to reconcile mount-s in D and BUG() in unlock_page():
> 
> Here is the basic framework:
> 
>  FS --> LVM --> md(raid5) --> scsi disks           (1)
> 
> when FS = ext2, the above set up works alright,
> when FS = xfs, then as you know either mount
> would sleep indefinitely on down(), or BUG() in unlock_page().
> 
> I've written a tiny SCSI simulator driver for
> block devices (non-SCSI; unrelated to all this),
> lets call it ``sbs''.
> 
> Strangely when the above set up is like so:
> 
>  xfs --> LVM --> sbs --> md(raid5) --> scsi disks  (2)
> 
> then everything works all right.
> 
> The only way I can explain this, is that the transformation
> that bh's get along the way down and up somehow confuse
> xfs in setup (1), (remember ext2 works all right in (1)),
> but when sbs is in between LVM and md then things are ok
> for xfs.
> 
> This ``solution'', was prompted by other curiosities we found
> out here, like when either md or LVM was missing from (1)
> with xfs, then things worked ok.
> 
> So, to make everyone happy, we put sbs in the middle of
> LVM and md (see (2)), so that from xfs's point of view
> it looks like LVM is talking to a scsi block device, and
> from md's point of view it looks like it (md) is getting
> its bh's from the linux block layer.
> 
> I hope those curiosities help ppl get some/any clue(s)
> as to what could be happening and resolve this -- especially
> those who know what fs/xfs/pagebuf/*.c is all about...
> 
> Bh's transformation, collecting them back into a page in
> xfs from xx_end_io(), etc... where could it be?
> 
> -- 
> Luben
> 
> P.S. No sensible performance penalties for putting sbs in
> the middle. But that's irrelevant.
> 
-- 
Eric Sandeen      XFS for Linux     http://oss.sgi.com/projects/xfs
sandeen@sgi.com   SGI, Inc.         651-683-3102
