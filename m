Return-Path: <Evan.Day@SUMMITSITE.COM>
Message-ID: <DC5B1A21E9E7D211B0020090273AD628242BBD@summit15.corvallis.summit>
From: "Day, Evan" <Evan.Day@SUMMITSITE.COM>
Subject: RE: [linux-lvm] LVM on root, Kernel panic: "I have no root and I 
	must scream"
Date: Fri, 27 Apr 2001 15:06:51 -0700
MIME-Version: 1.0
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

Using LILO (21.5 from the stable Debian dist) is sketchy.  Sometimes it'll
boot, other times it just prints "LI" on the screen and locks (or, even
better, starts dumping screen dumps to the printer).  I think Iwas a bit
confused because it turns out that /dev/sdb is scsi id 6 (boot disk) and
/dev/sda is scsi id 5, even though the SCSI BIOS reports id 6 as HD0 and id
5 as HD1.  I have a pair of IDE drives on the system, too, and LILO always
complains that /dev/sdb isn't the first disk... As long as I'm reloading
(again) I'll give it another try.

I won't even mention the evening I wasted trying to figure out why initrd
wasn't working before finally going back to the kernel and remembering to
enable it there... ;)

-Evan

-----Original Message-----
From: AJ Lewis [mailto:lewis@sistina.com]
Sent: Friday, April 27, 2001 3:00 PM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] LVM on root, Kernel panic: "I have no root and
I must scream"


On Fri, Apr 27, 2001 at 02:39:12PM -0700, Day, Evan wrote:
> I hosed things up good at lunch and started a reinstall before I went back
> to work.  I'll finish it up as soon as I get home and see what I can come
up
> with.  The only thing I see different in your linuxrc is the raidstart -a.
> I'm not doing that, and didn't think it would be necessary (my RAIDS are
> type fd in the partmap and have persistent-superblock 1 in /etc/raidtab).
> 
> Except for using GRUB instead of LILO (and kernel modules for raid/lvm),
my
> setup looks almost identical to yours.  I'm not using devfs, but that
> shouldn't matter.

I have seen problems with GRUB that are fixed by using LILO.  I'm not sure
what the issues are.  GRUB seems to be a lot more touchy though.  Have you
tried using LILO?

> What I really don't get is that I can put a mount /dev/vg00/lvol1 in
> /linuxrc and it mounts!  I can also boot with a root of /dev/sda2 (old
root
> partition), with /etc/fstab pointing / at /dev/vg00/lvol1 (from sda2) and
it
> mounts okay.
> 
> I'll have to see if I can run a serial cable from the linux machine to
> another PC to capture logs.
> 
> Thanks for the help
> -Evan
> 
> -----Original Message-----
> From: Luca Berra [mailto:bluca@comedia.it]
> Sent: Friday, April 27, 2001 2:12 PM
> To: 'linux-lvm@sistina.com'
> Subject: Re: [linux-lvm] LVM on root, Kernel panic: "I have no root and
> I must scream"
> 
> 
> On Fri, Apr 27, 2001 at 01:48:23PM -0700, Day, Evan wrote:
> > I've tried both setting root=/dev/vg00/lvol1 and root=0x3a00 - neither
> > worked.  I'm probably just going to put / as the first device (including
> > /boot) on RAID-1 and make the rest of the system LVM.  I've spent too
many
> > days trying to make root on LVM work and I need my system back...
> > 
> can you send me some more details on what happens,
> a log would be great if you can log on a serial device
> 
> it *should* work
> 
> here is what i have (i dun use lvmcreate_initrd)
> 
> [vc/2]bluca@Moskowskaya:~% df
> /dev/vg01/lvol1         253920     60104    180712  25% /
> /dev/md/0                29621     10798     17294  38% /boot
> /dev/vg01/lvol3        2064208   1675988    283364  86% /usr
> /dev/vg01/lvol4         507848    255632    226004  53% /var
> /dev/vg01/lvol5         253920      9428    231388   4% /tmp
> /dev/vg01/lvol6        2064208   1673716    285636  85% /opt
> /dev/vg01/lvol7        4128448   3137540    781196  80% /home
> 
> [vc/3]root@Moskowskaya:~# cat /etc/lilo.conf
> boot = /dev/md/0
> timeout = 50
> prompt
> root = 0x3a00 #/dev/vg01/lvol1
> read-only
> map = /boot/map
> install=/boot/boot.b
> default = linux
> optional
> append = "panic=60 devfs=symlinks video=tdfx:800x600-32@72
> root=/dev/vg01/lvol1"
> vga=normal
> restricted
> 
> image = /boot/vmlinuz-2.4.3-ac3
> label = 243ac3
> initrd = /boot/initrd-2.4.3-ac3
> alias = linux
> 
> [vc/3]root@Moskowskaya:~# cat /boot/initrd-source/linuxrc
> #!/bin/sh -x
> mount -t proc /proc /proc
> echo "" > /proc/sys/kernel/modprobe
> insmod -k /lib/modules/*/kernel/drivers/scsi/aic7xxx/aic7xxx.o
> aic7xxx=verbose
> insmod -k /lib/modules/*/kernel/drivers/md/raid1.o
> insmod -k /lib/modules/*/kernel/drivers/md/xor.o
> insmod -k /lib/modules/*/kernel/drivers/md/raid5.o
> raidstart -a
> vgchange -a y
> sulogin -t 10
> umount /proc
> 
> [vc/3]root@Moskowskaya:~# find /boot/initrd-source -type f
> /boot/initrd-source/bin/BusyBox
> /boot/initrd-source/bin/insmod
> /boot/initrd-source/bin/raidstart
> /boot/initrd-source/bin/sulogin
> /boot/initrd-source/bin/vgchange
> /boot/initrd-source/bin/vgscan
> /boot/initrd-source/etc/lvmtab.d/vg01
> /boot/initrd-source/etc/passwd
> /boot/initrd-source/etc/raidtab
> /boot/initrd-source/lib/ld-linux.so.2
> /boot/initrd-source/lib/libc.so.6
> /boot/initrd-source/lib/libcrypt.so.1
> /boot/initrd-source/lib/liblvm-11.so.0
> /boot/initrd-source/lib/modules/2.4.3-ac3/kernel/drivers/block/floppy.o
> /boot/initrd-source/lib/modules/2.4.3-ac3/kernel/drivers/md/raid1.o
> /boot/initrd-source/lib/modules/2.4.3-ac3/kernel/drivers/md/raid5.o
> /boot/initrd-source/lib/modules/2.4.3-ac3/kernel/drivers/md/xor.o
>
/boot/initrd-source/lib/modules/2.4.3-ac3/kernel/drivers/scsi/aic7xxx/aic7xx
> x.o
> /boot/initrd-source/lib/modules/2.4.3-ac3/kernel/drivers/scsi/sym53c8xx.o
> /boot/initrd-source/lib/modules/2.4.3-ac3/kernel/fs/reiserfs/reiserfs.o
> /boot/initrd-source/linuxrc
> 
> L.
> 
> -- 
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 
AJ Lewis
Sistina Software Inc.                  Voice:  612-379-3951
1313 5th St SE, Suite 111              Fax:    612-379-3952
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint = 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
To know recursion, you must first know recursion.
-----End Obligatory Humorous Quote------------------------------------------
