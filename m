Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k09505131642
	for <linux-lvm@redhat.com>; Mon, 9 Jan 2006 00:00:05 -0500
Received: from mail2.sea5.speakeasy.net (mail2.sea5.speakeasy.net
	[69.17.117.4])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k095045q006669
	for <linux-lvm@redhat.com>; Mon, 9 Jan 2006 00:00:05 -0500
Received: from ns1.lingpgmr.com (HELO [192.168.1.14])
	(cochranb@[66.92.147.154]) (envelope-sender <cochranb@speakeasy.net>)
	by mail2.sea5.speakeasy.net (qmail-ldap-1.03) with SMTP
	for <linux-lvm@redhat.com>; 9 Jan 2006 04:59:59 -0000
Message-ID: <43C1EDCE.6090800@speakeasy.net>
Date: Sun, 08 Jan 2006 23:59:58 -0500
From: Robert L Cochran <cochranb@speakeasy.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Mounting An Old LVM Drive Array
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

I have a similar situation to "Any way to recover "logical volumes" " by 
Dan Elder, except mine involves 2 drives of different sizes and they did 
not crash. To the best of my knowledge both drives are in good, usable 
condition. How can I mount the drives and access their data? Here are 
the details.

I recently replaced the motherboard, both hard drives and the CPU on my 
personal desktop with faster hardware, and these 2 drives are my entire 
former system. They are a 60 Gb and 120 Gb drives. The 120 Gb was once 
an independent Fedora Core 2 or Fedora Core 3 system. Then one day I 
decided to add the 60 Gb drive, probably to dual boot Windows XP on it. 
I removed the 120 Gb drive to protect it from Windows, installed the 
smaller drive in its place, used the Windows XP installer to define and 
format about a 29 Gb partition, installed Windows XP on that, then 
re-installed the 120 Gb drive and installed Fedora Core 3 (x86_64) on 
what I thought was the unpartitioned free space on the small drive.

I did all this blissfully ignorant of how LVM works.

Much later, I upgraded this system to Fedora Core 4 x86_64 with both 
physical drives installed and active.

 From the small bit of experimentation I've done, I am guessing the the 
LVM is actually "defined" on the 120 Gb drive, but my former Fedora Core 
4 system, which I want to access very much, is actually on the 60 Gb 
drive. So if I want to see that data again, I'll have to have both these 
disks mounted so that the startup scripts can find the volume group and 
mount the logical volume. I haven't attempted to do this yet, but I'll 
do it soon.

My new, upgraded system has one 400 Gb drive on which I installed Fedora 
Core 4 x86_64. I've thought of doing 'lvm lvrename' to rename the 
logical volume on this physical volume so I can then install my old 
drives into external hard drive enclosures and plug these into USB 
ports, and let them mount that way. But I understand I'll need to change 
the drive labels with e2label as well.

I can also uninstall my 400 Gb drive temporarily and plug in the old 
drives. The old drives are really PATA (IDE) drives, but I used 
HighPoint RocketHead 100 PATA-to-SATA adapters to allow me to plug them 
into the SATA ports on my old motherboard, and one of these adapters was 
given to a friend who is now using it on his system. I suppose interface 
wouldn't matter here -- just plug them into the IDE ports on the 
motherboard.

I appreciate any advice you can give me.

Thanks

Bob Cochran
