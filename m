Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3KE4aj01431
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 10:04:36 -0400
Received: from satellite.planete-terre.net ([81.80.96.66])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3KE4Z87012725
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 10:04:35 -0400
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by satellite.planete-terre.net (Postfix) with ESMTP id B484A401E
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 16:04:26 +0200 (CEST)
From: Vincent Schultz <vincent.schultz@wanadoo.fr>
Message-Id: <1082469853.4653.6.camel@localhost.localdomain>
Mime-Version: 1.0
Date: Tue, 20 Apr 2004 16:04:26 +0200
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM, loop device and Fedora 1 : Bad magic number
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello all,

I wanted to test LVM with loopdevice, but I experience some problems.
Here there are :

# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group
# dd if=/dev/zero of=/tmp/vdisk0 bs=50M count=1
# losetup /dev/loop0 /tmp/vdisk0

# pvcreate /dev/loop0
pvcreate -- physical volume "/dev/loop0" successfully created

# vgcreate VG_home /dev/loop0
vgcreate -- INFO: using default physical extent size 4 MB
vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
vgcreate -- doing automatic backup of volume group "VG_home"
vgcreate -- volume group "VG_home" successfully created and activated

[root@satellite root]# lvcreate -L40M -n LV_admins VG_home
lvcreate -- doing automatic backup of "VG_home"
lvcreate -- logical volume "/dev/VG_home/LV_admins" successfully created

[root@satellite root]# mke2fs -j /dev/VG_home/LV_admins
mke2fs 1.34 (25-Jul-2003)
Filesystem label=
[...]
Writing inode tables: done
Creating journal (4096 blocks): done

[root@satellite root]# dumpe2fs /dev/VG_home/LV_admins
dumpe2fs 1.34 (25-Jul-2003)
dumpe2fs: Bad magic number in super-block while trying to open
/dev/VG_home/LV_admins
Couldn't find valid filesystem superblock.

Impossible to mount the FS too!

I am using a 2.4.22-1.2174.nptl on a Fedora Core 1.& lvm-1.0.3-13

I read that it should be a good idea to upgrade lvm, so I installed 
lvm-1.0.5-1.i386.rpm for Red Hat Contrib, but it still the same.

Do you have an idea ? Where did I go wrong ?

Thanks for your help,

Vincent
