Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBR5iBr02346
	for <linux-lvm@redhat.com>; Mon, 27 Dec 2004 00:44:11 -0500
Received: from mail2.speakeasy.net (mail2.speakeasy.net [216.254.0.202])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iBR5iAQW008400
	for <linux-lvm@redhat.com>; Mon, 27 Dec 2004 00:44:10 -0500
Received: from dsl017-004-250.ser1.dsl.speakeasy.net (HELO [192.168.1.101])
	(rbunke@[69.17.4.250]) (envelope-sender <rbunke@speakeasy.net>)
	by mail2.speakeasy.net (qmail-ldap-1.03) with SMTP
	for <linux-lvm@redhat.com>; 27 Dec 2004 05:44:09 -0000
Message-ID: <41D00FDB.20000@speakeasy.net>
Date: Mon, 27 Dec 2004 08:36:27 -0500
From: "Richard S. Bunke" <rbunke@speakeasy.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] mount my lv with write permisions locks up OS
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I have a logical volume that I can only mount read only.  If I try to 
mount it with write access it locks up the whole OS -- no errors.   I 
filled up  the fs and then tried to move files off it and the whole 
thing crashed with unlink errors (If I remember correctly, it was a 
while back).

I've tried a few things.
I can run fsck.reiserfs successfully with out error. 
I can mount it read only.  The three pvs don't have any free extents 
left so I tried adding a fouth pv and growing the lv and filesytem by 
1Gb in oder to see if it would mount then, but it still froze. 
I tried to use pvmove to move one or two extents off the th other pvs 
onto the new one, but I couldn't figure out the syntax on how to move  
just one or two extents.  I don't even now if that would work.

I'm guessing it's an lvm problem, though I suppose it could be reiserfs
or md problem instead.

Any help or suggestions you might have would be greatly appreciated.

here is the setup:
lvm2
2.6.9 kernel on Gentoo
one drive is sata on nforce3 chipset (sda)
one drive is ata on nforce3 chipset (hda3)
two drives are ata on pci adapter aec62xx driver (hde, hdg)
amd64 architecture

# pvdisplay
  /dev/cdrom: open failed: Read-only file system
  --- Physical volume ---
  PV Name               /dev/hdg
  VG Name               myvg
  PV Size               27.96 GB / not usable 0  
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              7157
  Free PE               0
  Allocated PE          7157
  PV UUID               rob6sx-6VLN-YmJW-cWPL-5KDn-jyHj-a2oVVE
  
  --- Physical volume ---
  PV Name               /dev/hde
  VG Name               myvg
  PV Size               27.96 GB / not usable 0  
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              7157
  Free PE               0
  Allocated PE          7157
  PV UUID               DSym9d-2yAa-56Ly-4V4e-E2w2-6yYX-aSqrFW
  
  --- Physical volume ---
  PV Name               /dev/sda
  VG Name               myvg
  PV Size               74.53 GB / not usable 0  
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              19079
  Free PE               0
  Allocated PE          19079
  PV UUID               LRqQiF-stsg-FHCl-lgGW-uj4T-azY6-NocqXC
  
  --- Physical volume ---
  PV Name               /dev/hda3
  VG Name               myvg
  PV Size               9.03 GB / not usable 0  
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              2311
  Free PE               2055
  Allocated PE          256
  PV UUID               e6SUVH-xlss-4f02-9XUD-j4m0-ed9K-xcemNP
  

# vgdisplay
  /dev/cdrom: open failed: Read-only file system
  --- Volume group ---
  VG Name               myvg
  System ID            
  Format                lvm2
  Metadata Areas        4
  Metadata Sequence No  6
  VG Access             read/write
  VG Status             resizable
  MAX LV                255
  Cur LV                1
  Open LV               0
  Max PV                255
  Cur PV                4
  Act PV                4
  VG Size               139.47 GB
  PE Size               4.00 MB
  Total PE              35704
  Alloc PE / Size       33649 / 131.44 GB
  Free  PE / Size       2055 / 8.03 GB
  VG UUID               VuX0hq-qs9d-XZP2-vdZ6-rlwQ-RWqY-JHmNpj


# lvdisplay
  /dev/cdrom: open failed: Read-only file system
  --- Logical volume ---
  LV Name                /dev/myvg/mylv
  VG Name                myvg
  LV UUID                07oG4N-NRJo-YxxH-iDy4-b8ck-7jq1-6hWc5F
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                131.44 GB
  Current LE             33649
  Segments               4
  Allocation             next free (default)
  Read ahead sectors     0
  Block device           254:0

# dmsetup info
Name:              myvg-mylv
State:             ACTIVE
Tables present:    LIVE
Open count:        0
Event number:      0
Major, minor:      254, 0
Number of targets: 4
UUID: VuX0hqqs9dXZP2vdZ6rlwQRWqYJHmNpj07oG4NNRJoYxxHiDy4b8ck7jq16hWc5F

# dmsetup table
myvg-mylv: 0 58630144 linear 34:0 384
myvg-mylv: 58630144 58630144 linear 33:0 384
myvg-mylv: 117260288 156295168 linear 8:0 384
myvg-mylv: 273555456 2097152 linear 3:3 384
