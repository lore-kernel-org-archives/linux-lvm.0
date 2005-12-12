Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBC8Pn119068
	for <linux-lvm@redhat.com>; Mon, 12 Dec 2005 03:25:49 -0500
Received: from uproxy.gmail.com (uproxy.gmail.com [66.249.92.196])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBC8Pd2b016766
	for <linux-lvm@redhat.com>; Mon, 12 Dec 2005 03:25:39 -0500
Received: by uproxy.gmail.com with SMTP id k40so126213ugc
	for <linux-lvm@redhat.com>; Mon, 12 Dec 2005 00:25:38 -0800 (PST)
Date: Mon, 12 Dec 2005 15:25:23 +0700
From: Andrey Subbotin <eploko@gmail.com>
Message-ID: <45980936.20051212152523@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Converting LVM back to Ext2?
Reply-To: Andrey Subbotin <eploko@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello all.

I've got a 200GB HD partitioned automatically during Fedora Core 4 setup. That is the disk carries 2 partitions where the first one (/dev/sda1) is ext3 mounted as /boot and the second one (/dev/sda2) is an LVM. 

That is all clear and fancy but the problem is I'm faced with the fact I need to migrate the HD to Ext2 FS, so I could convert it to FAT32 later, so I could access it from a copy of the Windows OS I happen to boot recently to do some work. The LVM on /dev/sda2 is full of data I need to save and the problem is I don't have a spare HD to temporarily copy all those 200GB to. 

If I had a spare HD I would eventually mount it, make a new Ext2 partition on it and then copy all the data from the LogicalVolume to the new partition. Then I would fire up fdisk and kill the LVM, thus freeing the space on the drive. Then, moving the data back to the first HD would be a snap. But without a spare disk I face a real challenge.

My initial idea was to reduce the FS inside the LogicalVolume (it has ~40GB free of space) and then reduce the size of the LogicalVolume and then reduce the PhysicalVolume /dev/sda2 by the freed number of cylinders. Then, I would create an ext2 partition over the freed cylinders and move some files from the LogicalVolume onto it. Then I thought I would repeat the process several times effectively migrating my data from the ever-shrinking LVM to the ever-growing plain Ext2 FS. 

The problem is I have little idea how I can shrink an LVM partition on /dev/sda2. And there seem to be very little information on this on the net.

So far, I have lvreduce'd the FS inside the LogicalVolume and the LogicalVolume itselft to 35700000 4k blocks. Now, how do I redeuce the number of cyllinders occupied by the LVM on /dev/sda?

I would really apreciate any help or ideas. 
Thanks a lot in advance.

-- 
See you,
Andrey

ICQ UIN: 114087545
Journal: http://www.livejournal.com/users/e_ploko/
