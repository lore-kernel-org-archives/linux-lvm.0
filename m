Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6DFqlW5029937
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 11:52:47 -0400
Received: from mail-fx0-f223.google.com (mail-fx0-f223.google.com
	[209.85.220.223])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6DFqP1p006399
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 11:52:25 -0400
Received: by fxm23 with SMTP id 23so2149442fxm.3
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 08:52:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A5B383C.3070905@cox.net>
References: <4A5B383C.3070905@cox.net>
From: Diego Jacobi <jacobidiego@gmail.com>
Date: Mon, 13 Jul 2009 17:52:05 +0200
Message-ID: <5de034af0907130852m156b8cc5m3699c290be331af@mail.gmail.com>
Subject: Re: [linux-lvm] Getting rid of a dying hard drive
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi.

I have read a few days ago that using pvmove is not completely safe.
If your system crashes some how in the process then your data is lost.
Please some one correct me if i am wrong.

A better way is to use mirroring.

This are the steps to follow: (i will write vg as the volume group and
logicalv as the logical volume)

- Connect your new harddrive.
- Partition it as LVM. with at least 2 partitions. 1 Big and 1
tinypartition (like a few hundreds of Mb)
- Add both partitions with pvcreate and vgextend to your volume group
- Make a mirror for your logical volumes. The tiny partition will be
for the logs.
- lvm will duplicate your data on a live system.
You can safaly use the system when lvm does that.
- When the copy operation finishes you need to remove the other partition.
- For that, set the new mirrored volume again to a lineal volume
removing the old partition.
- Then use vgreduce and pvremove to delete the old partition.
- Disconnect the old harddrive.

This is safer, because mirroring duplicates your data transparently
when the system is working, without deleting anything, and if the
system crashes somehow, your data is not lost, it will continue
copying after the reboot.
You can also disconnect your harddrive after the copy process is
finished, lvm will automatically detect it as a missing PV and set the
remaining PV (the new one) as a lineal volume with all your data
available, which is exactly what you do with the last 3 steps.

pvcreate /dev/sdb1
vgextend /dev/vg /dev/sdb1
pvcreate /dev/sdb2         ------> tiny partition. Each mirrorlog
requires something like 4 Mb
vgextend /dev/vg /dev/sdb2

lvs -a -o +devices  ---> to check what PVs are in use
lvconvert -m1 /dev/vg/logicalv  ----> to create the mirroring
lvs -a -o +devices  ----> to see how it changed and what PVs are in
use for the new mirrored volume

Or you can specify the PVs to use
lvconvert -m1 /dev/vg/logicalv /dev/sda1 /dev/sdb1 /dev/sdb2
-----> The old, the new and the mirrorlog.

This operation starts inmediatelly copying data, you will have to wait
for it to finish but your system will still be working. If some new
data is written, it will be copyed too.

Now you can,
a) disconnect you old disk if it isnt being use for lvm (check it with
lvs -a -o +devices)
b) disconnect it by software, for maybe, a repartition or to change it
to other VG.

I never did (a) yet, but did (b):


lvconvert -m0 /dev/vg/logicalv /dev/sda1
---> unset mirroring and remove /dev/sda1, all data will be in sdb1

vgreduce /dev/vg /dev/sda1
pvremove /dev/sda1

And thats it.

Cheers.
Diego




2009/7/13 Ron Johnson <ron.l.johnson@cox.net>:
> Hi,
>
> Does this thread do an adequate job of documenting the process of removing a
> PV from an L?
> � �http://ubuntuforums.org/showthread.php?t=449711
>
> The problem is that sdb2 is the largest PV in my LV.
>
> Is there a simpler way?
>
> # pvscan
> �WARNING: Ignoring duplicate config node: filter (seeking filter)
> �PV /dev/sda1 � VG main_huge_vg � lvm2 [232.75 GB / 0 � �free]
> �PV /dev/sda2 � VG main_huge_vg � lvm2 [232.75 GB / 0 � �free]
> �PV /dev/sda3 � VG main_huge_vg � lvm2 [232.75 GB / 0 � �free]
> �PV /dev/sda4 � VG main_huge_vg � lvm2 [233.00 GB / 0 � �free]
> �PV /dev/sdc1 � VG main_huge_vg � lvm2 [232.75 GB / 0 � �free]
> �PV /dev/sdc2 � VG main_huge_vg � lvm2 [232.75 GB / 0 � �free]
> �PV /dev/sdc3 � VG main_huge_vg � lvm2 [232.88 GB / 0 � �free]
>>>PV /dev/sdb2 � VG main_huge_vg � lvm2 [594.25 GB / 0 � �free]
> �PV /dev/sdd4 � VG main_huge_vg � lvm2 [529.00 GB / 0 � �free]
> �Total: 9 [2.69 TB] / in use: 9 [2.69 TB] / in no VG: 0 [0 � ]
>
> # df -m /data/big
> Filesystem � � � � � 1M-blocks � � �Used Available Use% Mounted on
> /dev/dm-0 � � � � � � �2774711 � �680803 � 1952962 �26% /data/big
>
>
> As you can see, there's a whole lot of extra space on the LV.
>
> Thanks.
>
> --
> Scooty Puff, Sr
> The Doom-Bringer
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
