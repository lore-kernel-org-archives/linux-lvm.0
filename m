Message-ID: <03c901c3b84b$84dadde0$8d7ba8c0@ecrosstrade.com>
From: "John S. Hoch" <johnhoch@rasilient.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_03C6_01C3B808.768B5DC0"
Subject: [linux-lvm] LVM sharing questions
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
Date: Tue Dec  2 07:51:04 2003
List-Id: <linux-lvm.redhat.com>
To: Linux-LVM@Sistina.com
Cc: John S Hoch <johnhoch@rasilient.com>

This is a multi-part message in MIME format.

------=_NextPart_000_03C6_01C3B808.768B5DC0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have two questions regarding the sharing of LVM volumes in Linux.  I =
have read the text in the LVM Howto.

Suppose I have two sets of volume groups.  One set belongs to node A.  =
The other set belongs to node B.  I plan to use "vgchange -ay vgname" to =
bring up the volume groups during boot.  Each node only brings up the =
volume groups that belong to it.  That is why I specify the volume-group =
name to vgchange.

My questions concern vgscan. =20

1.  Suppose I only plan to run vgscan during boot.  Later, if I make =
changes to the LVM metadata for volume groups that belong to node A, I =
do not plan to inform node B (I do not run vgscan on node B after the =
changes are made).  So, node B will not have uptodate information on the =
volume groups that belong to node A, but those groups are not available =
to node B anyway (they have never been made available to node B by =
running vgchange on node B).  In this way, I do not need to shutdown =
node B for changes that only affect node A.  Will this work?
2.  Suppose I do run vgscan on node B after changes to the LVM metdata =
are made on node A.  Can I do this without following the sequence in the =
LVM Howto (first issue "vgchange -an" on node B, then make the changes =
on node A, then run vgscan on node B)?  I am hoping that I do not need =
to issue "vgchange -an" on node B because I am not making changes to =
volume groups that are available to node B.

Best regards,

John S. Hoch
Rasilient Systems
------=_NextPart_000_03C6_01C3B808.768B5DC0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I have&nbsp;two questions regarding the =
sharing of=20
LVM volumes in Linux.&nbsp; I have read the text in the LVM =
Howto.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Suppose I have two sets of volume =
groups.&nbsp; One=20
set belongs to node A.&nbsp; The other set belongs to node B.&nbsp; I =
plan to=20
use "vgchange -ay vgname" to bring up the volume groups during =
boot.&nbsp; Each=20
node only brings up the volume groups that belong to it.&nbsp; That is =
why I=20
specify the volume-group name to vgchange.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>My questions concern vgscan.&nbsp; =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>1.&nbsp; Suppose I only plan to run =
vgscan during=20
boot.&nbsp; Later, if I make changes to the LVM metadata for volume =
groups that=20
belong to node A, I do not plan to inform node B (I do not run vgscan on =
node B=20
after the changes are made).&nbsp; So, node B will not have uptodate =
information=20
on the volume groups that belong to node A, but those groups are not =
available=20
to node B anyway (they have never been made available to node B by =
running=20
vgchange on node B).&nbsp; In this way, I do not need to shutdown node B =
for=20
changes that only affect node A.&nbsp; </FONT><FONT face=3DArial =
size=3D2>Will this=20
work?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>2.&nbsp; Suppose I do run vgscan on =
node B after=20
changes to the LVM metdata are made on node A.&nbsp; Can I do this =
without=20
following the sequence in the LVM Howto (first issue "vgchange -an" on =
node B,=20
then make the changes on node A, then run vgscan on node B)? &nbsp;I am =
hoping=20
that I do not&nbsp;need to issue "vgchange -an" on node B because I am =
not=20
making changes to volume groups that are available to node =
B.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Best regards,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>John S. Hoch</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Rasilient =
Systems</FONT></DIV></BODY></HTML>

------=_NextPart_000_03C6_01C3B808.768B5DC0--
