Return-Path: <dave@galilean.d2g.com>
Date: Fri, 23 Mar 2001 22:55:59 +0100
From: Dave Wapstra <dave@xs4all.nl>
Message-ID: <20010323225559.A20479@mercury.mercury.multiweb.nl>
Mime-Version: 1.0
Subject: [linux-lvm] LVM corruption with ext2resize on Ultrasparc
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
To: linux-lvm@sistina.com

Hi all,

I recently tried to use ext2resize on my extended LV to resize the
filesystem.  I found out that ext2resize does not yet support big-endian.
However by even trying to use it, I messed up the volume group info on
my PV's.

Here's what I did:

Created logical volume, made ext2 filesytem, extended logical volume)

[/root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sdb" of VG "ftp" [8.43 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sdc" of VG "ftp" [8.43 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sdd" of VG "ftp" [8.43 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sde" of VG "ftp" [8.43 GB / 72 MB free]
pvscan -- total: 4 [33.74 GB] / in use: 4 [33.74 GB] / in no VG: 0 [0]

[/root]# ext2resize /dev/ftp/lvol1 33g
ext2resize v1.1.15 - 2000/08/08 for EXT2FS 0.5b
ext2resize: ext2_open: invalid superblock
ext2resize: can't open /dev/ftp/lvol1
[/root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sdb"   is associated to an unknown VG (run vgscan)
pvscan -- ACTIVE   PV "/dev/sdc"   is associated to an unknown VG (run vgscan)
pvscan -- ACTIVE   PV "/dev/sdd"   is associated to an unknown VG (run vgscan)
pvscan -- ACTIVE   PV "/dev/sde"   is associated to an unknown VG (run vgscan)
pvscan -- total: 4 [33.74 GB] / in use: 4 [33.74 GB] / in no VG: 0 [0]

Note: this output is edited, but does show the problem.  After this, I get

vgcreate -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run vgscan

and have to do dd if=/dev/zero of=/dev/sd<x> to clear all the tables
and do a reboot to clean up the VGDA in the kernel


Any pointers as to where to start to debug this problem are welcome.

-Dave

-- 
Dave Wapstra
dave@xs4all.nl
