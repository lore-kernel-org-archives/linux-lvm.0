From: galt <galt@fiberpimp.net>
Message-ID: <20020924050649.W76212-100000@true.fiberpimp.net>
MIME-Version: 1.0
Subject: [linux-lvm] raid1+lvm
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
Date: Tue Sep 24 04:25:33 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I got it working, thanks to all, especially to Luca. After verifying
that my lilo configuration was sane, I tried making the initrd on another
host. I was able to boot just fine.  I was trying to do everything from
the slackware 8.1 install cd, but the lvmcreate_initrd script doesnt want
to work properly in that environment.

Heres the setup:

# lilo -V
LILO version 22.2

# cat /etc/lilo.conf
lba32
boot = /dev/sda
delay = 50
vga = ext

image = /boot/vmlinuz
root = /dev/rootvg/root
initrd = /boot/initrd-lvm-2.4.18-heh3.gz
label = linux1
read-only

# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/rootvg/root       2097084    719204   1377880  35% /
/dev/rootvg/var        6254396     40824   6213572   1% /var

# swapon -s
Filename                        Type            Size    Used    Priority
/dev/rootvg/swap                partition       524280  0       -1

# cat /proc/lvm/global
LVM driver LVM version 1.0.1-rc4(ish)(03/10/2001)

# fdisk -l

Disk /dev/sda: 255 heads, 63 sectors, 1106 cylinders
Units = cylinders of 16065 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/sda1             1      1106   8883913+  fd  Linux raid autodetect

Disk /dev/sdb: 255 heads, 63 sectors, 1106 cylinders
Units = cylinders of 16065 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/sdb1             1      1106   8883913+  fd  Linux raid autodetect

# cat /etc/raidtab
raiddev /dev/md0
        raid-level 1
        nr-raid-disks 2
        nr-spare-disks 0
        device /dev/sda1
        raid-disk 0
        device /dev/sdb1
        raid-disk 1
#

LVM rules.

galt
