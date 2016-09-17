Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8HFIXI8011364
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 11:18:33 -0400
Received: from smtp1.guam.net (smtp1.guam.net [202.128.0.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0C087F77B
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 15:18:30 +0000 (UTC)
From: "Michael D. Setzer II" <mikes@kuentos.guam.net>
Date: Sun, 18 Sep 2016 01:18:25 +1000
MIME-Version: 1.0
Message-ID: <57DD5EC1.13830.178652@mikes.kuentos.guam.net>
In-reply-to: <8ebe6d1f9dc01bf7bfa843d8dcf3a0b8@dds.nl>
References: <368387847.156920.1474117496841.ref@mail.yahoo.com>,
	<8340e33605f0a84b10ed1d626cfecfbe@dds.nl>,
	<8ebe6d1f9dc01bf7bfa843d8dcf3a0b8@dds.nl>
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: Re: [linux-lvm] creating DD copies of disks
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
Content-Type: text/plain; charset="us-ascii"
To: Xen <list@xenhideout.nl>, LVM general discussion and development <linux-lvm@redhat.com>

I've been the maintainer of the G4L disk imaging project since 2004, and 
many of its options are using dd with compression to make disk/partition 
images or clone disks.

A couple of issues. if you make an image or clone of the disk, you probable 
will not have a problem since it will copy the blkid info from the old drive, so it 
will match as part of boot process. The big problem is if the new disk is going 
into a machine with a controller that is not part of you initrd. The disk will be 
identical, but since the contoller isn't included it will not be able to boot. 

Recently, had a motherboard in a system go bad. Moved disk to another 
machine, and default kernel wouldn't boot because of different on board 
controller. Was able to boot from the older rescue kernel, and then go thru 
the process of rebuilding the initrd for the latest kernel. Then that one booted 
fine.

Had a similar issue many years ago, when I imaged an IDE hard disk to a 
new sata disk. 

With windows systems, there seem to be more issues. On the same machine 
it works fine, but moving to systems that are just a little different sometimes 
results in various messages.

Good Luck.


On 17 Sep 2016 at 16:53, Xen wrote:

Date sent:      	Sat, 17 Sep 2016 16:53:14 +0200
From:           	Xen <list@xenhideout.nl>
To:             	linux-lvm@redhat.com
Subject:        	Re: [linux-lvm] creating DD copies of disks
Send reply to:  	LVM general discussion and development 
<linux-lvm@redhat.com>
	
> Xen schreef op 17-09-2016 16:16:
> 
> > I just won't be able to use the old system until I change it back.
> > Time to test, isn't it.
> 
> Indeed both Linux and Windows have no issues with the new disk, I think.
> 
> I was making a backup onto a bigger-sized disk, but neither Windows nor 
> Linux have an issue with it. They just see the old partition table of 
> the old disk and are fine with that.
> 
> Now I only need to know if the Linux system will run with the new disk, 
> but I'm sure there won't be issues there now. The system is not actually 
> *on* that disk.
> 
> Call it a data disk for an SSD system.
> 
> So perhaps you can see why I would want to have the two disks loaded at 
> the same time:
> 
> - if they work, I can copy data even after the DD (perhaps, to make some 
> rsync copy as you indicate) but now I already have all the required 
> structures (partition tables...) without any work.
> 
> - I wasn't actually yet done with the old disk. This was also just 
> research. Better make a backup first before you finalize things. I want 
> to do more work on the "old" system before I finalize things. But having 
> a backup sitting there that I can use is a plus. Having to not be able 
> to use both disks at the same time is a huge detriment. It is also not 
> that hard now to change the system back but I still don't know how I can 
> manually change the UUIDs that a VG/LV references. It is a huge plus if 
> I can just exchange one PV with another at will.
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


+----------------------------------------------------------+
  Michael D. Setzer II -  Computer Science Instructor      
  Guam Community College  Computer Center                  
  mailto:mikes@kuentos.guam.net                            
  mailto:msetzerii@gmail.com
  Guam - Where America's Day Begins                        
  G4L Disk Imaging Project maintainer 
  http://sourceforge.net/projects/g4l/
+----------------------------------------------------------+

http://setiathome.berkeley.edu (Original)
Number of Seti Units Returned:  19,471
Processing time:  32 years, 290 days, 12 hours, 58 minutes
(Total Hours: 287,489)

BOINC@HOME CREDITS
ABC         16613838.513356 | EINSTEIN   113011037.288695
ROSETTA     48420184.415104 | SETI        91961748.223136
