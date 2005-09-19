Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8JC1aV28259
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2005 08:01:36 -0400
Received: from www.geoinf.fu-berlin.de (www.geoinf.fu-berlin.de [160.45.89.23])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8JC1VEB026355
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2005 08:01:36 -0400
Received: from [160.45.89.15] (callisto.geoinf.fu-berlin.de [160.45.89.15])
	by www.geoinf.fu-berlin.de (Postfix) with ESMTP id 86136A1E03
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2005 13:56:36 +0200 (CEST)
Message-ID: <432EA763.9020501@alice-it.net>
Date: Mon, 19 Sep 2005 13:56:19 +0200
From: Sebastian <sebastian@alice-it.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] EMERGENCY: killing pvmove
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

Hello List,

I'm in a emergency situation so I haven't had the time to go through all 
the threads. I have had a strange problem and through my interaction it 
is now more severe as I think, so I have to get advice quickly.

I have several RAID subsets as physical volumes, each 1,4 TB in size, 
combine to a volume group of 8,6 TB. This VG is splitted in 6 LV's. One 
of the LV I did resize last week, and therefore added one PV of again 
1,4TB to the VG, and resized one LV.

After that -- everything went ok, even resizing the ext3 partition -- I 
got Input/Output errors while writing to the newly resized partition 
(writing to the extended part of the partition). As realising this, I 
put all the data off this partition, deleted it and was then trying to 
remove the Raid subsystem with pvmove. While doing "pvmove /dev/sdg" I 
just got an "segmentation fault".

As this wouldn't be enough, I restarted the computer putting the new 
RAID subsystem on a different scsi controller, as I thought this could 
be the problem. Then the pvmove command worked!

But as I realised shortly, I just moved the wrong one, as /dev/sdg is 
now another subsystem (the damaged one is now /dev/sde).
Now I have the Problem that my sane part of the data is slowly moving to 
the insane disk, which I can't stop! Even ctrl-c does not help...

How to stop it? Is a SIGTERM or SIGKILL allowed? Pleas help, I'm running 
out of time!

Thanks a lot!!!!
yours
Sebastian
