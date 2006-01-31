Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0V4BY116065
	for <linux-lvm@redhat.com>; Mon, 30 Jan 2006 23:11:34 -0500
Received: from mail62.messagelabs.com (mail62.messagelabs.com
	[203.166.119.147])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id k0V4BSR1008065
	for <linux-lvm@redhat.com>; Mon, 30 Jan 2006 23:11:29 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C6261C.60326996"
Date: Tue, 31 Jan 2006 15:11:13 +1100
Message-ID: <02D761BC9D4519419CA2FAD93C583EF87F4C35@ir-exchange-srv.ir.local>
From: "Alexey Shinkin" <Alexey.Shinkin@prognosis.com>
Subject: [linux-lvm] Questions on LVM2 and device mapper
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.

------_=_NextPart_001_01C6261C.60326996
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

=20
Hi=20,=20All=20!
=20
A=20couple=20of=20questions=20on=20LVM2=20and=20device=20mapper=20:
=20
1.=20How=20corresponds=20logical=20devices=20in=20DM=20and=20=20logical=20=
volumes=20in=20LVM2=20?
=20=20are=20they=20the=20same=20things=20?
=20
2.=20In=20LVM1=20some=20I/O=20statistics=20were=20available=20for=20a=20LV=
=20(using=20ioctl=20we
could=20see=20reads/writes=20for
=20each=20allocated=20PE=20in=20LV=20structure)=20.=20Is=20there=20such=20=
thing=20in=20LVM2=20?=20=20How
can=20I=20get=20a=20=20numbe=20of=20reads/writes=20for=20a=20LV=20?
=20
Thanks=20
=20
Alexey=20Shinkin
=20
=20

_____________________________________________________________________=20

This=20email=20is=20intended=20only=20for=20the=20use=20of=20the=20individ=
ual=20or=20entity=20named=20above=20and=20may=20contain=20information=20th=
at=20is=20confidential=20and/or=20privileged.=20If=20you=20are=20not=20the=
=20intended=20recipient,=20you=20are=20hereby=20notified=20that=20any=20di=
ssemination,=20distribution=20or=20copying=20of=20this=20Email=20is=20stri=
ctly=20prohibited.=20If=20you=20have=20received=20this=20Email=20in=20erro=
r,=20please=20notify=20us=20immediately=20by=20return=20email=20or=20telep=
hone=20+61=202=209966=201066=20and=20destroy=20the=20original=20message.=20=
Thank=20You
_______________________________________________________________________
------_=_NextPart_001_01C6261C.60326996
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE=20HTML=20PUBLIC=20"-//W3C//DTD=20HTML=204.0=20Transitional//EN">=

<HTML><HEAD>
<META=20http-equiv=3DContent-Type=20content=3D"text/html;=20charset=3Dus-a=
scii">
<META=20content=3D"MSHTML=206.00.2800.1528"=20name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT=20face=3DArial=20size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT=20face=3DArial=20size=3D2><SPAN=20class=3D849250004-31012006>Hi=
=20,=20All=20
!</SPAN></FONT></DIV>
<DIV><FONT=20face=3DArial=20size=3D2><SPAN=20
class=3D849250004-31012006></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT=20face=3DArial=20size=3D2><SPAN=20class=3D849250004-31012006>A=20=
couple=20of=20
questions=20on=20LVM2=20and=20device=20mapper=20:</SPAN></FONT></DIV>
<DIV><FONT=20face=3DArial=20size=3D2><SPAN=20
class=3D849250004-31012006></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT=20face=3DArial=20size=3D2><SPAN=20class=3D849250004-31012006>1.=
=20How=20corresponds=20
logical=20devices=20in=20DM=20and&nbsp;=20logical=20volumes=20in=20LVM2=20=
?</SPAN></FONT></DIV>
<DIV><FONT=20face=3DArial=20size=3D2><SPAN=20class=3D849250004-31012006>&n=
bsp;=20are=20they=20the=20
same=20things=20?</SPAN></FONT></DIV>
<DIV><FONT=20face=3DArial=20size=3D2><SPAN=20
class=3D849250004-31012006></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT=20face=3DArial=20size=3D2><SPAN=20class=3D849250004-31012006>2.=
=20In=20LVM1=20some=20I/O=20
statistics=20were=20available=20for=20a=20LV=20(using=20ioctl=20we=20could=
=20see=20reads/writes=20
for</SPAN></FONT></DIV>
<DIV><FONT=20face=3DArial=20size=3D2><SPAN=20class=3D849250004-31012006>&n=
bsp;each=20allocated=20
PE=20in=20LV=20structure)=20.=20Is=20there=20such=20thing=20in=20LVM2=20?&=
nbsp;=20How=20can=20I=20get=20a=20
&nbsp;numbe=20of=20reads/writes&nbsp;for&nbsp;a&nbsp;LV=20?</SPAN></FONT><=
/DIV>
<DIV><FONT=20face=3DArial=20size=3D2><SPAN=20class=3D849250004-31012006></=
SPAN></FONT><FONT=20
face=3DArial=20size=3D2><SPAN=20class=3D849250004-31012006></SPAN></FONT><=
FONT=20face=3DArial=20
size=3D2><SPAN=20class=3D849250004-31012006></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT=20face=3DArial=20size=3D2><SPAN=20class=3D849250004-31012006>Th=
anks=20
</SPAN></FONT></DIV>
<DIV><FONT=20face=3DArial=20size=3D2></FONT>&nbsp;</DIV>
<DIV><SPAN=20style=3D"FONT-FAMILY:=20Arial"><FONT=20size=3D2>Alexey=20
Shinkin</FONT></SPAN></DIV>
<DIV><SPAN=20style=3D"FONT-FAMILY:=20Arial"><FONT=20size=3D2></FONT></SPAN=
>&nbsp;</DIV>
<DIV><SPAN=20style=3D"FONT-FAMILY:=20Arial"><FONT=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<BR>
_____________________________________________________________________=20<B=
R>
<BR>
This=20email=20is=20intended=20only=20for=20the=20use=20of=20the=20individ=
ual=20or=20entity=20named=20above=20and=20may=20contain=20information=20th=
at=20is=20confidential=20and/or=20privileged.=20If=20you=20are=20not=20the=
=20intended=20recipient,=20you=20are=20hereby=20notified=20that=20any=20di=
ssemination,=20distribution=20or=20copying=20of=20this=20Email=20is=20stri=
ctly=20prohibited.=20If=20you=20have=20received=20this=20Email=20in=20erro=
r,=20please=20notify=20us=20immediately=20by=20return=20email=20or=20telep=
hone=20+61=202=209966=201066=20and=20destroy=20the=20original=20message.=20=
Thank=20You<BR>
_______________________________________________________________________<BR=
>
</BODY></HTML>

------_=_NextPart_001_01C6261C.60326996--
