Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8NL3ODx017448
	for <linux-lvm@redhat.com>; Tue, 23 Sep 2008 17:03:24 -0400
Received: from srv03.macroped.com (srv03.macroped.com [74.52.9.226])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8NL2Z7K002385
	for <linux-lvm@redhat.com>; Tue, 23 Sep 2008 17:02:35 -0400
Received: from newbie (c-76-118-191-158.hsd1.nh.comcast.net [76.118.191.158])
	(authenticated bits=0)
	by srv03.macroped.com (8.13.8/8.13.8) with ESMTP id m8NL7geC008806
	for <linux-lvm@redhat.com>; Tue, 23 Sep 2008 17:07:43 -0400
Date: Tue, 23 Sep 2008 17:02:33 -0400
From: Bob Bell <b_lvm@thebellsplace.com>
Message-ID: <20080923210233.GA32676@newbie.thebellsplace.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM label lost on MD RAID5 reshape?
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I'm up a creek, and hoping someone out there can help rescue my data, or 
at least tell me what went wrong so that I don't have a repeat event.  
I'm starting with this question on linux-lvm, though let me know if you 
think the discussion needs to be on linux-raid as well.

I'm setting up a new server running Ubuntu's Hardy Heron release.  `lvm 
version` reports:
  LVM version:     2.02.26 (2007-06-15)
  Library version: 1.02.20 (2007-06-15)
  Driver version:  4.12.0
`uname -a` reports:
  Linux sherwood 2.6.24-16-server #1 SMP Thu Apr 10 13:58:00 UTC 2008 i686 GNU/Linux

I initially created an md RAID5 device with only two components 
(matching 320 GB SATA HDDs).  I created a single Physical Volume using 
the entirety of that md device (320 GB), and then created several 
Logical Volumes for different filesystems (all ext3).  This was done 
using the Ubuntu installer.  After installing I used lvresize to 
increase the size of a few of the Logical Volumes, as I was conservative 
regarding the size during installation.  These filesystems hold data 
that is not a critical part of the system (mail, music, video, etc.).

(I also have a similar setup with a couple of IDE drives that I use for 
the system (/home, /var, /boot, /), but I haven't touched those since 
the install and they continue to work fine.)

I then copied data from a third matching 320 GB SATA HDD to one of the 
Logical Volume filesystems on the md device.  After freeing up that 
drive (by relocating its contents to the LVM/MD setup), I added the 
drive to the md device, which brought the total to 2 active devices and 
1 spare device.  I then grew the number of devices to 3 and waited for 
  the reshape to finish (increasing the capacity to 640 GB).  I bumped 
the values in /proc/sys/dev/raid/ so that I wouldn't have to wait as 
long.

Now that the reshaping is completed, LVM can't find the physical volume 
on that device anymore.  I tried rebooting the system, but the problem 
remained.  Checking /proc/mdstat shows that the md device is up and 
healthy.  The pvdisplay command only shows my other Physical Volume (for 
the IDE drives).  I found the pvck command and ran that on the md 
device, and it states that there is no LVM label on the device.

It is my understanding that the steps I outlined should have worked.  
I planned to follow them with pvresize, then lvresize, then umount, 
resize2fs, and mount again.  I've seen this procedure outlined a few 
different places, including at 
http://gentoo-wiki.com/Resize_LVM2_on_RAID5.

Did I do something wrong?  Is there anyway to rescue my data?  I saved 
the contents of /etc/lvm/backup/ when I noticed the problem -- perhaps 
that might help?  If there's no way of saving the data, I'd at least 
like to figure out what happened in the first place.

Thank you.  Your thoughtfulness and help is appreciated.

-- 
Bob Bell
