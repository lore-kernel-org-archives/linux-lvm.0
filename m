Message-ID: <004c01c221c2$e6681cb0$8606a8c0@julio>
From: "Julio Faerman" <julio@centershopping.com.br>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPartTM-000-817cd363-a92f-4cfe-bda4-fd26d2877eae"
Subject: [linux-lvm] Logical volume is smaller than physical drive.
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
Date: Tue Jul  2 07:13:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPartTM-000-817cd363-a92f-4cfe-bda4-fd26d2877eae
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0049_01C221A9.C021DEB0"

------=_NextPart_000_0049_01C221A9.C021DEB0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have a  16G Raid 1 ( 2 scsi drives ) .=20
I added it to a vg called vg ( vgcreate vg /dev/md1 ) and then tried to =
create a logical volume of 16G. ( lvcreate -L16G -nmy_volume vg).
It failed and said that there was no space avaliable.
'vgdisplay vg'  showed that i had only 10G avaliable. where are my other =
6G ;) ??
Have any of you been thru something similer ?

Thanx !

Julio Faerman
------=_NextPart_000_0049_01C221A9.C021DEB0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4915.500" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I have a&nbsp;&nbsp;16G Raid 1&nbsp;( 2 =
scsi drives=20
)&nbsp;. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I added it to a vg called vg ( vgcreate =
vg /dev/md1=20
) and then tried to create a logical volume of 16G. ( lvcreate -L16G =
-nmy_volume=20
vg).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>It failed and said that there was no =
space=20
avaliable.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>'vgdisplay vg'&nbsp; showed that i had =
only 10G=20
avaliable. where are my other 6G ;) ??</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Have any of you been thru something =
similer=20
?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanx !</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Julio =
Faerman</FONT></DIV></BODY></HTML>

------=_NextPart_000_0049_01C221A9.C021DEB0--


------=_NextPartTM-000-817cd363-a92f-4cfe-bda4-fd26d2877eae--
