Message-ID: <002401c1451e$b4fb0650$0202a8c0@thunder>
From: "www.simpsonsworld.de" <guest@jabubo.de>
Date: Mon, 24 Sep 2001 19:31:12 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0021_01C1452F.785DB0B0"
Subject: [linux-lvm] (no subject)
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
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0021_01C1452F.785DB0B0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello

My system crashes for some days and so my LVM-raid. the harddisks are =
all ok. I have installed Linux(Slackware 7.1) new. and compiled the =
kernel(2.2.18) in the same way the old was, with LVM 0.9. all settings =
are the same. the compilation was done successfully and at boot time =
stands "lvm -- Driver successfully initialized". Then I have compiled =
the LVM-tools and this was successfully too. after all ive tried to =
reactivate the old-lvm-partition and typed a "vgscan" and the program =
found the old one and this was inactive. so i ve typed "vgchange -ay" =
and there stands "vgchange -- LVM driver/module not loaded?". but the =
driver is loaded, according to the bootmsg. i ve recompiled the kernel =
and the tools and i ve tried the last version 1.0.1-rc2 and there was =
everytime the same problem that the driver couldn't be found. LVM as =
modul in the kernel was not successfully too. After all i ve tried the =
2.4.9 kernel but with no success.
Now i don't know what i can do to get the files from the raid, or to =
reactivate the raid. can someone other help ?

thx for help anyway !
Jan

------=_NextPart_000_0021_01C1452F.785DB0B0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2920.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>My system crashes for some days and so =
my LVM-raid.=20
the harddisks are all ok. I have installed Linux(Slackware 7.1) new. and =

compiled the kernel(2.2.18) in the same way the old was, with LVM 0.9. =
all=20
settings are the same. the compilation was done successfully and at boot =
time=20
stands "lvm -- Driver successfully initialized". Then I have compiled =
the=20
LVM-tools and this was successfully too. after all ive tried to =
reactivate the=20
old-lvm-partition and typed a "vgscan" and the program found the old one =
and=20
this was inactive. so i ve typed "vgchange -ay" and there stands =
"vgchange --=20
LVM driver/module not loaded?". but the driver is loaded, according to =
the=20
bootmsg. i ve recompiled the kernel and the tools and i ve tried the =
last=20
version 1.0.1-rc2 and there was everytime the same problem that the =
driver=20
couldn't be found. LVM as modul in the kernel was not successfully too. =
After=20
all i ve tried the 2.4.9 kernel but with no success.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Now i don't know what i can do to get =
the files=20
from the raid, or to reactivate the raid. can someone other help =
?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>thx for help anyway !</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Jan</FONT></DIV></BODY></HTML>

------=_NextPart_000_0021_01C1452F.785DB0B0--
