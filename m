Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7L85qV02295
	for <linux-lvm@redhat.com>; Sun, 21 Aug 2005 04:05:52 -0400
Received: from web31111.mail.mud.yahoo.com (web31111.mail.mud.yahoo.com
	[68.142.200.230])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id j7L85iUp032693
	for <linux-lvm@redhat.com>; Sun, 21 Aug 2005 04:05:44 -0400
Message-ID: <20050821080536.73424.qmail@web31111.mail.mud.yahoo.com>
Date: Sun, 21 Aug 2005 01:05:36 -0700 (PDT)
From: Hale India <hale_india@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] hard disk recovery using usb box
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi

I am using fedora 4 on a hp laptop.
My motherboard burned out..

When I had installed fedora on this machine I took the
automatic partition option. I kept windows in a
smaller partition and fedora used the rest.

I wanted to get bak my data's puting my hard disk in
an USB box and connecting it to another machine.

I get 3 devices /dev/sda1 /dev/sda2 /dev/sda3
I can acce boot partition from the hard disk but not
windows and not main fedora patition.
(VolGroup00-LogVol00)

{venus:root} mount /dev/sda1
mount: unknown filesystem type 'ntfs'
{venus:root} mount /dev/sda2
{venus:root} mount /dev/sda3
mount: can't find /dev/sda3 in /etc/fstab or /etc/mtab

I get boot partion in sda2
From suse I can access windows partition in sda1 :
ntfs filesystem type seems to be reconised
I cannot access main partition (which is in sda3)
using suse or fedora.

In /var/log/messages I get 

Aug 21 09:37:47 venus kernel: USB Mass Storage support
registered.
Aug 21 09:37:52 venus kernel:   Vendor: FUJITSU  
Model: MHS2040AT  D      Rev: 0811
Aug 21 09:37:52 venus kernel:   Type:   Direct-Access 
                    ANSI SCSI revision: 00
Aug 21 09:37:52 venus scsi.agent[9086]: disk at
/devices/pci0000:00/0000:00:13.2/usb1/1-8/1-8:1.0/host0/target0:0:0/0:0:0:0
Aug 21 09:37:52 venus kernel: SCSI device sda:
78140160 512-byte hdwr sectors (40008 MB)
Aug 21 09:37:52 venus kernel: sda: assuming drive
cache: write through
Aug 21 09:37:52 venus kernel: SCSI device sda:
78140160 512-byte hdwr sectors (40008 MB)
Aug 21 09:37:52 venus kernel: sda: assuming drive
cache: write through
Aug 21 09:37:52 venus kernel:  sda: sda1 sda2 sda3
Aug 21 09:37:52 venus kernel: Attached scsi disk sda
at scsi0, channel 0, id 0, lun 0
Aug 21 09:37:54 venus fstab-sync[9134]: added mount
point /media/usbdisk for /dev/sda1
Aug 21 09:37:54 venus fstab-sync[9137]: added mount
point /media/usbdisk1 for /dev/sda2
Aug 21 09:47:41 venus su(pam_unix)[9253]: session
opened for user root by (uid=1000)
Aug 21 09:50:00 venus kernel: kjournald starting. 
Commit interval 5 seconds
Aug 21 09:50:00 venus kernel: EXT3 FS on sda2,
internal journal
Aug 21 09:50:00 venus kernel: EXT3-fs: recovery
complete.
Aug 21 09:50:00 venus kernel: EXT3-fs: mounted
filesystem with ordered data mode.
Aug 21 09:50:00 venus kernel: SELinux: initialized
(dev sda2, type ext3), uses xattr
Aug 21 09:57:49 venus su(pam_unix)[9427]: session
opened for user root by (uid=1000)
Aug 21 09:59:52 venus kernel: kjournald starting. 
Commit interval 5 seconds
Aug 21 09:59:52 venus kernel: EXT3 FS on sda2,
internal journal
Aug 21 09:59:52 venus kernel: EXT3-fs: mounted
filesystem with ordered data mode.
Aug 21 09:59:52 venus kernel: SELinux: initialized
(dev sda2, type ext3), uses xattr

Using fdisk I get :

{venus:root} fdisk -l

Disk /dev/hda: 60.0 GB, 60011642880 bytes
255 heads, 63 sectors/track, 7296 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id
 System
/dev/hda1               1        3206    25744131+   7
 HPFS/NTFS
/dev/hda2   *        3207        3218       96390   83
 Linux
/dev/hda3            3219        7296    32756535   8e
 Linux LVM

Disk /dev/sda: 40.0 GB, 40007761920 bytes
255 heads, 63 sectors/track, 4864 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id
 System
/dev/sda1   *           1        2313    18579141    7
 HPFS/NTFS
Partition 1 does not end on cylinder boundary.
/dev/sda2            2314        2326      104422+  83
 Linux
/dev/sda3            2327        4864    20386485   8e
 Linux LVM

I need to access main partition.

Any help welcome.

Andre
