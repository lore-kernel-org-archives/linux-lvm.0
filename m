From: James Hawtin <oolon@ankh.org>
Subject: Re: [linux-lvm] vgscan not returning
In-Reply-To: <200209192114.RAA28859@www23.ureach.com>
Message-ID: <Pine.LNX.4.44.0209192113340.5869-100000@pzat.meep.org>
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
Date: Thu Sep 19 16:42:44 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com


On Thu, 19 Sep 2002, Ali Zaidi wrote:

> ================================================================
>
>    Device Boot    Start       End    Blocks   Id  System
> /dev/hda1   *         1      1020   8193118+  83  Linux
> /dev/hda2          1021      2491  11815807+   5  Extended
> /dev/hda5          1021      1148   1028128+  82  Linux swap
> /dev/hda6          1149      1187    313236   8e  Linux LVM
> /dev/hda7          1188      1200    104391   8e  Linux LVM
> /dev/hda8          1201      1213    104391   8e  Linux LVM
> /dev/hda9          1214      1226    104391   8e  Linux LVM
> /dev/hda10         1227      1239    104391   8e  Linux LVM
> /dev/hda11         1240      1241     16033+  8e  Linux LVM
> /dev/hda12         1242      1254    104391   8e  Linux LVM
> /dev/hda13         1255      1267    104391   8e  Linux LVM
> /dev/hda14         1268      1280    104391   8e  Linux LVM
> /dev/hda15         1281      1293    104391   8e  Linux LVM
> /dev/hda16         1294      2491   9622903+  8e  Linux LVM
> ================================================================
>



Errr ummm..... yes your right you are new to LVM!!! There is NO point at
all in doing this... yes I know you want "raw" devices oracle... but let
me explain.... A raw device for oracle is simply a device without a
filesystem on it.

Let me now pose you a question, if you had a "raid" device would you
define your partitions on the physical disk or on the special device after
it has been "raided"? The answer of course is after!

Think of LVM is a partion table on steriods. What your doing about is
stupid because...

1) You will create a pv volume on each one of those partions. You will
then put them all in the same volume group (lvm will effectly join them
all back together again) Then you will then reallocate the disk back into
chunks for the raw devices to be used by oracle. However if lvm spits it
differently to you then your disk will be slower not faster!

2) You want a seperate volume group for each logical volume why are you
using lvm?

Ok lets me show you the config for my "simple" system

first the partition table....

/dev/discs/disc0/part1             1       392   3148708+   b  Win95 FAT32
/dev/discs/disc0/part2   *       393       441    393592+  83  Linux
/dev/discs/disc0/part3           442       490    393592+  83  Linux
/dev/discs/disc0/part4           491      2103  12956422+   f  Win95 Ext'd
(LBA)
/dev/discs/disc0/part5           491      1003   4120641    b  Win95 FAT32
/dev/discs/disc0/part6          1004      2103   8835718+  8e  Linux LVM

in linux only partions 2 and 6 are normally used.

bash# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/ide/host0/bus0/target0/lun0/part6" of VG
"hex_vg" [8.38 GB / 0 free]
pvscan -- total: 1 [8.43 GB] / in use: 1 [8.43 GB] / in no VG: 0 [0]

Note one pv which contains the hex_vg in it....
But Hay! I want more than one partion for my system....... read on...

bash# df -k
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/root               381121     71333    290109  20% /
/dev/shm                262144         4    262140   1% /tmp
/dev/hex_vg/var_lv      262132     43780    218352  17% /var
/dev/hex_vg/usr_lv     3145628   2076264   1069364  67% /usr
/dev/hex_vg/hecate1_lv
                       4980580    168364   4812216   4% /hecate1

ls /dev/hex_vg/
group  hecate1_lv  swap_lv  usr_lv  var_lv

Rather than using those for filesystems I could have used them for raw
devices for oracle or anything else!

This will show you how lvm has layout out the disk...

vgdisplay hex_vg
--- Volume group ---
VG Name               hex_vg
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                255
Cur LV                4
Open LV               4
MAX LV Size           2 TB
Max PV                255
Cur PV                1
Act PV                1
VG Size               8.38 GB
PE Size               32 MB
Total PE              268
Alloc PE / Size       268 / 8.38 GB
Free  PE / Size       0 / 0
VG UUID               5B7ut8-3kgO-F3aT-Z6QS-odhu-tYLa-wTPTKN

--- Logical volume ---
LV Name                /dev/hex_vg/var_lv
VG Name                hex_vg
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                256 MB
Current LE             8
Allocated LE           8
Allocation             next free
Read ahead sectors     120
Block device           58:0

--- Logical volume ---
LV Name                /dev/hex_vg/swap_lv
VG Name                hex_vg
LV Write Access        read/write
LV Status              available
LV #                   2
# open                 1
LV Size                384 MB
Current LE             12
Allocated LE           12
Allocation             next free
Read ahead sectors     120
Block device           58:1

--- Logical volume ---
LV Name                /dev/hex_vg/usr_lv
VG Name                hex_vg
LV Write Access        read/write
LV Status              available
LV #                   3
# open                 1
LV Size                3 GB
Current LE             96
Allocated LE           96
Allocation             next free
Read ahead sectors     120
Block device           58:2

--- Logical volume ---
LV Name                /dev/hex_vg/hecate1_lv
VG Name                hex_vg
LV Write Access        read/write
LV Status              available
LV #                   4
# open                 1
LV Size                4.75 GB
Current LE             152
Allocated LE           152
Allocation             next free
Read ahead sectors     120
Block device           58:3


--- Physical volumes ---
PV Name (#)           /dev/ide/host0/bus0/target0/lun0/part6 (1)
PV Status             available / allocatable
Total PE / Free PE    268 / 0

As you can see lvm is being my partion table for me for those partions, it
has the added bonus that because it is in an extend partion on the real
disk its position in that table could (in theory move). However I don;t
have to worry about that cos lvm will find it and my devices will still
be where I put them

/dev/<volume groupname>/<logical volume name>

James
