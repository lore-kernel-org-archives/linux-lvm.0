Message-ID: <3B90EEC8.3030402@st-peter.stw.uni-erlangen.de>
Date: Sat, 01 Sep 2001 16:20:56 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] PBs with LVM over software RAID ( and XFS ? ext2 reiserfs?)
References: <3B8E3F0E.8050609@st-peter.stw.uni-erlangen.de> <20010830083546.A20989@sistina.com> <3B8EC633.40202@st-peter.stw.uni-erlangen.de> <3B8F8C5E.7030603@st-peter.stw.uni-erlangen.de> <20010831110512.V541@turbolinux.com> <3B90C9A4.3080005@st-peter.stw.uni-erlangen.de>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com, linux-xfs@oss.sgi.com, akpm@zip.com.au, neilb@cse.unsw.edu.au

and here are the results of mkfs

###############################################################
#########   linus-2.4.9 lvm-1.0.1rc1        ###################
###############################################################

[root@svetljo root]# mkfs -t reiserfs -f /dev/myData/SRC
mkreiserfs, 2001 - reiserfsprogs 3.x.0j
===================================================================
LEAF NODE (8211) contains level=1, nr_items=2, free_space=3932 rdkey
-------------------------------------------------------------------------------
|###|type|ilen|f/sp| loc|fmt|fsck|                   key 
       |
|   |    |    |e/cn|    |   |need| 
       |
-------------------------------------------------------------------------------
Segmentation fault
[root@svetljo root]# mkfs -t ext2 -f /dev/myData/SRC
mke2fs 1.22, 22-Jun-2001 for EXT2 FS 0.5b, 95/08/09
mkfs.ext2: bad fragment size - /dev/myData/SRC

################################################################
###########  linux-2.4.9-ac5 lvm-1.0    ########################
################################################################

[root@svetljo root]# mkfs -t reiserfs /dev/myData/SRC
mkreiserfs, 2001 - reiserfsprogs 3.x.0j
===================================================================
LEAF NODE (8211) contains level=1, nr_items=2, free_space=3932 rdkey
-------------------------------------------------------------------------------
|###|type|ilen|f/sp| loc|fmt|fsck|                   key 
       |
|   |    |    |e/cn|    |   |need| 
       |
-------------------------------------------------------------------------------
Segmentation fault
[root@svetljo root]# mkfs -t reiserfs -f /dev/myData/SRC
mkreiserfs, 2001 - reiserfsprogs 3.x.0j
===================================================================
LEAF NODE (8211) contains level=1, nr_items=2, free_space=3932 rdkey
-------------------------------------------------------------------------------
|###|type|ilen|f/sp| loc|fmt|fsck|                   key 
       |
|   |    |    |e/cn|    |   |need| 
       |
-------------------------------------------------------------------------------
Segmentation fault
[root@svetljo root]# mkfs -t ext2 -f /dev/myData/SRC
mke2fs 1.22, 22-Jun-2001 for EXT2 FS 0.5b, 95/08/09
mkfs.ext2: bad fragment size - /dev/myData/SRC
[root@svetljo root]# mkfs -t ext2 /dev/myData/SRC
mke2fs 1.22, 22-Jun-2001 for EXT2 FS 0.5b, 95/08/09
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
786432 inodes, 1572864 blocks
78643 blocks (5.00%) reserved for the super user
First data block=0
48 block groups
32768 blocks per group, 32768 fragments per group
16384 inodes per group
Superblock backups stored on blocks:
         32768, 98304, 163840, 229376, 294912, 819200, 884736

Writing inode tables: Segmentation fault

#####################################################################
###    and linux-2.4.10-pre2-xfs lvm-1.0.1rc2                 #######
#####################################################################

[root@svetljo root]# mkfs -t reiserfs /dev/myData/SRC
mkreiserfs, 2001 - reiserfsprogs 3.x.0j
===================================================================
LEAF NODE (8211) contains level=1, nr_items=2, free_space=3932 rdkey
------------------------------------------------------------------------------- 
|###|type|ilen|f/sp| loc|fmt|fsck|                   key 
       | |   |    |    |e/cn|    |   |need| 
                | 
------------------------------------------------------------------------------- 
Segmentation fault
[root@svetljo root]# mkfs -t reiserfs -f /dev/myData/SRC
mkreiserfs, 2001 - reiserfsprogs 3.x.0j
===================================================================
LEAF NODE (8211) contains level=1, nr_items=2, free_space=3932 rdkey
------------------------------------------------------------------------------- 
|###|type|ilen|f/sp| loc|fmt|fsck|                   key 
       | |   |    |    |e/cn|    |   |need| 
                | 
------------------------------------------------------------------------------- 
Segmentation fault
[root@svetljo root]# mkfs -t ext2 /dev/myData/SRC
mke2fs 1.22, 22-Jun-2001 for EXT2 FS 0.5b, 95/08/09
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
786432 inodes, 1572864 blocks
78643 blocks (5.00%) reserved for the super user
First data block=0
48 block groups
32768 blocks per group, 32768 fragments per group
16384 inodes per group
Superblock backups stored on blocks:
         32768, 98304, 163840, 229376, 294912, 819200, 884736

Writing inode tables: Segmentation fault
[root@svetljo root]# mkfs -t ext2 -f /dev/myData/SRC
mke2fs 1.22, 22-Jun-2001 for EXT2 FS 0.5b, 95/08/09
mkfs.ext2: bad fragment size - /dev/myData/SRC
[root@svetljo root]# mkfs -t xfs /dev/myData/SRC
meta-data=/dev/myData/SRC        isize=256    agcount=8, agsize=196608 blks
data     =                       bsize=4096   blocks=1572864, imaxpct=25
          =                       sunit=0      swidth=0 blks, unwritten=0
naming   =version 2              bsize=4096
log      =internal log           bsize=4096   blocks=1200
realtime =none                   extsz=65536  blocks=0, rtextents=0
[root@svetljo root]# mkfs -t xfs -f /dev/myData/SRC
meta-data=/dev/myData/SRC        isize=256    agcount=8, agsize=196608 blks
data     =                       bsize=4096   blocks=1572864, imaxpct=25
          =                       sunit=0      swidth=0 blks, unwritten=0
naming   =version 2              bsize=4096
log      =internal log           bsize=4096   blocks=1200
realtime =none                   extsz=65536  blocks=0, rtextents=0
