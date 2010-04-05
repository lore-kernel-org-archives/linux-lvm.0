Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o35EjrjI007765
	for <linux-lvm@redhat.com>; Mon, 5 Apr 2010 10:45:53 -0400
Received: from 27.mail-out.ovh.net (27.mail-out.ovh.net [91.121.30.210])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o35EjgEH012029
	for <linux-lvm@redhat.com>; Mon, 5 Apr 2010 10:45:43 -0400
From: KiKouN <kikoun@kikoun.org>
Date: Mon, 05 Apr 2010 16:45:09 +0200
Message-ID: <1270478709.31665.99.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] help to recovering my home volume
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
To: linux-lvm@redhat.com

Hello, 

First, sorry for my english.


The other day, I wanted to create a multi-iso usb (for install- 
party) but I stupidly copied the image on my main hard drive.

When I have seen my error, I have stop the copy and run
"cat /proc/partitions" to make a backup of my partition table. But the
system was crash before.

I have reboot to a liveCD and make a copy of my disk on an other disk.

I have run testdisk and gpart on this image without success. So I have
make a bash script with dd and grep to find some file or some special
block.

With this script, I have found my last lvm backup text file
( http://pastebin.com/TTSnpr47 )

I want to know if I can make an image file of my home LV with this file
and how to calculate the start/end sector (on the disk) of my home LV.

dd if=sda.img of=home.img bs=512 count=size_of_home_part1
skip=start_sector_of_home_LV

I think that size_of_home_part1 is 11008*8192 but I want to know how to
calculate start_sector_of_home_LV. How to calculate this value ?

In the lvm backup file, I don't know what is the value "pe_start" in pv0
section. What is this value ? 

thanks for your help.



Some more info:

# hdparm -g /dev/sda

/dev/sda:
 geometry      = 14593/255/63, sectors = 234441648, start = 0


My partition table before the crash. 
/dev/sda1	/boot 	~200Mo
/dev/sda2	/boot2 	~200Mo
/dev/sda3	swap	~1Go
/dev/sda4
  /dev/sda5	PV	~107Go
End of disk
