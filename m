Message-ID: <006201bf0bb7$6eae4a60$030116ac@fd1>
From: "Fernando Dammous" <ferdam@internetcom.com.br>
Subject: [linux-lvm] LVM, raw-io, devfs
Date: Thu, 30 Sep 1999 23:48:23 -0300
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_005F_01BF0B9E.48761620"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Linux LVM msede <linux-lvm@msede.com>

This is a multi-part message in MIME format.

------=_NextPart_000_005F_01BF0B9E.48761620
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

 I would like help from the more experts in this matter, because I fear =
that I can in some way to lose or to corrupt my FS under LVM. =20
 =20
LVM 0.7 is installed (built into the kernel, which is still in the =
version 2.0.36) and working perfectly, with the root filesystem and swap =
in a LV (boot with initrd). =20
 =20
Now, I would like to install the devfs and mainly the raw-io.  =20
 =20
Can I install them in a kernel 2.0.36, which is already patched with =
LVM? =20
 =20
Should I apply the patches in which order (first devfs, later the =
raw-io, or vice versa)? =20
 =20
I intend to install Oracle8 using raw-io.  =20
The devfs isn't so important for me (should it be ?). =20

If anyone knows about restrictions or some clues I would thank a lot. =20

Thanks in advance

Fernando


------=_NextPart_000_005F_01BF0B9E.48761620
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
<DIV><FONT size=3D2><BR>&nbsp;I would like help&nbsp;from the more =
experts in this=20
matter, because I fear that I can in some way to lose or to corrupt my =
FS under=20
LVM.&nbsp; <BR>&nbsp; <BR>LVM 0.7 is installed (built into the kernel, =
which is=20
still in the version 2.0.36) and working perfectly, with the root =
filesystem and=20
swap in a LV (boot with initrd).&nbsp; <BR>&nbsp; <BR>Now, I would like =
to=20
install the devfs and mainly the raw-io.&nbsp;&nbsp; <BR>&nbsp; <BR>Can =
I=20
install them in a kernel 2.0.36, which is already patched with =
LVM?&nbsp;=20
<BR>&nbsp; <BR>Should I apply the patches in which order (first devfs, =
later the=20
raw-io, or vice versa)?&nbsp; <BR>&nbsp; <BR>I intend to install Oracle8 =
using=20
raw-io.&nbsp;&nbsp; <BR>The devfs isn't so important for me (should it =
be=20
?).&nbsp; </FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>If anyone knows about restrictions or some clues I =
would thank=20
a lot.&nbsp; </FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>Thanks in advance</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>Fernando</FONT></DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_005F_01BF0B9E.48761620--
