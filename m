Message-Id: <017101c1c7c9$3a6efa30$3200a8c0@warl0k>
From: "Glenn Shannon" <warl0k@lvcm.com>
References: <014a01c1c7c7$0a1e9400$3200a8c0@warl0k>
Subject: Re: [linux-lvm] pvmove error......and now I have no VG :(
MIME-Version: 1.0
Content-Type: multipart/alternative;
    boundary="----=_NextPart_000_016C_01C1C78E.691EE380"
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
Date: Sat Mar  9 18:18:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_016C_01C1C78E.691EE380
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Ah ha!

Nevermind....figured it out I think.

All I did was upgrade from 1.0.1-rc4 to 1.0.3 (figured the newer tools =
might have some better error handling) and then did a vgcfgrestore to =
all the partitions/new disk and then ran vgscan and *bam* it's back in =
business!

Thanks all!

Glenn
  ----- Original Message -----=20
  From: Glenn Shannon=20
  To: linux-lvm@sistina.com=20
  Sent: Saturday, March 09, 2002 5:03 PM
  Subject: [linux-lvm] pvmove error......and now I have no VG :(


  Hi Everyone!

  I just installed a new 60G hard drive that I bought, tried to follow =
section 16 of the HOWTO on the sistina website to move the data from a =
13G hard drive to the new 60G hard drive.

  During the vgreduce it segfaulted, and now my entire VG has =
disappeared *gasp*.

  What do I do now? I tried to look up how to recover from such a =
situation but alas, no dice.

  Any and all help is appreciated!

  long live LVM!

  Glenn

------=_NextPart_000_016C_01C1C78E.691EE380
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2713.1100" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Ah ha!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Nevermind....figured it out I =
think.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>All I did was upgrade from 1.0.1-rc4 to =
1.0.3=20
(figured the newer tools might have some better error handling) and then =
did a=20
vgcfgrestore to all the partitions/new disk and then ran vgscan and =
*bam* it's=20
back in business!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks all!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Glenn</FONT></DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dwarl0k@lvcm.com href=3D"mailto:warl0k@lvcm.com">Glenn =
Shannon</A>=20
</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A =
title=3Dlinux-lvm@sistina.com=20
  href=3D"mailto:linux-lvm@sistina.com">linux-lvm@sistina.com</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Saturday, March 09, 2002 =
5:03=20
  PM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> [linux-lvm] pvmove=20
  error......and now I have no VG :(</DIV>
  <DIV><BR></DIV>
  <DIV><FONT face=3DArial size=3D2>Hi Everyone!</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>I just installed a new 60G hard drive =
that I=20
  bought, tried to follow section 16 of the HOWTO on the sistina website =
to move=20
  the data from a 13G hard drive to the new 60G hard drive.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>During the vgreduce it segfaulted, =
and now my=20
  entire VG has disappeared *gasp*.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>What do I do now? I tried to look up =
how to=20
  recover from such a situation but alas, no dice.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Any and all help is =
appreciated!</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>long live LVM!</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial =
size=3D2>Glenn</FONT></DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_016C_01C1C78E.691EE380--
