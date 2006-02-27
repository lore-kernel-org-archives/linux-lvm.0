Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1RH4H108084
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2006 12:04:17 -0500
Received: from fed1rmmtao05.cox.net (fed1rmmtao05.cox.net [68.230.241.34])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1RH4G9H002183
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2006 12:04:16 -0500
Received: from [70.187.180.140] by fed1rmmtao05.cox.net
	(InterMail vM.6.01.05.02 201-2131-123-102-20050715) with ESMTP
	id <20060227170118.RGCR17838.fed1rmmtao05.cox.net@[70.187.180.140]>
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2006 12:01:18 -0500
Message-ID: <44033100.6010600@tsss.org>
Date: Mon, 27 Feb 2006 09:04:00 -0800
From: kelsey hudson <khudson@tsss.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM drive changed from USB to Firewire
References: <1d4c059f0602250659u54eeaa7bldce33e389430b1d6@mail.gmail.com>
	<20060225191211.GB31720@old.davidb.org>
In-Reply-To: <20060225191211.GB31720@old.davidb.org>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

David Brown wrote:
>>The problem is that the drive is not found at boot anymore, and an
>>error is raised because it can't be mounted. But if I do a vgscan,
>>then a vgchage -ay, then mount -a, all is well and my volumes are
>>mounted.
>>
>>How do I tell LVM to look at the firewire card instead of the usb controller?
> 
> LVM should look at all of the devices.
> 
> Most likely the firewire interface/driver takes longer to startup than the
> USB does, and the drive isn't visible when the startup scripts do their
> vgscan.

i've had a bunch of success with one machine on which I run LVM by 
simply adding a 5-second wait period between the time the kernel calls 
/sbin/init and it begins executing the contents of whatever rc script 
init starts at your desired runlevel (add 'sleep 5' to the beginning of 
this script). kernel threads are great in some circumstances (like 
improving boot speed), but sometimes i guess you could say it boots too 
fast for its own good!

just a side note though: my experience with ieee1394 under linux has 
been less-than-satisfactory: i can't seem to get a decent aggregate raw 
transfer rate of >11MByte/sec, no matter what hardware i use. i've since 
  switched back to usb2.0, even though usb is completely and wholly the 
wrong transport to use for mass storage devices :(

if you can get your disks working faster than this, please let me know 
how you did it. :)

thanks
-kelsey
