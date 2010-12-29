Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oBTE3Qbp010140
	for <linux-lvm@redhat.com>; Wed, 29 Dec 2010 09:03:26 -0500
Received: from BLADE3.ISTI.CNR.IT (blade3.isti.cnr.it [194.119.192.19])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oBTE3Epd010226
	for <linux-lvm@redhat.com>; Wed, 29 Dec 2010 09:03:15 -0500
Received: from SCRIPT-SPFWL-DAEMON.mx.isti.cnr.it by mx.isti.cnr.it
	(PMDF V6.5-x5 #31825) id <01NVZWG8Q3YONG559C@mx.isti.cnr.it> for
	linux-lvm@redhat.com; Wed, 29 Dec 2010 15:02:09 +0100 (MET)
Received: from conversionlocal.isti.cnr.it by mx.isti.cnr.it
	(PMDF V6.5-x5 #31825) id <01NVZWG8LGBKNG59ZY@mx.isti.cnr.it> for
	linux-lvm@redhat.com; Wed, 29 Dec 2010 15:02:09 +0100 (MET)
Received: from [192.168.7.52] (firewall.itb.cnr.it [155.253.6.254])
	by mx.isti.cnr.it (PMDF V6.5-x5 #31826)
	with ESMTPSA id <01NVZWG7OYU2NQ2BY0@mx.isti.cnr.it> for
	linux-lvm@redhat.com; Wed, 29 Dec 2010 15:02:08 +0100 (MET)
Date: Wed, 29 Dec 2010 15:02:18 +0100
From: Spelic <spelic@shiftmail.org>
In-reply-to: <4D1A9FAF.6050401@shiftmail.org>
Message-id: <4D1B3F6A.4070309@shiftmail.org>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <4D1A9FAF.6050401@shiftmail.org>
Subject: Re: [linux-lvm] pvmove painfully slow on parity RAID
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: linux-lvm@redhat.com

On 12/29/2010 03:40 AM, Spelic wrote:
> Hello list
>
> pvmove is painfully slow if the destination is on a 6-disks MD raid-5, 
> it performs at 200-500Kbytes/sec! (kernel 2.6.36.2)
> Same for lvconvert add mirror.
>
> Instead, if the destination is on a 4 devices MD raid10near, it 
> performs at 60MBytes/sec which is much more reasonable. (this is a 
> 120-fold difference at least!)
> Same for lvconvert add mirror.
>

Sorry, yesterday I made a few mistakes computing the speeds.
Here are the times for moving a 200MB logical volume towards various 
types of MD arrays (either pvmove or lvconvert add mirror: doesn't 
change much)

It's the destination array that matters, not the source array.

raid5, 8 devices, 1024k chunk:  36 seconds (5.5MB/sec)
raid5, 6 device, 4096k chunk: 2m18sec ?!?! (1.44 MB/sec!?)
raid5, 5 devices, 1024k chunk: 25sec (8MB/sec)
raid5, 4 devices, 16384k chunk: 41sec (4.9MB/sec)
raid10, 4 devices, 1024k chunk, near-copies: 5 sec! (40MB/sec)
raid1, 2 devices: 3.4sec! (59MB/sec)
raid1, 2 devices (another, identical to the above): 3.4sec! (59MB/sec)

I tried multiple times for every device with consistent results, so I'm 
pretty sure these are actual numbers.
What's happening?
Apart from the amazing difference of parity raid vs nonparity raid, with 
parity raid it seems to vary randomly with the number of devices and the 
chunksize..?

I tried various --regionsize settings for lvconvert add mirror but the 
times didn't change much.

I even tried to set my SATA controller to ignore-FUA mode (it fakes the 
FUA, returns immediately) => no change.

Thanks for any info
