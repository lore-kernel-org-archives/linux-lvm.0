From: Andreas Dilger <adilger@turbolabs.com>
Date: Fri, 31 Aug 2001 16:56:56 -0600
Subject: Re: [linux-lvm] PBs with LVM over software RAID
Message-ID: <20010831165656.K541@turbolinux.com>
References: <3B8E3F0E.8050609@st-peter.stw.uni-erlangen.de> <20010830083546.A20989@sistina.com> <3B8EC633.40202@st-peter.stw.uni-erlangen.de> <3B8F8C5E.7030603@st-peter.stw.uni-erlangen.de> <20010831110512.V541@turbolinux.com> <3B8FD95C.60702@st-peter.stw.uni-erlangen.de> <20010831130718.C541@turbolinux.com> <3B900E92.7060607@st-peter.stw.uni-erlangen.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B900E92.7060607@st-peter.stw.uni-erlangen.de>
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
To: svetljo <galia@st-peter.stw.uni-erlangen.de>
Cc: linux-lvm@sistina.com

On Sep 01, 2001  00:24 +0200, svetljo wrote:
> it works with IMB's JFS
> when i try mkfs -t reiserfs -f /dev/myData/SRC it segfaults :
> 
> [root@svetljo mnt]# mkfs -t reiserfs -f /dev/myData/SRC
> mkreiserfs, 2001 - reiserfsprogs 3.x.0j
> ===================================================================
> LEAF NODE (8211) contains level=1, nr_items=2, free_space=3932 rdkey
> -------------------------------------------------------------------------------
> |###|type|ilen|f/sp| loc|fmt|fsck|                   
> key                      |
> |   |    |    |e/cn|    |   
> |need|                                            |
> -------------------------------------------------------------------------------
> Segmentation fault
> 
> isn't that a bit strange that reiserfs and xfs doesn't handle it, but 
> jfs does

It could just be lucky that JFS works, depending on access patterns.

> and the one with ext2 :
> 
> [root@svetljo mnt]# mkfs -t ext2 /dev/myData/SRC
> mke2fs 1.22, 22-Jun-2001 for EXT2 FS 0.5b, 95/08/09
> Filesystem label=
> OS type: Linux
> Block size=4096 (log=2)
> Fragment size=4096 (log=2)
> 786432 inodes, 1572864 blocks
> 78643 blocks (5.00%) reserved for the super user
> First data block=0
> 48 block groups
> 32768 blocks per group, 32768 fragments per group
> 16384 inodes per group
> Superblock backups stored on blocks:
>        32768, 98304, 163840, 229376, 294912, 819200, 884736
> 
> Writing inode tables: Segmentation fault

Then it is definitely not anything to do with the filesystem itself
(although it may be with the XFS patch).  Try a kernel without the
XFS patch and see if this makes a difference.  Maybe it is a bad
interaction between XFS, RAID, LVM?

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
