From: Goetz Bock <bock@blacknet.de>
Message-ID: <20011217014227.A453@golem.blacknet.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] File size limit exceeded
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
Date: Sun Dec 16 18:40:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm <linux-lvm@sistina.com>

Hi,

I've a strange problem with my LVM:

---------------------------------------------------------------------------
root # cat /proc/version
Linux version 2.4.16 (root@server.blacknet.de) (gcc version 2.95.3 20010315 (release)) #3 SMP Fri Dec 7 01:40:25 CET 2001

root # cat /proc/lvm/global (run after last command)
LVM driver LVM version 1.0.1(26/11/2001)

Total:  1 VG  1 PV  7 LVs (3 LVs open 3 times)

Global: 285158 bytes malloced   IOP version: 10   3 days 15:28:44 active

VG:  filebase  [1 PV, 7 LV/3 open]  PE Size: 16384 KB
  Usage [KB/PE]: 400146432 /24423 total  285212672 /17408 used  114933760 /7015 free
  PV:  [AA] md0                   400146432 /24423   285212672 /17408   114933760 /7015
    LVs: [AWDL  ] priv                      20971520 /1280     1x open
         [AWDL  ] own                       20971520 /1280     close
         [AWDL  ] pub                       62914560 /3840     1x open
         [AWDL  ] music                     62914560 /3840     1x open
         [AWDL  ] video                     62914560 /3840     close
         [AWDL  ] backup                    52428800 /3200     close
         [AWDL  ] ipaq                       2097152 /128      close

root # vgdisplay
--- Volume group ---
VG Name               filebase
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                255
Cur LV                7
Open LV               3
MAX LV Size           1023.97 GB
Max PV                255
Cur PV                1
Act PV                1
VG Size               381.61 GB
PE Size               16.00 MB
Total PE              24423
Alloc PE / Size       17408 / 272.00 GB
Free  PE / Size       7015 / 109.61 GB
VG UUID               adOlVW-JSK8-Hxws-t4bz-kBFr-L05y-5rPsdB

root # pvdisplay /dev/md0
--- Physical volume ---
PV Name               /dev/md0
VG Name               filebase
PV Size               381.64 GB / NOT usable 31.38 MB [LVM: 219.00 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                8
PE Size (KByte)       16384
Total PE              24423
Free PE               6887
Allocated PE          17536
PV UUID               sJXF7E-YRkV-0Vd8-2TI4-NAuo-tfU6-G6REhE


root # lvcreate -L 20G -n dragon filebase
lvcreate -- doing automatic backup of "filebase"
lvcreate -- logical volume "/dev/filebase/dragon" successfully created

root # mke2fs /dev/filebase/dragon
mke2fs 1.22, 22-Jun-2001 for EXT2 FS 0.5b, 95/08/09
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
2621440 inodes, 5242880 blocks
262144 blocks (5.00%) reserved for the super user
First data block=0
160 block groups
32768 blocks per group, 32768 fragments per group
16384 inodes per group
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
        4096000

File size limit exceeded

root # lvremove /dev/filebase/dragon
...

root # lvcreate -L2G -n dragon filebase
lvcreate -- doing automatic backup of "filebase"
lvcreate -- logical volume "/dev/filebase/dragon" successfully created

root # mke2fs -j /dev/filebase/dragon
mke2fs 1.22, 22-Jun-2001 for EXT2 FS 0.5b, 95/08/09
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
262144 inodes, 524288 blocks
26214 blocks (5.00%) reserved for the super user
First data block=0
16 block groups
32768 blocks per group, 32768 fragments per group
16384 inodes per group
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912

mke2fs: Attempt to write block from filesystem resulted in short write zeroing block 524280 at end of filesystem

root # vgremove /dev/filebase/dragon
...

root # lvcreate -L 1G -n dragon filebase
lvcreate -- doing automatic backup of "filebase"
lvcreate -- logical volume "/dev/filebase/dragon" successfully created

root # mke2fs /dev/filebase/dragon
mke2fs 1.22, 22-Jun-2001 for EXT2 FS 0.5b, 95/08/09
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
131072 inodes, 262144 blocks
13107 blocks (5.00%) reserved for the super user
First data block=0
8 block groups
32768 blocks per group, 32768 fragments per group
16384 inodes per group
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376

Writing inode tables: done
Writing superblocks and filesystem accounting information: done

This filesystem will be automatically checked every 32 mounts or
180 days, whichever comes first.  Use tune2fs -c or -i to override.

root@server ~# lvremove /dev/filebase/dragon
lvremove -- do you really want to remove "/dev/filebase/dragon"? [y/n]: y
lvremove -- doing automatic backup of volume group "filebase"
lvremove -- logical volume "/dev/filebase/dragon" successfully removed
---------------------------------------------------------------------------

I'm running 272 GB in 7 LV (all with reiserfs(*)) w/o problems. The only
thing I changed lately was the CPU. (I've fried my PIII-1000 and I've
returned to a C433).
The System is: C433, 1024MB PC133, 3Ware 6800, 6x 80GB Maxtor, Intel EEpro100,
 1x 40GB Fujitsu (boot disk at onboard controller), BX chipset (ASUS CUBX).


(*) mkreiserfs doesn't work either (same error), it works ok with 1G

Any pointers appreciated,
    Goetz.
