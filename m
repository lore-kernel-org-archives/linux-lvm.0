Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i3F4u8j05105
	for <linux-lvm@redhat.com>; Thu, 15 Apr 2004 00:56:08 -0400
Received: from york.smtp.ru (york.smtp.ru [62.118.249.10])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i3F4u6u6004386
	for <linux-lvm@redhat.com>; Thu, 15 Apr 2004 00:56:06 -0400
Received: from [194.85.85.2] (account <01@smtp.ru>)
	by york.smtp.ru (CommuniGate Pro WebUser 3.5.9)
	with HTTP id 43168791 for <linux-lvm@redhat.com>;
	Thu, 15 Apr 2004 08:56:05 +0400
From: "Stepanov Andrew" <01@smtp.ru>
Date: Thu, 15 Apr 2004 08:56:05 +0400
Message-ID: <web-43168791@york.smtp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM2: modprobe: Can't locate module
	/dev/mapper/vg-home...
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello!
First of all sorry for my English.

I'm using Gentoo Linux 2004.0.
All works fine.
(LVM2 works and i can using partitions at LVM2)

But, At boot time there messages:

*Setting up the Logical Volume Manager...
modprobe: Can't locate module /dev/mapper/vg-home
modprobe: Can't locate module /dev/mapper/vg-opt
modprobe: Can't locate module /dev/mapper/vg-tmp
modprobe: Can't locate module /dev/mapper/vg-usr
modprobe: Can't locate module /dev/mapper/vg-var

modprobe: Can't locate module /dev/vg/group
modprobe: Can't locate module /dev/vg/usr
modprobe: Can't locate module /dev/vg/group
modprobe: Can't locate module /dev/vg/home
modprobe: Can't locate module /dev/vg/group
modprobe: Can't locate module /dev/vg/opt
modprobe: Can't locate module /dev/vg/group
modprobe: Can't locate module /dev/vg/var
modprobe: Can't locate module /dev/vg/group
modprobe: Can't locate module /dev/vg/tmp      [OK]
.
.
.
This is coolbox.mydomain.org (Linux i686 2.4.24-xfs-r3)

coolbox login:


That's all.
I can work with my computer.

Please help me to hide this messages.

This messages shows when device mapper compiled into kernel
or it loaded like module at boot time.

HELLLLP!!!!
