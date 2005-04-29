Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3TMeYO16908
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2005 18:40:34 -0400
Received: from postfix3-2.free.fr (postfix3-2.free.fr [213.228.0.169])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3TMeS42012276
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2005 18:40:28 -0400
Received: from lns-vlq-17f-81-56-168-64.adsl.proxad.net
	(lns-vlq-17f-81-56-168-64.adsl.proxad.net [81.56.168.64])
	by postfix3-2.free.fr (Postfix) with ESMTP id E8289C013
	for <linux-lvm@redhat.com>; Sat, 30 Apr 2005 00:40:27 +0200 (CEST)
From: Eddahbi Karim <thetemplar@free.fr>
Date: Sat, 30 Apr 2005 00:40:21 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200504300040.24763.thetemplar@free.fr>
Subject: [linux-lvm] LVM volume groups and logical volumes recovery...
Reply-To: thetemplar@free.fr,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Hi,

I've got a serious problem on this machine that I'm trying to fix via a 
Live-CD.

I've a SATA Drive detected as a SCSI Drive on which I installed a Suse and 
setting /dev/sda5 as a Linux LVM Partition. Then I created a volume group 
"Suse" and 3 Logical volumes "Home" "Var" and "Opt".

Then, after some months, I decided to install Debian Sarge. I picked up the 
weekly generated CD-Rom via http, 3 days ago. When trying to install Debian, 
I had to partition my SATA drive (heh) and I selected to delete 2 Logical 
Volumes (Var and Opt) in the volume group "Suse". It seems, but I don't 
remember deleting it and replacing it, that the Linux LVM partition has been 
formatted with reiserfs tools by Debian Sarge.

Then, after my Reboot, with the same Debian Sarge CD, my Suse Volume Group was 
gone. Debian hasn't been installed because there was a problem with Grub too 
but partman didn't detect my volume group...

So I picked up a Live-CD and try to do pvscan but it returned that no Volume 
Group was found and the Live-CD mounted /dev/sda5 like a simple ReiserFS 
partition with no data in it.
That's pretty weird and I thought that my datas were lost but cat /dev/sda5 
displays a lot information and datas that were in the logical volumes "Home" 
"Var" and "Opt".

So, in short :

- My LVM partition (Only physical volume) on /dev/sda5 (SATA drive) have been 
formated like a simple ReiserFS partition and this wiped away my Volume Group 
with its Logicial Volumes.
- Datas are still visible via cat /dev/sda5
- Is there a way to get the data back or the LVM layout back so I can mount 
the partitions ?
- Or Is there a way to analyze the partition and get data back ?

Following, system information :

http://thetemplar.free.fr/Tragedy

I think I gave all important informations. If you have a way to fix this, tell 
me. Even if If it sounds a bit crazy...

Regards,


-- 
Eddahbi Karim
