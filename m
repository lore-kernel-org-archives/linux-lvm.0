Message-ID: <025001c2f79b$7aedc6b0$64451c0a@dokho>
From: "Gaetan" <gaetan@avence.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_024D_01C2F7AC.3E6139F0"
Subject: [linux-lvm] Help for Vg max size
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
Date: Wed Apr  2 05:13:08 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_024D_01C2F7AC.3E6139F0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

ZanZiBar:~# vgdisplay
--- Volume group ---
VG Name               FILER
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                2
Open LV               1
MAX LV Size           255.99 GB
Max PV                256
Cur PV                2
Act PV                2
VG Size               230.06 GB
PE Size               4 MB
Total PE              58896
Alloc PE / Size       58893 / 230.05 GB
Free  PE / Size       3 / 12 MB
VG UUID               ExxNF9-89PZ-wHbC-LtKX-R3GL-Hp00-EVfvJt

I want to add 2 news disk but it tells me that i'm limited to 256 Gb

I'm told to do a vgcreate -s=20
but dunno what i have to type after and i'm afraid if i increase the =
current virtual group , data will be lost

Anyone could help me please -=20

thanks a lot

   =20



------=_NextPart_000_024D_01C2F7AC.3E6139F0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>ZanZiBar:~# vgdisplay<BR>--- Volume =
group ---<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
FILER<BR>VG=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
read/write<BR>VG=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
available/resizable<BR>VG=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0<BR>MAX=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
256<BR>Cur=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
2<BR>Open=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
1<BR>MAX LV =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.99 GB<BR>Max=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
256<BR>Cur=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
2<BR>Act=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
2<BR>VG=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
230.06 GB<BR>PE=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
4 MB<BR>Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
58896<BR>Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 58893 / =
230.05=20
GB<BR>Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3 / 12 =
MB<BR>VG=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
ExxNF9-89PZ-wHbC-LtKX-R3GL-Hp00-EVfvJt<BR><BR>I want to add 2 news disk =
but it=20
tells me that i'm limited to 256 Gb</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I'm told to do a vgcreate -s =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>but dunno what i have to type after and =
i'm afraid=20
if i increase the current virtual group , data will be lost</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Anyone could help me please - =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>thanks a lot</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; </DIV>
<DIV><BR></DIV></FONT></BODY></HTML>

------=_NextPart_000_024D_01C2F7AC.3E6139F0--
