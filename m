Message-ID: <016401c3c5e3$f1230cc0$f0bba5cc@patni.com>
From: "Neerav" <neerav.parikh@patni.com>
References: <01139FC052A0D411900B00508B9535FC0F0D2589@ZCH07EXM04.corp.mot.com>
Subject: Re: [linux-lvm] LVM2 not function
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0161_01C3C612.0ACA7FE0"
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
Date: Fri Dec 19 08:17:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0161_01C3C612.0ACA7FE0
Content-Type: text/plain;
	charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi Leo Li,

Please run "vgscan -ay" as this command will activate
all the VGs and hence the LVs in your system.

Also, check if this command is present in your
/etc/rc.sysinit boot script, so that your VGs and LVs
are available for auto mount after reboot.

Regards,
Neerav
  ----- Original Message -----=20
  From: Li Yang-r58472=20
  To: 'linux-lvm@sistina.com'=20
  Sent: Thursday, December 18, 2003 12:47 PM
  Subject: [linux-lvm] LVM2 not function


  Hi,

  =20

  I used LVM come with Redhat9 on my desktop computer.  Recent days I =
want to upgrade my kernel to 2.6.0-test11 which needs LVM2 to work with =
the device-mapper.  To be more up to date, I also recreated the lvs to =
use lvm2 metadata.  But when I rebooted the computer, new created lv =
can't mount.  It said it's not a valid block device.  So I check the =
status with "lvm lvscan", it showed that these lv turned to be inactive. =
 So I removed and recreated these lv.  Right after creation, these lvs =
were ACTIVE and mountable, but after reboot, they became inactive and =
unusable again.  Does anyone have clue?

  =20

  --

  Leo Li

  Software Engineer

  Metrowerks -- a Motorola company

  =20

  Office: +8610-65642272

  LeoLi@motorola.com

  =20


------=_NextPart_000_0161_01C3C612.0ACA7FE0
Content-Type: text/html;
	charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-2022-jp" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2919.6307" name=3DGENERATOR>
<STYLE>@font-face {
	font-family: SimSun;
}
@font-face {
	font-family: SimSun;
}
P.MsoNormal {
	FONT-FAMILY: "Times New Roman"; FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt
}
LI.MsoNormal {
	FONT-FAMILY: "Times New Roman"; FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt
}
DIV.MsoNormal {
	FONT-FAMILY: "Times New Roman"; FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt
}
A:link {
	COLOR: blue; TEXT-DECORATION: underline
}
SPAN.MsoHyperlink {
	COLOR: blue; TEXT-DECORATION: underline
}
A:visited {
	COLOR: purple; TEXT-DECORATION: underline
}
SPAN.MsoHyperlinkFollowed {
	COLOR: purple; TEXT-DECORATION: underline
}
P.MsoAutoSig {
	FONT-FAMILY: "Times New Roman"; FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt
}
LI.MsoAutoSig {
	FONT-FAMILY: "Times New Roman"; FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt
}
DIV.MsoAutoSig {
	FONT-FAMILY: "Times New Roman"; FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt
}
SPAN.EmailStyle17 {
	COLOR: windowtext; FONT-FAMILY: Arial
}
DIV.Section1 {
	page: Section1
}
</STYLE>
</HEAD>
<BODY bgColor=3D#ffffff lang=3DEN-US link=3Dblue vLink=3Dpurple>
<DIV><FONT face=3DVerdana size=3D1>Hi Leo Li,</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DVerdana size=3D1>Please run "vgscan -ay" as this =
command will=20
activate</FONT></DIV>
<DIV><FONT face=3DVerdana size=3D1>all the VGs and hence the LVs in your =

system.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DVerdana size=3D1>Also, check if this command is =
present in=20
your</FONT></DIV>
<DIV><FONT face=3DVerdana size=3D1>/etc/rc.sysinit boot script, so that =
your VGs and=20
LVs</FONT></DIV>
<DIV><FONT face=3DVerdana size=3D1>are available for auto mount after=20
reboot.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DVerdana size=3D1>Regards,</FONT></DIV>
<DIV><FONT face=3DVerdana size=3D1>Neerav</FONT></DIV>
<BLOCKQUOTE=20
style=3D"BORDER-LEFT: #000000 2px solid; MARGIN-LEFT: 5px; MARGIN-RIGHT: =
0px; PADDING-LEFT: 5px; PADDING-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A href=3D"mailto:LeoLi@motorola.com" title=3DLeoLi@motorola.com>Li=20
  Yang-r58472</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  href=3D"mailto:'linux-lvm@sistina.com'"=20
  title=3Dlinux-lvm@sistina.com>'linux-lvm@sistina.com'</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Thursday, December 18, =
2003 12:47=20
  PM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> [linux-lvm] LVM2 not=20
  function</DIV>
  <DIV><BR></DIV>
  <DIV class=3DSection1>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">Hi,</SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">&nbsp;</SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">I used LVM come with =
Redhat9 on my=20
  desktop computer. &nbsp;Recent days I want to upgrade my kernel to=20
  2.6.0-test11 which needs LVM2 to work with the device-mapper. &nbsp;To =
be more=20
  up to date, I also recreated the lvs to use lvm2 metadata.&nbsp; But =
when I=20
  rebooted the computer, new created lv can't mount.&nbsp; It said it's =
not a=20
  valid block device.&nbsp; So I check the status with "lvm lvscan", it =
showed=20
  that these lv turned to be inactive.&nbsp; So I removed and recreated =
these=20
  lv. &nbsp;Right after creation, these lvs were ACTIVE and mountable, =
but after=20
  reboot, they became inactive and unusable again.&nbsp; Does anyone =
have=20
  clue?</SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">&nbsp;</SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-FAMILY: 'Courier New'; FONT-SIZE: =
10pt">--</SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-FAMILY: 'Courier New'; FONT-SIZE: 10pt">Leo =
Li</SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-FAMILY: 'Courier New'; FONT-SIZE: 10pt">Software=20
  Engineer</SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-FAMILY: 'Courier New'; FONT-SIZE: 10pt">Metrowerks -- a =
Motorola=20
  company</SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-FAMILY: 'Courier New'; FONT-SIZE: =
10pt">&nbsp;</SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-FAMILY: 'Courier New'; FONT-SIZE: 10pt">Office:=20
  +8610-65642272</SPAN></FONT></P>
  <P class=3DMsoAutoSig><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-FAMILY: 'Courier New'; FONT-SIZE: =
10pt">LeoLi@motorola.com</SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Times New Roman" size=3D3><SPAN=20
  style=3D"FONT-SIZE: =
12pt">&nbsp;</SPAN></FONT></P></DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0161_01C3C612.0ACA7FE0--
