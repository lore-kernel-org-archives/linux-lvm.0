Return-Path: <carenas@chasqui.lared.net.pe>
Date: Thu, 3 May 2001 06:41:39 -0500 (PET)
From: Carlo Marcelo Arenas Belon <carenas@chasqui.lared.net.pe>
Subject: Re: [linux-lvm] LVM Questions
In-Reply-To: <20010503004851.897.qmail@web10803.mail.yahoo.com>
Message-ID: <Pine.LNX.4.33.0105030540170.21066-100000@chasqui.LaRed.net.pe>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

<SNIP>
> First, does LVM do RAID or do I need to employ the md
> driver to accomplish this? It seems to me (as a
> sysadmin) that LVM is great for adding space when
> needed, but having RAID capabilities in conjunction
> with this would be required to produce a highly
> available system.

for sure using RAID1 or RAID5 would make any system a highly available
one, but i am not sure if i understand what your point is on LVM not doing
RAID?

just to clarify me and hopefully all that are getting nervous with that
aseveration

you can make pseudo LINEAR or RAID0 arrays using LVM pvcreating all the
needed disks and making a VG over them.

when more space is needed on any LV all what is needed is to :

1) pvcreate the new disk/partition
2) vgextend the VG where you are short on space over the new PV
3) lvextend the LV inside the VG where you need the space
4) extend the filesystem that is on the extended LV

so, if you have (as i just happened to have)

[root@sajino /root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hda9" of VG "vga" [10.08 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdb"  of VG "vga" [27.96 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdc"  of VG "vga" [19.01 GB / 5.67 GB free]
pvscan -- total: 3 [57.05 GB] / in use: 3 [57.05 GB] / in no VG: 0 [0]

[root@sajino /root]# lvscan
lvscan -- ACTIVE            "/dev/vga/vga1" [5 GB]
lvscan -- ACTIVE            "/dev/vga/vga2" [1 GB]
lvscan -- ACTIVE            "/dev/vga/vga3" [1 GB]
lvscan -- ACTIVE            "/dev/vga/vga4" [256 MB]
lvscan -- ACTIVE            "/dev/vga/vga5" [44 GB]
lvscan -- ACTIVE            "/dev/vga/vga6" [128 MB]
lvscan -- 6 logical volumes with 51.38 GB total in 1 volume group
lvscan -- 6 active logical volumes

and just on VG that is named vga.

and i need more space on vga5 (ext2) all what is needed (adding a new disk
as hdd with 30G)

  pvcreate /dev/hdd
  vgextend /dev/vga /dev/hdd
  umount /dev/vga/vga5
  e2fsadm -L+30G /dev/vga/vga5
  mount /dev/vga/vga5

or am i missing something?

> What ext2 resize utility is the ideal choice for LVM
> to use. parted seems to be quite functional, but
> having to down the machine to single is a but
> annoying. Has anyone successfully used the ext2online
> utility on RedHat? It seems as though the version of
> e2fsprogs that includes this code is part of RH 7.1
> anyways. At least from what I can tell. The online
> resizing would definitely be required for a highly
> available system as well.

on my RH7.1 server it works.

[root@sajino /root]# rpm -q e2fsprogs
e2fsprogs-1.19-4

and if using ext2 you can use (over not mounted filesystems)

[root@sajino /root]# which resize2fs
/sbin/resize2fs

<SNIP>
> The howto mentions to add a couple of commands to the
> RH start script, but a scan of them reveals that RH
> 7.1 already has them. If they are correct, perhaps the
> howto needs to reflect this. Does anyone know if they
> are correct?

well, i didn't change those lines on /etc/rc.d/rc.sysinit and my system is
doing well.

what is recommended is this patch on /etc/rc.d/init.d/halt to add the
vgscan -n call, but is not really needed AFAIK

--- initscripts-5.83/rc.d/init.d/halt.lvm	Wed Feb 28 17:18:49 2001
+++ initscripts-5.83/rc.d/init.d/halt	Thu May  3 06:49:29 2001
@@ -163,6 +163,9 @@

 [ -f /proc/bus/usb/devices ] && umount /proc/bus/usb

+# LVM shutdown
++[ -e /proc/lvm -a -x /sbin/vgchange -a -f /etc/lvmtab ] && /sbin/vgchange -a n
+
 # Remount read only anything that's left mounted.
 #echo $"Remounting remaining filesystems (if any) readonly"
 mount | awk '/ext2/ { print $3 }' | while read line; do


regards,

Carlo
