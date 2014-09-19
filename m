Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8J3XgTf032349
	for <linux-lvm@redhat.com>; Thu, 18 Sep 2014 23:33:42 -0400
Received: from esa2.ucsf.iphmx.com (esa2.ucsf.iphmx.com [68.232.143.34])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8J3XfW7017946
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 18 Sep 2014 23:33:41 -0400
Received: from exht05.net.ucsf.edu (mx.ucsf.edu [64.54.247.193]) by
	bcuda4.ucsf.edu with ESMTP id TjeGvfGRJXp1l96V (version=TLSv1
	cipher=AES128-SHA bits=128 verify=NO) for
	<linux-lvm@redhat.com>; Thu, 18 Sep 2014 20:33:39 -0700 (PDT)
From: "Boylan, Ross" <Ross.Boylan@ucsf.edu>
Date: Fri, 19 Sep 2014 03:33:38 +0000
Message-ID: <F1F13E14A610474196571953929C0209623F9B@ex08.net.ucsf.edu>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Incorrect metadata area header checksum
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

While doing some work on my system I added a new disk, GPT partitioned it, and created a new VG "mongo" out of the big partition (~1TB).  After various operations detailed below, and a few hours of apparent success, things started to go wrong.  My root file system (/, not just /root), in my other VG "turtle", experienced read problems and was remounted read-only.  The new filesystem on mongo also became unreadable.  vgsan and other LVM commands, which had been happy, started reporting
Incorrect metadata area header checksum
although they still reported info on turtle--but not mongo.

First question: If vgdisplay turtle displays the incorrect metadata message, is that a sure sign that turtle's metadata is bad, or could it be from mongo?
At first I thought it meant both VG's (on 2 separate disks) had failed, but now I'm not so sure--I've been able to reboot with turtle, though nothing in mongo is accessible.

Second question: what could cause the problem(s)?

Behind these question I'm wondering what state my system is in, and whether this indicates LVM is unsafe to use in the way I do.  It's worked great before this.  I think I have to reinstall and restore from backups, since bad things were happening to my filesystems.

Thanks.

Ross Boylan

Details:
For both VG's I allocated all free space and wiped it:
lvcreate -l 100%FREE -n tozero turtle
cryptsetup --key-file /etc/crypt/big1ah zero_crypt /dev/turtle/tozero
dd if=/dev/zero of=/dev/mapper/zero_crypt
I then freed the LV's so created and added some of the resulting free space to other LV's.
It seems possible that this may have stressed LVM too far.  "turtle" also had active snapshots (no thin provisioning).

The growth was considerable, e.g., from 20G to 40G.  Maybe the block size changed?  But I made no changes to the root filesystem, and that's what failed first.

The necessary crypto headers disappeared from  some of the LV's, although now that I've rebooted they seem to be back (?) for turtle.  The RAID headers tested fine throughout.  It looks as if the pv for mongo is still recognized, even though the VG is not:
# date; pvdisplay
Thu Sep 18 20:28:22 PDT 2014
  Incorrect metadata area header checksum
  --- Physical volume ---
  PV Name               /dev/md1
  VG Name               turtle
  PV Size               696.68 GB / not usable 2.00 MB
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              178350
  Free PE               24932
  Allocated PE          153418
  PV UUID               3cc3d1-tvjW-ZVwP-Gegj-NKF3-S2bA-AEQ59e

  "/dev/sda2" is a new physical volume of "931.51 GB"
  --- NEW Physical volume ---
  PV Name               /dev/sda2
  VG Name
  PV Size               931.51 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               iTdabJ-Unml-Qs4h-wIQE-cpo0-7nWQ-tzRlCU


0.90 metadata for RAID.

VG mongo is made of one partition on one physical disk
VG turtle is made of one software RAID-1 disk; the RAID is made of GPT partitions on 2 disks.
The one LV on mongo had crypt (in the cryptsetup sense) on it, and many of the LV's on turtle (including root) used crypto

Debian Lenny (very old--I was getting ready to upgrade) on amd64.
linux kernel 2.6.32-5-amd64 (which is newer than Lenny)
lvm2                             2.02.39-8                              The Linux Logical Volume Manager
cryptsetup                   2:1.0.6-7     (ignore the 2: prefix; it's 1.0.6)               configures encrypted block devices
mdadm                         2.6.7.2-3                              tool to administer Linux MD arrays (software RAID)
