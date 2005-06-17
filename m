Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5HIRFu31430
	for <linux-lvm@redhat.com>; Fri, 17 Jun 2005 14:27:15 -0400
Received: from ahmler8.mail.eds.com (ahmler8.mail.eds.com [192.85.154.82])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5HIR9Be022420
	for <linux-lvm@redhat.com>; Fri, 17 Jun 2005 14:27:09 -0400
Received: from ahmlir1.mail.eds.com (ahmlir1-2.mail.eds.com [192.85.154.131])
	by ahmler8.mail.eds.com (8.13.4/8.12.10) with ESMTP id j5HIR35H002278
	for <linux-lvm@redhat.com>; Fri, 17 Jun 2005 14:27:04 -0400
Received: from ahmlir1.mail.eds.com (localhost [127.0.0.1])
	by ahmlir1.mail.eds.com (8.13.2/8.12.10) with ESMTP id j5HIQ9m5031733
	for <linux-lvm@redhat.com>; Fri, 17 Jun 2005 14:26:09 -0400
Received: from USAHM013.amer.corp.eds.com ([130.175.214.154])
	by ahmlir1.mail.eds.com (8.13.2/8.12.10) with ESMTP id j5HIQ9T9031728
	for <linux-lvm@redhat.com>; Fri, 17 Jun 2005 14:26:09 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Fri, 17 Jun 2005 14:26:08 -0400
Message-ID: <5A14AF34CFF8AD44A44891F7C9FF41050428E14F@usahm236.amer.corp.eds.com>
From: "Post, Mark K" <mark.post@eds.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] RE: LVM VG keeps disappearing
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

I'm still trying to figure out this problem.  When I run an "strace -f
-F vgscan" the only thing that looks odd to me is this:
open("/dev/vg01/group", O_RDONLY)       = 4
ioctl(4, 0xc004fe05, 0x800095b0)        = -1 ENXIO (No such device or
address)
close(4)                                = 0
open("/dev/vg01/group", O_RDONLY)       = 4
ioctl(4, 0xc004fe05, 0x800095b0)        = -1 ENXIO (No such device or
address)
close(4)                                = 0


Now, that device node does exist, so I don't understand what the error
means:
# ls -l /dev/vg01/group                                       
crw-r-----  1 root disk 109, 0 Feb 17 02:15 /dev/vg01/group 


When I compare the output to another system where LVM is working, I get
this:
open("/dev/vg01/group", O_RDONLY)       = 4
ioctl(4, 0xc004fe05, 0x406600)          = 0
close(4)                                = 0                  


Does this suggest anything to anyone?  Can anyone help me?  Thanks,

Mark Post

-----Original Message-----
From: Post, Mark K 
Sent: Tuesday, May 31, 2005 6:24 PM
To: 'linux-lvm@redhat.com'
Subject: LVM VG keeps disappearing


Twice now, I've had a VG "disappear" on me when I reboot my system.
These two instances were widely separated in time, with several reboots
in between.

When the system comes up vgscan runs, but I get this error:
vgscan -- reading all physical volumes (this may take a while...)

vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
volume 
group "vg01" from physical volume(s)

vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created

vgscan -- WARNING: This program does not do a VGDA backup of your volume
group  

The first time this happened, I wound up just restoring all my logical
volumes from backup.  This time I would like to try to figure out: 1.
How to recover from this without restoring everything from backup. 2.
Why this happens so that a fix can be created.

This system is a slack/390 operating system, 64-bit, running a 2.4.26
kernel.

The LVM version I'm running is 1.0.8.
