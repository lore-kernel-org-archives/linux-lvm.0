Message-ID: <000c01bee05a$f0bd2a40$020201c0@gecko>
From: "Martin Gansser" <m.gansser@ostalb.netsurf.de>
Subject: [linux-lvm] pvcreate -- ERROR -399 getting size of physical volume "/dev/sdc1"
Date: Sat, 7 Aug 1999 00:27:54 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi,

i wont to create a stripped Volume consists of 2 x 4 GB Harddisk (sdc1 and
sdd1).
installed SW is: DLD Kernel 2.2.10 with LVM Version 0.7
after i have changed the partition id, the problems starts
i hope the following outputs can help to solve the problem:

gecko:[/root] #lsmod
Module                  Size  Used by
loop                    7244   0  (autoclean)
lvm                    26924   0
bttv                   33976   0  (unused)
tuner                   1872   1
i2c                     3160   2  [bttv tuner]
videodev                2264   2  [bttv]
emu10k1                57924   0
soundcore               2100   5  [emu10k1]
nls_iso8859-1           2024   1  (autoclean)
nls_cp437               3548   1  (autoclean)
vfat                   11100   1  (autoclean)
fat                    23912   1  (autoclean) [vfat]


gecko:[/root] #fdisk -l

Disk /dev/sda: 255 heads, 63 sectors, 555 cylinders
Units = cylinders of 16065 * 512 bytes

   Device Boot   Start      End   Blocks   Id  System
/dev/sda1            1       33   265041   82  Linux swap
/dev/sda2           34      555  4192965   83  Linux native

Disk /dev/sdb: 255 heads, 63 sectors, 527 cylinders
Units = cylinders of 16065 * 512 bytes

   Device Boot   Start      End   Blocks   Id  System
/dev/sdb1   *        1      261  2096451    6  DOS 16-bit >=32M
/dev/sdb2          262      527  2136645    5  Extended
/dev/sdb5          262      527  2136613+   7  OS/2 HPFS

Disk /dev/sdc: 255 heads, 63 sectors, 555 cylinders
Units = cylinders of 16065 * 512 bytes

   Device Boot   Start      End   Blocks   Id  System
/dev/sdc1            1      555  4458006   fe  Unknown

Disk /dev/sdd: 255 heads, 63 sectors, 555 cylinders
Units = cylinders of 16065 * 512 bytes

   Device Boot   Start      End   Blocks   Id  System
/dev/sdd1            1      555  4458006   fe  Unknown


gecko:[/root] #pvcreate -d /dev/sd[cd]1
lvm_get_iop_version -- CALLED
lvm_get_iop_version -- AFTER ioctl ret: 0
lvm_get_iop_version -- LEAVING with ret: 0
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/sdc1"
pv_check_name -- LEAVING with ret: 0
pv_get_size -- CALLED with /dev/sdc1 and BFFFF38C
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/sdc1"
pv_check_name -- LEAVING with ret: 0
pv_check_part -- CALLED with /dev/sdc1
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/sdc1"
pv_check_name -- LEAVING with ret: 0
pv_check_part -- LEAVING with 1
lvm_dir_cache -- CALLED
lvm_dir_cache -- calling scandir() with /dev/ide/hd
lvm_dir_cache -- AFTER calling scandir() with /dev/ide/hd
lvm_dir_cache -- calling scandir() with /dev/loop
lvm_dir_cache -- AFTER calling scandir() with /dev/loop
lvm_dir_cache -- calling scandir() with /dev/md
lvm_dir_cache -- AFTER calling scandir() with /dev/md
lvm_dir_cache -- calling scandir() with /dev/rd
lvm_dir_cache -- AFTER calling scandir() with /dev/rd
lvm_dir_cache -- calling scandir() with /dev/sd
lvm_dir_cache -- AFTER calling scandir() with /dev/sd
lvm_dir_cache -- calling scandir() with /dev
lvm_dir_cache -- AFTER calling scandir() with /dev
lvm_dir_cache -- LEAVING with cache_size: 315
pv_get_size -- LEAVING with ret: -399
pvcreate -- ERROR -399 getting size of physical volume "/dev/sdc1"

Thanks

Martin Gansser m.gansser@ostalb.netsurf.de
----------------------------------------------------
