Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q09L93OW026113
	for <linux-lvm@redhat.com>; Mon, 9 Jan 2012 16:09:03 -0500
Received: from mail.midoco.de (mail.midoco.de [87.139.14.43])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q09L91L6003192
	for <linux-lvm@redhat.com>; Mon, 9 Jan 2012 16:09:01 -0500
Received: from titan.midoco.de (localhost [127.0.0.1])
	by mail.midoco.de (Postfix) with ESMTP id 3B77CC00B4
	for <linux-lvm@redhat.com>; Mon,  9 Jan 2012 21:09:00 +0000 (UTC)
Date: Mon, 9 Jan 2012 22:08:59 +0100
From: "Marcus Haarmann" <marcus.haarmann@midoco.de>
Message-ID: <H000006700be1aa4.1326143338.titan.midoco.de@MHS>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="2_0_c1_342281aMHTML_=_01"
Subject: [linux-lvm] lvcreate fails
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm <linux-lvm@redhat.com>

--2_0_c1_342281aMHTML_=_01
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi experts,
=20
I have configured an external disk array on Ubuntu (amd64, 2.6.32
kernel) with lvm2 (2.02.54)
The setup is as follows:
=20
--- Physical volume ---
  PV Name               /dev/fc_keep1a_1 (this is a symbolic link to a
fibre channel device)
  VG Name               vg_uni
  PV Size               555,23 GiB / not usable 2,20 MiB
  Allocatable           NO
  PE Size               4,00 MiB
  Total PE              142139
  Free PE               65339
  Allocated PE          76800
  PV UUID               SmOTSP-wPEd-ZruJ-XP8n-WpoL-anDN-ccG7dM
=20
vgdisplay vg_uni
  --- Volume group ---
  VG Name               vg_uni
  System ID            =20
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  20
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                4
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               555,23 GiB
  PE Size               4,00 MiB
  Total PE              142139
  Alloc PE / Size       76800 / 300,00 GiB
  Free  PE / Size       65339 / 255,23 GiB
  VG UUID               0VNl5W-W22T-HEow-LvNx-gopm-nS0z-FpjZvi

This is for a database working with raw devices (without filesystem), I
allocated multiple partitions:
100 GB root
50 GB blob1
50 GB blob2
100 GB data1
=20
When I try to allocate another area with 10 GB for a temporary space, I
get an error:
lvcreate -L 10G -n dbs_uni_tmp vg_uni
  Insufficient free space: 2560 extents needed, but only 0 available=20
=20
I did -vvv so the layout is printed (note there have been other lvm
partitions which have been dropped):
 Using cached label for /dev/fc_keep1a_1
        Using cached label for /dev/fc_keep1a_1
        Read vg_unister metadata (20) from /dev/fc_keep1a_1 at 47104
size 1723
        /dev/fc_keep1a_1 0:      0  25600: dbs_uni_root(0:0)
        /dev/fc_keep1a_1 1:  25600  25600: dbs_uni_data1(0:0)
        /dev/fc_keep1a_1 2:  51200  64000: NULL(0:0)
        /dev/fc_keep1a_1 3: 115200  12800: dbs_uni_blob1(0:0)
        /dev/fc_keep1a_1 4: 128000  12800: dbs_uni_blob2(0:0)
        /dev/fc_keep1a_1 5: 140800   1339: NULL(0:0)
    Archiving volume group "vg_unister" metadata (seqno 20).
    Creating logical volume dbs_unister_tmp
  Insufficient free space: 1338 extents needed, but only 0 available
      Unlocking /var/lock/lvm/V_vg_unister
        _undo_flock /var/lock/lvm/V_vg_unister
        Closed /dev/fc_keep1a_1

What can I do to be able to use the space ?
Thank you all for your thoughts !

Marcus Haarmann




--2_0_c1_342281aMHTML_=_01
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>

<META name=3DGENERATOR content=3D"MSHTML 8.00.6001.19046"></HEAD>
<BODY>
<DIV><SPAN class=3D682125820-09012012><FONT size=3D2 face=3DArial>Hi=20
experts,</FONT></SPAN>
</DIV>
<DIV><SPAN class=3D682125820-09012012><FONT size=3D2=20
face=3DArial></FONT></SPAN>&nbsp;
</DIV>
<DIV><SPAN class=3D682125820-09012012><FONT size=3D2 face=3DArial>I have c=
onfigured an=20
external disk array on Ubuntu&nbsp;(amd64, 2.6.32 kernel)&nbsp;with lvm2=20
(2.02.54)</FONT></SPAN>
</DIV>
<DIV><SPAN class=3D682125820-09012012><FONT size=3D2 face=3DArial>The set=
up is as=20
follows:</FONT></SPAN>
</DIV>
<DIV><SPAN class=3D682125820-09012012><FONT size=3D2=20
face=3DArial></FONT></SPAN>&nbsp;
</DIV>
<DIV><SPAN class=3D682125820-09012012><FONT size=3D2 face=3DArial>--- Phy=
sical volume=20
---<BR>
&nbsp; PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/fc_keep1a_1 (this is a symbolic link to a fibre channel device)<BR>
&nbsp;=20
VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
vg_uni<BR>
&nbsp; PV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
555,23 GiB / not usable 2,20 MiB<BR>
&nbsp;=20
Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
NO<BR>
&nbsp; PE=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
4,00 MiB<BR>
&nbsp; Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
142139<BR>
&nbsp; Free=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
65339<BR>
&nbsp; Allocated=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 76800<BR>
&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
SmOTSP-wPEd-ZruJ-XP8n-WpoL-anDN-ccG7dM</FONT></SPAN>
</DIV>
<DIV><SPAN class=3D682125820-09012012><FONT size=3D2=20
face=3DArial></FONT></SPAN>&nbsp;
</DIV>
<DIV><SPAN class=3D682125820-09012012><FONT size=3D2 face=3DArial>vgdispl=
ay=20
vg_uni<BR>
&nbsp; --- Volume group ---<BR>
&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
vg_uni<BR>
&nbsp; System=20
ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
<BR>
&nbsp;=20
Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;=20
lvm2<BR>
&nbsp; Metadata Areas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>
&nbsp; Metadata Sequence No&nbsp; 20<BR>
&nbsp; VG=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
read/write<BR>
&nbsp; VG=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
resizable<BR>
&nbsp; MAX=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
0<BR>
&nbsp; Cur=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
4<BR>
&nbsp; Open=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
0<BR>
&nbsp; Max=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
0<BR>
&nbsp; Cur=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
1<BR>
&nbsp; Act=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
1<BR>
&nbsp; VG=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
555,23 GiB<BR>
&nbsp; PE=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
4,00 MiB<BR>
&nbsp; Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
142139<BR>
&nbsp; Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 76800 /=20
300,00 GiB<BR>
&nbsp; Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
65339 / 255,23 GiB<BR>
&nbsp; VG=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
0VNl5W-W22T-HEow-LvNx-gopm-nS0z-FpjZvi<BR>
</FONT></SPAN>
</DIV>
<DIV><SPAN class=3D682125820-09012012><FONT size=3D2 face=3DArial>This is=
 for a=20
database working with raw devices (without filesystem), I allocated multi=
ple=20
partitions:</FONT></SPAN>
</DIV>
<DIV><SPAN class=3D682125820-09012012><FONT size=3D2 face=3DArial>100 GB=20
root</FONT></SPAN>
</DIV>
<DIV><SPAN class=3D682125820-09012012><FONT size=3D2 face=3DArial>50 GB=20
blob1</FONT></SPAN>
</DIV>
<DIV><SPAN class=3D682125820-09012012><FONT size=3D2 face=3DArial>50 GB=20
blob2</FONT></SPAN>
</DIV>
<DIV><SPAN class=3D682125820-09012012><FONT size=3D2 face=3DArial>100 GB=20
data1</FONT></SPAN>
</DIV>
<DIV><SPAN class=3D682125820-09012012><FONT size=3D2=20
face=3DArial></FONT></SPAN>&nbsp;
</DIV>
<DIV><SPAN class=3D682125820-09012012><FONT size=3D2 face=3DArial>When I t=
ry to=20
allocate another area with 10 GB for a temporary space, I get an=20
error:</FONT></SPAN>
</DIV>
<DIV><SPAN class=3D682125820-09012012><FONT size=3D2 face=3DArial>lvcreat=
e -L 10G -n=20
dbs_uni_tmp vg_uni<BR>
&nbsp; Insufficient free space: 2560 extents needed, but=20
only 0 available</FONT>&nbsp;</SPAN>
</DIV>
<DIV><SPAN class=3D682125820-09012012><FONT size=3D2=20
face=3DArial></FONT></SPAN>&nbsp;
</DIV>
<DIV><SPAN class=3D682125820-09012012><FONT size=3D2 face=3DArial>I did -=
vvv so the=20
layout is printed (note there have been other lvm partitions which have b=
een=20
dropped):</FONT></SPAN>
</DIV>
<DIV><SPAN class=3D682125820-09012012><FONT size=3D2 face=3DArial>&nbsp;U=
sing cached=20
label for /dev/fc_keep1a_1<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Using=20
cached label for /dev/fc_keep1a_1<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
Read vg_unister metadata (20) from /dev/fc_keep1a_1 at 47104 size=20
1723<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/fc_keep1a_1=20
0:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp; 25600:=20
dbs_uni_root(0:0)<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/fc_keep1a_1=20
1:&nbsp; 25600&nbsp; 25600:=20
dbs_uni_data1(0:0)<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
/dev/fc_keep1a_1 2:&nbsp; 51200&nbsp; 64000:=20
NULL(0:0)<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/fc_keep1a_1 3:=20
115200&nbsp; 12800:=20
dbs_uni_blob1(0:0)<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
/dev/fc_keep1a_1 4: 128000&nbsp; 12800:=20
dbs_uni_blob2(0:0)<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
/dev/fc_keep1a_1 5: 140800&nbsp;&nbsp; 1339: NULL(0:0)<BR>
&nbsp;&nbsp;&nbsp;=20
Archiving volume group "vg_unister" metadata (seqno 20).<BR>
&nbsp;&nbsp;&nbsp;=20
Creating logical volume dbs_unister_tmp<BR>
&nbsp; Insufficient free space: 1338=20
extents needed, but only 0 available<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Unlocking=20
/var/lock/lvm/V_vg_unister<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
_undo_flock=20
/var/lock/lvm/V_vg_unister<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed=20
/dev/fc_keep1a_1<BR>
</FONT></SPAN>
</DIV>
<DIV><FONT size=3D2 face=3DArial><SPAN=20
class=3D682125820-09012012>What</SPAN></FONT><FONT size=3D2 face=3DArial>=
<SPAN=20
class=3D682125820-09012012>&nbsp;can I do to be&nbsp;able to use the spac=
e=20
?</SPAN></FONT>
</DIV>
<DIV align=3Dleft><SPAN lang=3DDE>
<P align=3Dleft><FONT size=3D2 face=3DArial><SPAN class=3D682125820-09012=
012>Thank you=20
all for your thoughts !</SPAN></FONT>

</P>
<P align=3Dleft><FONT size=3D2 face=3DArial>Marcus=20
Haarmann<BR>
</FONT></SPAN>

</P></DIV></BODY></HTML>
--2_0_c1_342281aMHTML_=_01--
