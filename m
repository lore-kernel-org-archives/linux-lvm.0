Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3M4rYp19331
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 00:53:34 -0400
Received: from bedevere.spamaps.org (ip-65-77-168-70-muca.aerosurf.net
	[65.77.168.70])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3M4rXMc017225
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 00:53:34 -0400
Received: from [172.16.129.42] (helo=spamaps.org)
	by bedevere.spamaps.org with esmtp (Exim 3.35 #1 (Debian))
	id 1BGWDM-0001Mk-00
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 21:53:32 -0700
Date: Wed, 21 Apr 2004 21:53:32 -0700
Subject: Re: [linux-lvm] About Extending LVM size with Hardware Raid
Mime-Version: 1.0 (Apple Message framework v553)
From: Clint Byrum <cbyrum@spamaps.org>
Content-Transfer-Encoding: 7bit
In-Reply-To: <4086E2FA.6090201@gbrmpa.gov.au>
Message-Id: <01285A15-9419-11D8-B982-000A95730E92@spamaps.org>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>


On Wednesday, April 21, 2004, at 02:09 PM, Glen Harris wrote:

> I have a similar system - a fibre channel RAID box. I added a disk to 
> it
> and expanded the RAID5 device, then used the scsiadd command to rescan
> the device. If your card emulates a SCSI disk, this may work. 
> Otherwise,
> try unloading/loading the kernel driver module(if possible), and 
> failing
> that a reboot should work.
>
> Anyway, the new size was reported correctly as 1.25Tb, so I then used
> pvresize to grow the pv to the new size of the device.
>

Just curious, but what kind of rebuild time do you see on that 1.25TB 
RAID5 volume?

I know you have a hardware controller, but I've found that with Linux's 
software RAID5, anything over 400GB or so will take over 3 hours on a 
decent disk system to rebuild. Thats why I use LVM to aggregate several 
RAID5 volumes, rather than one giant RAID5. I generally expect that it 
will take a couple of hours to see the failure, find a replacement, and 
get it installed in the machine (thats if I'm onsite, and have spares 
on hand ) With a 2 hour rebuild time, I'm already looking at 4 hours of 
exposure where another disk failure means data loss. Thats already 
pretty high to me, especially if there's something systemic causing 
drives to fail.

Even with hot spares, you still have to be careful during the array 
rebuild. :-P
