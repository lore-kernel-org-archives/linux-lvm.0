Date: Thu, 6 Jul 2000 22:21:44 -0400 (EDT)
From: Krzysztof Adamski <k@adamski.org>
Reply-To: Krzysztof Adamski <k@adamski.org>
Subject: [linux-lvm] Segmentation fault in lvextend
Message-ID: <Pine.LNX.3.96.1000706201849.11229C-100000@pc.netxsys.com>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

I have been playing with lvm and I got a seg fault, here the sequence of
commands that generated this, and at the end I have included some gdb
output with the line that has caused the seg fault:

radon:~# cat /proc/lvm 
LVM driver version 0.8final  (15/02/2000)

Total:  1 VG  4 PVs  2 LVs (0 LVs open)
Global: 21729 bytes malloced   IOP version: 6   2 days 13:52:02 active

VG:  test_vg  [4 PV, 2 LV/0 open]  PE Size: 4096 KB
  Usage [KB/PE]: 4096000 /1000 total  4096000 /1000 used  0 /0 free
  PVs: [AA] sdb1                   1024000 /250      1024000 /250 0 /0     
       [AA] sdc1                   1024000 /250      1024000 /250 0 /0     
       [AA] sdd1                   1024000 /250      1024000 /250 0 /0     
       [AA] sde1                   1024000 /250      1024000 /250 0 /0     
    LVs: [AWDL  ] my_test_lv                 3072000 /750      close
         [AWDL  ] my_test_lv_2               1024000 /250      close
radon:~# lvdisplay 
lvdisplay -- please enter a logical volume path

radon:~# lvdisplay my_test_lv
lvdisplay -- logical volume "my_test_lv" doesn't exist


radon:~# lvdisplay /dev/test_vg/my_test_lv
--- Logical volume ---
LV Name               /dev/test_vg/my_test_lv
VG Name               test_vg
LV Write Access       read/write
LV Status             available
LV #                  1
# open                0
LV Size               2.93 GB
Current LE            750
Allocated LE          750
Allocation            next free
Read ahead sectors    120
Block device          58:0


radon:~# lvremove 
lvremove -- please enter a logical volume path

radon:~# lvremove /dev/test_vg/my_test_lv
lvremove -- do you really want to remove "/dev/test_vg/my_test_lv"? [y/n]:
y
lvremove -- doing automatic backup of volume group "test_vg"
lvremove -- logical volume "/dev/test_vg/my_test_lv" successfully removed

radon:~# cat /proc/lvm 
LVM driver version 0.8final  (15/02/2000)

Total:  1 VG  4 PVs  1 LV (0 LVs open)
Global: 9257 bytes malloced   IOP version: 6   2 days 13:53:12 active

VG:  test_vg  [4 PV, 1 LV/0 open]  PE Size: 4096 KB
  Usage [KB/PE]: 4096000 /1000 total  1024000 /250 used  3072000 /750 free
  PVs: [AA] sdb1                   1024000 /250       307200 /75 716800 /175   
       [AA] sdc1                   1024000 /250            0 /0 1024000 /250   
       [AA] sdd1                   1024000 /250            0 /0 1024000 /250   
       [AA] sde1                   1024000 /250       716800 /175 307200 /75    
    LV:  [AWDL  ] my_test_lv_2               1024000 /250      close
radon:~# lvcreate 
lvcreate -- please enter either option -l or -L

radon:~# lvcreate -L 3072000
lvcreate -- please enter a volume group name

radon:~# lvcreate -L 3072000 /dev/test_vg/ -n my_test_lv -i 3
lvcreate -- no valid volume group name "test_vg/"

radon:~# lvcreate -L 3072000 -n my_test_lv -i 3 test_vg
lvcreate -- INFO: using default stripe size 16 KB
lvcreate -- ERROR "parameter error" creating "my_test_lv" in "test_vg"

radon:~# cat /proc/lvm 
LVM driver version 0.8final  (15/02/2000)

Total:  1 VG  4 PVs  1 LV (0 LVs open)
Global: 9257 bytes malloced   IOP version: 6   2 days 13:54:53 active

VG:  test_vg  [4 PV, 1 LV/0 open]  PE Size: 4096 KB
  Usage [KB/PE]: 4096000 /1000 total  1024000 /250 used  3072000 /750 free
  PVs: [AA] sdb1                   1024000 /250       307200 /75 716800 /175   
       [AA] sdc1                   1024000 /250            0 /0 1024000 /250   
       [AA] sdd1                   1024000 /250            0 /0 1024000 /250   
       [AA] sde1                   1024000 /250       716800 /175 307200 /75    
    LV:  [AWDL  ] my_test_lv_2               1024000 /250      close
radon:~# lvcreate -L 750 -n my_test_lv -i 3 test_vg
lvcreate -- INFO: using default stripe size 16 KB
lvcreate -- rounding up size to physical extent boundary "752 MB"
lvcreate -- rounding 770048 KB to stripe boundary size 774144 KB / 189 PE
lvcreate -- doing automatic backup of "test_vg"
lvcreate -- logical volume "/dev/test_vg/my_test_lv" successfully created
radon:~# cat /proc/version 
Linux version 2.4.0-test2 (root@radon) (gcc version 2.95.2 20000220
(Debian GNU/Linux)) #2 Mon Jul 3 23:49:59 EDT 2000
radon:~# cat /proc/lvm     
LVM driver version 0.8final  (15/02/2000)

Total:  1 VG  4 PVs  2 LVs (0 LVs open)
Global: 12760 bytes malloced   IOP version: 6   2 days 13:55:30 active

VG:  test_vg  [4 PV, 2 LV/0 open]  PE Size: 4096 KB
  Usage [KB/PE]: 4096000 /1000 total  1798144 /439 used  2297856 /561 free
  PVs: [AA] sdb1                   1024000 /250       565248 /138 458752 /112   
       [AA] sdc1                   1024000 /250       258048 /63 765952 /187   
       [AA] sdd1                   1024000 /250       258048 /63 765952 /187   
       [AA] sde1                   1024000 /250       716800 /175 307200 /75    
    LVs: [AWDS3 ] my_test_lv                  774144 /189      close
         [AWDL  ] my_test_lv_2               1024000 /250      close
radon:~# lvremove /dev/test_vg/my_test_lv
lvremove -- do you really want to remove "/dev/test_vg/my_test_lv"? [y/n]: y
lvremove -- doing automatic backup of volume group "test_vg"
lvremove -- logical volume "/dev/test_vg/my_test_lv" successfully removed

radon:~# lvcreate -L 1500 -n my_test_lv -i 3 test_vg
lvcreate -- INFO: using default stripe size 16 KB
lvcreate -- doing automatic backup of "test_vg"
lvcreate -- logical volume "/dev/test_vg/my_test_lv" successfully created

radon:~# cat /proc/lvm 
LVM driver version 0.8final  (15/02/2000)

Total:  1 VG  4 PVs  2 LVs (0 LVs open)
Global: 15736 bytes malloced   IOP version: 6   2 days 13:56:08 active

VG:  test_vg  [4 PV, 2 LV/0 open]  PE Size: 4096 KB
  Usage [KB/PE]: 4096000 /1000 total  2560000 /625 used  1536000 /375 free
  PVs: [AA] sdb1                   1024000 /250       819200 /200 204800 /50    
       [AA] sdc1                   1024000 /250       512000 /125 512000 /125   
       [AA] sdd1                   1024000 /250       512000 /125 512000 /125   
       [AA] sde1                   1024000 /250       716800 /175 307200 /75    
    LVs: [AWDS3 ] my_test_lv                 1536000 /375      close
         [AWDL  ] my_test_lv_2               1024000 /250      close
radon:~# lvremove /dev/test_vg/my_test_lv
lvremove -- do you really want to remove "/dev/test_vg/my_test_lv"? [y/n]:y
lvremove -- doing automatic backup of volume group "test_vg"
lvremove -- logical volume "/dev/test_vg/my_test_lv" successfully removed

radon:~# lvcreate -L 3500 -n my_test_lv -i 3 test_vg
lvcreate -- INFO: using default stripe size 16 KB
lvcreate -- rounding 3584000 KB to stripe boundary size 3588096 KB / 876 PE
lvcreate -- only 750 free physical extents in volume group "test_vg"

radon:~# cat /proc/lvm 
LVM driver version 0.8final  (15/02/2000)

Total:  1 VG  4 PVs  1 LV (0 LVs open)
Global: 9257 bytes malloced   IOP version: 6   2 days 13:56:38 active

VG:  test_vg  [4 PV, 1 LV/0 open]  PE Size: 4096 KB
  Usage [KB/PE]: 4096000 /1000 total  1024000 /250 used  3072000 /750 free
  PVs: [AA] sdb1                   1024000 /250       307200 /75 716800 /175   
       [AA] sdc1                   1024000 /250            0 /0 1024000 /250   
       [AA] sdd1                   1024000 /250            0 /0 1024000 /250   
       [AA] sde1                   1024000 /250       716800 /175 307200 /75    
    LV:  [AWDL  ] my_test_lv_2               1024000 /250      close
radon:~# lvcreate -L 3400 -n my_test_lv -i 3 test_vg
lvcreate -- INFO: using default stripe size 16 KB
lvcreate -- rounding 3481600 KB to stripe boundary size 3489792 KB / 852 PE
lvcreate -- only 750 free physical extents in volume group "test_vg"

radon:~# lvcreate -L 3000 -n my_test_lv -i 3 test_vg
lvcreate -- INFO: using default stripe size 16 KB
lvcreate -- not enough allocatable/free physical volume space in "test_vg"
lvcreate -- please check, if physical volumes are allocatable

radon:~# cat /proc/lvm 
LVM driver version 0.8final  (15/02/2000)

Total:  1 VG  4 PVs  1 LV (0 LVs open)
Global: 9257 bytes malloced   IOP version: 6   2 days 13:57:53 active

VG:  test_vg  [4 PV, 1 LV/0 open]  PE Size: 4096 KB
  Usage [KB/PE]: 4096000 /1000 total  1024000 /250 used  3072000 /750 free
  PVs: [AA] sdb1                   1024000 /250       307200 /75 716800 /175   
       [AA] sdc1                   1024000 /250            0 /0 1024000 /250   
       [AA] sdd1                   1024000 /250            0 /0 1024000 /250   
       [AA] sde1                   1024000 /250       716800 /175 307200 /75    
    LV:  [AWDL  ] my_test_lv_2               1024000 /250      close
radon:~# lvcreate -L 2800 -n my_test_lv -i 3 test_vg
lvcreate -- INFO: using default stripe size 16 KB
lvcreate -- rounding 2867200 KB to stripe boundary size 2875392 KB / 702 PE
lvcreate -- not enough allocatable/free physical volume space in "test_vg"
lvcreate -- please check, if physical volumes are allocatable

radon:~# cat /proc/lvm 
LVM driver version 0.8final  (15/02/2000)

Total:  1 VG  4 PVs  1 LV (0 LVs open)
Global: 9257 bytes malloced   IOP version: 6   2 days 13:58:03 active

VG:  test_vg  [4 PV, 1 LV/0 open]  PE Size: 4096 KB
  Usage [KB/PE]: 4096000 /1000 total  1024000 /250 used  3072000 /750 free
  PVs: [AA] sdb1                   1024000 /250       307200 /75 716800 /175   
       [AA] sdc1                   1024000 /250            0 /0 1024000 /250   
       [AA] sdd1                   1024000 /250            0 /0 1024000 /250   
       [AA] sde1                   1024000 /250       716800 /175 307200 /75    
    LV:  [AWDL  ] my_test_lv_2               1024000 /250      close
radon:~# lvcreate -L 2700 -n my_test_lv -i 3 test_vg
lvcreate -- INFO: using default stripe size 16 KB
lvcreate -- not enough allocatable/free physical volume space in "test_vg"
lvcreate -- please check, if physical volumes are allocatable

radon:~# lvcreate -L 2500 -n my_test_lv -i 3 test_vg
lvcreate -- INFO: using default stripe size 16 KB
lvcreate -- rounding 2560000 KB to stripe boundary size 2568192 KB / 627 PE
lvcreate -- not enough allocatable/free physical volume space in "test_vg"
lvcreate -- please check, if physical volumes are allocatable

radon:~# cat /proc/lvm 
LVM driver version 0.8final  (15/02/2000)

Total:  1 VG  4 PVs  1 LV (0 LVs open)
Global: 9257 bytes malloced   IOP version: 6   2 days 13:58:23 active

VG:  test_vg  [4 PV, 1 LV/0 open]  PE Size: 4096 KB
  Usage [KB/PE]: 4096000 /1000 total  1024000 /250 used  3072000 /750 free
  PVs: [AA] sdb1                   1024000 /250       307200 /75 716800 /175   
       [AA] sdc1                   1024000 /250            0 /0 1024000 /250   
       [AA] sdd1                   1024000 /250            0 /0 1024000 /250   
       [AA] sde1                   1024000 /250       716800 /175 307200 /75    
    LV:  [AWDL  ] my_test_lv_2               1024000 /250      close
radon:~# lvcreate -L 2200 -n my_test_lv -i 3 test_vg
lvcreate -- INFO: using default stripe size 16 KB
lvcreate -- rounding 2252800 KB to stripe boundary size 2260992 KB / 552 PE
lvcreate -- not enough allocatable/free physical volume space in "test_vg"
lvcreate -- please check, if physical volumes are allocatable

radon:~# lvcreate -L 2000 -n my_test_lv -i 3 test_vg
lvcreate -- INFO: using default stripe size 16 KB
lvcreate -- rounding 2048000 KB to stripe boundary size 2052096 KB / 501 PE
lvcreate -- doing automatic backup of "test_vg"
lvcreate -- logical volume "/dev/test_vg/my_test_lv" successfully created

radon:~# cat /proc/lvm 
LVM driver version 0.8final  (15/02/2000)

Total:  1 VG  4 PVs  2 LVs (0 LVs open)
Global: 17752 bytes malloced   IOP version: 6   2 days 13:58:40 active

VG:  test_vg  [4 PV, 2 LV/0 open]  PE Size: 4096 KB
  Usage [KB/PE]: 4096000 /1000 total  3076096 /751 used  1019904 /249 free
  PVs: [AA] sdb1                   1024000 /250       991232 /242 32768 /8     
       [AA] sdc1                   1024000 /250       684032 /167 339968 /83    
       [AA] sdd1                   1024000 /250       684032 /167 339968 /83    
       [AA] sde1                   1024000 /250       716800 /175 307200 /75    
    LVs: [AWDS3 ] my_test_lv                 2052096 /501      close
         [AWDL  ] my_test_lv_2               1024000 /250      close
radon:~# lvremove /dev/test_vg/my_test_lv
lvremove -- do you really want to remove "/dev/test_vg/my_test_lv"? [y/n]:y
lvremove -- doing automatic backup of volume group "test_vg"
lvremove -- logical volume "/dev/test_vg/my_test_lv" successfully removed

radon:~# lvcreate -L 2100 -n my_test_lv -i 3 test_vg
lvcreate -- INFO: using default stripe size 16 KB
lvcreate -- doing automatic backup of "test_vg"
lvcreate -- logical volume "/dev/test_vg/my_test_lv" successfully created

radon:~# cat /proc/lvm 
LVM driver version 0.8final  (15/02/2000)

Total:  1 VG  4 PVs  2 LVs (0 LVs open)
Global: 18135 bytes malloced   IOP version: 6   2 days 13:59:27 active

VG:  test_vg  [4 PV, 2 LV/0 open]  PE Size: 4096 KB
  Usage [KB/PE]: 4096000 /1000 total  3174400 /775 used  921600 /225 free
  PVs: [AA] sdb1                   1024000 /250      1024000 /250 0 /0     
       [AA] sdc1                   1024000 /250       716800 /175 307200 /75    
       [AA] sdd1                   1024000 /250       716800 /175 307200 /75    
       [AA] sde1                   1024000 /250       716800 /175 307200 /75    
    LVs: [AWDS3 ] my_test_lv                 2150400 /525      close
         [AWDL  ] my_test_lv_2               1024000 /250      close
radon:~# lvremove /dev/test_vg/my_test_lv
lvremove -- do you really want to remove "/dev/test_vg/my_test_lv"? [y/n]:y
lvremove -- doing automatic backup of volume group "test_vg"
lvremove -- logical volume "/dev/test_vg/my_test_lv" successfully removed

radon:~# lvcreate -L 2200 -n my_test_lv -i 3 test_vg
lvcreate -- INFO: using default stripe size 16 KB
lvcreate -- rounding 2252800 KB to stripe boundary size 2260992 KB / 552 PE
lvcreate -- not enough allocatable/free physical volume space in "test_vg"
lvcreate -- please check, if physical volumes are allocatable

radon:~# lvremove /dev/test_vg/my_test_lv
lvremove -- logical volume "/dev/test_vg/my_test_lv" doesn't exist

radon:~# lvcreate -L 2100 -n my_test_lv -i 3 test_vg
lvcreate -- INFO: using default stripe size 16 KB
lvcreate -- doing automatic backup of "test_vg"
lvcreate -- logical volume "/dev/test_vg/my_test_lv" successfully created

radon:~# cat /proc/lvm 
LVM driver version 0.8final  (15/02/2000)

Total:  1 VG  4 PVs  2 LVs (0 LVs open)
Global: 18135 bytes malloced   IOP version: 6   2 days 14:00:07 active

VG:  test_vg  [4 PV, 2 LV/0 open]  PE Size: 4096 KB
  Usage [KB/PE]: 4096000 /1000 total  3174400 /775 used  921600 /225 free
  PVs: [AA] sdb1                   1024000 /250      1024000 /250 0 /0     
       [AA] sdc1                   1024000 /250       716800 /175 307200 /75    
       [AA] sdd1                   1024000 /250       716800 /175 307200 /75    
       [AA] sde1                   1024000 /250       716800 /175 307200 /75    
    LVs: [AWDS3 ] my_test_lv                 2150400 /525      close
         [AWDL  ] my_test_lv_2               1024000 /250      close
v /usr/sbin/in.rexecd
radon:~# lvextend 
lvextend -- please enter a logical volume path

radon:~# lvextend /dev/test_vg/my_test_lv
lvextend -- please give an l or L option

radon:~# lvextend /dev/test_vg/my_test_lv -L 200
lvextend -- rounding size 204800 KB to stripe boundary size 208896 KB
lvextend -- new size 204 MB is not bigger than old size

radon:~# lvextend /dev/test_vg/my_test_lv -L +200
lvextend -- rounding size 2355200 KB to stripe boundary size 2359296 KB
lvextend -- extending logical volume "/dev/test_vg/my_test_lv" to 2.25 GB
lvextend -- doing automatic backup of volume group "test_vg"
lvextend -- logical volume "/dev/test_vg/my_test_lv" successfully extended

radon:~# cat /proc/lvm 
LVM driver version 0.8final  (15/02/2000)

Total:  1 VG  4 PVs  2 LVs (0 LVs open)
Global: 18951 bytes malloced   IOP version: 6   2 days 14:00:49 active

VG:  test_vg  [4 PV, 2 LV/0 open]  PE Size: 4096 KB
  Usage [KB/PE]: 4096000 /1000 total  3383296 /826 used  712704 /174 free
  PVs: [AA] sdb1                   1024000 /250      1024000 /250 0 /0     
       [AA] sdc1                   1024000 /250       716800 /175 307200 /75    
       [AA] sdd1                   1024000 /250       716800 /175 307200 /75    
       [AA] sde1                   1024000 /250       716800 /175 307200 /75    
    LVs: [AWDS3 ] my_test_lv                 2359296 /576      close
         [AWDL  ] my_test_lv_2               1024000 /250      close
radon:~# lvextend /dev/test_vg/my_test_lv -L +500
lvextend -- rounding size 2871296 KB to stripe boundary size 2875392 KB
lvextend -- extending logical volume "/dev/test_vg/my_test_lv" to 2.74 GB
Segmentation fault
radon:~# 
radon:~# cat /proc/lvm 
LVM driver version 0.8final  (15/02/2000)

Total:  1 VG  4 PVs  2 LVs (0 LVs open)
Global: 18951 bytes malloced   IOP version: 6   2 days 14:01:05 active

VG:  test_vg  [4 PV, 2 LV/0 open]  PE Size: 4096 KB
  Usage [KB/PE]: 4096000 /1000 total  3383296 /826 used  712704 /174 free
  PVs: [AA] sdb1                   1024000 /250      1024000 /250 0 /0     
       [AA] sdc1                   1024000 /250       716800 /175 307200 /75    
       [AA] sdd1                   1024000 /250       716800 /175 307200 /75    
       [AA] sde1                   1024000 /250       716800 /175 307200 /75    
    LVs: [AWDS3 ] my_test_lv                 2359296 /576      close
         [AWDL  ] my_test_lv_2               1024000 /250      close
radon:~# 

radon:~# gdb lvextend
GNU gdb 19990928
Copyright 1998 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you are
welcome to change it and/or distribute copies of it under certain conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for details.
This GDB was configured as "i686-pc-linux-gnu"...(no debugging symbols found)...
(gdb) run /dev/test_vg/my_test_lv -L +500
Starting program: /sbin/lvextend /dev/test_vg/my_test_lv -L +500
lvextend -- rounding size 2871296 KB to stripe boundary size 2875392 KB
lvextend -- extending logical volume "/dev/test_vg/my_test_lv" to 2.74 GB

Program received signal SIGSEGV, Segmentation fault.
0x4002471c in lv_setup_for_extend (vg_name=0x4004be05 "test_vg", vg=0x4004af60, 
    lv_name=0xbffffe70 "/dev/test_vg/my_test_lv", size=5750784, pv_allowed=0x0) at lv_setup_for_extend.c:223
223 vg->pv[pv_index]->pe[(vg->lv[l]->lv_current_pe[dest].pe-LVM_PE_DISK_OFFSET(0,vg->pv[pv_index]))/vg->pe_size].le_num = dest;
(gdb) display vg
1: vg = (vg_v1_t *) 0x4004af60
(gdb) display *vg
2: *vg = {vg_name = "test_vg", '\000' <repeats 120 times>, vg_number = 0, vg_access = 3, vg_status = 4, 
  lv_max = 256, lv_cur = 2, lv_open = 0, pv_max = 256, pv_cur = 4, pv_act = 4, dummy = 0, vgda = 0, 
  pe_size = 8192, pe_total = 1000, pe_allocated = 952, pvg_total = 0, proc = 0x0, pv = {0x8054118, 
    0x80546e8, 0x8054cb8, 0x8055288, 0x0 <repeats 253 times>}, lv = {0x8055858, 0x8057e98, 
    0x0 <repeats 255 times>}} 
(gdb) display pv_index
3: pv_index = 4294967295
(gdb) display dest
4: dest = 659
(gdb) 

K
