Return-Path: <bluca@comedia.it>
Date: Fri, 27 Apr 2001 23:11:44 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM on root, Kernel panic: "I have no root and I must scream"
Message-ID: <20010427231144.F2260@colombina.comedia.it>
References: <DC5B1A21E9E7D211B0020090273AD628242BBA@summit15.corvallis.summit>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DC5B1A21E9E7D211B0020090273AD628242BBA@summit15.corvallis.summit>; from Evan.Day@SUMMITSITE.COM on Fri, Apr 27, 2001 at 01:48:23PM -0700
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

On Fri, Apr 27, 2001 at 01:48:23PM -0700, Day, Evan wrote:
> I've tried both setting root=/dev/vg00/lvol1 and root=0x3a00 - neither
> worked.  I'm probably just going to put / as the first device (including
> /boot) on RAID-1 and make the rest of the system LVM.  I've spent too many
> days trying to make root on LVM work and I need my system back...
> 
can you send me some more details on what happens,
a log would be great if you can log on a serial device

it *should* work

here is what i have (i dun use lvmcreate_initrd)

[vc/2]bluca@Moskowskaya:~% df
/dev/vg01/lvol1         253920     60104    180712  25% /
/dev/md/0                29621     10798     17294  38% /boot
/dev/vg01/lvol3        2064208   1675988    283364  86% /usr
/dev/vg01/lvol4         507848    255632    226004  53% /var
/dev/vg01/lvol5         253920      9428    231388   4% /tmp
/dev/vg01/lvol6        2064208   1673716    285636  85% /opt
/dev/vg01/lvol7        4128448   3137540    781196  80% /home

[vc/3]root@Moskowskaya:~# cat /etc/lilo.conf
boot = /dev/md/0
timeout = 50
prompt
root = 0x3a00 #/dev/vg01/lvol1
read-only
map = /boot/map
install=/boot/boot.b
default = linux
optional
append = "panic=60 devfs=symlinks video=tdfx:800x600-32@72 root=/dev/vg01/lvol1"
vga=normal
restricted

image = /boot/vmlinuz-2.4.3-ac3
label = 243ac3
initrd = /boot/initrd-2.4.3-ac3
alias = linux

[vc/3]root@Moskowskaya:~# cat /boot/initrd-source/linuxrc
#!/bin/sh -x
mount -t proc /proc /proc
echo "" > /proc/sys/kernel/modprobe
insmod -k /lib/modules/*/kernel/drivers/scsi/aic7xxx/aic7xxx.o aic7xxx=verbose
insmod -k /lib/modules/*/kernel/drivers/md/raid1.o
insmod -k /lib/modules/*/kernel/drivers/md/xor.o
insmod -k /lib/modules/*/kernel/drivers/md/raid5.o
raidstart -a
vgchange -a y
sulogin -t 10
umount /proc

[vc/3]root@Moskowskaya:~# find /boot/initrd-source -type f
/boot/initrd-source/bin/BusyBox
/boot/initrd-source/bin/insmod
/boot/initrd-source/bin/raidstart
/boot/initrd-source/bin/sulogin
/boot/initrd-source/bin/vgchange
/boot/initrd-source/bin/vgscan
/boot/initrd-source/etc/lvmtab.d/vg01
/boot/initrd-source/etc/passwd
/boot/initrd-source/etc/raidtab
/boot/initrd-source/lib/ld-linux.so.2
/boot/initrd-source/lib/libc.so.6
/boot/initrd-source/lib/libcrypt.so.1
/boot/initrd-source/lib/liblvm-11.so.0
/boot/initrd-source/lib/modules/2.4.3-ac3/kernel/drivers/block/floppy.o
/boot/initrd-source/lib/modules/2.4.3-ac3/kernel/drivers/md/raid1.o
/boot/initrd-source/lib/modules/2.4.3-ac3/kernel/drivers/md/raid5.o
/boot/initrd-source/lib/modules/2.4.3-ac3/kernel/drivers/md/xor.o
/boot/initrd-source/lib/modules/2.4.3-ac3/kernel/drivers/scsi/aic7xxx/aic7xxx.o
/boot/initrd-source/lib/modules/2.4.3-ac3/kernel/drivers/scsi/sym53c8xx.o
/boot/initrd-source/lib/modules/2.4.3-ac3/kernel/fs/reiserfs/reiserfs.o
/boot/initrd-source/linuxrc

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
