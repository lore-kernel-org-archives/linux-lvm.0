Message-ID: <39D8A2AA.CA0A282C@attglobal.net>
Date: Mon, 02 Oct 2000 10:58:50 -0400
From: Les Hazelton <seawolf@attglobal.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] need help to recover my system
References: <200010020449.e924nVl11138@webber.adilger.net> <39D82C2E.FEFE5205@attglobal.net> <20001002102626.B7806@srv.t-online.de>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Mauelshagen@Sistina.com
Cc: linux-lvm@msede.com, Andreas Dilger <adilger@turbolinux.com>

I have my production system back again thanks to all the help provided
by Heinz and Andreas. It has been an interesting week of learning.

Once my test system could see the logical volumes I created an ext2fs
partition on /dev/hda9 and copied the content of the "/" logical volume
to it. I changed the /etc/fstab entry for "/" to match the new location.
Next I modified the /boot/grub/menu.lst entry to match the new location.

Once these steps were done I re-booted the system using a grub floppy
disk. I used the root, kernel and boot commands to boot the production
Linux 7.1 system. From there I reentered grub and used the root and
install commands to install grub on the /boot partition.

I re-booted the system at that point and it is running now with no
apparent ill effects. I don't think I will make any improvements for a
few days.  I need the rest ;-)

Heinz, Andreas,  Many thanks.

-- 

Good Journey, longevity and prosperity to all

Les Hazelton
