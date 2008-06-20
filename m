Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5KDwe6e024367
	for <linux-lvm@redhat.com>; Fri, 20 Jun 2008 09:58:40 -0400
Received: from palakse.guam.net (palakse.guam.net [202.128.0.38])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5KDwLjj016927
	for <linux-lvm@redhat.com>; Fri, 20 Jun 2008 09:58:22 -0400
Received: from localhost (smtp1 [10.255.255.254])
	by palakse.guam.net (Postfix) with ESMTP id 16C4E41EB31
	for <linux-lvm@redhat.com>; Fri, 20 Jun 2008 23:58:15 +1000 (ChST)
Received: from [192.168.128.3] (119.121.55.225.guam.net [121.55.225.119])
	by smtp.guam.net (Postfix) with ESMTP id 54EB4EF49A8
	for <linux-lvm@redhat.com>; Fri, 20 Jun 2008 23:58:12 +1000 (ChST)
From: "Michael D. Setzer II" <mikes@kuentos.guam.net>
Date: Fri, 20 Jun 2008 23:57:16 +1000
MIME-Version: 1.0
Message-ID: <485C43DC.31373.B21EDE9@mikes.kuentos.guam.net>
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: [linux-lvm] Mounting a Partition Image of LM partition?
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

I have a system that is currently 7 timezones away that failed to reboot after 
a long power outage. Don't get back till end of July.  The systems doesn't 
even seem to see the drive in the BIOS, but booting from a g4l live cd, I can 
see the disk, and mount /boot partition with no problem. The system isn't 
critical, but has a few scripts I could put on other systems. Being that the / is 
an LVM partition, the g4l doesn't have the ability to mount it, and I am vncing 
into a local machine and then telnetting into the machine. If I was there, I 
could boot from a rescue cd, and get access to the files.

I save some messages on using losetup and I also found some web pages 
with info. I have a compressed disk image of the 250G drive, and also have 
a compressed partition image of the partitions with the LVM partition. I was 
able to copy this partition to my home machine taking about 11 hours, and 
was able to uncompress the lzop image. I was then able to use losetup 
/dev/loop0 to load the image, and pvscan then shows it, but it has the same 
name  as the regular LVM volumne on the machine. 

The message in this list talked about kpartx and using a disk image, but 
unfortuantely, I don't have enough space on the system to expanded the 
250GB compressed disk image.

Any ideals?
Thanks.

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
SETI 5,629,888.149690 | EINSTEIN 1,697,233.415700 | ROSETTA 
529,338.410477


-----BEGIN PGP SIGNATURE-----
Version: PGP 6.5.8 -- QDPGP 2.61c
Comment: http://community.wow.net/grt/qdpgp.html

iQA/AwUBSFsqnizGQcr/2AKZEQL7NgCbBtGV5GV8hR0IZ4RxcguBRyvak8AAnAwa
TrXGGn/2SQIBL9ac/IYYNFyE
=gNa/
-----END PGP SIGNATURE-----
