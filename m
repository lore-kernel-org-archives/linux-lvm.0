Message-ID: <376E4C78.341E42B6@mainz.ibm.de>
Date: Mon, 21 Jun 1999 16:30:16 +0200
From: Udo Weber <udo.weber@mainz.ibm.de>
MIME-Version: 1.0
Subject: [linux-lvm] pvcreate once more
Content-Type: multipart/mixed;
 boundary="------------3075473DDB8F6A5AD5D7BAB1"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com

This is a multi-part message in MIME format.
--------------3075473DDB8F6A5AD5D7BAB1
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,
sorry for the last mail, I don't know why but something was left of this
mail.
Here now (I hope so) the complete mail once more and for insurence also
the same as
attachment:
******************************************************************
Hi LVM-specialists,

I'm new here the Linux-LVM-array. This means I was downloading all
needed software+patches, compiled successfull and also installed without

erors on my IBM-Thinkpad (300 MHz PII, 128 MB RAM, 8GByte HD).
I have all my LINUX-stuff on several extended partitions.

Now at first some generally questions (I don't  found an answer for this

in the docu):
Is it possible to create a PV on a extended partion or do I need only
primary partions ?
I think pvcreate writes something at the top of the physical volume (
whole PV or partion).
Do that works well with other OS-formated parts of the same hdisk ?

If the first question is no, forget the rest of this mail!
If it should works please help. Here are all infos related to my
problem:

################################################################

Welcome to SuSE Linux 6.1 (i386) - Kernel 2.2.10 (tty4).

mumpel:~ # vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: you may not have an actual backup of your volume
group

mumpel:~ # vgchange -a y
vgchange -- no volume groups found

mumpel:~ # cat /proc/lvm
LVM module version 0.6  (26/02/1999)

Total:  0 VGs  0 PVs  0 LVs (0 LVs open)
Global: 139 bytes vmalloced   IOP version: 4   0:21:47 active

mumpel:~ # fdisk -l

Disk /dev/hda: 240 heads, 63 sectors, 1058 cylinders
Units = cylinders of 15120 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hda1   *         1       271   2048728+   b  Win95 FAT32
/dev/hda2           272      1057   5942160    f  Win95 Extended (LBA)
/dev/hda5           272       548   2094088+   6  DOS 16-bit >=32M
/dev/hda6           549       687   1050808+   6  DOS 16-bit >=32M
/dev/hda7           688       705    136048   82  Linux swap
/dev/hda8           706       841   1028128   83  Linux native
/dev/hda9           842       977   1028128+  83  Linux native
/dev/hda10          978      1057    604768   fe  Unknown

mumpel:~ # pvcreate /dev/hda10
pvcreate -- extended partition "/dev/hda10" doesn't exist

mumpel:~ # uname -a
Linux mumpel 2.2.10 #1 Sun Jun 20 02:03:14 MEST 1999 i686 unknown

mumpel:~ # lsmod
Module                  Size  Used by
lvm                    29472   0  (autoclean)
sd_mod                 15856   0  (autoclean) (unused)
dummy0                   684   1  (autoclean)
nls_iso8859-1           2020   3  (autoclean)
nls_cp437               3548   3  (autoclean)
vfat                   11292   3  (autoclean)
fat                    25600   3  (autoclean) [vfat]

mumpel:~ # ls -l /dev/hda* /dev/lvm
brw-rw----   1 root     disk       3,   0 May  1 00:50 /dev/hda
brw-rw----   1 root     disk       3,   1 May  1 00:50 /dev/hda1
brw-rw----   1 root     disk       3,  10 May  1 00:50 /dev/hda10
brw-rw----   1 root     disk       3,  11 May  1 00:50 /dev/hda11
brw-rw----   1 root     disk       3,  12 May  1 00:50 /dev/hda12
brw-rw----   1 root     disk       3,  13 May  1 00:50 /dev/hda13
brw-rw----   1 root     disk       3,  14 May  1 00:50 /dev/hda14
brw-rw----   1 root     disk       3,  15 May  1 00:50 /dev/hda15
brw-rw----   1 root     disk       3,   2 May  1 00:50 /dev/hda2
brw-rw----   1 root     disk       3,   3 May  1 00:50 /dev/hda3
brw-rw----   1 root     disk       3,   4 May  1 00:50 /dev/hda4
brw-rw----   1 root     disk       3,   5 May  1 00:50 /dev/hda5
brw-rw----   1 root     disk       3,   6 May  1 00:50 /dev/hda6
brw-rw----   1 root     disk       3,   7 May  1 00:50 /dev/hda7
brw-rw----   1 root     disk       3,   8 May  1 00:50 /dev/hda8
brw-rw----   1 root     disk       3,   9 May  1 00:50 /dev/hda9
crw-r-----   1 root     root     109,   0 Jun 20 02:47 /dev/lvm

mumpel:~ # mount
/dev/hda9 on / type ext2 (rw)
proc on /proc type proc (rw)
/dev/hda1 on /C type vfat (rw)
/dev/hda5 on /D type vfat (rw)
/dev/hda6 on /E type vfat (rw)
/dev/hda8 on /REDHAT type ext2 (rw)
none on /dev/pts type devpts (rw)

and here now the debug-info from pvcreate:
mumpel:~ # pvcreate -d /dev/hda10
lvm_iop_version -- CALLED
lv_status_internal -- AFTER ioctl ret: 0
lvm_iop_version -- LEAVING with ret: 0
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hda10"
pv_check_name -- LEAVING with ret: 0
pv_get_size -- CALLED with /dev/hda10 and BFFFF70C
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hda10"
pv_check_name -- LEAVING with ret: 0
pv_check_part -- CALLED with /dev/hda10
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hda10"
pv_check_name -- LEAVING with ret: 0
pv_check_part -- LEAVING with 10
pv_get_size -- BEFORE llseek 0:0
pv_get_size -- part[0].sys_ind: B  part[0].nr_sects: 4097457
pv_get_size -- first == 1
pv_get_size -- part[1].sys_ind: F  part[1].nr_sects: 11884320
pv_get_size -- first == 1
pv_get_size -- part[2].sys_ind: 0  part[2].nr_sects: 0
pv_get_size -- first == 1
pv_get_size -- part[3].sys_ind: 0  part[3].nr_sects: 0
pv_get_size -- first == 1
pv_get_size -- LEAVING with ret: -242
pvcreate -- extended partition "/dev/hda10" doesn't exist

The same on RedHat 6.0 - same config.
only one different output:
[root@mumpel 0.6]# fdisk -l
Disk /dev/hda: 240 heads, 63 sectors, 1058 cylinders
Units = cylinders of 15120 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hda1   *         1       271   2048728+   b  Win95 FAT32
/dev/hda2           272      1057   5942160    f  Win95 Ext'd (LBA)
/dev/hda5           272       548   2094088+   6  FAT16
/dev/hda6           549       687   1050808+   6  FAT16
/dev/hda7           688       705    136048   82  Linux swap
/dev/hda8           706       841   1028128   83  Linux
/dev/hda9           842       977   1028128+  83  Linux
/dev/hda10          978      1057    604768   fe  LANstep

##########################################################################

What was going wrong here ?
What should I do ?

I'd like to use the LVM for testing. I'm primary working in the
AIX-support-center.
My special field there are LVM-problems :)


Thanks with warm regards,
Udo Weber
***************************************************************************

Maybe I put a dot (".") too much between the lines in the last email :)

But the prob should be the same, I read the answers from Heinz, now I
think here is realy
a problem.

Thanks,
Udo


--------------3075473DDB8F6A5AD5D7BAB1
Content-Type: text/plain; charset=us-ascii;
 name="Lvm.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="Lvm.txt"

Welcome to SuSE Linux 6.1 (i386) - Kernel 2.2.10 (tty4).
--------------3075473DDB8F6A5AD5D7BAB1--
