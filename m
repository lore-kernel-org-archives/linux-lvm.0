Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3ILjbT5002839
	for <linux-lvm@redhat.com>; Fri, 18 Apr 2008 17:45:37 -0400
Received: from smtp03.atlngahp.sys.nuvox.net (smtp-out3.atlngahp.sys.nuvox.net
	[70.43.63.20])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3ILjFvo030756
	for <linux-lvm@redhat.com>; Fri, 18 Apr 2008 17:45:16 -0400
Received: from smtp.media-brokers.com (70.43.81.99.nw.nuvox.net [70.43.81.99])
	by smtp03.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m3ILj7r0029808
	for <linux-lvm@redhat.com>; Fri, 18 Apr 2008 17:45:07 -0400
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id 15C4F2A50DC
	for <linux-lvm@redhat.com>; Fri, 18 Apr 2008 17:45:07 -0400 (EDT)
Message-ID: <48091663.2070404@Media-Brokers.com>
Date: Fri, 18 Apr 2008 17:45:07 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Adding PVs to a group
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

Hello,

I'm still fairly new to using LVM, and I need to do something on a live 
server, so just need to be sure of what I'm doing...

Hardware:

3ware 9500S-8 Raid card with 8 Seagate 160GB hard drives

Ports 0 & 1 are mirrored, and contain:

    Device Boot      Start         End      Blocks   Id  System
/dev/sda1               1         100      803218+  83  Linux
/dev/sda2             101         163      506047+  82  Linux swap
/dev/sda3             164        2654    20008957+  83  Linux
/dev/sda4            2655       19450   134913870   83  Linux

The other 6 are set up in a Raid 10, and contain:

    Device Boot      Start         End      Blocks   Id  System
/dev/sdb1               1       24900   200009218+  8e  Linux LVM
/dev/sdb2           24901       58352   268703190   8e  Linux LVM

pvscan shows:

myhost # pvscan
   /dev/cdrom: open failed: Read-only file system
   Attempt to close device '/dev/cdrom' which is not open.
   PV /dev/sdb1   VG vg2   lvm2 [190.74 GB / 0    free]
   Total: 1 [190.74 GB] / in use: 1 [190.74 GB] / in no VG: 0 [0   ]
myhost #

lvscan shows:

myhost # lvscan
   ACTIVE            '/dev/vg2/home' [50.00 GB] inherit
   ACTIVE            '/dev/vg2/usr' [20.00 GB] inherit
   ACTIVE            '/dev/vg2/var' [120.74 GB] inherit
myhost #

So, /dev/sdb2 was being used for backups, but I was finally able to 
convince the boss to let me get a QNAP NAS, so am using that for backups 
now.

What I want to do is make the space from /dev/sdb2 available to my vg2 
volume group, so I can extend my /var partition (it is filling up fast - 
damn email packrats)....

Am I correct in that all I need to do is:

vgextend vg2 /dev/sdb2

then I can extend any of the logical volumes?

What I want to do is add all of /dev/sdb2 to the /var partition, so am I 
correct taht to do this I would do:

lvextend -l %FREE /dev/vg2/var

(I think the %FREE is how I tell it to use all of it, right?)

then resize the filesystem (it is reiserfs):

umount /dev/vg2/var
resize_reiserfs /dev/vg2/var
mount -t reiserfs /dev/vg2/var /var

Thanks for any help and/or suggestions...

-- 

Best regards,

Charles
