Return-Path: <Ron.Vissers@qtiworld.com>
Message-ID: <139803A793E0D311AFF60050DA2BC54003021094@qtiexch1.qgraph.com>
From: "Vissers, Ron" <Ron.Vissers@qtiworld.com>
Date: Sat, 7 Apr 2001 15:43:42 -0500 
MIME-Version: 1.0
Subject: [linux-lvm] debian 2.4.2 / LVM .91beta6 / pvcreate device doesn't exist ???
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

(debian:root) /root #
(debian:root) /root #
(debian:root) /root # pvscan -v
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ERROR "pv_read_all_pv(): lvm_dir_cache" reading physical volumes
 
(debian:root) /root # lvscan -v
lvscan -- no volume groups found
 
(debian:root) /root # vgscan -v
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- no volume groups found
 
(debian:root) /root # lvm -v
su: lvm: command not found
(debian:root) /root # /etc/init.d/lvm stop
vgchange -- no volume groups found
 Hi,

I'm having a lot of trouble trying to get LVM to pvcreate my 2nd ide disk.
LVM is not on my first IDE disk yet either, but I'll worry about that later.
pvcreate /dev/hdc1 doesn't seem to work.  I've dug through the archives here
and tried a couple of other things as well.  The fdisk and other entries are
below. 

Can someone offer a little direction?
Thanks,
Ron
 

---

Disk /dev/hdc1: 255 heads, 63 sectors, 1826 cylinders
Units = cylinders of 16065 * 512 bytes
 
     Device Boot    Start       End    Blocks   Id  System
/dev/hdc1p1             1      1826  14667313+  8e  Unknown

-----

(debian:root) /root # /etc/init.d/lvm start
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group
 
vgchange -- no volume groups found
 
(debian:root) /root # pvcreate /dev/hdc1
pvcreate -- device "/dev/hdc1" doesn't exist
 
(debian:root) /root # pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ERROR "pv_read_all_pv(): lvm_dir_cache" reading physical volumes
 
(debian:root) /root # pvcreate /dev/ide/host0/bus1/target0/lun0/part1
pvcreate -- invalid physical volume name
"/dev/ide/host0/bus1/target0/lun0/part1"
(debian:root) /root # lvmdiskscan
lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- no disks / partitions found
 
(debian:root) /root # ls /proc/partitions
/proc/partitions
(debian:root) /root # cat /proc/partitions
major minor  #blocks  name
 
   3     0   20066251 ide/host0/bus0/target0/lun0/disc
   3     1      48163 ide/host0/bus0/target0/lun0/part1
   3     2   19920600 ide/host0/bus0/target0/lun0/part2
   3     3      96390 ide/host0/bus0/target0/lun0/part3
  22     0   14668416 ide/host0/bus1/target0/lun0/disc
  22     1   14667313 ide/host0/bus1/target0/lun0/part1
(debian:root) /root # pvcreate /dev/ide/host0/bus1/target0/lun0/part1
pvcreate -- invalid physical volume name
"/dev/ide/host0/bus1/target0/lun0/part1"
(debian:root) /root #


------------------------------------------------------------------------

This message has been scanned for viruses with Trend Micro's Interscan VirusWall.
