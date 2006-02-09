Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k19BsK122997
	for <linux-lvm@redhat.com>; Thu, 9 Feb 2006 06:54:20 -0500
Received: from jhb4.mx.isp.org.za (jhb4.mx.isp.org.za [196.23.181.89])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k19Brn4h012523
	for <linux-lvm@redhat.com>; Thu, 9 Feb 2006 06:54:09 -0500
Received: from support.metroweb.co.za (ns2.isp.org.za [196.23.178.205])
	by jhb4.mx.isp.org.za (8.13.2/8.13.2) with SMTP id k19BqIq0016792
	for <linux-lvm@redhat.com>; Thu, 9 Feb 2006 13:52:26 +0200
Message-ID: <47668.196.23.181.50.1139485793.squirrel@support.metroweb.co.za>
Date: Thu, 9 Feb 2006 13:49:53 +0200 (SAST)
From: henka@cityweb.co.za
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM2: problem accessing volume after raidreconf to add
	hd to raid5
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

Hello,

Hopefully someone can shed some light on what feels like a hopeless
situation.  I've googled and tried a few things and got to a certain point,
but fear increasing the risk of losing data.

OK, first the original logical volume setup on raid5 which worked fine.
Here's the setup I followed:

mdadm --create /dev/md0 --level=5 --force --raid-devices=3 \
     /dev/hdc1 /dev/sda1 /dev/sdb1
pvcreate /dev/md0
vgcreate lvm-raid /dev/md0
vgdisplay lvm-raid  (and copy Free PE / Size for use in next command)
lvcreate -l 23845 lvm-raid -n lvm0
mkfs -t ext3 /dev/lvm-raid/lvm0
...and mount.

Everything worked perfectly, etc.  Weeks later (present miserable week),
we then needed to add a disk to this RAID5 array.

So, unmounted the volume, and:
mdadm -S /dev/md0
vgchange -an lvm-raid

then created new raidtab file with extra device, then:
raidreconf -o /etc/raidtab -n /etc/raidtabnew -m /dev/md0
...reconf takes several days, but is successful...
...raid auto-rebuild currently running..

[this is where the problems start]

vgcfgrestore lvm-raid - errors with:
Couldn't find device with uuid 's7XzWQ-3J9O-yaYj-anJG-hhMn-mloL-mPkl1F'.
  Couldn't find all physical volumes for volume group lvm-raid.
  Restore failed.

To get uuid (this is possibly where I'm losing the plot due to ignorance):
pvdisplay  /dev/md0
  --- NEW Physical volume ---
  PV Name               /dev/md0
  VG Name
  PV Size               1.09 TB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               6LGvgt-fLSV-xyfL-ItNc-YIiN-9Dhl-mYefsA

Then:
pvcreate -u s7XzWQ-3J9O-yaYj-anJG-hhMn-mloL-mPkl1F /dev/md0
  Physical volume "/dev/md0" successfully created

vgcfgrestore lvm-raid
  Restored volume group lvm-raid

lvdisplay
  --- Logical volume ---
  LV Name                /dev/lvm-raid/lvm0
  VG Name                lvm-raid
  LV UUID                000000-0000-0000-0000-0000-0000-000000
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                745.16 GB  (this is supposed to be 1TB+)
  Current LE             23845
  Segments               1
  Allocation             normal
  Read ahead sectors     1024

vgchange -ay
  1 logical volume(s) in volume group "lvm-raid" now active

vgdisplay lvm-raid
  --- Volume group ---
  VG Name               lvm-raid
  System ID             baksrv01138783727
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  1
  VG Access             read/write
  VG Status             resizable
  MAX LV                256
  Cur LV                1
  Open LV               0
  Max PV                256
  Cur PV                1
  Act PV                1
  VG Size               745.16 GB
  PE Size               32.00 MB
  Total PE              23845
  Alloc PE / Size       23845 / 745.16 GB
  Free  PE / Size       0 / 0
  VG UUID               6JaxpJ-MmTj-Ve9X-WiT6-THcg-SOjV-9uO8Mv

------------

Before proceeding to try and lvextend to use the extra 400GB (of new dev),
I decided to check if things were still happy, and tried to mount:

mount -a

dmesg:
VFS: Can't find ext3 filesystem on dev dm-0.

It's clear from above that my knowledge of lvm/2 is dangerous.
I have a gut feeling that either:
a) I've screwed the data, and/or,
b) I'm missing something glaringly obvious due to acute ignorance.

Any help would be appreciated.

Regards
Henka


--------------------------------------------------------
This message was sent using MetroWEB's AirMail service.
http://www.metroweb.co.za/ - full access for only R73.
Free Web Accelerator, WebMail, Calendar, Anti-Virus,
Anti-Spam, 10 emails, 100MB personal webspace, and more!
Phone Now!  086 11 11 440
