Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6QJK03F006439
	for <linux-lvm@redhat.com>; Thu, 26 Jul 2007 15:20:00 -0400
Received: from palakse.guam.net (palakse.guam.net [202.128.0.38])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l6QJJw0d002515
	for <linux-lvm@redhat.com>; Thu, 26 Jul 2007 15:19:58 -0400
Received: from localhost (smtp1 [10.255.255.254])
	by palakse.guam.net (Postfix) with ESMTP id E800D267C8E
	for <linux-lvm@redhat.com>; Fri, 27 Jul 2007 05:19:51 +1000 (ChST)
Received: from [192.168.128.3] (1.121.55.212.guam.net [121.55.212.1])
	by smtp.guam.net (Postfix) with ESMTP id AA936E0C148
	for <linux-lvm@redhat.com>; Fri, 27 Jul 2007 05:19:51 +1000 (ChST)
From: "Michael D. Setzer II" <mikes@kuentos.guam.net>
Date: Fri, 27 Jul 2007 05:19:51 +1000
MIME-Version: 1.0
Message-ID: <46A98077.2550.6B8346A@mikes.kuentos.guam.net>
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: [linux-lvm] Mounting LVM from boot cd.
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

I looking for the steps to be able to mount lvm for read/write for the G4L 
(Ghost for Linux) project I handle. For the most part, it does disk images to 
an Ftp server, but can do local images to Fat32, and ext? partitions. I've just 
added ntfs-3g to the latest alpha I'm working on to do local backups to NTFS 
partitions. 

I've copied the lvm.static from a fedora core 5 system to system after 
booting from the g4l cd. It can then see lvm partitions, but I haven't found the 
way to mount the partitions. 


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
SETI 3,412,542.824463 | EINSTEIN 970,204.788541 | ROSETTA 
167,391.947864


-----BEGIN PGP SIGNATURE-----
Version: PGP 6.5.8 -- QDPGP 2.61c
Comment: http://community.wow.net/grt/qdpgp.html

iQA/AwUBRqhnOCzGQcr/2AKZEQLfPQCeOCxAjp0HEiaAb/7RaBXs+rGyAdwAni2o
5E9CvXH+3lvguhAVAb0ZK3XO
=heqc
-----END PGP SIGNATURE-----
