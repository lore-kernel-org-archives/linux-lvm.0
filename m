Message-ID: <3B8F8C5E.7030603@st-peter.stw.uni-erlangen.de>
Date: Fri, 31 Aug 2001 15:08:46 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
References: <3B8E3F0E.8050609@st-peter.stw.uni-erlangen.de> <20010830083546.A20989@sistina.com> <3B8EC633.40202@st-peter.stw.uni-erlangen.de>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] PBs with LVM over software RAID
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: AJ Lewis <lewis@sistina.com>, linux-lvm@sistina.com, pixel@mandrakesoft.com, Mauelshagen@Sistina.com

i have forgoten my mail : svetljo@lycos.com
  galia@st-peter.stw.uni-erlangen.de
i'll be tankfull for any idea  write me


can somebody tell me where is the problem and what can i do about it
the first time i try to mount the LV mount segfaults and after that i am 
not able to mount any other file system ( partition, CD ...) :

root@svetljo#mount -o ro /dev/scd0 /mnt/cdrom
no messeges from mount but it blocks the console and does not mount the CD



i'm running MDK8.1(cooker) with kernel 2.4.9-xfs-cvs with LVM 1.0.1-rc1
ABIT BP6 dual Celleron533 512Mb RAM
onboard HPT366 UDMA66 controler
on the HPT366  2xWD 30Gb(/dev/hde /dev/hdg) 1xMaxtor 40Gb(/dev/hdh)

here is the console output:

[root@svetljo mnt]# cat /proc/mdstat
Personalities : [linear] [raid0] [raid5]
read_ahead 1024 sectors
md7 : active linear hde6[1] hde11[0]       13936128 blocks 64k rounding
md6 : active linear hdg6[3] hdg12[2] hdg1[1] hdg5[0]       14409856 
blocks 64k rounding
md0 : active raid0 hdh6[2] hdg10[1] hde8[0]       8064256 blocks 8k chunks
md1 : active raid0 hdh7[2] hdg9[1] hde10[0]       24579072 blocks 16k 
chunks
md8 : active raid0 hdh8[1] hdg7[0]       529920 blocks 64k chunks
unused devices: <none>
[root@svetljo mnt]# vgscan
  vgscan -- reading all physical volumes (this may take a while...)
  vgscan -- found active volume group "myData"
  vgscan -- found active volume group "wish"
  vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
  vgscan -- WARNING: This program does not do a VGDA backup of your 
volume groups
[root@svetljo mnt]# vgdisplay myData
--- Volume group ---
VG Name               myData
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                255
Cur LV                1
Open LV               0
MAX LV Size           255.99 GB
Max PV                255
Cur PV                3
Act PV                3
VG Size               41.50 GB
PE Size               4.00 MB
Total PE              10624
Alloc PE / Size       7170 / 28.01 GB
Free  PE / Size       3454 / 13.49 GB
VG UUID               EqfM1F-WKiN-41Jw-D7kl-PSwv-jLp7-4fFjIo

[root@svetljo mnt]# lvdisplay /dev/myData/Music
--- Logical volume ---
LV Name                /dev/myData/Music
VG Name                myData
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                28.01 GB
Current LE             7170
Allocated LE           7170
Stripes                3
Stripe size (KByte)    4
Allocation             next free
Read ahead sectors     32
Block device           58:0
[root@svetljo mnt]# mount -t xfs /dev/myData/Music music
Segmentation fault
[root@svetljo mnt]# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/md0               8064004   7593920    470084  95% /
/dev/hde5                31079     23564      5911  80% /boot
none                    256252         0    256252   0% /dev/shm
/dev/md1              24574272  24444608    129664 100% /mnt/md1
/dev/hde1               441520    272376    169144  62% /mnt/win_c
[root@svetljo mnt]# lvdisplay /dev/myData/Music
--- Logical volume ---
LV Name                /dev/myData/Music
VG Name                myData
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1             <----
LV Size                28.01 GB
Current LE             7170
Allocated LE           7170
Stripes                3
Stripe size (KByte)    4
Allocation             next free
Read ahead sectors     32
Block device           58:0


------------------------------------------------------------------------

and one more question :

can i make a VG and LV's over  LV's
the idea is replacing the linear sofware RAID with a linear LV's, but i
think i'll have the same roblems that i had with the raid

the LV ( lvcreate -i3 -I4 -L26G -nMusic )

the VG -> myData   /dev/hdh10 /dev/linVG1/linLV1 /dev/linVG2/linLV2

/dev/hdh10 normal partition 14G
/dev/linVG1/linLV1 ->  linear LV 14G /dev/hde6 /dev/hde12
/dev/linVg2/linLV2 ->  linear LV 14G /dev/hdg1 /dev/hdg5 /dev/hdg6
/dev/hdg12


 > Hi i couldn't change the partition's id of the RAID but i mannaged it
 > to create the VG, LV and to format the LV
 > but when i try to mount the the LV mount segfaults  and every try to
 > do anything with the LV finish witth a sleep
 > i mean when i try to mount anything ( a partition, a CD or a LV) after
 > the segfault of the first ' mount -t xfs /dev/myData/Music /mnt/music
 > '  mount goes to sleep and do not do anything
 > vgdisplay says that the volume is activ
 > lvremove says that the volume is open and can not be removed
 > do you have an idea wthat is the problem
 > and what can i try
 >
 > the LV ( lvcreate -i3 -I4 -L26G -nMusic )
 >
 > the VG -> myData   /dev/hdh10 /dev/md6 /dev/md7
 >
 > /dev/hdh10 normal partition 14G
 > /dev/md6 ->  linear software RAID 14G /dev/hde6 /dev/hde12
 > /dev/md7 ->  linear software RAID 14G /dev/hdg1 /dev/hdg5 /dev/hdg6
 > /dev/hdg12
 >
 > the reason:
 >
 > after trying BeOS, FreeBSD and useing windows , i was trying to switch
 > complete to linux without having to repartiton all the drives( i have
 > tree )
 > and lose about 30G of Data + and a new instalation ( the current Data
 > and instalation is over a software RAID-0 other a striped  LV's  or to
 > back up 30 Gigs of Data
 > AJ Lewis wrote:
 >
 >>On Thu, Aug 30, 2001 at 03:26:38PM +0200, svetljo wrote:
 >>
 >>>Hi i saw your postings on the lvm-board
 >>>and i was woundering whether you can help me
 >>>
 >>>can you plese tell me how can i change the type  of  'partition' on
 >>>md-device (softweare Linear RAID )
 >>>i can not make it with fdisk on md-device
 >>>
 >>>i have 3 disks with a lot of partitions and i wanted to build  striped
 >>>LV's on a new VG
 >>>i've created the VG ( /dev/md5 /dev/md6 /dev/hdh10 )
 >>>but when i try to create LV's  it returns to me that not all PV's are
 >>>online ( md5 )
 >>>and /proc/mdstat tells me that everything is ok :
 >>> md5 ( /dev/hde6 /dev/hde12 linear) and md6 (/dev/hdg1 /dev/hdg2
 >>>/dev/hdg8 linear) are online
 >>>but they are marked as ext2 partitions
 >>>
 >>>can you please help me
 >>>
 >>
 >>I'm sorry.  I don't personally have any experience using md.  I 
suggest you
 >>post this to linux-lvm.  There should be people there that have done what
 >>you're proposing.
 >>
 >>>linux-2.4.9-xfs-cvs  with LVM 1.0.1rc1
 >>>
 >>
 >>Regards,
 >>
 >
 >
