Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6ALBZC0025442
	for <linux-lvm@redhat.com>; Sat, 10 Jul 2010 17:11:35 -0400
Received: from mail-bw0-f46.google.com (mail-bw0-f46.google.com
	[209.85.214.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6ALBMXg013027
	for <linux-lvm@redhat.com>; Sat, 10 Jul 2010 17:11:22 -0400
Received: by bwz1 with SMTP id 1so1907000bwz.33
	for <linux-lvm@redhat.com>; Sat, 10 Jul 2010 14:11:21 -0700 (PDT)
MIME-Version: 1.0
Sender: grzegorz.wierzowiecki@gmail.com
Date: Sat, 10 Jul 2010 23:11:21 +0200
Message-ID: <AANLkTilHHV9DOCDeeqREaGdYqVVaLcOt5V7i9CQGlX8M@mail.gmail.com>
From: Grzegorz Wierzowiecki <grzegorz.wierzowiecki+lvm2@gmail.com>
Subject: [linux-lvm] LVM2 mirror segment monitoring function failed
Reply-To: grzegorz.wierzowiecki+lvm2@gmail.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello,

I hope it's not duplicate, but I've been googling and it was hard to
me to find any clue how to deal with my problem. Let me describe
situation:

I've made a few mirrored LVM2 volumes (non-root - root is standard partition).

When running system I see :
(trying to not misstype, but take into account I am retyping from photo :) )

(...)
:: Activating LVM2 groups
  File-based locking installation failed
Child exited with code 5
  Unable to start dmeventd.
Child exited with code 5
  Unable to start dmeventd.
  vg0-Archive: event registration failed: No such process
  vg0/Archive: mirror segment monitoring function failed
(... repeats for all mirrored partitions...)


This is my mkinitcpio.conf modules and hooks:
MODULES="dm_mod reiserfs"
HOOKS="base udev autodetect pata scsi sata mdadm lvm2 encrypt filesystems"

My rc,conf , MODULES and DAEMONS looks like:
MODULES=(slhc lp parport parport_pc dm-mod fuse vboxdrv)
DAEMONS=(syslog-ng network netfs iptables dbus hal crond fglrx dhcpd
sshd lighttpd @openntpd)

My kernel is
# uname -srvmi
Linux 2.6.34-ARCH #1 SMP PREEMPT Sat Jun 19 00:07:49 CEST 2010 x86_64
AuthenticAMD
(currently don't want to upgrade, case some problems for my gpu
reported after update, so waiting for solutions for gfx before
upgrade)

After booting, when system is running is looks like working. But those
warnings makes me unsure.

Could you advice me:
How to check if my LV mirroring is working correctly (and data are
"safe" for one disk failure) ?
How to fix those warnings on startup ?

Thanks for all urls, and advices.
