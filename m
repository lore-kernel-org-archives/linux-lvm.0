Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iALCJlr11341
	for <linux-lvm@redhat.com>; Sun, 21 Nov 2004 07:19:47 -0500
Received: from mail.gmx.net (mail.gmx.de [213.165.64.20])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id iALCJVNI024622
	for <linux-lvm@redhat.com>; Sun, 21 Nov 2004 07:19:41 -0500
Received: from pavian.at.ds9 (pavian.at.ds9 [192.168.0.104])
	by mailer.at.ds9 (Postfix) with ESMTP id F36F47579E
	for <linux-lvm@redhat.com>; Sun, 21 Nov 2004 13:19:24 +0100 (CET)
From: Sisko <cisco66@gmx.de>
Date: Sun, 21 Nov 2004 13:19:27 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200411211319.27152.cisco66@gmx.de>
Subject: [linux-lvm] RAID, LVM and dm_crypt, please confirm setup
Reply-To: cisco66@gmx.de,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Hello group !

I would really appreciate it, if someone with more knowledge than me could 
confirm, if my setup is ok.

I have (at home) the following setup for my data discs:

2x 40  GB RAID1 --> /dev/md0
2x 80  GB RAID1 --> /dev/md1
2x160 GB RAID1 --> /dev/md2

These are part of volume group vg00, consisting of 9 logical volumes 
lv00...lv09

Now i set up crypt devices with cryptsetup and named these crypt devices 
clv00...clv09.

So my directory /dev/mapper looks like:
brw-r-----   1 root root 253, 10 2004-11-18 22:54 clv00
brw-r-----   1 root root 253, 11 2004-11-18 22:54 clv01
brw-r-----   1 root root 253, 12 2004-11-18 22:54 clv02
brw-r-----   1 root root 253, 13 2004-11-18 22:54 clv03
brw-r-----   1 root root 253, 14 2004-11-18 22:54 clv04
brw-r-----   1 root root 253, 15 2004-11-18 22:54 clv05
brw-r-----   1 root root 253, 16 2004-11-18 22:54 clv06
brw-r-----   1 root root 253, 17 2004-11-18 22:54 clv07
brw-r-----   1 root root 253, 18 2004-11-18 22:54 clv08
brw-r-----   1 root root 253, 19 2004-11-18 22:54 clv09
crw-------   1 root root  10, 63 2004-06-24 17:42 control
brw-r-----   1 root root 253, 20 2004-11-18 22:54 swap0
brw-r-----   1 root root 253, 21 2004-11-18 22:54 swap1
brw-------   1 root root 253,  0 2004-11-18 22:53 vg00-lv00
brw-------   1 root root 253,  1 2004-11-18 22:53 vg00-lv01
brw-------   1 root root 253,  2 2004-11-18 22:53 vg00-lv02
brw-------   1 root root 253,  3 2004-11-18 22:53 vg00-lv03
brw-------   1 root root 253,  4 2004-11-18 22:53 vg00-lv04
brw-------   1 root root 253,  5 2004-11-18 22:53 vg00-lv05
brw-------   1 root root 253,  6 2004-11-18 22:53 vg00-lv06
brw-------   1 root root 253,  7 2004-11-18 22:53 vg00-lv07
brw-------   1 root root 253,  8 2004-11-18 22:53 vg00-lv08
brw-------   1 root root 253,  9 2004-11-18 22:53 vg00-lv09

These crypt devices are mounted and presented via Samba.
In fact, everything is working fine and out of the box.

The "problem" is:

When i try to extend one logical volume, i have to do it this way:

1) unmount the device on server and client side
2) stop samba
3)  lvextend -L+5G /dev/vg00/lv00    # not clv00 !
4) e2fsck resize2fs /dev/mapper/clv00-f /dev/mapper/clv00         # now the 
crypto device !
5) resize2fs /dev/mapper/clv00 # again the crypto device
6) mount 
7) finish

What i'm a bit afraid of is the fact that i once have to touch the crypto 
device and once the "normal" logical volume. It is working and i have now 
problems, but is this really the right way and supported ?

I could imagine that other people find this configuration interesting too, so 
maybe this could be an item for the LVM-HOWTO (ie under item 13, recipes) or 
so.

Thanks in advance !

Kernel 2.6.9 vanilla
~# lvm version
  LVM version:     2.00.24 (2004-09-16)
  Library version: 1.00.17-ioctl (2004-04-19)
  Driver version:  4.1.0
~# dmsetup --version
Library version:   1.00.17-ioctl (2004-04-19)
Driver version:    4.1.0
