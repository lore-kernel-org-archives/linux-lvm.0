Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB51LwV18339
	for <linux-lvm@redhat.com>; Sun, 4 Dec 2005 20:21:58 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.199])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jB51LpQU027478
	for <linux-lvm@redhat.com>; Sun, 4 Dec 2005 20:21:51 -0500
Received: by wproxy.gmail.com with SMTP id i5so933264wra
	for <linux-lvm@redhat.com>; Sun, 04 Dec 2005 17:21:51 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v746.2)
Message-Id: <45CF68C3-8E43-493E-B9DF-2BD0A51D09F4@gmail.com>
Content-Type: multipart/alternative; boundary=Apple-Mail-4-819682574
From: William Strathearn <billythekid@gmail.com>
Date: Sun, 4 Dec 2005 17:21:45 -0800
Subject: [linux-lvm] Can't Boot Cleaned JFS VG after System Crash
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--Apple-Mail-4-819682574
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed


   After a forced reboot while my 2.6.12 system was frozen, the JFS  
formatted LVM2 VG I have created will not mount upon startup.  When I  
use the following command to mount it by hand, I get a generic bad  
superblock message:

pvr ~ # mount -t jfs /dev/myth-video-vg/myth-video /video
mount: wrong fs type, bad option, bad superblock on /dev/myth-video- 
vg/myth-video,
        missing codepage or other error
        In some cases useful info is found in syslog - try
        dmesg | tail  or so

   I ran jfs_fsck on both physical volumes that are part of the VG  
and one partition had a detectable error that was fixed by replaying  
the log.  Now jfs_fsk reports two clean filesystems.

pvr ~ # jfs_fsck /dev/sdb
jfs_fsck version 1.1.8, 03-May-2005
processing started: 12/4/2005 10.1.24
Using default parameter: -p
The current device is:  /dev/sdb
Block size in bytes:  4096
Filesystem size in blocks:  61049646
**Phase 0 - Replay Journal Log
Filesystem is clean.

pvr ~ # jfs_fsck /dev/sda4
jfs_fsck version 1.1.8, 03-May-2005
processing started: 12/4/2005 10.1.31
Using default parameter: -p
The current device is:  /dev/sda4
Block size in bytes:  4096
Filesystem size in blocks:  16844152
**Phase 0 - Replay Journal Log
Filesystem is clean.

   Despite their cleanliness, they still won't mount.  Do I need to  
go about restoring anything in LVM2 meta data in order to mount?   
I've read
this previous post about using vgcfgrestore and tried it with the  
newest file in /etc/lvm/archive/, but it had not effect after  
completing sucessfully.

pvr ~ # vgcfgrestore --file /etc/lvm/archive/myth-video-vg_00003.vg  
myth-video-vg
   Restored volume group myth-video-vg

pvr ~ # mount -t jfs /dev/myth-video-vg/myth-video /video
mount: wrong fs type, bad option, bad superblock on /dev/myth-video- 
vg/myth-video,
        missing codepage or other error
        In some cases useful info is found in syslog - try
        dmesg | tail  or so


   I'm really not sure what I need to do in order to get this VG  
mounted.  Any hints would be greatly appreciated.

    Here are some diagnostics:

pvr ~ # lvscan
   ACTIVE            '/dev/myth-video-vg/myth-video' [297.14 GB] inherit
pvr ~ # lvmdiskscan
   /dev/sda1 [       39.19 MB]
   /dev/sda2 [      964.84 MB]
   /dev/sda3 [        9.32 GB]
   /dev/sda4 [       64.26 GB] LVM physical volume
   /dev/sdb  [      232.89 GB] LVM physical volume
   0 disks
   3 partitions
   1 LVM physical volume whole disk
   1 LVM physical volume
pvr ~ # lvdisplay
   --- Logical volume ---
   LV Name                /dev/myth-video-vg/myth-video
   VG Name                myth-video-vg
   LV UUID                4gV513-mE25-gEkf-gCLp-LqWE-XvG8-CXziEv
   LV Write Access        read/write
   LV Status              available
   # open                 0
   LV Size                297.14 GB
   Current LE             76067
   Segments               2
   Allocation             inherit
   Read ahead sectors     0
   Block device           253:0

pvr ~ # pvdisplay
   --- Physical volume ---
   PV Name               /dev/sdb
   VG Name               myth-video-vg
   PV Size               232.88 GB / not usable 0
   Allocatable           yes (but full)
   PE Size (KByte)       4096
   Total PE              59618
   Free PE               0
   Allocated PE          59618
   PV UUID               0SUUxX-EVWj-Mquv-qCnR-NNHb-qMfp-v4uOnZ

   --- Physical volume ---
   PV Name               /dev/sda4
   VG Name               myth-video-vg
   PV Size               64.25 GB / not usable 0
   Allocatable           yes (but full)
   PE Size (KByte)       4096
   Total PE              16449
   Free PE               0
   Allocated PE          16449
   PV UUID               Bo4us4-JNx7-T71m-H7M6-AxFN-eH4m-1m0zvB

pvr ~ # pvscan
   PV /dev/sdb    VG myth-video-vg   lvm2 [232.88 GB / 0    free]
   PV /dev/sda4   VG myth-video-vg   lvm2 [64.25 GB / 0    free]
   Total: 2 [297.14 GB] / in use: 2 [297.14 GB] / in no VG: 0 [0   ]
pvr ~ # vgscan
   Reading all physical volumes.  This may take a while...
   Found volume group "myth-video-vg" using metadata type lvm2



--
Bill



--Apple-Mail-4-819682574
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=ISO-8859-1

<HTML><BODY style=3D"word-wrap: break-word; -khtml-nbsp-mode: space; =
-khtml-line-break: after-white-space; "><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font: normal =
normal normal 12px/normal Helvetica; min-height: 14px; "><BR></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">=A0 After a forced reboot while my 2.6.12 system was =
frozen, the JFS formatted LVM2 VG I have created will not mount upon =
startup.=A0 When I use the following command to mount it by hand, I get =
a generic bad superblock message:=A0</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font: normal =
normal normal 12px/normal Helvetica; min-height: 14px; "><BR></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">pvr ~ # mount -t jfs /dev/myth-video-vg/myth-video =
/video</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">mount: wrong fs type, bad =
option, bad superblock on /dev/myth-video-vg/myth-video,</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">=A0 =A0 =A0=A0 missing codepage or other =
error</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 =A0 =A0=A0 In some cases =
useful info is found in syslog - try</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">=A0 =A0 =A0=A0 =
dmesg | tail=A0 or so</DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; font: normal normal normal =
12px/normal Helvetica; min-height: 14px; "><BR></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">=A0 I ran jfs_fsck on both physical volumes that are =
part of the VG and one partition had a=A0detectable=A0error that was =
fixed by replaying the log.=A0 Now jfs_fsk reports two clean =
filesystems.=A0</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font: normal normal normal =
12px/normal Helvetica; min-height: 14px; "><BR></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">pvr ~ # jfs_fsck /dev/sdb=A0=A0</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">jfs_fsck version 1.1.8, 03-May-2005</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">processing started: 12/4/2005 10.1.24</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">Using default parameter: -p</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">The current device is:=A0 /dev/sdb</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">Block size in bytes:=A0 4096</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">Filesystem size in blocks:=A0 61049646</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">**Phase 0 - Replay Journal Log</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">Filesystem is clean.</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font: =
normal normal normal 12px/normal Helvetica; min-height: 14px; =
"><BR></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">pvr ~ # jfs_fsck =
/dev/sda4</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">jfs_fsck version 1.1.8, =
03-May-2005</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">processing started: 12/4/2005 =
10.1.31</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">Using default parameter: =
-p</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: =
0px; margin-left: 0px; ">The current device is:=A0 /dev/sda4</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">Block size in bytes:=A0 4096</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">Filesystem size in blocks:=A0 16844152</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">**Phase 0 - Replay Journal Log</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">Filesystem is clean.</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font: =
normal normal normal 12px/normal Helvetica; min-height: 14px; =
"><BR></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 Despite=A0their cleanliness, =
they still won't mount.=A0 Do I need to go about restoring anything in =
LVM2 meta data in order to mount?=A0 I've read=A0</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><A =
href=3D"https://www.redhat.com/archives/linux-lvm/2004-December/msg00048.h=
tml">this previous post</A>=A0about using=A0<FONT =
class=3D"Apple-style-span" face=3D"Courier" size=3D"3"><SPAN =
class=3D"Apple-style-span" style=3D"font-size: 13px;">vgcfgrestore =
</SPAN></FONT>and tried it with the newest file in /etc/lvm/archive/, =
but it had not effect after completing sucessfully.=A0</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font: normal normal normal 12px/normal Helvetica; =
min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">pvr ~ # =
vgcfgrestore --file /etc/lvm/archive/myth-video-vg_00003.vg =
myth-video-vg</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 Restored volume group =
myth-video-vg</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font: normal normal normal =
12px/normal Helvetica; min-height: 14px; "><BR></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">pvr ~ # mount -t jfs /dev/myth-video-vg/myth-video =
/video</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">mount: wrong fs type, bad =
option, bad superblock on /dev/myth-video-vg/myth-video,</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">=A0 =A0 =A0=A0 missing codepage or other =
error</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 =A0 =A0=A0 In some cases =
useful info is found in syslog - try</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">=A0 =A0 =A0=A0 =
dmesg | tail=A0 or so</DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; font: normal normal normal =
12px/normal Helvetica; min-height: 14px; "><BR></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font: normal normal normal 12px/normal Helvetica; =
min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">=A0 I'm =
really not sure what I need to do in order to get this VG mounted.=A0 =
Any hints would be greatly appreciated.=A0</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font: =
normal normal normal 12px/normal Helvetica; min-height: 14px; =
"><BR></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 =A0Here are some =
diagnostics:=A0</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font: normal normal normal =
12px/normal Helvetica; min-height: 14px; "><BR></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">pvr ~ # lvscan</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">=A0 ACTIVE=A0 =
=A0 =A0 =A0 =A0 =A0 '/dev/myth-video-vg/myth-video' [297.14 GB] =
inherit</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">pvr ~ # lvmdiskscan</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">=A0 /dev/sda1 [=A0 =A0 =A0=A0 39.19 MB]</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">=A0 /dev/sda2 [=A0 =A0 =A0 964.84 MB]</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">=A0 /dev/sda3 [=A0 =A0 =A0 =A0 9.32 GB]</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">=A0 /dev/sda4 [=A0 =A0 =A0=A0 64.26 GB] LVM physical =
volume</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 /dev/sdb=A0 [=A0 =A0 =A0 =
232.89 GB] LVM physical volume</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">=A0 0 =
disks</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 3 partitions</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">=A0 1 LVM physical volume whole disk</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">=A0 1 LVM physical volume</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">pvr ~ # lvdisplay</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">=A0 --- =
Logical volume ---</DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; ">=A0 LV Name=A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 /dev/myth-video-vg/myth-video</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">=A0 VG Name=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
myth-video-vg</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 LV UUID=A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 4gV513-mE25-gEkf-gCLp-LqWE-XvG8-CXziEv</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">=A0 LV Write Access=A0 =A0 =A0 =A0 =
read/write</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 LV Status=A0 =A0 =A0 =A0 =A0 =
=A0 =A0 available</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 # open=A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0=A0 0</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 LV Size=A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 297.14 GB</DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; ">=A0 Current LE=A0 =A0 =A0 =A0=
 =A0 =A0=A0 76067</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 Segments=A0 =A0 =A0 =A0 =A0 =
=A0 =A0=A0 2</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 Allocation=A0 =A0 =A0 =A0 =A0 =
=A0=A0 inherit</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 Read ahead sectors=A0 =A0=A0 =
0</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: =
0px; margin-left: 0px; ">=A0 Block device=A0 =A0 =A0 =A0 =A0=A0 =
253:0</DIV><P style=3D"margin: 0.0px 0.0px 0.0px 0.0px">=A0=A0</P><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">pvr ~ # pvdisplay</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">=A0 --- =
Physical volume ---</DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; ">=A0 PV Name=A0 =A0 =A0 =A0 =
=A0 =A0 =A0=A0 /dev/sdb</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">=A0 VG Name=A0 =
=A0 =A0 =A0 =A0 =A0 =A0=A0 myth-video-vg</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">=A0 PV =
Size=A0 =A0 =A0 =A0 =A0 =A0 =A0=A0 232.88 GB / not usable 0=A0=A0</DIV><DI=
V style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">=A0 Allocatable=A0 =A0 =A0 =A0 =A0=A0 yes (but =
full)</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 PE Size (KByte)=A0 =A0 =A0=A0 =
4096</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 Total PE=A0 =A0 =A0 =A0 =A0 =
=A0 =A0 59618</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 Free PE=A0 =A0 =A0 =A0 =A0 =A0=
 =A0=A0 0</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 Allocated PE=A0 =A0 =A0 =A0 =
=A0 59618</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 PV UUID=A0 =A0 =A0 =A0 =A0 =A0=
 =A0=A0 0SUUxX-EVWj-Mquv-qCnR-NNHb-qMfp-v4uOnZ</DIV><P style=3D"margin: =
0.0px 0.0px 0.0px 0.0px">=A0=A0</P><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">=A0 --- =
Physical volume ---</DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; ">=A0 PV Name=A0 =A0 =A0 =A0 =
=A0 =A0 =A0=A0 /dev/sda4</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">=A0 VG Name=A0 =
=A0 =A0 =A0 =A0 =A0 =A0=A0 myth-video-vg</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">=A0 PV =
Size=A0 =A0 =A0 =A0 =A0 =A0 =A0=A0 64.25 GB / not usable 0=A0=A0</DIV><DIV=
 style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">=A0 Allocatable=A0 =A0 =A0 =A0 =A0=A0 yes (but =
full)</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 PE Size (KByte)=A0 =A0 =A0=A0 =
4096</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 Total PE=A0 =A0 =A0 =A0 =A0 =
=A0 =A0 16449</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 Free PE=A0 =A0 =A0 =A0 =A0 =A0=
 =A0=A0 0</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 Allocated PE=A0 =A0 =A0 =A0 =
=A0 16449</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 PV UUID=A0 =A0 =A0 =A0 =A0 =A0=
 =A0=A0 Bo4us4-JNx7-T71m-H7M6-AxFN-eH4m-1m0zvB</DIV><P style=3D"margin: =
0.0px 0.0px 0.0px 0.0px">=A0=A0</P><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">pvr ~ # =
pvscan</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">=A0 PV /dev/sdb=A0 =A0 VG =
myth-video-vg=A0=A0 lvm2 [232.88 GB / 0=A0 =A0 free]</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">=A0 PV /dev/sda4=A0=A0 VG myth-video-vg=A0=A0 lvm2 =
[64.25 GB / 0=A0 =A0 free]</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">=A0 Total: 2 =
[297.14 GB] / in use: 2 [297.14 GB] / in no VG: 0 [0=A0=A0 ]</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">pvr ~ # vgscan</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">=A0 Reading =
all physical volumes.=A0 This may take a while...</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">=A0 Found volume group "myth-video-vg" using =
metadata type lvm2</DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; font: normal normal normal =
12px/normal Helvetica; min-height: 14px; "><BR></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font: normal normal normal 12px/normal Helvetica; =
min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font: normal =
normal normal 12px/normal Helvetica; min-height: 14px; "><BR></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">--</DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; ">Bill</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font: normal normal normal 12px/normal Helvetica; =
min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font: normal =
normal normal 12px/normal Helvetica; min-height: 14px; "><BR =
class=3D"khtml-block-placeholder"></DIV></BODY></HTML>=

--Apple-Mail-4-819682574--
