From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Re: Unable to get XFS, ext3, reiserfs & LVM to
    coexist happily
Message-Id: <20020105142527.I12868@lynx.no>
References: <200201020451.g024pPg00867@oss.sgi.com>
    <E16Md6L-0007pY-00@hermes.sistina.com> <20020104163939.C12868@lynx.no>
    <200201050212.TAA16774@cthulhu.turbolabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200201050212.TAA16774@cthulhu.turbolabs.com>; from
    ahead@bigpond.net.au on Sat, Jan 05, 2002 at 12:12:40PM +1000
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
Date: Sat Jan  5 15:29:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Head <ahead@bigpond.net.au>
Cc: Eric Sandeen <sandeen@sgi.com>, Linux XFS Mailing List <linux-xfs@oss.sgi.com>, linux-lvm@sistina.com

On Jan 05, 2002  12:12 +1000, Adrian Head wrote:
> On Sat, 5 Jan 2002 09:39, Andreas Dilger wrote:
> > Can you repeat this test, but skip the ext3 snapshot creation part of it
> > entirely (i.e. create a reiserfs snapshot and an XFS snapshot, without
> > changing the kernel)?  I'm wondering if XFS is getting an old inode that
> > ext3 was using, but either ext3 or XFS is not clearing it, so that is why
> > it is calling into ext3.  Also, are you using ext3 on other filesystems in
> > this computer?
> 
> Yes there are other volumes using ext3.
> /boot			    20M	ext3
> /			   512M	ext3
> /usr			   512M	ext3
> /var			   512M	ext3
> swap			   768M
> /tmp			   128M	reiserfs  LVM
> /cache			   512M	reiserfs  LVM
> /chroot			   512M	ext3	LVM
> /usr/src			  4096Mreiserfs	LVM
> /data			   ~30G	xfs	LVM
> 
> the tests are done on /chroot for ext3,
> /usr/src for resierfs & /data for xfs.
> 
> I can skip the ext3 snapshot creation part - each test is done on its own 
> logical volume; however, in the dark dim past any of these could have had 
> other filesystems on them.
> Does this sound sensible?
> 1)	Run tests without doing the ext3 snapshot creation, then
> 2)	dd the entire lv that is giving problems and try again?

Hmm, no I'm not worried about old filesystems on the disk.  I thought
maybe you were running the tests on the same LV, and creating new
filesystems on a single LV between the tests.  What I'm worried about
is old inodes being kept in memory between the tests.  If the tests are
being run on separate LVs, then that is not a possibility.

I guess what is needed is a real oops report from the ext3 problem.
Maybe Andrew or Stephen can figure it out.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
