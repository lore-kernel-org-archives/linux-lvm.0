Return-Path: <banal@home.com>
Message-ID: <3AEB0146.C9D05ED5@home.com>
Date: Sat, 28 Apr 2001 10:43:34 -0700
From: Evan Day <banal@home.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM on root, Kernel panic: "I have no root and I must 
 scream"
References: <DC5B1A21E9E7D211B0020090273AD628242BBB@summit15.corvallis.summit> <20010428095923.B4149@colombina.comedia.it>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

A quick thanks to everyone on the list who offered tips & advice for making
my setup work.  I finally got everything loaded, configured, partitioned,
mirrored, and LVMed!

Problem 1: needed to use install-mbr to put an MBR on /dev/sda and /dev/sdb.
Problem 2: needed to upgrade LILO

Now I have the install-mbr MBR booting, which gets me to LILO (21.7) 
installed on /dev/md0 (/dev/sda1, /dev/sdb1).  The older version of LILO I 
was using (21.5) didn't seem to work with md devices (I recall reading about
that somewhere, too).

Running Kernel 2.4.4 w/ LVM 0.9.1b7 (had to make a minor change to lvm.c to 
get the kernel to compile):

day@kirk:~$ df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/vg00/lvol1         131064    102124     28940  78% /
/dev/md0                 48056     38656      9400  80% /boot
/dev/vg00/lvol2        1048540    551088    497452  53% /usr
/dev/vg00/lvol3         262132    130240    131892  50% /var
/dev/vg00/lvol4         262132     32840    229292  13% /tmp
/dev/vg00/lvol5         262132     32840    229292  13% /hom

kirk:~# fdisk /dev/sda

Command (m for help): p

Disk /dev/sda: 255 heads, 63 sectors, 522 cylinders
Units = cylinders of 16065 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/sda1   *         1         6     48163+  fd  Linux raid autodetect
/dev/sda2             7        23    136552+  82  Linux swap
/dev/sda3            24        40    136552+  82  Linux swap
/dev/sda4            41       522   3871665   fd  Linux raid autodetect

(/dev/sdb is the same)

kirk:~# cat /etc/lilo.conf
lba32
boot=/dev/md0
root=/dev/hda2
install=/boot/boot.b
map=/boot/map
delay=20
vga=normal
default=lvm-linux

image=/vmlinuz
        label=linux
        read-only
        initrd=/boot/initrd-lvm-2.4.4.gz

image=/vmlinuz.lvm
        label=lvm-linux
        initrd=/boot/initrd-lvm-2.4.4.gz
        root=/dev/vg00/lvol1
        read-only

image=/vmlinuz.old
        label=linux-old
        read-only
        optional

Thanks again!
-Evan
