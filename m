From: "yves.alloyer" <Yves.ALLOYER@slpinfoware.com>
Subject: RE: [linux-lvm] Problem with LVM over RAID-1
Date: Mon, 15 Oct 2001 13:02:26 +0200
Message-Id: <NEBBLHFAEINCLDICDLOAOEPKCHAA.yves.alloyer@slpinfoware.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <m2u1x238a1.fsf@isnogud.escape.de>
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

You may want to look at the  "[linux-lvm] pvcreate fails on a software RAID
metadisk" thread.
There is something going wrong in lvm_check_partitioned_dev.
AFAIK the problem is being investigated. Since you probably don't want to
partition any of your MD devices, the following patch should do it. It just
tells LVM to use the whole device.
I've got that running... (2.4.10/1.0.1-rc4).
Hope it helps.
Yves
------------------------------------------------------------------------
--- tools/lib/lvm_check_partitioned_dev.c.bluca	Thu Aug 23 07:51:53 2001
+++ tools/lib/lvm_check_partitioned_dev.c	Fri Oct  5 21:18:51 2001
@@ -55,6 +55,8 @@
 	switch (lvm_get_device_type(st_rdev)) {
 	case LVM_DEVICE_TYPE_INVALID:
 	    break;
+	case LVM_DEVICE_TYPE_MD:
+	    break;
 	default:
 	    ret = TRUE;
 	}
------------------------------------------------------------------------

> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Urs Thuermann
> Sent: Sunday, October 14, 2001 11:01 AM
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] Problem with LVM over RAID-1
>
>
> This problem has occrued on this mailing list before by another user
> but I haven't read a solution to it here.
>
> We want to setup LVM over a RAID-1 array, i.e. LVM on /dev/md0.  But
> the pvcreate on /dev/md0 fails:
>
>
>     oker:~# uname -a
>     Linux oker 2.4.7oker #1 SMP Sat Oct 13 18:31:47 CEST 2001 i586 unknown
>     oker:~# dmesg|grep -i lvm
>     LVM version 0.9.1_beta2  by Heinz Mauelshagen  (18/01/2001)
>     lvm -- Driver successfully initialized
>     oker:~# pvcreate --version
>     pvcreate: Logical Volume Manager 1.0.1-rc3
>     Heinz Mauelshagen, Sistina Software  01/10/2001 (IOP 10)
>     oker:~# grep md/0 /proc/partitions
>        9     0   17775808 md/0
>     oker:~# pvcreate -v /dev/md0
>     pvcreate -- locking logical volume manager
>     pvcreate -- checking physical volume name "/dev/md0"
>     pvcreate -- getting physical volume size
>     pvcreate -- device "/dev/md0" has a partition table
>
>
>     pvcreate [-d|--debug] [-f[f]|--force [--force]] [-h|--help] [-y|--yes]
>     	    [-v|--verbose] [--version] PhysicalVolume [PhysicalVolume...]
>
>     oker:~# dd if=/dev/zero of=/dev/md0 count=256 bs=512
>     256+0 records in
>     256+0 records out
>     oker:~# pvcreate -v /dev/md0
>     pvcreate -- locking logical volume manager
>     pvcreate -- checking physical volume name "/dev/md0"
>     pvcreate -- getting physical volume size
>     pvcreate -- device "/dev/md0" has a partition table
>
>
>     pvcreate [-d|--debug] [-f[f]|--force [--force]] [-h|--help] [-y|--yes]
>     	    [-v|--verbose] [--version] PhysicalVolume [PhysicalVolume...]
>
>
> However, /dev/md0 seems to be ok.  I can dd to/from it, I can mkfs on
> it.  The RAID-array is configured as
>
>     oker:~# cat /etc/raidtab
>     raiddev /dev/md0
>     	    raid-level              1
>     	    nr-raid-disks           2
>     	    nr-spare-disks          0
>     	    chunk-size              4
>     	    persistent-superblock   1
>     	    device                  /dev/sdb3
>     	    raid-disk               0
>     	    device                  /dev/sda3
>     	    failed-disk             1
>
> /dev/sda3 is marked as "failed" currently, since there is now an ext2
> FS on sda3 on which the system was installed and is currently running
> (debain sid, BTW).  We plan to install LVM on /dev/md0, copy
> everything over to it and then mirror sdb3 to sda3.
>
> Can anyone help us with creating a PV on /dev/md0, please?
>
>
> Another question on Linux-Software RAID-1:  We want to use it to get
> more reliability by mirroring.  But I'd like to know if the Linux
> kernel will also make use of both disks to increase the read
> performance, i.e. when reading a large file, read some parts from one
> disk, other parts from the other disk.  Or when accessing two files,
> read one file from one disk and the other file from the second disk.
> Will the Linux kernel do this?
>
>
> urs
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
