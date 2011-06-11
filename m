Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p5BMijuv016392
	for <linux-lvm@redhat.com>; Sat, 11 Jun 2011 18:44:45 -0400
Received: from mail3.guam.net (mail3.guam.net [202.128.0.97])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p5BMih9U025191
	for <linux-lvm@redhat.com>; Sat, 11 Jun 2011 18:44:44 -0400
Received: from localhost (unknown [10.255.255.190])
	by mail3.guam.net (Postfix) with ESMTP id 2D56F16417B9
	for <linux-lvm@redhat.com>; Sun, 12 Jun 2011 08:59:02 +1000 (ChST)
Received: from smtp3.guam.net ([127.0.0.1])
	by localhost (smtp3.guam.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mOXXH6WHd9CF for <linux-lvm@redhat.com>;
	Sun, 12 Jun 2011 08:41:09 +1000 (ChST)
Received: from [192.168.128.201] (202-128-91-158.d.c300.guam.net
	[202.128.91.158])
	by smtp3.guam.net (Postfix) with ESMTP id 612BFFE03B4
	for <linux-lvm@redhat.com>; Sun, 12 Jun 2011 08:41:09 +1000 (ChST)
From: "Michael D. Setzer II" <mikes@kuentos.guam.net>
Date: Sun, 12 Jun 2011 08:44:40 +1000
MIME-Version: 1.0
Message-ID: <4DF3EFD8.21200.145B56@mikes.kuentos.guam.net>
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: [linux-lvm] Question on LVM and Bare Metal Restore?
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

I'm the maintainer for the G4L disk imaging project since version 
0.15 to the current 0.37, and working on 0.38. 

Backing up the regular partitions that contain an LVM has been 
always been available, and backing up the whole disk image. 
Recent versions have added the ability to backup the LVM dm 
partitions as well. Backing up and restore works fine as long as 
the LVM setup is already there, but it a disk completely fails one 
would need to recreate the LVM before being able to restore it.

Similar to how one backs up the MBR and partition table for disks, 
I'd like to have a method that would allow for the recreation of the 
LVM, so that restores could be done. Additionally, with the 
fsarchiver doing backups of files in use, it is generally faster than 
doing a raw dd type backup. 

Is there a script or how to that explains the process of creating a 
script to recreate the LVM from scratch or from an already existing 
partition table?

Thanks.

+----------------------------------------------------------+
  Michael D. Setzer II -  Computer Science Instructor      
  Guam Community College  Computer Center                  
  mailto:mikes@kuentos.guam.net                            
  mailto:msetzerii@gmail.com
  http://www.guam.net/home/mikes
  Guam - Where America's Day Begins                        
  G4L Disk Imaging Project maintainer 
  http://sourceforge.net/projects/g4l/
+----------------------------------------------------------+

http://setiathome.berkeley.edu (Original)
Number of Seti Units Returned:  19,471
Processing time:  32 years, 290 days, 12 hours, 58 minutes
(Total Hours: 287,489)

BOINC@HOME CREDITS
SETI        10870621.860383   |   EINSTEIN     6012510.330851
ROSETTA      3240336.813559   |   ABC          6279463.408252
