Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i191aGa22077
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2004 20:36:16 -0500
Received: from tomhollins.com (nameservices.net [208.234.23.178] (may be forged))
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i191aGb16050
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2004 20:36:16 -0500
Received: from tomhollins.com (h238.223.40.162.ip.alltel.net [162.40.223.238])
	by tomhollins.com (8.12.10/8.12.10) with ESMTP id i191Rare000805
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2004 20:27:36 -0500
Message-ID: <4026E3D7.8010802@tomhollins.com>
From: tom <tom@tomhollins.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm]VG Recovery off multiple PV's
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
Date: Sun Feb  8 20:35:18 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I saw your message in January but I have been working on the "mysteries 
of LVM on-disk layout". Here is what I "think" I've found.
1) Even if your lvm is screwed up, your ext2/3 data is probably still 
there since that volume wasn't the one with physical problems.
2) If you want to "backup" for safety's sake your ext2 data then you 
need to do a pvdata for each of your partitions. The developers have a 
better handle on this, maybe one day they will post to your problem.
The Ext2 filesystem is placed on a hard disk starting at 1024 bytes in 
from the beginning of the partition. This is probably for MBR areas 
(which are usually 512 bytes I believe).
There is a 56 byte data area (mine always start with 0x00)
There is the magic number for the filesystem type 53EF (this is byte 
reversed order of 0xEF53. Magic numbers found in /usr/share/misc/magic)
The there is your ext2 partition metadata and data (I don't care of the 
layout and neither do you, only the size).
Question is where is this on the partition? And the answer is, this is 
roughly dynamically assigned space based on the size of your physical 
volume (I am guessing, you have to look at the lvm code). I used dd to 
find out using hexedit what is going on here :
I will use your first partition /dev/hdg1 to work on all examples.
dd if=/dev/hdg1 of=(any filename on a partition with space to hold it 
lets call it hdg1.e2fs for example) ibs=512 obs=1M count=(supposed to be 
ibs * this count=total bytes but I didn't have the space for it on mine 
so I can't be sure)
Your data is saved. Now the hard part is to either mount it in the 
loopback mount, note: the directory name can be anything.
mkdir /mnt/widget  
mount -t ext3 -o ro,errors=continue,loop  (full path)/hdg1 /mnt/widget
Now mine says the standard error of bad superblock, etc... And this is 
as far as I got. Maybe you won't have my problems.
Also, my theory is that if you have a comparable disk and lets say it is 
hdf then you should be able to dd directly to that disk and it should 
mount ok (my theory only but I am going to try it when my drive 
arrives). the command would be :
dd if=/dev/hdg1 of=/dev/hdf ibs=512 obs=1M count=60G
About 45mins later roughly it should be done. There is NO status info in 
dd saying nn% complete or anything like that, just let it run.

After all data is accounted for and backed up then you can restart the 
LVM process.
I hope this helps a little, sorry I haven't the experience (yet) to tell 
you how to finish the recovery.

I want to say though, that as you start your LVM init process for the 
disks that the lvm dir should be backed up at each step then reboot to 
make sure everything is ok. Short of this and you will get yourself into 
my situation, where there is data and preferences that have accummulated 
over time that I never thought to backup, I copied the data to the lvm, 
everything looked ok, booted ok, then BLAM primary boot disk dies and 
takes all of the LVM data with it, with nearly no chance of recovery. 
C'est la vie!

Good luck. Happy hunting.
-T-
