Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAAEdNBB009625
	for <linux-lvm@redhat.com>; Wed, 10 Nov 2010 09:39:23 -0500
Received: from mail-gy0-f174.google.com (mail-gy0-f174.google.com
	[209.85.160.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAAEdB9k001393
	for <linux-lvm@redhat.com>; Wed, 10 Nov 2010 09:39:11 -0500
Received: by gyh4 with SMTP id 4so398467gyh.33
	for <linux-lvm@redhat.com>; Wed, 10 Nov 2010 06:39:10 -0800 (PST)
Message-ID: <4CDAAE84.5060806@gmail.com>
Date: Wed, 10 Nov 2010 09:39:00 -0500
From: Mauricio Tavares <raubvogel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Bad disk?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Yesterday I added a hard drive (to put extra stuff on it) to my ubuntu 
10.10 box and created a LVM in it. Then copied some files to it and 
restarted the machine to see if it would mount into the right 
mountpoint. It didn't. So I decided to see if it was there (vg in 
question is export):

raub@strangepork:~$ sudo vgscan
   Reading all physical volumes.  This may take a while...
   /dev/dm-0: read failed after 0 of 4096 at 429496664064: Input/output 
error
   /dev/dm-0: read failed after 0 of 4096 at 429496721408: Input/output 
error
   /dev/dm-0: read failed after 0 of 4096 at 0: Input/output error
   /dev/dm-0: read failed after 0 of 4096 at 4096: Input/output error
   /dev/dm-0: read failed after 0 of 4096 at 0: Input/output error
   Found volume group "export" using metadata type lvm2
   Found volume group "root" using metadata type lvm2
raub@strangepork:~$

Those dm-0 messages do not make me happy. dmesg and vgchange make me 
think the problem is on the new drive:

[  268.024593] scsi 0:0:0:0: Direct-Access     ATA      ST3500320NS 
  SN04 PQ: 0 ANSI: 5
[  268.024900] sd 0:0:0:0: [sdc] 976773168 512-byte logical blocks: (500 
GB/465 GiB)
[  268.024918] sd 0:0:0:0: Attached scsi generic sg2 type 0
[  268.024996] sd 0:0:0:0: [sdc] Write Protect is off
[  268.025003] sd 0:0:0:0: [sdc] Mode Sense: 00 3a 00 00
[  268.025046] sd 0:0:0:0: [sdc] Write cache: enabled, read cache: 
enabled, doesn't support DPO or FUA
[  268.025377]  sdc: sdc1
[  268.049853] sd 0:0:0:0: [sdc] Attached SCSI disk
[  335.467482] quiet_error: 3 callbacks suppressed
[  335.467492] Buffer I/O error on device dm-0, logical block 104857584
[  335.467540] Buffer I/O error on device dm-0, logical block 104857584
[  335.467589] Buffer I/O error on device dm-0, logical block 104857598
[  335.467615] Buffer I/O error on device dm-0, logical block 104857598
[  335.467647] Buffer I/O error on device dm-0, logical block 0
[  335.467671] Buffer I/O error on device dm-0, logical block 0
[  335.467703] Buffer I/O error on device dm-0, logical block 1
[  335.467734] Buffer I/O error on device dm-0, logical block 104857599
[  335.467762] Buffer I/O error on device dm-0, logical block 104857599
[  335.467788] Buffer I/O error on device dm-0, logical block 104857599

raub@strangepork:~$ sudo vgchange -a y
   /dev/dm-0: read failed after 0 of 4096 at 0: Input/output error
   1 logical volume(s) in volume group "export" now active
   4 logical volume(s) in volume group "root" now active
raub@strangepork:~$

Glancing through http://readlist.com/lists/centos.org/centos/1/5704.html 
I wondered if I had the wrong file system descriptor:

raub@strangepork:~$ sudo sfdisk -l /dev/sdc

Disk /dev/sdc: 60801 cylinders, 255 heads, 63 sectors/track
Units = cylinders of 8225280 bytes, blocks of 1024 bytes, counting from 0

    Device Boot Start     End   #cyls    #blocks   Id  System
/dev/sdc1          0+  60800   60801- 488384001   8e  Linux LVM
/dev/sdc2          0       -       0          0    0  Empty
/dev/sdc3          0       -       0          0    0  Empty
/dev/sdc4          0       -       0          0    0  Empty
raub@strangepork:~$

I guess that rules that out. Does that mean the disk is bad? If so, is 
there a way to retrieve the data I put in it?
