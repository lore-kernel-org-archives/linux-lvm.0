Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2IEKvj10698
	for <linux-lvm@redhat.com>; Thu, 18 Mar 2004 09:20:57 -0500
Received: from mtagate1.uk.ibm.com (mtagate1.uk.ibm.com [195.212.29.134])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2IEKu4b015517
	for <linux-lvm@redhat.com>; Thu, 18 Mar 2004 09:20:57 -0500
Received: from d06nrmr1307.portsmouth.uk.ibm.com
	(d06nrmr1307.portsmouth.uk.ibm.com [9.149.38.129])
	by mtagate1.uk.ibm.com (8.12.10/8.12.10) with ESMTP id i2IEKp4I152740
	for <linux-lvm@redhat.com>; Thu, 18 Mar 2004 14:20:51 GMT
Received: from d06ml501.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
	[9.149.37.228])
	by d06nrmr1307.portsmouth.uk.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	i2IEIKZS180652
	for <linux-lvm@redhat.com>; Thu, 18 Mar 2004 14:18:21 GMT
Subject: Re: [linux-lvm] lvm on software raid 5
Message-ID: <OF974FD75A.F94D719C-ONC1256E5B.004D008F-C1256E5B.004E504E@nl.ibm.com>
From: Rick van der Linde <h.r.vanderlinde@nl.ibm.com>
Date: Thu, 18 Mar 2004 15:15:23 +0100
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com





Hi there,

As I read your comments I would suggest you not to create an VG straight
onto the /dev/md0 device but first to create one huge partition on device
/dev/md0 with label 8e (Linux LVM) and create a VG on top of that
partition.

As I did something like this before I would like to know your experiences.
I've (succesfully) tried to install LVM on top of a RAID 5 volume
consisting 4 disks of 80GB. However I switched back to simple ext3 volumes
on RAID 5 duie to performance problems. I've tried this on LVM 1.0.3 and
the md-driver delivered with the 2.4.20 kernel. In this situation I
experience a (LVM on RAID5) perfomance loss of approx 40-60% in comparison
to the RAID5 perfomance. The performance advantages were more important to
me then the LVM flexibility was. I would like to know from you if the new
IO scheduler which comes with Kernel 2.6.X doesn't give a performance loss
anymore. (comparison true RAID5 perfomance to LVM on RAID5 performance) If
the performance hit is a few percent which is usual to expec from LVM this
will give me the optimal solution having a great performance AND maximum
flexibility. Thanks in advance....

Vriendelijke groeten/ Kindly regards,


Rick van der Linde


F u cn rd ths, u cn gt a gd jb n cmptr prgrmmng.


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

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
