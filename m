Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7SHsA324668
	for <linux-lvm@redhat.com>; Sat, 28 Aug 2004 13:54:10 -0400
Received: from web52805.mail.yahoo.com (web52805.mail.yahoo.com
	[206.190.39.169])
	by mx3.redhat.com (8.12.11/8.12.10) with SMTP id i7SHs4in031397
	for <linux-lvm@redhat.com>; Sat, 28 Aug 2004 13:54:04 -0400
Message-ID: <20040828175359.53311.qmail@web52805.mail.yahoo.com>
Date: Sat, 28 Aug 2004 10:53:59 -0700 (PDT)
From: Richard Weil <rcweil@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] prob w/ lvm2 on root (RAID 5), creating mkinitrd
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I'm having problems creating an mkinitrd image where I want the /
directory to be lvm2.

Setup:
o  Running Debian Sarge using stock 2.6.7-k7-smp w/ udev; per docs, the
Debian initrd-tools support lvm2 on root
o  Volume group named "vg" created from /dev/md1 (which is RAID 5)
o  Logical volume "root" on "vg"
   => result: a lvm2 device called "/dev/vg/root"
o  Mounted /dev/vg/root on /mnt and copied over my current / partition
o  Tried to create an initrd image using /dev/vg/root as / and I get
the following:

portland:~# chroot /mnt mkinitrd -o /boot/initrd.img-2.6.7-1-k7-smp-LVM
/usr/sbin/mkinitrd: neither /dev/fd or /proc/self/fd exists!
Try mounting the proc filesystem: mount -tproc none /proc
portland:~# chroot /mnt mount -tproc none /proc
portland:~# chroot /mnt mkinitrd -o /boot/initrd.img-2.6.7-1-k7-smp-LVM
/usr/sbin/mkinitrd: device /dev/vg/root is not a block device

Using mkinitrd in a chroot environment, instead of with "-r", may be
Debian specific. In any case, I'm stuck now -- any ideas? Help much
appreciated.

Thanks,

Richard

p.s. I know /boot should not be on the lvm2 device; my plan was to move
/boot to it's own partition, /dev/md0 (setup as RAID 1), as soon as I
had the initrd image.


		
__________________________________
Do you Yahoo!?
Yahoo! Mail - 50x more storage than other providers!
http://promotions.yahoo.com/new_mail
