From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Unable to get XFS, ext3, reiserfs & LVM to
    coexist happily
Message-Id: <20020103100030.V12868@lynx.no>
References: <E16LcO0-0006VI-00@hermes.sistina.com>
    <20020102110538.K12868@lynx.no> <200201030244.g032iZg32176@oss.sgi.com>
    <200201030315.UAA21279@cthulhu.turbolabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200201030315.UAA21279@cthulhu.turbolabs.com>; from
    ahead@bigpond.net.au on Thu, Jan 03, 2002 at 01:14:32PM +1000
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
Date: Thu Jan  3 10:58:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Head <ahead@bigpond.net.au>
Cc: linux-xfs@oss.sgi.com, linux-lvm@sistina.com

On Jan 03, 2002  13:14 +1000, Adrian Head wrote:
> With this case ext3 & resierfs are fine for creating snapshots, mounting 
> snapshots and being stable when snapshots overflow.  However, XFS dies during 
> snapshot creation.
> 
> In this case where do you recommend I take this problem? LVM developers or 
> XFS developers?

Probably XFS.  Note that XFS needs some non-standard changes made to the LVM
code, so it may be that you are hitting a "known" problem with XFS and
snapshots.  Hmm, reading further, maybe it is an ext3 problem???

> - From the backtrace it appears that it is ext3 that is actually dying - am I 
> reading this correctly?  In which case does this need to be CC'd to the ext3 
> developers as well?

Maybe yes.  This is very strange.  Are you testing all of these filesystems
on the same LV in order?  Can you try just doing XFS by itself on a clean
reboot?  I assume that you are rebooting after every oops, because if you
don't there is junk in the kernel memory that will screw up further tests.

> 2.4.17-xfs
> While source volume mounted:
>  + lvm-1.0.1 upgrade
>  + VFS-lock
>  (In that order)
> * Can create ext3 snapshot?			| yes
> * Can mount a ext3 snapshot?			| yes
> * Can create resierfs snapshot?			| yes
> * Can mount a resierfs snapshot?		| yes
> * Can create xfs snapshot?			| Oops
>  btp 1234 (lvcreate)
>  journal_start
>  ext3_dirty_inode
   ^^^^^^^^^^^^^^^^ yes, very strange.
>  __mark_inode_dirty
>  update_atime
>  do_generic_file_read
>  generic_file_read
>  sys_read
>  system_call

Note that it appears most of the ext3 fixes went into 2.4.17, so this may
be a new bug.  As I said, let's try first with XFS snapshots only, and if
that doesn't have a problem, try to re-create the above problem and send
a full oops report to ext2-devel.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
