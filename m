Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2V0dl3G011178
	for <linux-lvm@redhat.com>; Sun, 30 Mar 2008 20:39:47 -0400
Received: from palakse.guam.net (palakse.guam.net [202.128.0.38])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2V0dTKu016294
	for <linux-lvm@redhat.com>; Sun, 30 Mar 2008 20:39:30 -0400
Received: from localhost (smtp1 [10.255.255.254])
	by palakse.guam.net (Postfix) with ESMTP id 37BA03A0160
	for <linux-lvm@redhat.com>; Mon, 31 Mar 2008 10:39:24 +1000 (ChST)
Received: from [192.168.128.3] (119.121.55.225.guam.net [121.55.225.119])
	by smtp.guam.net (Postfix) with ESMTP id F3C4DED1041
	for <linux-lvm@redhat.com>; Mon, 31 Mar 2008 10:39:23 +1000 (ChST)
From: "Michael D. Setzer II" <mikes@kuentos.guam.net>
Date: Mon, 31 Mar 2008 10:38:49 +1000
MIME-Version: 1.0
Message-ID: <47F0BF39.11865.4559B09@mikes.kuentos.guam.net>
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: [linux-lvm] Adding LVM TW support to live boot cd.
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I'm the current maintaner of the G4L project that does disk imaging from a 
boot cd. At the moment, it can create images on an FTP server or locally on 
ext2/3, fat32 (limited size or splitting), and NTFS partitions. It might also 
support some of the other linux formats, but LVM it doesn't. Is there some 
documentation, on what would be required to add this support. It can backup 
LVM with no problem, but does so in raw mode using dd. 

I am currently using Fedora 8 machine to build the support system, but use 
kernels build from Kernel.org to support the latest hardware.


+----------------------------------------------------------+
  Michael D. Setzer II -  Computer Science Instructor      
  Guam Community College  Computer Center                  
  mailto:mikes@kuentos.guam.net                            
  mailto:msetzerii@gmail.com
  http://www.guam.net/home/mikes
  Guam - Where America's Day Begins                        
+----------------------------------------------------------+

http://setiathome.berkeley.edu (Original)
Number of Seti Units Returned:  19,471
Processing time:  32 years, 290 days, 12 hours, 58 minutes
(Total Hours: 287,489)

BOINC@HOME CREDITS
SETI 5,083,348.272836 | EINSTEIN 1,506,162.284587 | ROSETTA 
453,574.076057


-----BEGIN PGP SIGNATURE-----
Version: PGP 6.5.8 -- QDPGP 2.61c
Comment: http://community.wow.net/grt/qdpgp.html

iQA/AwUBR++l+izGQcr/2AKZEQIxOgCbBEy6j+AIfnXJ+hrVCWvD/Mgu3+oAnAr4
IL6wnGmbYBt+Lwr5+UJh8Cki
=hH4w
-----END PGP SIGNATURE-----
