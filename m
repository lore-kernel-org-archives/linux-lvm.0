Return-Path: <whiplash@pobox.com>
Message-Id: <4.3.1.2.20010108164145.00c9f3e0@pop.nyx.net>
Date: Mon, 08 Jan 2001 16:53:42 -0700
From: Gordon Schumacher <whiplash@pobox.com>
Mime-Version: 1.0
Content-Type: text/html; charset="us-ascii"
Subject: [linux-lvm] mke2fs problem
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

<html>
Okay, I am hoping that someone can help me with this...<br>
<br>
I've got a system that I'm trying to get LVM working on.&nbsp; It's got a
2.4.0-rel kernel running on it, and I've updated to e2fsprogs 1.19.&nbsp;
The Linux install is SuSE 7.0.<br>
<br>
I have two drives installed in the system currently.&nbsp; One of them is
the drive that contains the main Linux partitions - /dev/hda is 15GB and
has ~12GB free on hda1 that I want to make part of a volume group.&nbsp;
The other, /dev/hdc, is a 60GB which will also become part of the volume
group.<br>
<br>
I've partitioned them and set the types to 0x8e, and then run the
following:<br>
pvcreate /dev/hda3<br>
pvcreate /dev/hdc1<br>
vgcreate mygrp /dev/hda3 /dev/hdc1<br>
lvcreate -i 2 -L 52M -n lv1 mygrp<br>
lvcreate -i 2 -L 12M -n lv2 mygrp<br>
mke2fs /dev/mygrp/lv1<br>
<font face="Courier New, Courier">mke2fs 1.19, 13-Jul-2000 for EXT2 FS
0.5b, 95/08/09<br>
Filesystem label=<br>
OS type: Linux<br>
Block size=1024 (log=0)<br>
Fragment size=1024 (log=0)<br>
14336 inodes, 57344 blocks<br>
2867 blocks (5.00%) reserved for the super user<br>
First data block=1<br>
7 block groups<br>
8192 blocks per group, 8192 fragments per group<br>
2048 inodes per group<br>
Superblock backups stored on blocks: <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8193, 24577, 40961<br>
<br>
Writing inode tables:
done&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
Writing superblocks and filesystem accounting information: done<br>
<br>
</font>mke2fs /dev/mygrp/lv2<br>
<font face="Courier New, Courier">mke2fs 1.19, 13-Jul-2000 for EXT2 FS
0.5b, 95/08/09<br>
Filesystem label=<br>
OS type: Linux<br>
Block size=1024 (log=0)<br>
Fragment size=1024 (log=0)<br>
4096 inodes, 16384 blocks<br>
819 blocks (5.00%) reserved for the super user<br>
First data block=1<br>
2 block groups<br>
8192 blocks per group, 8192 fragments per group<br>
2048 inodes per group<br>
Superblock backups stored on blocks: <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8193<br>
<br>
Writing inode tables:
done&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
Writing superblocks and filesystem accounting information: done<br>
<br>
</font>I've included the output of the mke2fs command.&nbsp; Note the
surprisingly small number of blocks...!<br>
<br>
Here's what lvdisplay /dev/mygrp/lv1 shows:<br>
<font face="Courier New, Courier">--- Logical volume ---<br>
LV
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
/dev/mygrp/lv1<br>
VG
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
mygrp<br>
LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
read/write<br>
LV
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
available<br>
LV
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1<br>
#
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0<br>
LV
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
56 MB<br>
Current
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
14<br>
Allocated LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
14<br>
Stripes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
2<br>
Stripe size (KByte)&nbsp;&nbsp; 16<br>
Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
next free<br>
Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 120<br>
Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
58:0<br>
<br>
</font>So, everything *looks* like it's the right size; but mke2fs seems
to think that it's talking to a ~57MB and ~16MB disk, respectively!&nbsp;
What am I doing wrong here?</html>
