Return-Path: <juspeace@dreamwiz.com>
Message-Id: <200105080129.f481TB104985@mail5.dreamwiz.com>
Date: Tue, 8 May 2001 10:29:06 +0900 (KST)
From: =?EUC-KR?B?wMzIq7yu?= <juspeace@dreamwiz.com>
MIME-Version: 1.0
Content-Type: MULTIPART/ALTERNATIVE; BOUNDARY="0-113807298-989285349=:4922"
Subject: [linux-lvm] Question about LVM
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
To: Linux-LVM@Sistina.com

--0-113807298-989285349=:4922
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII

HI! Heinz Manelshagen

I am hongseok Lee.
I am a student working on sungkyunkwan Univ. in korea.
I tried to construct Logical Volume Management (LVM) in my PC,
 but I don't know how I can't do anymore.

First I pactched Linux-version 2.4.0 and uploaded LVM 0.9.1-Beta5.
It is successfully.
So I maked 3 Physical volume. (/dev/hdb1, /dev/hdb2, /dev/hdb3)
And I tried to make VG, But it is not available.
I think PV's state are inactive is primary problem.
Therfore I can't do any progress.
How can I change this PV state is active and VG state is available?
Plz, check next text result and give me some advice.
I red LVM HOWTO. But there is no describe this problem.

- RESULT

pvscan.txt
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdb1" of VG "group1" [3.84 GB / 3.84 GB free]
pvscan -- inactive PV "/dev/hdb2" of VG "group1" [3.84 GB / 3.84 GB free]
pvscan -- inactive PV "/dev/hdb3" of VG "group1" [5.03 GB / 5.03 GB free]
pvscan -- total: 3 [12.72 GB] / in use: 3 [12.72 GB] / in no VG: 0 [0]


pvdisplay_hdb1.txt
--- Physical volume ---
PV Name               /dev/hdb1
VG Name               group1
PV Size               3.85 GB / NOT usable 1.47 MB [LVM: 124 KB]
PV#                   1
PV Status             NOT available
Allocatable           yes
Cur LV                0
PE Size (KByte)       4096
Total PE              984
Free PE               984
Allocated PE          0
PV UUID               FSebAC-CooV-3wl2-bAcm-k17y-vUFD-zbByTu


vgscan.txt
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "group1"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group


vgdisplay.txt
--- Volume group ---
VG Name               group1
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                0
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                3
Act PV                3
VG Size               12.72 GB
PE Size               4 MB
Total PE              3256
Alloc PE / Size       0 / 0
Free  PE / Size       3256 / 12.72 GB
VG UUID               3i0sjU-p0iT-azB5-FKeI-lNss-AB6G-uDmolp






-------------------------------------------------
DreamWiz Free Mail @ http://www.dreamwiz.com/
DreamSearch Click the world!!! http://search.dreamwiz.com/


--0-113807298-989285349=:4922
Content-Type: TEXT/HTML; CHARSET=US-ASCII

<HTML>
<BODY>

<BR>HI! Heinz Manelshagen
<BR>
<BR>I am hongseok Lee.
<BR>I am a student working on sungkyunkwan Univ. in korea.
<BR>I tried to construct Logical Volume Management (LVM) in my PC,
<BR>&nbsp;but I don't know how I can't do anymore.
<BR>
<BR>First I pactched Linux-version 2.4.0 and uploaded LVM 0.9.1-Beta5.
<BR>It is successfully.
<BR>So I maked 3 Physical volume. (/dev/hdb1, /dev/hdb2, /dev/hdb3)
<BR>And I tried to make VG, But it is not available.
<BR>I think PV's state are inactive is primary problem.
<BR>Therfore I can't do any progress.
<BR>How can I change this PV state is active and VG state is available?
<BR>Plz, check next text result and give me some advice.
<BR>I red LVM HOWTO. But there is no describe this problem.
<BR>
<BR>- RESULT
<BR>
<BR>pvscan.txt
<BR>pvscan -- reading all physical volumes (this may take a while...)
<BR>pvscan -- inactive PV "/dev/hdb1" of VG "group1" [3.84 GB / 3.84 GB free]
<BR>pvscan -- inactive PV "/dev/hdb2" of VG "group1" [3.84 GB / 3.84 GB free]
<BR>pvscan -- inactive PV "/dev/hdb3" of VG "group1" [5.03 GB / 5.03 GB free]
<BR>pvscan -- total: 3 [12.72 GB] / in use: 3 [12.72 GB] / in no VG: 0 [0]
<BR>
<BR>
<BR>pvdisplay_hdb1.txt
<BR>--- Physical volume ---
<BR>PV Name               /dev/hdb1
<BR>VG Name               group1
<BR>PV Size               3.85 GB / NOT usable 1.47 MB [LVM: 124 KB]
<BR>PV#                   1
<BR>PV Status             NOT available
<BR>Allocatable           yes
<BR>Cur LV                0
<BR>PE Size (KByte)       4096
<BR>Total PE              984
<BR>Free PE               984
<BR>Allocated PE          0
<BR>PV UUID               FSebAC-CooV-3wl2-bAcm-k17y-vUFD-zbByTu
<BR>
<BR>
<BR>vgscan.txt
<BR>vgscan -- reading all physical volumes (this may take a while...)
<BR>vgscan -- found inactive volume group "group1"
<BR>vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
<BR>vgscan -- WARNING: This program does not do a VGDA backup of your volume group
<BR>
<BR>
<BR>vgdisplay.txt
<BR>--- Volume group ---
<BR>VG Name               group1
<BR>VG Access             read/write
<BR>VG Status             NOT available/resizable
<BR>VG #                  0
<BR>MAX LV                256
<BR>Cur LV                0
<BR>Open LV               0
<BR>MAX LV Size           255.99 GB
<BR>Max PV                256
<BR>Cur PV                3
<BR>Act PV                3
<BR>VG Size               12.72 GB
<BR>PE Size               4 MB
<BR>Total PE              3256
<BR>Alloc PE / Size       0 / 0
<BR>Free  PE / Size       3256 / 12.72 GB
<BR>VG UUID               3i0sjU-p0iT-azB5-FKeI-lNss-AB6G-uDmolp
<BR>
<BR>
<BR>
<BR>
<BR></BODY>
</HTML>

<BR>

<BR>
<BR>

<BR>
<a HREF="http://www.dreamwiz.com/" TARGET=_blank><img SRC="http://mail.dreamwiz.com/juspeace/cgi-bin/receive_check.cgi?mailbox=Sent&uid_validity=00000000000953128345&uid=00000000000000000072,X00000&key=31f80147f77639b082b0be3fbf617f2f" BORDER="0"></a> <FONT SIZE=2><B>Your life on the net</FONT></B><br>
<img src="http://i.dreamwiz.com/dw/ko/n.gif" width=1 height=7 border="0"><br>
<span style="font-size: 8pt;">
DreamWiz Free Mail @ <a href="http://www.dreamwiz.com/" TARGET=_blank>http://www.dreamwiz.com/</a><br>
DreamSearch Click the world!!! &nbsp;<a href="http://search.dreamwiz.com/" TARGET=_blank>http://search.dreamwiz.com/</a></span>
<br>
<img src="http://i.dreamwiz.com/dw/ko/n.gif" width=1 height=8 border="0"><br>
<IMG SRC="http://i.dreamwiz.com/dw/ko/ma/pluscon.gif" width=491 HEIGHT=12 BORDER=0 usemap="#plus"> 
<map name="plus">
  <area shape="rect" coords="396,0,490,11" href="http://www.dreamwiz.com/is/backicon.htm" target=_top>
  <area shape="rect" coords="268,1,389,11" href="http://www.dreamwiz.com/is/dreamstart.htm" target=_top>
  <area shape="rect" coords="1,1,264,11" href="http://www.dreamwiz.com/gn/main.htm" target=_top>
</map>


--0-113807298-989285349=:4922--
