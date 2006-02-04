Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k14Ikm119784
	for <linux-lvm@redhat.com>; Sat, 4 Feb 2006 13:46:48 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k14IkgpF006127
	for <linux-lvm@redhat.com>; Sat, 4 Feb 2006 13:46:42 -0500
Date: Sat, 4 Feb 2006 19:46:41 +0100
From: Luca Berra <bluca@comedia.it>
Subject: [mslonik@poczta.onet.pl: Re: [linux-lvm] Ubuntu distro with lvm2,
	raid 1, not booting anymore.]
Message-ID: <20060204184641.GA32334@percy.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

i surrender,
is there anyone on the list that can help Maciej?

L.
----- Forwarded message from Maciej S??ojewski <mslonik@poczta.onet.pl> -----

Date:	Sat, 04 Feb 2006 18:44:29 +0100
From: Maciej S??ojewski <mslonik@poczta.onet.pl>
To: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Ubuntu distro with lvm2, raid 1, not booting anymore.

Luca Berra napisa??(a):


Again, what I've been doing since Ubuntu Live! ends its booting process:

# sudo su
# cd /mnt
# mkdir dev proc boot sys
# mount -v -t ext3 /dev/PV/root /mnt
# mount -v -t ext3 /dev/PV/boot /mnt/boot
# mount -v -t proc none /mnt/proc
# mount -v -t sysfs none /mnt/sys
# mount -v --bind /dev /mnt/dev

# chroot /mnt /bin/bash
# update-initramfs -v -c -k 2.6.12-10-386
# /sbin/lilo

Warning: '/proc/partitions' does not match '/dev' directory structure.
Name change: '/dev/dm-0' -> '/dev/mapper/casper-cow'
Fatal: is_primary: Not a valid device: 0xFE07

So the same problem again :-(
---------------------------------------------------------

My /dev/mapper directory:

+ PV-boot              254,2
+ PV-home             254,5
+ PV-root               254,4
+ PV-swap             254,3
+ PV-zasoby           254,6
+ casper-cow          254,0
+ casper-snapshot   254,1
- control

---------------------------------------------------------

My lilo.conf:

boot = /dev/md0
root = /dev/mapper/PV-root
raid-extra-boot = mbr
map = /boot/map

delay = 20

default = Linux

image = /vmlinuz
   initrd = /initrd.img
   label = Linux
   read-only

---------------------------------------------------------

Thanks a lot again for your interest and time on this problem. Do you 
have any further clues?

Kind regards,
Maciej (mslonik)

----- End forwarded message -----

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
