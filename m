Message-ID: <39E21C56.B57AC5D4@attglobal.net>
Date: Mon, 09 Oct 2000 15:28:22 -0400
From: Les Hazelton <seawolf@attglobal.net>
MIME-Version: 1.0
Subject: [linux-lvm] Unable to boot using LVM for "/"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

I have been attempting to move my root partition to a logical volume and
eliminate the current normal partition.  No luck.  I have read the
lvmcreate_initrd man page found at 

http://linux.msede.com/lvm/man/man2html.cgi?lvmcreate_initrd:8

and followed those instructions but it doesn't work for me. I have tried
two different versions of lilo (lilo-0.21.5.1-4mdk and the 0.21.6
binaries from the lilo site) and get the same result from both.

If I use grub with the menu.lst shown below I can boot the entry for
linux-2 and the system runs correctly. Neither of the other two entries
will boot correctly. The /dev/hda9 is the real partition I am attempting
to eliminate.  If I try to boot the first, linux, entry it gets a kernel
panic because it can't locate init. The third entry produces a kernel
panic because it can't mound device 0:0
---------------------------------------------------------
[root@farpt1 /root]# cat /boot/grub/menu.lst
timeout 5
color black/cyan yellow/cyan
i18n (hd0,4)/grub/messages
keytable (hd0,4)/us.klt
default 0

title linux
kernel (hd0,4)/bzImage-2.2.17-0.16mdk-02 init=/boot/init  vga=0x318
initrd (hd0,4)/initrd.lrh.gz

title linux-2
kernel (hd0,4)/bzImage-2.2.17-0.16mdk-02  root=/dev/hda9 vga=0x318
initrd (hd0,4)/initrd.gz

title test
kernel (hd0,4)/bzImage-2.2.17-0.16mdk-02 root=/dev/vg01/main vga=0x318
initrd (hd0,4)/initrd.lrh.gz
----------------------------------------------------------

When the system is booted from the linux-2 entry it produces the
following.  Notice the rdev and "df -h" show clearly different views of
where the root partition is sourced.
----------------------------------------------------------
[root@farpt1 /root]# df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/vg01/main        501M  353M  122M  74% /
/dev/hda5             235M  2.9M  220M   1% /boot
/dev/vg01/usr         2.5G  2.0G  553M  78% /usr
/dev/vg01/src         600M  380M  220M  63% /usr/src
/dev/vg01/local       800M  600M  200M  75% /usr/local
/dev/vg01/home       1020M  434M  586M  43% /home
/dev/vg01/mp3         1.5G  1.4G   98M  94% /mp3
/dev/vg01/var         252M  122M  129M  49% /var
/dev/hda8             2.9G  1.3G  1.5G  47% /Archives
[root@farpt1 /root]# rdev
/dev/hda9 /
------------------------------------------------------------

My lilo.conf resides in the /boot partition which is an ext2fs on
/dev/hda5. It is listed below.  When I install lilo and try to boot the
system It comes up but it is using /dev/hda6 for the root partition and
that belongs to my test copy of LM v7.2 and should have nothing to do
with this system. 

The one thing that is clearly different is that the lvmcreate_initrd man
page references ext2fe file systems and I am using reiserfs for all
except the /boot on /dev/hda5. Can anyone see what I am doing wrong and
get me turned around?  I would sure appreciate the help.

---------------------------------------------
[root@farpt1 /root]# cat /boot/lilo.conf
boot=/dev/hda5
map=/boot/map
install=/boot/boot.b
vga=ext
default=rootonly
keytable=/boot/us.klt
lba32
delay=100
backup=/boot/boot.grub
message=/boot/message
image=/boot/bzImage-2.2.17-0.16mdk-02 vga=0x318
    initrd=/boot/initrd.gz
	root=/dev/vg01/main
	label=rootonly
	append="ramdisk_size=8192"
	read-only
--------------------------------------------------------------

-- 

Good Journey, longevity and prosperity to all

Les Hazelton
