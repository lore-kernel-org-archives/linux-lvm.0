Message-ID: <OF05414B2E.B23B3CDB-ON86256B12.007DCDB5@TEXASMUTUAL.COM>
From: "Jonathan S. Polacheck" <JPolache@texasmutual.com>
MIME-Version: 1.0
Subject: [linux-lvm] df and lvscan show differnet sizes
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
Date: Thu Nov 29 08:26:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I am running Mandrake 8.1 w/devfs. df shows the original size of
/dev/vol_usr and /dev/vol_var.  lvscan shows sizes after lvextend.  I have
rebooted.

[root@netman root]# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/hda3               297221     35709    246166  13% /
/dev/hda1                19487      1776     16705  10% /boot
/dev/vg1/vol_usr        178488    166454      2818  99% /usr
/dev/vg1/vol_var         23797     22734         0 100% /var
/dev/vg1/vol_home         3963        20      3739   1% /home
none                     47240         0     47240   0% /dev/shm
/dev/hdc                663744    663744         0 100% /mnt/cdrom


[root@netman root]# lvscan
lvscan -- ACTIVE            "/dev/vg1/vol_usr" [252.00 MB]
lvscan -- ACTIVE            "/dev/vg1/vol_var" [104.00 MB]
lvscan -- ACTIVE            "/dev/vg1/vol_home" [4.00 MB]
lvscan -- 3 logical volumes with 360.00 MB total in 1 volume group
lvscan -- 3 active logical volumes

[root@netman root]# cat /proc/version
Linux version 2.4.8-26mdk (quintela@bi.mandrakesoft.com) (gcc version 2.96
20001

[root@netman root]# rpm -q lvm
lvm-1.0.1.rc4-1

[root@netman root]# lvmdiskscan
lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- /dev/ide/host0/bus0/target0/lun0/part1 [      19.66 MB]
Primary ]
lvmdiskscan -- /dev/ide/host0/bus0/target0/lun0/part2 [     191.95 MB]
Primary ]
lvmdiskscan -- /dev/ide/host0/bus0/target0/lun0/part3 [     299.74 MB]
Primary ]
lvmdiskscan -- /dev/ide/host0/bus0/target0/lun0/part4 [     711.21 MB]
Primary ]
lvmdiskscan -- /dev/ide/host0/bus0/target1/lun0/part1 [       1.19 GB]
Primary ]
lvmdiskscan -- /dev/hdc                               [     648.19 MB] free
whok
lvmdiskscan -- 3 disks
lvmdiskscan -- 1 whole disk
lvmdiskscan -- 0 loop devices
lvmdiskscan -- 0 multiple devices
lvmdiskscan -- 0 network block devices
lvmdiskscan -- 5 partitions
lvmdiskscan -- 2 LVM physical volume partitions


[root@netman root]# cat /proc/partitions
major minor  #blocks  name     rio rmerge rsect ruse wio wmerge wsect wuse
runnq

  58     0     258048 lvma 0 0 0 0 0 0 0 0 0 0 0
  58     1     106496 lvmb 0 0 0 0 0 0 0 0 0 0 0
  58     2       4096 lvmc 0 0 0 0 0 0 0 0 0 0 0
   3     0    1251936 ide/host0/bus0/target0/lun0/disc 5961 42389 96726
100220 0
   3     1      20128 ide/host0/bus0/target0/lun0/part1 30 420 900 710 13 4
34 0
   3     2     196560 ide/host0/bus0/target0/lun0/part2 4 0 32 30 0 0 0 0 0
30 0
   3     3     306936 ide/host0/bus0/target0/lun0/part3 1612 9711 22648
23200 20
   3     4     728280 ide/host0/bus0/target0/lun0/part4 4305 32258 73126
76100 0
   3    64    1251936 ide/host0/bus0/target1/lun0/disc 15 3 36 140 0 0 0 0
0 140
   3    65    1251904 ide/host0/bus0/target1/lun0/part1 7 3 20 50 0 0 0 0 0
50 0
  22     0     663748 hdc 0 0 0 0 0 0 0 0 0 0 0
