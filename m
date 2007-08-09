Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l799AWju023848
	for <linux-lvm@redhat.com>; Thu, 9 Aug 2007 05:10:34 -0400
Received: from barge.anchor.net.au (barge.anchor.net.au [203.202.1.123])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l799APSO000583
	for <linux-lvm@redhat.com>; Thu, 9 Aug 2007 05:10:25 -0400
Received: from [127.0.0.1] (dsl-58-6-32-215.nsw.westnet.com.au [58.6.32.215])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by barge.anchor.net.au (Postfix) with ESMTP id 8075A10103
	for <linux-lvm@redhat.com>; Thu,  9 Aug 2007 19:11:52 +1000 (EST)
Message-ID: <46BAD9DC.5030303@backstagetech.com.au>
Date: Thu, 09 Aug 2007 19:09:48 +1000
From: Scott Eade <seade@backstagetech.com.au>
MIME-Version: 1.0
References: <46B6A2D5.6030402@backstagetech.com.au>
In-Reply-To: <46B6A2D5.6030402@backstagetech.com.au>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: superblock or partition table corrupt - fixable?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Well after numerous problems I managed to sort this mess out for myself. 
  For the blow by blow and details of my eventual solution take a look 
at: http://forums.fedoraforum.org/showthread.php?t=162893

As a final comment: I experienced a catastrophic bug in 
system-configure-lvm (or one of the underlying libraries).  In my case I 
had a backup of the critical data on the volume and in fact the data was 
fine anyway (just the file system superblocks were screwed up) and hence 
I was able to recover.  I would not however expect the vast majority of 
users out there to be able to recover from this problem.

The linux lvm is a great piece of software - I really appreciate what it 
does.  It scares me however that that a bug such as the one that I 
apparently hit might exist.

I would highlight also that the standard Fedora 7 recover mode (booting 
from the install DVD that is) can make it somewhat complicated to deal 
with lvm problems (the thread at the above link touches on this).

Keep up the great work.

Scott

Scott Eade wrote:
> My problem is that system-config-lvm seems to have corrupted the 
> superblock on my root logical volume. When I boot I am required to fsck 
> manually and this reports: "Either the superblock or the partition table 
> is likely to be corupted." Further details show that the superblock 
> thinks the volume size is some 71663616 blocks where as the physical 
> size of the volume is just 57884672 blocks. The following is a 
> description of how I got to this point.
> 
> I have a Fedora 7 box, recently upgraded from FC5. System had a single 
> 250GB HD and I am in the process of adding a second HD, this time 500GB.
> 
> I used system-config-lvm to create a partition on the new drive and 
> added it to the original volume group (VolGroup00).
> 
> I then attempted to extend the original logical volume (LogVol00) by 
> some arbitrary portion of the newly added PV - I kind of assumed that 
> part of the point of LVM was to allow LVs greater in size than a PV. I 
> still don't know whether or not this is supported, but in any case the 
> operation in system-config-lvm failed. I just assumed that this was a 
> graceful failure and went on to create a couple of new LVs for stuff I 
> would pull out of LogVol00.
> 
> I completed the configuration of the new LVs, including copying the data 
> from LogVol00 and updating fstab to mount the new LVs, but upon reboot I 
> am required to run fsck manually and the above listed error is produced.
> 
> So it seems to me that my original attempt to expand LogVol00 using 
> system-config-lvm did not actually fail gracefully - it appears to have 
> updated the superblock with the new size before then falling over when 
> updating the partition table.
> 
> fsck is not particularly helpful - upon boot the system stops and 
> requires me to run fsck manually with no -p. The first error that comes 
> up when I manually fsck is the one listed above followed by an Abort 
> prompt which requires a N response in order to continue (so there goes 
> any opportunity of using -y). If I don't abort it goes onto Phase 1, 
> checking inodes, blocks and sizes and starts failing on blocks above 
> 57884672. Each block then fails, so something like 41 million Y 
> responses would need to be manually entered in order to get through 
> Phase 1 of fsck - not really viable and unlikely to resolve the problem 
> in any case.
> 
> If I boot using the Fedora 7 DVD and select the recover mode it mounts 
> the volume group with no problem and all of the data is present and 
> accessible (in fact the entire system image seems fine, including the 
> data on the two new LVs I created).
> 
> To me this says that all is well, but this doesn't stop fsck from 
> falling over when it hits the bad information in the superblock.
> 
> I have looked at the set up using TestDisk, but since it doesn't look 
> inside the LV it doesn't seem to offer much hope.
> 
> I am guessing that the solution would be to somehow revert the volume 
> size in the superblock. Is there some way to do this or am I barking up 
> the wrong tree?
> 
> TIA for any assistance rendered,
> 
> Scott
> 
