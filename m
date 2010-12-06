Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oB6MaekE009273
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2010 17:36:40 -0500
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB6MaOpC021627
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2010 17:36:28 -0500
Received: from [192.168.1.4] (unknown [82.66.78.161])
	by smtp4-g21.free.fr (Postfix) with ESMTP id 10B3D4C80B9
	for <linux-lvm@redhat.com>; Mon,  6 Dec 2010 23:36:20 +0100 (CET)
Message-ID: <4CFD6563.70508@free.fr>
Date: Mon, 06 Dec 2010 23:36:19 +0100
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] A hint on a process
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello !
I've a system (now on Ubuntu 9.04, but initially on a Fedora ) set up as
follow :
There are two RAID1 software raid arrays (md0 , which is around 100 Mb
and holding an Ext2 FS for use in booting, md1 occupying the rest of the
space used as a PV for LVM) made on a couple of old 160 GB disks.

On the LVM VG0 are a lot of LV onto which Ubuntu is installed.

One of the two disks failed. I can't find a 160 GB replacement. Only 320
Gb for the smallest availlable disk near where I live.

So I plan to move the system to 320 GB disks and, if possible, not
wasting the 320-160 difference....
The process I thought about is as follow :

1) insert one 320 disk in both arrays (after partitioning it correctly,
100 Mb for the first partition and the remaining for the second.)

2) wait for the raid1 to synchronize.

3) mark the remaining 160 GB disk as failed and remove/replace with
another 320 GB disk set up as the first.

4) wait for the arrays to reconstruct/synchronize.

5) Extend the PV my Volume Group is build on (md1 in this case)

6) enjoy a beer...

What do you think of my method ? Is it a good one or am I missing
something ? You will have understood that losing data is not an option ...
Many thanks in advance for your answers, critics and pointers...
Regards.

-- 
If the only tool you have is a hammer, you tend to see every problem as a nail.
                Abraham Maslow
A British variant :
Any tool can serve as a hammer but a screwdriver makes the best chisel. 
