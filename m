Message-ID: <001201bf0495$017ef940$030116ac@fd1>
From: "Fernando Dammous" <ferdam@internetcom.com.br>
Subject: [linux-lvm] ERROR -157 reading data
Date: Tue, 21 Sep 1999 21:54:19 -0300
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000F_01BF047B.DB1D9220"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Linux LVM msede <linux-lvm@msede.com>

This is a multi-part message in MIME format.

------=_NextPart_000_000F_01BF047B.DB1D9220
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

I have created my vg00 (/dev/hdb2) with 1 LV (lv00).=20
After mounting it, I can work fine with lv00.=20
But, on next boot, vgscan removes /etc/lvmtab and /etc/lvmtab.d and it =
isn't able to create a new set of these files.
<SNIP>
vgscan -- reading data of volume group "vg00" from physical volume(s)
vgscan -- ERROR -157: can't get data of volume group "vg00" from =
physical volume(s)
vgscan -- ERROR -157: creating "/etc/lvmtab" and "/etc/lvmtab.d"

With others LVM tools also give almost same msgs :

vgcfgbackup -- reading volume group data for "vg00" from disk(s)I=20
vgcfgbackup -- ERROR -157: reading VGDA of "vg00"
vgcfgbackup -- ERROR -313: backing up volume group "vg00"

vgck -- reading volume group data for "vg00" from physical volume(s)
vgck -- ERROR -157: reading data of volume group "vg00" from physical =
volume(s)
vgck -- please DON'T run vgscan prior to vgcfgrestore

My disk is a IDE 3.2GB with 2 partitions :
# fdisk -l /dev/hdb

Disk /dev/hdb: 128 heads, 63 sectors, 785 cylinders
Units =3D cylinders of 8064 * 512 bytes

    Device   Boot    Start        End        Blocks         Id    System
/dev/hdb1                   1            5         20128+      83    =
Linux native
/dev/hdb2                   6         785     3144960        83    =
Unknown

The LVM program is built into my kernel (2.0.36) not as a module.
Am I missing something in my configuration?

Please help me!

Thanks in advance,

Fernando Dammous



------=_NextPart_000_000F_01BF047B.DB1D9220
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2614.3401" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT size=3D2>Hi all,</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>I have created&nbsp;my vg00 (/dev/hdb2) with 1 LV =
(lv00).=20
<BR>After mounting it, I can work fine with lv00. <BR>But, on next boot, =
vgscan=20
removes /etc/lvmtab and /etc/lvmtab.d and it isn't able to create a new =
set of=20
these files.<BR>&lt;SNIP&gt;<BR>vgscan -- reading data of volume group =
"vg00"=20
from physical volume(s)<BR>vgscan -- ERROR -157: can't get data of =
volume group=20
"vg00" from physical volume(s)<BR>vgscan -- ERROR -157: creating =
"/etc/lvmtab"=20
and "/etc/lvmtab.d"</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>With others LVM tools also give&nbsp;almost same =
msgs=20
:</FONT></DIV>
<DIV><FONT size=3D2><BR>vgcfgbackup -- reading volume group data for =
"vg00" from=20
disk(s)I <BR>vgcfgbackup -- ERROR -157: reading VGDA of =
"vg00"<BR>vgcfgbackup --=20
ERROR -313: backing up volume group "vg00"</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>vgck -- reading volume group data for "vg00" from =
physical=20
volume(s)<BR>vgck -- ERROR -157: reading data of volume group "vg00" =
from=20
physical volume(s)<BR>vgck -- please DON'T run vgscan prior to=20
vgcfgrestore<BR></FONT></DIV>
<DIV><FONT size=3D2>My disk is a IDE 3.2GB with 2 partitions =
:</FONT></DIV>
<DIV><FONT size=3D2># fdisk -l /dev/hdb</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>Disk /dev/hdb: 128 heads, 63 sectors, 785=20
cylinders</FONT></DIV>
<DIV><FONT size=3D2>Units =3D cylinders of 8064 * 512 bytes</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>&nbsp;&nbsp;&nbsp; Device&nbsp;&nbsp; =
Boot&nbsp;&nbsp;&nbsp;=20
Start&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
End&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =20
Blocks&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Id&nbsp;&nbsp;&nbsp;=20
System</FONT></DIV>
<DIV><FONT=20
size=3D2>/dev/hdb1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&=
nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp;20128+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;83&nbsp;&nbsp=
;&nbsp;=20
Linux native</FONT></DIV>
<DIV><FONT size=3D2><FONT=20
size=3D2>/dev/hdb2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
785&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3144960&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;83&nbsp;&nbsp;&nbsp;=20
Unknown</FONT></FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>The LVM program is built into my kernel (2.0.36) not =
as a=20
module.</FONT></DIV>
<DIV><FONT size=3D2>Am I missing something in my =
configuration?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>Please help me!</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>Thanks in advance,</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>Fernando Dammous</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>&nbsp;</DIV></FONT></BODY></HTML>

------=_NextPart_000_000F_01BF047B.DB1D9220--
