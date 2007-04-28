Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3SAX46F009386
	for <linux-lvm@redhat.com>; Sat, 28 Apr 2007 06:33:04 -0400
Received: from smtp1-g19.free.fr (smtp1-g19.free.fr [212.27.42.27])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l3SAX3EF016361
	for <linux-lvm@redhat.com>; Sat, 28 Apr 2007 06:33:03 -0400
Received: from free.fr (gar13-1-82-227-28-39.fbx.proxad.net [82.227.28.39])
	by smtp1-g19.free.fr (Postfix) with SMTP id 50D6DB9467
	for <linux-lvm@redhat.com>; Sat, 28 Apr 2007 12:33:03 +0200 (CEST)
Date: Sat, 28 Apr 2007 12:33:03 +0200
From: Yann Boutin <yann.boutin@free.fr>
Message-ID: <20070428103303.GA11539@gentoo>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] can't mount vfat fs on lvm created by winxp guest on xen
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Greetings, 
I've had no success with mounting a vfat file system created by a 
Windows XP guest on a lvm volume. Windows XP guest is running under xen 3.0.5 rc3.

# mount -t vfat /dev/vg1/win1 /mnt/
mount: wrong fs type, bad option, bad superblock on /dev/vg1/win1,
       missing codepage or other error
       In some cases useful info is found in syslog - try
       dmesg | tail  or so

# dmesg
FAT: invalid media value (0xb9)
VFS: Can't find a valid FAT filesystem on dev dm-0.

# lvm version
  LVM version:     2.02.10 (2006-09-19)
  Library version: 1.02.10 (2006-09-19)
  Driver version:  4.7.0

# uname -a
Linux gentoo 2.6.18-xen #6 SMP Sun Apr 22 12:11:43 CEST 2007 i686 
Intel(R) Core(TM)2 CPU          6300  @ 1.86GHz GenuineIntel GNU/Linux


I found solutions for similar problem (symptoms) reported with usb pens but no one worked.

Help  would be greatly appreciated.

Thanks!

	Yann.
