Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i37MtUj26948
	for <linux-lvm@redhat.com>; Wed, 7 Apr 2004 18:55:30 -0400
Received: from email.careercast.com (email.careercast.com [216.39.101.233])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i37MtUWB012400
	for <linux-lvm@redhat.com>; Wed, 7 Apr 2004 18:55:30 -0400
From: Clint Byrum <cbyrum@spamaps.org>
Message-Id: <1081378532.25836.264.camel@arthur.cbd.careercast.com>
Mime-Version: 1.0
Date: Wed, 07 Apr 2004 15:55:33 -0700
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm2 weirdness on software RAID5
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

Ok, I have a nice 700GB LVM sitting on top of a couple of 350GB software
RAID5 volumes (on 4 250GB SATA disks). I want to add another 330GB of
software RAID 5 (on 4 120GB PATA disks), so here's what I did:

mdadm --create /dev/md2 --chunk 256 --level 5 -n 4 /dev/hdc1 /dev/hdd1
/dev/hdg1 /dev/hdh1

This went fine, and /dev/md2 is working as well as can be expected
considering the master/slave drives used to build it:

md2 : active raid5 hdh1[3] hdg1[2] hdd1[1] hdc1[0]
      351661824 blocks level 5, 256k chunk, algorithm 2 [4/4] [UUUU]

[root@backup root]# lvm pvs
PV         VG      Fmt  Attr PSize   PFree
/dev/md0   backups lvm2 a-   349.33G    0
/dev/md1   backups lvm2 a-   349.31G 8.64G

Here is where it gets weird. So I want to add /dev/md2:

[root@backup root]# lvm pvcreate /dev/md2
  No physical volume label read from /dev/md2
  Physical volume "/dev/md2" successfully created
[root@backup root]# lvm pvs
PV         VG      Fmt  Attr PSize   PFree
/dev/hdc1          lvm2 --   335.37G 335.37G
/dev/md0   backups lvm2 a-   349.33G      0
/dev/md1   backups lvm2 a-   349.31G   8.64G

Wha?! Thats not right! It sees disk 0 of the RAID5 set as having the pv.
Why is this? I created and added md0 and md1 with the same methods
almost exactly, albeit on a 3Ware card, so they show up as sda - sdd. I
can see why this might happen, but it still is a bit disconcerting.

A little more weirdness:
[root@backup root]# lvm pvremove /dev/hdc1
  Labels on physical volume "/dev/hdc1" successfully wiped
[root@backup root]# lvm pvs
PV         VG      Fmt  Attr PSize   PFree
/dev/md0   backups lvm2 a-   349.33G      0
/dev/md1   backups lvm2 a-   349.31G   8.64G
/dev/md2           lvm2 --   335.37G 335.37G

This looks more like what I want.. .but still.. I'm afraid to use this
PV. I can use vgextend and add it into my backups vg, and all seems
fine:

[root@backup root]# lvm vgextend -v backups /dev/md2
    Checking for volume group "backups"
    Archiving volume group "backups" metadata.
    Adding physical volume '/dev/md2' to volume group 'backups'
    Volume group "backups" will be extended by 1 new physical volumes
    Creating volume group backup "/etc/lvm/backup/backups"
  Volume group "backups" successfully extended

[root@backup root]# lvm vgs
VG      #PV #LV #SN Attr VSize VFree
backups   3   1   0 wz-- 1.01T 344.01G

But, whats this? Weirdness returns!:

[root@backup root]# lvm pvs
PV         VG      Fmt  Attr PSize   PFree
/dev/hdc1  backups lvm2 a-   335.37G 335.37G
/dev/md0   backups lvm2 a-   349.33G      0
/dev/md1   backups lvm2 a-   349.31G   8.64G

If I remove hdc1 from /etc/lvm/.cache, I get this:
[root@backup root]# lvm pvs
PV         VG      Fmt  Attr PSize   PFree
/dev/md0   backups lvm2 a-   349.33G      0
/dev/md1   backups lvm2 a-   349.31G   8.64G
/dev/md2   backups lvm2 a-   335.37G 335.37G

So I must assume that this might just be a display problem. However,
this definitely looks like a bug. Either way I'm afraid to rely on
/dev/md2 until I figure out why this is happening. Anybody have any
ideas?

More info:
[root@backup root]# lvm version
  LVM version:     2.00.08 (2003-11-14)
  Library version: 1.00.07-ioctl (2003-11-21)
  Driver version:  4.1.0

OS: Fedora Core 1
[root@backup root]# uname -a
Linux backup 2.6.5 #1 SMP Tue Apr 6 14:42:41 PDT 2004 i686 athlon i386 GNU/Linux

Hardware: Dual Athlon MP 1900+, Tyan S2466-N4M Motherboard, 512MB DDR
REG ECC RAM. 3ware Escalade 8506-8 SATA card. Highpoint HPT302 ATA/133
Controller. 4x WDC 250GB SATA Drives. 4xSeagate 120GB PATA drives.


Thanks!
-- 
Clint Byrum
Systems Administrator
CareerCast, Inc.
