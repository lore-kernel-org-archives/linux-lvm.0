Return-Path: <thornber@btconnect.com>
Date: Mon, 23 Apr 2001 11:58:50 +0100
Subject: Re: [linux-lvm] Split patch sets for beta[345]
Message-ID: <20010423115850.A1188@66bassett.freeserve.co.uk>
References: <20010422125226.A10274@66bassett.freeserve.co.uk> <200104231044.f3NAiUwL001186@webber.adilger.int>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200104231044.f3NAiUwL001186@webber.adilger.int>; from adilger@turbolinux.com on Mon, Apr 23, 2001 at 04:44:30AM -0600
From: Joe Thornber <thornber@btconnect.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Andreas,

On Mon, Apr 23, 2001 at 04:44:30AM -0600, Andreas Dilger wrote:
> Joe, you write:
> > The 2.4.3 patches were generated automatically by repeatedly patching
> > the LVM tarball, building a 2.4.3 patch, applying said patch and then
> > diffing.  The results look correct but I haven't tested them - yell
> > if you see something wrong.
> 
> I haven't looked at all of the patches yet, but I think part of them at
> least are missing the point.  I don't think Linus/Alan want a blow-by-blow
> series of patches to follow LVM development (I could be wrong, but that's
> my opinion).  Maybe this is a work-in-progress?

Yes this is a work in progress, which is why I haven't taken Alan up
on his offer of help yet.  I had to start somewhere. so I decided to
make patch sets which move from beta version to beta version.  The
only bogosities left should be those present at a beta release - I am
trying to merge bogus patches within the release.  The plan is that I
get the full set finished today (if sistina's cvsweb starts serving to
me).  Then people comment, whilst I create yet another set of patches
that contain no bogus mistakes.  It's a big job.


> If I were you, I would continue with your current scheme, just to get a
> discrete list of all the changes made to the kernel code.  Then I would
> sit back and combine all patches that affect the same piece of code, so
> you get a bunch of patchs that go directly from beta2 (Linus kernel) to
> beta7/CVS which say "this patch changes X, because it was broken, now
> it is fixed, see".

Yep.

> Granted, the file renaming and code reorg also needs to be done, if we
> want the kernel code to match CVS...  However, I don't think that many
> (if any) changes were made in lvm-fs.c after it was split out, for example.

I think we made one mistake, not suprising since it was a merge of
your's my and the original code.  I do want omeone to tidy the proc
info functions at some time though.

> For example, the IOP version change patch should just be thrown away
> outright (zero sum change).

Yep.

>  The "allow VG_CREATE on /dev/lvm" patch
> should be combined with the patch (not on your page yet) that adds
> the "VG_CREATE_OLD" ioctl.

> This assumes that the current CVS user
> tool vgcreate has my patch which tries the VG_CREATE_OLD ioctl if
> VG_CREATE fails (several people complained about that.  Otherwise the
> whole thing is still broken.

I thought Patrick merged this in ?

> Likewise, the fix to lvm_user_bmap() to use b_rdev and b_blocknr is
> actually reverting a fix which was added into the stock kernel recently
> because lvm_map() was broken.  I submitted a patch to lvm-devel to fix
> this just before beta7 was released, but it wasn't added to CVS, AFAICS.
> 
> Combine all of the trivial whitespace, debug, etc. patches into a single
> one (ensuring it really is all trivial stuff).

Yep

> Of course, don't even think of submitting a patch which has the "set
> low bits on buffer pointer" for pv_move, or the whole flame-fest will
> start anew.

Yes, I need to talk to someone in authority about the new things I
need in the block layer.

- Joe
