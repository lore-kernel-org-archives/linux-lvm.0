Message-ID: <1041074125.3e0d87cdaaece@ogd.nl>
From: Patrick van den Berg <P.van.den.Berg@ogd.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Problems mounting LVM root volume
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
Date: Sat Dec 28 05:15:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello everybody, 

I'm new at using LVM and I ran into trouble using it. I've got problems 
mounting an LVM volume as root on my system running Gentoo Linux 1.4. My 
configuration is as follows (skip to the bottom of the text for the actual 
error message): 

Gigabyte mainboard with onboard Promise RAID. I've got 2 80GB discs attached 
(same model) and configured as RAID1. I installed via the Gentoo RC1 Stage 1 
CDROM. During boot of the CD I had to abort and add the "IDE0=0x9400,0x9802 
IDE2=0x9c00,0xa002" parameters to be able to load the pdcraid module. 

My fstab looks as follows: 
 
/dev/ataraid/disc0/part1  /boot       ext3      noauto,noatime  1  1 
/dev/vg3/rootlv           /           reiserfs  noatime         0  0 
/dev/ataraid/disc0/part2  none        swap      sw              0  0 
/dev/cdroms/cdrom0        /mnt/cdrom  iso9660   noauto,ro       0  0 
proc                      /proc       proc      defaults        0  0 
tmpfs                     /dev/shm    tmpfs     defaults        0  0 

I also compiled my kernel using the gentoo-sources, and with the following 
options enabled: 

- LVM support 
- Built-in RAM disk support with initrd 
- DEV fs support 
- mount DEV filesystem at boot
- ReiserFS support 

I also ran lvmcreate_initrd with the -M option, because everything is compiled 
in the kernel. Also, when I run lvmceate_initrd without the -M options, it 
returns errors and the lvm image is not created. 

My grub,conf (linked to menu.lst) looks as follows: 
 
default 0 
timeout 30 
splashimage=(hd0,0)/boot/grub/splash.xpm.gz 

title=Gentoo 1.4 GNU/Linux on Antigone 
root (hd0,0) 
kernel /boot/bzImage root=/dev/vg3/rootlv ide0=0x9400,0x9802 ide2=0x9c00,0xa002 
initrd /boot/initrd-lvm.gz 


When I boot the system grub starts correctly, but when grub wants to boot my 
system the following messages appear: 

Code: 
RAMDISK: Compressed image found at block 0 
Freeing initrd memory: 994k freed. 
VFS: Mounted root (ext2 filesystem). 
Mounted devfs on /dev 
vgscan -- found inactive volume group "vg3" 
vgscan -- ERROR 28 writing volumegroup backup file /etc/lvmtab.d/vg3.tmp in 
vg_cfgbackup.c [line273] 
vgscan -- ERROR: "lvm_tab_vg_remove(): unlink" removing volume group "vg3" 
from "/etc/lvmtab.d" 
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" succesfully created 
vgscan -- WARNING: This program does not do a VGDA backup of your volume group 

vgchange -- no volume groups found 

VFS: Cannot open root device "vg3/rootlv" or 00:00 
Please append a correct "root=" boot option 
Kernel panic: VFS: Unable to mount rootfs on 00:00 


Now, the strange thing is, when I boot via the CD and do vgscan and
vgchange -ay by hand, I can mount /dev/vg3/rootlv normally! 

Does anybody got any ideas? I've run out of them  

Thanks for any help in advance. When you need any more info, just say so. 

Regards, 
Patrick
