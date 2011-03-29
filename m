Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p2TFLSrR008435
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2011 11:21:28 -0400
Received: from smtp.bredband2.com (smtp.bredband2.com [83.219.192.166])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2TFLMBl006609
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2011 11:21:23 -0400
Received: from caramon (c-83-219-217-17.cust.bredband2.com [83.219.217.17])
	(Authenticated sender: ba9826)
	by smtp.bredband2.com (Postfix) with ESMTPA id E98E1E4A47
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2011 17:21:20 +0200 (CEST)
Message-ID: <DE6049702F6A4634890B18D047C27E03@caramon>
From: "Fredrik Skog" <fredrik.skog@rodang.se>
Date: Tue, 29 Mar 2011 17:21:55 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0150_01CBEE35.CD6CFB60"
Subject: [linux-lvm] How to fix missmatch between VG-size and LV-size?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

------=_NextPart_000_0150_01CBEE35.CD6CFB60
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

While adding a new disk to my LV i ended up with a crash during the =
resize2fs. Now I have LVM reporting different sizes for my VG and LV.
How do I fix this?

I tried to do a "vgreduce vgftp /dev/sde1" to remove my new drive again. =
This only gives me an error "Physical volume "/dev/sde1" still in use"
If I can revert the adding of the new drive, I planned on trying to =
vgcfgrestore to an archived config from before I added the drive and did =
the lvextend and resize2fs.
Is this a good way of solving the problem? I guess it's not possible to =
lvreduce the LV by the same amount i did lvextend it before, because the =
system still thinks the LV is the old size. I just want to get rid of =
the PV i added to the VG

I'm a bit confused on how to do this.

# vgdisplay
  --- Volume group ---
  VG Name               vgftp
  System ID            =20
  Format                lvm2
  Metadata Areas        13
  Metadata Sequence No  67
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               0
  Max PV                0
  Cur PV                12
  Act PV                12
  VG Size               5.59 TiB
  PE Size               4.00 MiB
  Total PE              1464180
  Alloc PE / Size       1089649 / 4.16 TiB
  Free  PE / Size       374531 / 1.43 TiB
  VG UUID               kOApX5-oTeV-cPWr-h41J-NxML-sbbj-WcKObC

 # lvdisplay
  --- Logical volume ---
  LV Name                /dev/vgftp/lvftp
  VG Name                vgftp
  LV UUID                l4EWSh-GOfD-n0Sx-7ZSG-RTVi-p7fC-ApyHZS
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                4.16 TiB
  Current LE             1089649
  Segments               14
  Allocation             inherit
  Read ahead sectors     auto
  =20

thank you
/Fredrik Skog
------=_NextPart_000_0150_01CBEE35.CD6CFB60
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META name=3DGENERATOR content=3D"MSHTML 8.00.6001.19019">
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT size=3D2 face=3DArial>Hello,</FONT></DIV>
<DIV><FONT size=3D2 face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2 face=3DArial>While adding a new disk to my LV =
i&nbsp;ended up=20
with a crash during the <SPAN class=3Dcode><FONT size=3D3=20
face=3D"Times New Roman">resize2fs. Now I have LVM reporting different =
sizes for=20
my VG and LV.</FONT></SPAN></FONT></DIV>
<DIV><SPAN class=3Dcode>How do I fix this?</SPAN></DIV>
<DIV><SPAN class=3Dcode><FONT size=3D2 =
face=3DArial></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3Dcode><FONT size=3D2 face=3DArial>I tried to do a =
"vgreduce vgftp=20
/dev/sde1" to remove my new drive again. This only gives me an error =
"Physical=20
volume "/dev/sde1" still in use"</FONT></SPAN></DIV>
<DIV><SPAN class=3Dcode><FONT size=3D2 face=3DArial>If I can revert the =
adding of the=20
new drive, I planned on trying to vgcfgrestore to an archived config =
from before=20
I added the drive and did the lvextend and =
resize2fs.</FONT></SPAN></DIV>
<DIV><SPAN class=3Dcode><FONT size=3D2 face=3DArial>Is this a good way =
of solving the=20
problem? I guess it's not possible to lvreduce the LV by the same amount =
i did=20
lvextend it before, because the system still thinks the LV is the old =
size. I=20
just want to get rid of the PV i added to the VG</FONT></SPAN></DIV>
<DIV><SPAN class=3Dcode><FONT size=3D2 =
face=3DArial></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3Dcode><FONT size=3D2 face=3DArial>I'm a bit confused =
on how to do=20
this.</FONT></SPAN></DIV>
<DIV><SPAN class=3Dcode><FONT size=3D2 =
face=3DArial></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3Dcode><FONT size=3D2 face=3DArial># =
vgdisplay<BR>&nbsp; --- Volume=20
group ---<BR>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
vgftp<BR>&nbsp; System=20
ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
<BR>&nbsp;=20
Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;=20
lvm2<BR>&nbsp; Metadata Areas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
13<BR>&nbsp; Metadata Sequence No&nbsp; 67<BR>&nbsp; VG=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
read/write<BR>&nbsp; VG=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
resizable<BR>&nbsp; MAX=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
0<BR>&nbsp; Cur=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp; Open=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
0<BR>&nbsp; Max=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
0<BR>&nbsp; Cur=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
12<BR>&nbsp; Act=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
12<BR>&nbsp; VG=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
5.59 TiB<BR>&nbsp; PE=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
4.00 MiB<BR>&nbsp; Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
1464180<BR>&nbsp; Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
1089649 /=20
4.16 TiB<BR>&nbsp; Free&nbsp; PE / =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
374531 / 1.43 TiB<BR>&nbsp; VG=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
kOApX5-oTeV-cPWr-h41J-NxML-sbbj-WcKObC</FONT></SPAN></DIV>
<DIV><SPAN class=3Dcode><FONT size=3D2 =
face=3DArial></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3Dcode><FONT size=3D2 face=3DArial>&nbsp;# =
lvdisplay<BR>&nbsp; ---=20
Logical volume ---<BR>&nbsp; LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/vgftp/lvftp<BR>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
vgftp<BR>&nbsp; LV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
l4EWSh-GOfD-n0Sx-7ZSG-RTVi-p7fC-ApyHZS<BR>&nbsp; LV Write=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>&nbsp; LV =

Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
NOT available<BR>&nbsp; LV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
4.16 TiB<BR>&nbsp; Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
1089649<BR>&nbsp;=20
Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
14<BR>&nbsp;=20
Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;=20
inherit<BR>&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp;=20
auto<BR>&nbsp;&nbsp; </FONT></SPAN></DIV>
<DIV><SPAN class=3Dcode><FONT size=3D2 =
face=3DArial></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3Dcode><FONT size=3D2 face=3DArial>thank =
you</FONT></SPAN></DIV>
<DIV><SPAN class=3Dcode><FONT size=3D2 face=3DArial>/Fredrik=20
Skog</FONT></SPAN></DIV></BODY></HTML>

------=_NextPart_000_0150_01CBEE35.CD6CFB60--
