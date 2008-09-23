Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8NLSIuF029356
	for <linux-lvm@redhat.com>; Tue, 23 Sep 2008 17:28:18 -0400
Received: from ripple.fruitbat.org (69-12-150-177.dsl.static.sonic.net
	[69.12.150.177])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8NLQJw4017937
	for <linux-lvm@redhat.com>; Tue, 23 Sep 2008 17:26:21 -0400
Received: (from daemon@localhost)
	by ripple.fruitbat.org (8.13.4/8.8.8/PAC-1.3) id m8NLOJZt028646
	for <linux-lvm@redhat.com>; Tue, 23 Sep 2008 14:24:19 -0700
Received: from gremlin.fruitbat.org (IDENT:202@gremlin.fruitbat.org
	[192.168.55.4])
	by ming.fruitbat.org (8.12.10/8.10.2/PAC-1.6) with ESMTP id
	m8NLO934001819
	for <linux-lvm@redhat.com>; Tue, 23 Sep 2008 14:24:10 -0700
Date: Tue, 23 Sep 2008 14:24:09 -0700 (PDT)
From: "Peter A. Castro" <doctor@fruitbat.org>
Subject: Re: [linux-lvm] LVM label lost on MD RAID5 reshape?
In-Reply-To: <20080923210233.GA32676@newbie.thebellsplace.net>
Message-ID: <Pine.LNX.4.64.0809231419010.4246@gremlin.fruitbat.org>
References: <20080923210233.GA32676@newbie.thebellsplace.net>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 23 Sep 2008, Bob Bell wrote:

Greetings, Bob,

> I'm up a creek, and hoping someone out there can help rescue my data, or at 
> least tell me what went wrong so that I don't have a repeat event.  I'm 
> starting with this question on linux-lvm, though let me know if you think the 
> discussion needs to be on linux-raid as well.
>
> I'm setting up a new server running Ubuntu's Hardy Heron release.  `lvm 
> version` reports:
> LVM version:     2.02.26 (2007-06-15)
> Library version: 1.02.20 (2007-06-15)
> Driver version:  4.12.0
> `uname -a` reports:
> Linux sherwood 2.6.24-16-server #1 SMP Thu Apr 10 13:58:00 UTC 2008 i686 
> GNU/Linux
>
> I initially created an md RAID5 device with only two components (matching 320 
> GB SATA HDDs).  I created a single Physical Volume using the entirety of that 
> md device (320 GB), and then created several Logical Volumes for different 
> filesystems (all ext3).  This was done using the Ubuntu installer.  After 
> installing I used lvresize to increase the size of a few of the Logical 
> Volumes, as I was conservative regarding the size during installation.  These 
> filesystems hold data that is not a critical part of the system (mail, music, 
> video, etc.).
>
> (I also have a similar setup with a couple of IDE drives that I use for the 
> system (/home, /var, /boot, /), but I haven't touched those since the install 
> and they continue to work fine.)
>
> I then copied data from a third matching 320 GB SATA HDD to one of the 
> Logical Volume filesystems on the md device.  After freeing up that drive (by 
> relocating its contents to the LVM/MD setup), I added the drive to the md 
> device, which brought the total to 2 active devices and 1 spare device.  I 
> then grew the number of devices to 3 and waited for  the reshape to finish 
> (increasing the capacity to 640 GB).  I bumped the values in 
> /proc/sys/dev/raid/ so that I wouldn't have to wait as long.

My understanding of RAID5 is that once you configure the set of disks to
the array, you can't just add an additional disk to it.  Attempting to do
so does more than just "reshape" the array, it changes the logical layout
of the sectors completely.  It's no wonder that LVM can't find anything,
since it's data (if it survived the reorg) is no longer where it should
be.  And, once you've done this, there's really no going back to recover. 
This is assuming my understanding of RAID5 is correct.

> Now that the reshaping is completed, LVM can't find the physical volume on 
> that device anymore.  I tried rebooting the system, but the problem remained. 
> Checking /proc/mdstat shows that the md device is up and healthy.  The 
> pvdisplay command only shows my other Physical Volume (for the IDE drives). 
> I found the pvck command and ran that on the md device, and it states that 
> there is no LVM label on the device.
>
> It is my understanding that the steps I outlined should have worked.  I 
> planned to follow them with pvresize, then lvresize, then umount, resize2fs, 
> and mount again.  I've seen this procedure outlined a few different places, 
> including at http://gentoo-wiki.com/Resize_LVM2_on_RAID5.
>
> Did I do something wrong?  Is there anyway to rescue my data?  I saved the 
> contents of /etc/lvm/backup/ when I noticed the problem -- perhaps that might 
> help?  If there's no way of saving the data, I'd at least like to figure out 
> what happened in the first place.
>
> Thank you.  Your thoughtfulness and help is appreciated.

-- 
Peter A. Castro <doctor@fruitbat.org> or <Peter.Castro@oracle.com>
 	"Cats are just autistic Dogs" -- Dr. Tony Attwood
