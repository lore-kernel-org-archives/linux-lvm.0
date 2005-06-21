Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5LGSCu21881
	for <linux-lvm@redhat.com>; Tue, 21 Jun 2005 12:28:12 -0400
Received: from bokxing.nl.alt001.com (82-204-14-226.static.bbeyond.nl
	[82.204.14.226])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5LGRvVS027182
	for <linux-lvm@redhat.com>; Tue, 21 Jun 2005 12:28:02 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bokxing.nl.alt001.com (Postfix) with ESMTP id 61290C97C
	for <linux-lvm@redhat.com>; Tue, 21 Jun 2005 18:27:42 +0200 (CEST)
Received: from bokxing.nl.alt001.com ([127.0.0.1])
	by localhost (fixeer [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 13072-01 for <linux-lvm@redhat.com>;
	Tue, 21 Jun 2005 18:27:41 +0200 (CEST)
Received: from denie (53548F2B.cable.casema.nl [83.84.143.43])
	by bokxing.nl.alt001.com (Postfix) with ESMTP id 0E360C5EA
	for <linux-lvm@redhat.com>; Tue, 21 Jun 2005 18:27:41 +0200 (CEST)
Message-ID: <00b601c5767e$24e4d2e0$0203a8c0@denie>
From: "Denie Andriessen" <denie@bokxing.nl>
References: <001301c5766d$9d0090e0$e81ef88f@winxp>
Subject: Re: [linux-lvm] recover problem from hard disk failure
Date: Tue, 21 Jun 2005 18:27:40 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00B3_01C5768E.E84EA930"
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

------=_NextPart_000_00B3_01C5768E.E84EA930
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: quoted-printable

It is not possible !

Only option you *might* have, is to do a dd_rescue from the failing disk =
on to a new disk (I used same make/model), only works if the old disk =
sometimes still has a little life in it..=20

http://freshmeat.net/projects/ddrescue/

I used it once, took a LONG time, stopping and starting it, but =
recovered over 90% in the end
Patience, having a rubber hammer at hand, hitting it from time to =
time...

Else: restore from backup !
(You DO have a backup, right ?)

Denie
  ----- Original Message -----=20
  From: HYUN-CHUL KIM=20
  To: linux-lvm@redhat.com=20
  Sent: Tuesday, June 21, 2005 4:29 PM
  Subject: [linux-lvm] recover problem from hard disk failure


  Hi, all

  One among three hard disks constituting a LVM logical volume has =
failed.
  How to recover data from the other two hard disks?

  Sincerely,

  Hyun-Chul Kim

  Computational Cell Biology Laboratory
  Department of Biosystems
  Korea Advanced Institute of Science and Technology
  Yusung-Gu, Taejon 305-333
  Republic of Korea
------=_NextPart_000_00B3_01C5768E.E84EA930
Content-Type: text/html;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dks_c_5601-1987">
<META content=3D"MSHTML 6.00.2900.2668" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>It is not possible !</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Only option you *might* have, is to do =
a dd_rescue=20
from the failing disk on to a new disk (I used same make/model), only =
works if=20
the old disk sometimes still has a little life in it.. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><A=20
href=3D"http://freshmeat.net/projects/ddrescue/">http://freshmeat.net/pro=
jects/ddrescue/</A></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I used it once, took a LONG time, =
stopping and=20
starting it, but recovered over 90% in the end</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Patience, having a rubber hammer at =
hand, hitting=20
it from time to time...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Else: r</FONT><FONT face=3DArial =
size=3D2>estore from=20
backup !</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>(You DO have a backup, right =
?)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Denie</FONT></DIV>
<BLOCKQUOTE=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dsundol@kaist.ac.kr =
href=3D"mailto:sundol@kaist.ac.kr">HYUN-CHUL KIM</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A =
title=3Dlinux-lvm@redhat.com=20
  href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Tuesday, June 21, 2005 =
4:29=20
PM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> [linux-lvm] recover =
problem from=20
  hard disk failure</DIV>
  <DIV><FONT face=3DArial size=3D2></FONT><FONT face=3DArial =
size=3D2></FONT><BR></DIV>
  <DIV><FONT face=3D"Times New Roman" size=3D2>Hi, all</FONT></DIV>
  <DIV><FONT face=3D"Times New Roman" size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3D"Times New Roman" size=3D2>One&nbsp;among three hard =
disks=20
  constituting a LVM logical volume has failed.</FONT></DIV>
  <DIV><STRONG><FONT face=3D"Times New Roman">How to recover data from =
the other=20
  two hard disks?</FONT></STRONG></DIV>
  <DIV><FONT face=3D"Times New Roman" size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3D"Times New Roman" size=3D2>Sincerely,</FONT></DIV>
  <DIV><FONT face=3D"Times New Roman" size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3D"Times New Roman" size=3D2>Hyun-Chul =
Kim</FONT></DIV>
  <DIV><FONT face=3D"Times New Roman" size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3D"Times New Roman" size=3D2>Computational Cell =
Biology=20
  Laboratory<BR>Department of Biosystems<BR>Korea Advanced Institute of =
Science=20
  and Technology<BR>Yusung-Gu, Taejon 305-333<BR>Republic of=20
Korea</FONT></DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_00B3_01C5768E.E84EA930--
