Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o11ISk5u016356
	for <linux-lvm@redhat.com>; Mon, 1 Feb 2010 13:28:46 -0500
Received: from h7.zynet2.co.uk (h7.zynet2.co.uk [212.24.80.7])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o11ISVFr030609
	for <linux-lvm@redhat.com>; Mon, 1 Feb 2010 13:28:31 -0500
Received: from h93.zynet2.co.uk (h93.zynet2.co.uk [212.24.80.93])
	by h7.zynet2.co.uk (Postfix) with ESMTP id 39FC633F70
	for <linux-lvm@redhat.com>; Mon,  1 Feb 2010 18:28:30 +0000 (GMT)
Received: from h66.zynet2.co.uk (h66.zynet2.co.uk [212.24.80.66])
	(Authenticated sender: simon)
	by h93.zynet2.co.uk (Postfix) with ESMTPA id 2E494A46779
	for <linux-lvm@redhat.com>; Mon,  1 Feb 2010 18:28:30 +0000 (GMT)
From: Simon Waters <simonw@zynet.net>
Date: Mon, 1 Feb 2010 18:28:29 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201002011828.29896.simonw@zynet.net>
Subject: [linux-lvm] Newbie: Yet another "Incorrect metadata area header
	checksum"
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Installed Debian Lenny using NetInst CD 5.0.3 i386 dated  20090906-12:06 onto 
a DELL SC1425 with two SATA disks.

The system had previously had Centos 5.4 installed with LVM. The Debian 
installer was fighting back a little (because of this?), but eventually I 
picked "Guided Install with LVM" and it behaved in a plausible fashion 
(/dev/sda1 for /boot, /dev/sda2 for LVM, lots of partitions because I asked 
for them).

All seemed to go fine. The system installed, and booted, I shrunk /home file 
system and then logical volume, then expanded /home to fit the new lv size. I 
add /dev/sdb1 to the only volume group, add a logical volume. Basically 
convinced myself LVM was working and that I could administer it.

The I turned my attention to the error message that some of the commands 
produced: "Incorrect metadata area header checksum", since it looked 
annoying.

I've tried a lot of things rather blindly. The first occurance is in the 
installer log after the message "Queuing package e2fsprogs for later 
installation" from "Main-Menu" so presumably in response to me using the 
Debian installer menu's to set up LVM. This suggests it all went pear shaped 
before I had the opportunity to mistype stuff at the command line.

One suggestion was to install "dmraid" and look for metadata using this.
It produces:
 /dev/sdb: ddf1. ".ddf1_disks", GROUP, ok, 155989151 sectors, data@ 0
 /dev/sda: ddf1. ".ddf1_disks", GROUP, ok, 155989151 sectors, data@ 0

Attempts to erase this with "dmraid -rE" as suggested in one post fail with a 
three lines of:

ERROR: seeking device "/dev/sdb" to 40959999737856
ERROR: writing metadata to /dev/sdb, offset 79999999488 sectors, size 0 bytes 
returned 0
ERROR: erasing ondisk metadata on /dev/sdb
(and same for /dev/sda).

Other suggestion was make sure Debian Lenny packages were upto date. They are. 
The netinst CD just does that now - I'm sure it didn't always do that but I 
double checked and no updates are available.

This is my first (Linux) LVM install - be gentle.

Did I fail in preparing my disks in some way?
