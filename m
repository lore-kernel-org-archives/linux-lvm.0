From: "Jonathan DeHaan" <jdehaan@home.com>
Subject: RE: [linux-lvm] PBs with LVM over software RAID ( and XFS ? ext2 reiserfs?)-2.4.7
Date: Fri, 7 Sep 2001 10:50:23 -0400
Message-ID: <000001c137ac$6ca156e0$0400a8c0@ci696011a.lxintn1.ky.home.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <3B97B21D.10309@st-peter.stw.uni-erlangen.de>
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
To: linux-lvm@sistina.com

svetljo,
I think I've done what you are trying to do.

Starting with Mandrake 8.1b1:
kernel 2.4.9
patch-2.4.9-xfs-2001-08-26
lvm-1.0.1-rc2
xfsprogs-1.3.5
Apply xfs patch before doing make in lvm.
Configure lvmtools with --enable-static_link

/dev/md/0 is RAID0 over three partitions - hda1, sda1, sdb1
pvcreate /dev/md/0
vgcreate vg /dev/md/0
lvcreate -s 4G -n root vg
mkfs -t xfs /dev/vg/root
mount /dev/vg/root /mnt

No errors.

If this same sequence of commands produces errors on your system, then I
would suspect something other than md, lvm, or xfs. Unless you really have a
need to run both, I would not patch both XFS and JFS into the same kernel. I
also would not use modules for any filesystems that I expect to use daily.

Hope this helps,
Jonathan DeHaan
jdehaan@home.com

> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of svetljo
> Sent: Thursday, September 06, 2001 1:28 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] PBs with LVM over software RAID ( and XFS ?
> ext2 reiserfs?)-2.4.7
>
>
> Hi again
> it took me some time but it's the same with 2.4.7
> mke2fs and mkreiserfs segfaults and there are no OOPSes
> and jfs has no problems
>
> vanila 2.4.7 with jfs-1.0.4 and LVM-cvs from about an hour ago
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
