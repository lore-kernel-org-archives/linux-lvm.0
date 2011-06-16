Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p5GLjlV5007525
	for <linux-lvm@redhat.com>; Thu, 16 Jun 2011 17:45:48 -0400
Received: from out4.smtp.messagingengine.com (out4.smtp.messagingengine.com
	[66.111.4.28])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p5GLjk6u019730
	for <linux-lvm@redhat.com>; Thu, 16 Jun 2011 17:45:46 -0400
Received: from compute6.internal (compute6.nyi.mail.srv.osa [10.202.2.46])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 2555020A1A
	for <linux-lvm@redhat.com>; Thu, 16 Jun 2011 17:45:46 -0400 (EDT)
Message-Id: <1308260745.12257.1464013973@webmail.messagingengine.com>
From: "Lee Gold" <leegold@operamail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"
Date: Thu, 16 Jun 2011 14:45:45 -0700
Subject: [linux-lvm] Help to mount ext3 boot partiton which reports it's
 LVM2_member when I try to mount it
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
To: linux-lvm@redhat.com

Hi,

Tried adding a disk with LVM2. Rebooted maybe too soon and Grub became
confused and system will not boot.

It's Unbuntu Server 10.04. Removed new disk - grub still confused, no
boot. I put in a live Ubuntu disk to look and hopefully repair non-LVM
ext3 boot partition...somehow. But I can not mount the boot partiton.
Yet, sudo fdisk -l says ID 83, Linux for /dev/sda1 - the boot partition.
But when I try: sudo mount /dev/sda1 /mnt/bootp I get: mount:unknown
filesystem type 'LVM2_member'...fdisk reports differently...

How can this be right? I clearly remember installing the /boot as an
ext3 partiton.

sudo pvs says:

PV        VG       Fmt   Attr   PSize    PFree 

/dev/sda1          lvm2  a-     190.00m  190.00m 

/dev/sda2 system   lvm2  a-      92.97g       0

I can mount the partitons in /dev/sda2 by installing LVM2 while using
the live disk and some command-line - so I can recover the data if
necessay so all is not lost. But I would really like to know what is
going on and how to get the system booting again. Again the boot
partition was ext3 and separate, why can't I access it, fdisk
confirms...?  Thanks.

Lee G.

-- 
http://www.fastmail.fm - Choose from over 50 domains or use your own
