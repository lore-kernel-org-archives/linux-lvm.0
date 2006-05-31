Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4VKSST3016943
	for <linux-lvm@redhat.com>; Wed, 31 May 2006 16:28:28 -0400
Received: from pat.uio.no (IDENT:7411@pat.uio.no [129.240.10.4])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4VKSMnq000772
	for <linux-lvm@redhat.com>; Wed, 31 May 2006 16:28:22 -0400
Received: from mail-mx1.uio.no ([129.240.10.29])
	by pat.uio.no with esmtp (Exim 4.43) id 1FlXIh-00010p-Fp
	for linux-lvm@redhat.com; Wed, 31 May 2006 22:28:19 +0200
Received: from mail-web2.uio.no ([129.240.10.19] helo=webmail.uio.no)
	by mail-mx1.uio.no with esmtp (Exim 4.43) id 1FlXId-0007Li-OC
	for linux-lvm@redhat.com; Wed, 31 May 2006 22:28:15 +0200
Message-ID: <1281.129.240.40.46.1149107295.squirrel@webmail.uio.no>
Date: Wed, 31 May 2006 22:28:15 +0200 (CEST)
From: d.g.lawyer@medisin.uio.no
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvm- problem after pvcreate -ff
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
To: linux-lvm@redhat.com

Hello,

I�m afraid I have over-written something important while using LVM
(pvcreate), and need help restoring the system, or at least getting the
data off of it.

In short, while installing a new hard-disk to an existing FC4 system, I
ran pvcreate twice on the new disk. The second time I used the �ff option
(it asked for it), after which LVM was no longer able to find the device
with a certain uuid.

The long story:
I am responsible for a small computer lab, 5 machines running FC4 with a
default install, including the default LVM setup. I needed to install a
new 250GB hard drive in one of the machines.

Put harddisk in case, connected cables, powered on. No smoke, bios detects
the drive.

The new hard disk shows up as /dev/sdb

fdisk /dev/sdb   to create a partition table, forget to set type.

pvcreate /dev/sdb1

vgextend VolGroup00 /dev/sdb1

When preparing to lvextend I realized I�d forgotten to set the type with
fdisk.

fdisk again, this time also setting the type

pvcreate /dev/sdb1
  Gives error �Cannot create physical volume without �ff option�

pvcreate �ff /dev/sdb1

pvscan (just to check)

Get the message �couldn't find the device with uuid �xxxxx-x-x-xx-x-x�� (no,
it wasn�t x�s, but I don't want to copy the whole string by hand here)

And of course now the computer doesn�t boot as it cannot read all of
VolGroup00.

The how-to suggests
Use pvcreate to restore the metadata: pvcreate --uuid "<some_long_string>"
--restorefile /etc/lvm/archive/VolumeGroupName_XXXXX.vg <PhysicalVolume>

but I can't read /etc/lvm/archive since LVM can't load the volume group
which contains /etc.

Any help appreciated.
