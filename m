Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2144S801715
	for <linux-lvm@redhat.com>; Sun, 29 Feb 2004 23:04:28 -0500
Received: from smtp1.cwidc.net (smtp1.cwidc.net [154.33.63.111])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i2144Rb20230
	for <linux-lvm@redhat.com>; Sun, 29 Feb 2004 23:04:27 -0500
Received: from [211.14.136.222] (helo=tequila.co.jp)
	by smtp1.cwidc.net with esmtp (Exim 3.36 #2)
	id 1AxefK-00075L-00
	for linux-lvm@redhat.com; Mon, 01 Mar 2004 13:04:26 +0900
Message-ID: <4042B63E.6030708@tequila.co.jp>
From: Clemens Schwaighofer <cs@tequila.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm on software raid 5
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Sun Feb 29 23:03:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

hi,

I have a software raid 5 in linud 2.6.3 and I created a lvm on. Actually
it works, but there some strange things. Perhaps someone can point me
out why.

Basic:

lvm vesion:
ii  lvm2              2.00.08-4         The Linux Logical Volume Manager
ii  lvm-common        1.5.12            The Logical Volume Manager for
Linux (common files

raid version:
ii  raidtools2        1.00.3-5          Utilities to support 'new-style'
RAID disks

md admin version
ii  mdadm             1.4.0-3           Manage MD devices aka Linux
Software Raid

my raidtab:

# 4 x 160GB Raid 5, no spare
raiddev                 /dev/md0
raid-level              5
nr-raid-disks           4
nr-spare-disks          0
persistent-superblock           1
chunk-size              64
parity-algorithm                left-symmetric
# Spare disks for hot reconstruction
# no the raid devices
# Alpha
device                  /dev/sda1
raid-disk               0
# Beta
device                  /dev/sdb1
raid-disk               1
# Gamma
device                  /dev/sdc1
raid-disk               2
# Delta
device                  /dev/sdd1
raid-disk               3

[the partitions are 'fd' type: Linux auto raid]

After I created the physical volume with 'pvcreate /dev/md0' I got this
output with pvdisplay:

ludivinus:~# pvdisplay
~  Incorrect metadata area header checksum
~  Incorrect metadata area header checksum
~  Incorrect metadata area header checksum
~  Incorrect metadata area header checksum
~  Incorrect metadata area header checksum
~  --- Physical volume ---
~  PV Name               /dev/cciss/c1d0p4
~  VG Name               TequilaData
~  PV Size               60.15 GB / not usable 0
~  Allocatable           yes
~  PE Size (KByte)       4096
~  Total PE              15398
~  Free PE               38
~  Allocated PE          15360
~  PV UUID               eqEPJ1-YbVY-qhFQ-Fm63-9cC1-0UwZ-PAssTp

~  --- NEW Physical volume ---
~  PV Name               /dev/md0
~  VG Name
~  PV Size               457.99 GB
~  Allocatable           NO
~  PE Size (KByte)       0
~  Total PE              0
~  Free PE               0
~  Allocated PE          0
~  PV UUID               jlq1y1-YpjZ-AU3Z-Iibp-0EkG-DzZj-5IHGhq

~  --- NEW Physical volume ---
~  PV Name               /dev/sdd1
~  VG Name
~  PV Size               457.99 GB
~  Allocatable           NO
~  PE Size (KByte)       0
~  Total PE              0
~  Free PE               0
~  Allocated PE          0
~  PV UUID               *U|-?c-?6??I-?n??j-5IHGhq

its kinda strange, so I removed /dev/sdd1.

ludivinus:~# pvremove /dev/sdd1
~  Incorrect metadata area header checksum
~  Incorrect metadata area header checksum
~  Incorrect metadata area header checksum
~  Labels on physical volume "/dev/sdd1" successfully wiped

and after that I pvdisplay showed the correct output. But after I
created the volume group and the logical volume I had this "ghost
volume" back again. So I removed it again. my initial tests look good.
there is no problem.

With my first test on this box, I created a raid just with the bare
disks without partitions, I had other problems, that he suddenly had a
partition in sda and sdd with the size of the right which screwed lvm
totaly up.

Anyway my question is, did I do something wrong? Missed I something out?
I couldn't find any good description for lvm on raid5. The only one I
could find, didn't sepcify anything else.
- --
Clemens Schwaighofer - IT Engineer & System Administration
==========================================================
Tequila Japan, 6-17-2 Ginza Chuo-ku, Tokyo 104-8167, JAPAN
Tel: +81-(0)3-3545-7703            Fax: +81-(0)3-3545-7343
http://www.tequila.jp
==========================================================
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAQrY9jBz/yQjBxz8RAvSFAKCKy9Vgzr3ZMSHkcY35d5MS9f8YGACfRQYu
rqZlE7SnIYii2w9QukfQLrk=
=xtAZ
-----END PGP SIGNATURE-----
