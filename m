Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k195QK111301
	for <linux-lvm@redhat.com>; Thu, 9 Feb 2006 00:26:20 -0500
Received: from smtpauth01.mail.atl.earthlink.net
	(smtpauth01.mail.atl.earthlink.net [209.86.89.61])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k195QD3r013030
	for <linux-lvm@redhat.com>; Thu, 9 Feb 2006 00:26:13 -0500
Received: from [66.218.36.163] (helo=[192.168.1.17])
	by smtpauth01.mail.atl.earthlink.net with asmtp (Exim 4.34)
	id 1F74Jk-0008FE-7B
	for linux-lvm@redhat.com; Thu, 09 Feb 2006 00:26:08 -0500
Message-ID: <43EAD26F.7060303@earthlink.net>
Date: Wed, 08 Feb 2006 21:26:07 -0800
From: Richard Blumel <revslowmo@earthlink.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Freeing space on a LVM for other partitions
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I currently have this setup on a hw raid 0+1

[root@cranium][pts/2]:~# fdisk -l

Disk /dev/sda: 320.0 GB, 320073629696 bytes
255 heads, 63 sectors/track, 38913 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1        3732    29977258+   7  HPFS/NTFS
/dev/sda2            3860        5076     9775552+  83  Linux
/dev/sda3            5077       38913   271795702+  83  Linux
/dev/sda4            3733        3859     1020127+   5  Extended
/dev/sda5            3733        3859     1020096   82  Linux swap /
Solaris
 

[root@cranium][pts/2]:~# vgdisplay
  --- Volume group ---
  VG Name               raid01
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  6
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                4
  Open LV               4
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               259.20 GB
  PE Size               4.00 MB
  Total PE              66356[root@cranium][pts/2]:~# lvdisplay
  --- Logical volume ---
  LV Name                /dev/raid01/usr
  VG Name                raid01
  LV UUID                khBZSv-3q6S-OKeX-NHJz-PdC5-FK9C-or6BDb
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                15.00 GB
  Current LE             3840
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:0

  --- Logical volume ---
  LV Name                /dev/raid01/var
  VG Name                raid01
  LV UUID                gxbp4O-pL6I-Ye5o-Yvqp-nrmB-7Q51-8psyn2
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                5.00 GB
  Current LE             1280
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:1

  --- Logical volume ---
  LV Name                /dev/raid01/tmp
  VG Name                raid01
  LV UUID                awX51K-guHb-oAbZ-mvnd-SBg0-YM87-IR5BXQ
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                1.00 GB
  Current LE             256
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:2

  --- Logical volume ---
  LV Name                /dev/raid01/home
  VG Name                raid01
  LV UUID                R6ZBTP-y7LF-1pGl-u1be-lFx4-G31b-qZuCLU
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                208.20 GB
  Current LE             53300
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:3

  Alloc PE / Size       58676 / 229.20 GB
  Free  PE / Size       7680 / 30.00 GB
  VG UUID               Md0gWC-47Kj-CAft-W9D8-G420-tzQl-34sMBk


What I want to do is shrink the /dev/sda3 partition which is lvm, not
sure why is says just link but eh. Once shrunk I am going to grow the
ntfs partition which  I know how todo. My problem is most of the howto
talk about moving pv to remove pv so forth. I saw one post that said
what I am trying todo is voodoo and dangerous but recommend that to
move the PE towards one edge of the disk us --alloc anywhere however I
have seen other documents that say that is not implemented yet. I hope
I haven't lost you guys but if you know what I should I would be
greatly in your debt.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFD6tJL48JsCLyRVlARAiMuAJ4i3mOV0QkQaFs1axWDZOpRXfFVAgCfbJjp
GDdeXvoG0Lcs/gzgwm1Gprk=
=24e7
-----END PGP SIGNATURE-----
