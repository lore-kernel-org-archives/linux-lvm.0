Message-ID: <3D8F5DB3.9080806@comedia.it>
From: Luca Berra <bluca@comedia.it>
MIME-Version: 1.0
Subject: Re: [linux-lvm] raid1+lvm
References: <20020923102557.B74653-100000@true.fiberpimp.net>
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
Date: Mon Sep 23 13:31:53 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

galt wrote:
> perhaps I'm missing something.
> 
> Luca,
> So it is or is not possible to boot a root filesystem thats inside an lvm
> without a separate /boot that is either raid1 or normal? From what you
> said I'd like to interpret it as you need a initrd inside the root lv...is
> that the case?  If so, could I see the root= and boot= lines from your
> lilo.conf? (Assuming you have this configuration)

This config is far from perfect, was done in a hurry and since i was not 
able to batter lilo into perfection i had to use boot=/dev/sda and do a
dd if=/dev/sda of=/dev/sdb bs=512 count=1
after running lilo

This config was tested and i was able to boot it removing the first drive.

# lilo -V
LILO version 22.3.2

# cat /etc/lilo.conf
boot=/dev/sda
map=/boot/map
vga=normal
default=linux
keytable=/boot/us.klt
lba32
prompt
nowarn
timeout=100
message=/boot/message
menu-scheme=wb:bw:wb:bw
ignore-table
password="XXXXXXX"

image=/boot/vmlinuz
         restricted
         label=linux
         root=/dev/vg00/lvol3
         initrd=/boot/initrd.img
         append="devfs=mount console=ttyS1,9600 console=tty0"
         read-only

# df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/vg00/lvol3        3096336   1070072   1868980  37% /
/dev/vg00/lvol1         126931      8277    112101   7% /boot
/dev/vg00/lvol4        4128448   2632024   1286712  68% /home
/dev/vg00/lvol5        2064208    240884   1718468  13% /var

# swapon -s
Filename                        Type            Size    Used    Priority
/dev/vg00/lvol2                 partition       1048568 26640   -1

# cat /proc/lvm/global
LVM module LVM version 1.0.3(19/02/2002)

# fdisk -l

Disk /dev/scsi/host0/bus0/target0/lun0/disc: 255 heads, 63 sectors, 2213 
cylinders
Units = cylinders of 16065 * 512 bytes

                                  Device Boot    Start       End 
Blocks   Id  System
/dev/scsi/host0/bus0/target0/lun0/part1   *         1         7 
56196    6  FAT16
/dev/scsi/host0/bus0/target0/lun0/part2             8      2213 
17719695   fd  Linux raid autodetect

Disk /dev/scsi/host0/bus0/target1/lun0/disc: 255 heads, 63 sectors, 2213 
cylinders
Units = cylinders of 16065 * 512 bytes

                                  Device Boot    Start       End 
Blocks   Id  System
/dev/scsi/host0/bus0/target1/lun0/part1   *         1         7 
56196    6  FAT16
/dev/scsi/host0/bus0/target1/lun0/part2             8      2213 
17719695   fd  Linux raid autodetect

# cat /etc/raidtab
raiddev /dev/md0
   raid-level 1
   nr-raid-disks 2
   nr-spare-disks 0
   device /dev/scsi/host0/bus0/target0/lun0/part2
   raid-disk 0
   device /dev/scsi/host0/bus0/target1/lun0/part2
   raid-disk 1


I was not able to boot from an LVM 2 since lilo does not grok 
device-mapper devices, btw lilo seems to need HDIO_GETGEO
syscall that is (was?) not available with device-mapper.

L.

P.S. in case yoo wonder sd?1 is the server diagnostic partition

-- 
Luca Berra -- bluca@comedia.it
	Service Delivery Manager
	Communication Media & Services S.r.l.
	Via A. Modigliani 1 - MILANO
