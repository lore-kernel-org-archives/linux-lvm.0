Message-ID: <3E0F159E.9040000@tzi.org>
From: Christian Quast <wildcart@tzi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problems mounting logical volumes
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
Date: Sun Dec 29 09:28:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi,

I have a similar problem to one i found in the archive:
    http://linux.msede.com/lvm_mlist/archive/2002/09/0097.html
with a few difference though.

I tried to adoped the steps recommended to my setup but still wasn't 
able to mount the lv. Basically because of the superblock error mentioned.

   goliath:/usr/src # mount -t ext3 /dev/goliath_vg/moviez /home/Moviez/
   mount: wrong fs type, bad option, bad superblock on
   /dev/goliath_vg/moviez,
          or too many mounted file systems

Some things about my system. I am using SuSE 8.0 with kernel 
2.4.18(-suse) and lvm 1.0.2 (at least this is what it says at boot time).

I set up lvm about two weeks ago. The actual setup will follow at the 
end of this mail. What gets me concerned is the Status of the PV 
(/dev/hdd1) wich is 'NOT available' while it is in the posting mentioned 
above.

What I've tried so far is to mount the lv with the backup superblock 
option. But I'm not sure how to figure out what blocks are backups of 
the superblock. The ext3 inside the lv has a blocksize of 1k according 
to 'man mount' superblocks were stored every 8192 block but aren't 
anymore. Because I got 1k block instead of 4k I tried to mount the lv with

goliath:/usr/src # mount -t ext3 -osb=32768 /dev/goliath_vg/moviez 
/home/Moviez/

mount: wrong fs type, bad option, bad superblock on /dev/goliath_vg/moviez,
        or too many mounted file systems

rather then 131072 as well as several other blocks but none of them 
worked (How do I actually figure out which blocks are superblocks).

Some more information that migh be usefull. tune2fs produces the 
following output:

goliath:/usr/src # tune2fs -l /dev/goliath_vg/moviez
tune2fs 1.26 (3-Feb-2002)
Filesystem volume name:   golmoviez
Last mounted on:          <not available>
Filesystem UUID:          22915d28-c373-4f7e-8cff-fe5d9361e0be
Filesystem magic number:  0xEF53
Filesystem revision #:    1 (dynamic)
Filesystem features:      has_journal filetype sparse_super
Filesystem state:         clean with errors
Errors behavior:          Continue
Filesystem OS type:       Linux
Inode count:              14655488
Block count:              117239808
Reserved block count:     5861990
Free blocks:              34912993
Free inodes:              14654356
First block:              1
Block size:               1024
Fragment size:            1024
Blocks per group:         8192
Fragments per group:      8192
Inodes per group:         1024
Inode blocks per group:   128
Last mount time:          Wed Dec 25 12:14:24 2002
Last write time:          Sun Dec 29 16:13:37 2002
Mount count:              3
Maximum mount count:      27
Last checked:             Sun Dec 22 19:39:42 2002
Check interval:           15552000 (6 months)
Next check after:         Fri Jun 20 20:39:42 2003
Reserved blocks uid:      0 (user root)
Reserved blocks gid:      0 (group root)
First inode:              11
Inode size:               128
Journal UUID:             <none>
Journal inode:            8
Journal device:           0x0000
First orphan inode:       0

and fsck.ext2/3 end up in a segmentation fault

goliath:/usr/src # fsck.ext2 /dev/goliath_vg/moviez
e2fsck 1.26 (3-Feb-2002)
Group descriptors look bad... trying backup blocks...
Segmentation fault

Because of the 'Group descriptors look bad' I tried to restore the vgs 
metadata by doing a vgcfgrestore with all the backups I had (Not sure 
what the Group descriptors actually are but because it is a lv I thought 
it might the vg Group...). Neither of the backups would solve the Group 
descriptors thing.

I am out of options and would be rather thankfull for any advice on 
howto mount the lv and save the data contained.



regards and thnx in advance for any help
   Christian Quast


--


goliath:/usr/src # vgdisplay && lvdisplay /dev/goliath_vg/moviez && 
pvdisplay /dev/hdd1
--- Volume group ---
VG Name               goliath_vg
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               111.81 GB
PE Size               4 MB
Total PE              28623
Alloc PE / Size       28623 / 111.81 GB
Free  PE / Size       0 / 0
VG UUID               hjGW45-uPb2-NljK-pWlr-bvt5-Pchj-69o0c7


--- Logical volume ---
LV Name                /dev/goliath_vg/moviez
VG Name                goliath_vg
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                111.81 GB
Current LE             28623
Allocated LE           28623
Allocation             next free
Read ahead sectors     10000
Block device           58:0


--- Physical volume ---
PV Name               /dev/hdd1
VG Name               goliath_vg
PV Size               111.81 GB [234492993 secs] / NOT usable 4.25 MB 
[LVM: 239 KB]
PV#                   1
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              28623
Free PE               0
Allocated PE          28623
PV UUID               ZlTfuK-pMnn-CpPr-H0dm-UJ4v-YZ6l-V0m3Qm
