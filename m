Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3E35UO13746
	for <linux-lvm@redhat.com>; Wed, 13 Apr 2005 23:05:30 -0400
Received: from nexus.stevens.edu (nexus.stevens.edu [155.246.14.12])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3E35Odm012487
	for <linux-lvm@redhat.com>; Wed, 13 Apr 2005 23:05:25 -0400
Received: from greglaptop (gdeangel.u05.stevens-tech.edu [155.246.221.26])
	by nexus.stevens.edu
	(iPlanet Messaging Server 5.2 HotFix 1.26 (built Mar 31 2004))
	with ESMTP id <0IEX00EMW1WYSL@nexus.stevens.edu> for
	linux-lvm@redhat.com; Wed, 13 Apr 2005 23:05:24 -0400 (EDT)
Date: Wed, 13 Apr 2005 23:04:44 -0400
From: Greg DeAngelis <gdeangel@stevens.edu>
Message-id: <0IEX00EMY1X0SL@nexus.stevens.edu>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Subject: [linux-lvm] lvm volume corruption
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

I am having some trouble installing gentoo on a striped lvm setup. The
architecture is AMD64 and it is Gentoo 2005.0.

The system specs are: 
Athlon 64 3500+ 
MSI K8T Neo2-FIR 
1 gig ddr400 ram 
FastTrak 150 sx4-m 
3x Maxtor 120 gig sata drives 
Geforce 6800 
Soundblaster Audigy 
DVD-RW DL 
Mouse + Keyboard 

The 3 sata 120 gig hard drives are attached to the FastTrak 150 sx4-m raid
card. There is no array configured. I was gonna use hardware (apparently not
possible with this card) or software raid 5 but ive heard of some problems
with reliability. This setup was previously running Windows XP with no
stability issues. 

The disk structure as reported by fdisk looks like this: 
/dev/sda 
/dev/sda1 100 mbs /boot 
/dev/sda2 2.5 gigs swap 
/dev/sda3 2 gigs / 
/dev/sda4 extended 
/dev/sda5 112 gigs approx Linux LVM 

/dev/sdb 
/dev/sdb1 117 gigs approx Linux LVM 

/dev/sdac 
*this disk was gonna primarily be used for back up only purposes by doing
snapshots 

After creating the lvm volumes according to the gentoo lvm guide (i am
striping across the first 2 drives using 4k blocks) and formatting them with
ext3, I encountered an error while installing some packages where one volume
suddenly became read only. I ran e2fsck on the resulting volume devices and
found several inode errors including imagic flag, dtime and linked list
corruption errors. I tried multiple times to create these stripes, format
them with ext3, and then run e2fsck without success. I recreated the volumes
without striping and noticed no problems with e2fsck. Id like to use
striping and don't see what i am doing wrong. Can lvm stripe across
different sized partitions and if so, how are the stripes determined once
one partition is used up?
