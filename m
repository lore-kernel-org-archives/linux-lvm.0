Message-ID: <39E3008D.A969BC89@winqvist.net>
Date: Tue, 10 Oct 2000 13:42:05 +0200
From: =?iso-8859-1?Q?J=F6rgen?= Winqvist <jorgen@winqvist.net>
MIME-Version: 1.0
Subject: [linux-lvm] Compaq diskarray problems
Content-Transfer-Encoding: quoted-printable
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@msede.com

Hi,

I can't pvcreate LUN's on a Compaq raid controller. This LUN is 10 Gb.
I've compiled 8.0final.
(I had to comment #include "gnu/types.h" out  in liblvm.h).

Greateful for any help.

Regards

J=EF=BF=BDrgen


Compaq Proliant DL380 with 3 striped disks and 5 LUNs'
Redhat 7 with 2.4.0-0.26
----------------------------------------------------------------
# cat /proc/lvm
LVM driver version 0.8final  (15/02/2000)

Total:  0 VGs  0 PVs  0 LVs (0 LVs open)
Global: 143 bytes malloced   IOP version: 6   5:20:33 active
-------------------------------------------------------------

# fdisk /dev/ida/c0d1
Command (m for help): p
Disk /dev/ida/c0d1: 255 heads, 32 sectors, 2510 cylinders
Units =3D cylinders of 8160 * 512 bytes

         Device Boot    Start       End    Blocks   Id  System

Command (m for help): q
# pvcreate  /dev/ida/c0d1
pvcreate -- invalid partition type 0x83 for "/dev/ida/c0d1" (must be
0x8e)
--------------------------------------------------------------

I've now added a partition with type LVM

# fdisk /dev/ida/c0d1
Command (m for help): p
Disk /dev/ida/c0d1: 255 heads, 32 sectors, 2510 cylinders
Units =3D cylinders of 8160 * 512 bytes
         Device Boot    Start       End    Blocks   Id  System
/dev/ida/c0d1p1             1      2510  10240784   8e  Linux LVM
Command (m for help): q
# pvcreate  /dev/ida/c0d1p
pvcreate -- invalid partition type 0x83 for "/dev/ida/c0d1p1" (must be
0x8e)
--------------------------------------------------------------

output from dmesg

cpqarray: Device 1000 has been found at 0 8
Compaq SMART2 Driver (v 2.4.0)
Found 1 controller(s)
cpqarray: Finding drives on ida0 (Integrated Array)
cpqarray ida/c0d0: blksz=3D512 nr_blks=3D20481600
cpqarray ida/c0d1: blksz=3D512 nr_blks=3D20481600
cpqarray ida/c0d2: blksz=3D512 nr_blks=3D20481600
cpqarray ida/c0d3: blksz=3D512 nr_blks=3D20481600
cpqarray ida/c0d4: blksz=3D512 nr_blks=3D24732960
cpqarray: Starting firmware's background processing
Partition check:
 ida/c0d0: p1 p2 < p5 p6 p7 p8 p9 p10 p11 p12 >
 ida/c0d1:
 ida/c0d2:
 ida/c0d3:
 ida/c0d4:
---------------------------------------------------------------
