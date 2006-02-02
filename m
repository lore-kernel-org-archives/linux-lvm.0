Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k12Iql101304
	for <linux-lvm@redhat.com>; Thu, 2 Feb 2006 13:52:47 -0500
Received: from smtp6.poczta.onet.pl (smtp6.poczta.onet.pl [213.180.130.36])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k12Iqj4x014363
	for <linux-lvm@redhat.com>; Thu, 2 Feb 2006 13:52:46 -0500
Message-ID: <43E254B5.5080107@poczta.onet.pl>
Date: Thu, 02 Feb 2006 19:51:33 +0100
From: =?ISO-8859-2?Q?Maciej_S=B3ojewski?= <mslonik@poczta.onet.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Ubuntu distro with lvm2, raid 1, not booting anymore.
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

Welcome!

I have the serious problem with booting of my machine. It is run on 
Ubuntu distro (5.10), with lvm2 raid 1 on two identical sata hard disks. 
Lilo bootloader. The problem is that after small change in lilo.conf and 
running /sbin/lilo my system is no longer bootable. I see 'kernel panic' 
message. When I try to run lilo again (from Ubuntu Live! cd) I see some 
comments somehow related to dev-mapper:

Warning: /proc/partitions does not match /dev directory structure
Name change: /dev/cloop 0 -> /tmp/dev.0
(...)
Fatal: is_primary: Not a valid device

I don't know how to handle these problesm. Looking over net didn't help 
me. So I decided to write on this mailing list. If you can help me anyway,
even just redirecting me to appropriate group / chanel where people will 
help me to deal with these problem, I will appreciate it. Thanks
in advance!

My lilo version is 22.6.1
dev-mapper version is 1.11.0
kernel (default of Ubuntu 5.10): 2.6.12-10-386

I will quote the kernel messages:
RAMDISK: ran out of compressed data
invalid compressed format (err=1)
VFS: Cannot open root device "fd02" or unknow-block (253,2)
Please append a correct "root=" root option
Kernel panic - not syncing: VFS: Unable to mount root fs
unknown-block (253,2)

That is all. It looks like kernel is doing some hardware recognition and 
then stops.

Kind regards,
Maciej Slojewski (mslonik)
