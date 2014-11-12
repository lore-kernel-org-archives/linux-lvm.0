Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sACMXqco032562
	for <linux-lvm@redhat.com>; Wed, 12 Nov 2014 17:33:52 -0500
Received: from golfcontact.eu (golfcontact.eu [62.210.207.121])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sACMXoSn006143
	for <linux-lvm@redhat.com>; Wed, 12 Nov 2014 17:33:50 -0500
Received: from [10.0.0.145] (143.141.broadband17.iol.cz [109.80.141.143])
	by golfcontact.eu (Postfix) with ESMTPSA id DC58C288030A
	for <linux-lvm@redhat.com>; Wed, 12 Nov 2014 23:16:13 +0100 (CET)
Message-ID: <5463DC2D.5020305@ttux.net>
Date: Wed, 12 Nov 2014 23:16:13 +0100
From: Marc des Garets <marc@ttux.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] broken fs after removing disk from group
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi,

I messed up a bit and I am trying to find the best way to recover.

A few days ago, 1 of the physical disk of my lvm setup started to show 
sign of failure (I/O errors) so I decided to move it to another disk 
with pvmove. That didn't work out. After 5 days, pvmove had done only 
0.1% so I stopped it.

After a reboot, the dying disk wouldn't show up at all, it had died 
completely so I decided to remove it with vgreduce --removemissing 
--force VolGroup00

Problem is that it refused to do so because of the pvmove saying the LV 
was locked. I tried pvmove --abort which refused to do so because of the 
missing disk that died.

So I was stuck and did: vgcfgbackup VolGroup00

Then I edited the file, removed the entry about pvmove, tried 
vgcfgbackup VolGroup00 which refused to restore because of the missing 
disk so I edited the file again, removed the missing disk from there and 
did the vgcfgrestore which succeeded.

Now the problem is that I can't mount my volume because it says:
wrong fs type, bad option, bad superblock

Which makes sense as the size of the partition is supposed to be 2.4Tb 
but now has only 2.2Tb. Now the question is how do I fix this? Should I 
use a tool like testdisk or should I be able to somehow create a new 
physical volume / volume group where I can add my logical volumes which 
consist of 2 physical disks and somehow get the file system right (file 
system is ext4)?

pvdisplay output:

   --- Physical volume ---
   PV Name               /dev/sda4
   VG Name               VolGroup00
   PV Size               417.15 GiB / not usable 4.49 MiB
   Allocatable           yes (but full)
   PE Size               4.00 MiB
   Total PE              106789
   Free PE               0
   Allocated PE          106789
   PV UUID               dRhDoK-p2Dl-ryCc-VLhC-RbUM-TDUG-2AXeWQ

   --- Physical volume ---
   PV Name               /dev/sdb1
   VG Name               VolGroup00
   PV Size               1.82 TiB / not usable 4.97 MiB
   Allocatable           yes (but full)
   PE Size               4.00 MiB
   Total PE              476923
   Free PE               0
   Allocated PE          476923
   PV UUID               MF46QJ-YNnm-yKVr-pa3W-WIk0-seSr-fofRav


Thank you for your help.


Marc
