Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o150onp0021486
	for <linux-lvm@redhat.com>; Thu, 4 Feb 2010 19:50:50 -0500
Received: from relay.versatel.net (relay56.tele2.vuurwerk.nl [62.250.3.56])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o150oaoe029310
	for <linux-lvm@redhat.com>; Thu, 4 Feb 2010 19:50:37 -0500
Received: from [87.215.195.98] (helo=bokxing.nl.alt001.com)
	by relay.versatel.net with esmtp (Exim 4.69)
	(envelope-from <denie@bokxing.nl>) id 1NdCP5-0000nk-Pa
	for linux-lvm@redhat.com; Fri, 05 Feb 2010 01:50:36 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bokxing.nl.alt001.com (Postfix) with ESMTP id B372522013
	for <linux-lvm@redhat.com>; Fri,  5 Feb 2010 01:50:46 +0100 (CET)
Received: from bokxing.nl.alt001.com ([127.0.0.1])
	by localhost (bokxing.nl.alt001.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id YHmSJVLI9Vex for <linux-lvm@redhat.com>;
	Fri,  5 Feb 2010 01:50:46 +0100 (CET)
Received: from denie (53547AF6.cable.casema.nl [83.84.122.246])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by bokxing.nl.alt001.com (Postfix) with ESMTPSA id 0F57021F74
	for <linux-lvm@redhat.com>; Fri,  5 Feb 2010 01:50:45 +0100 (CET)
Message-ID: <EE33E85308ED454393CE31C706987805@denie>
From: "Denie Andriessen" <denie@bokxing.nl>
References: <00e101caa5f8$2460da40$6d228ec0$@edu>
Date: Fri, 5 Feb 2010 01:50:32 +0100
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0432_01CAA605.9A090490"
Subject: Re: [linux-lvm] A Question About LVM
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

------=_NextPart_000_0432_01CAA605.9A090490
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Mohammed,

my answers:
1) Yes, LVM has undergone a LOT of changes.. The current versions all =
are actually called ' LVM2'=20
That does suggest there was a LVM (1)...
LVM(1) was quite a bit different, it didn't even need the device mapper =
!!!=20
2) There are so much dates and revisions, check the ChangeLogs, and try =
and setup a CVS client for it, it has ALL the gory details, with dates =
and all !!
ALL !! Even the tiniest change is in there !!

Beware, it is a LOT of information !!!

LVM is like any Opensource project, following quite a few rules.. Check =
out wikipedia on it, and see when it has been added to the main kernel =
as experimental, and when the experimetal tag as been removed. You can =
check that out on kernel.org too !!

Okies, be warned.. learning about this, will take time and effort on =
your side.. All information is there !!! You only have to learn how to =
acces it !

There is no ready answer for your question in the format you request it.
All the information is in the CVS. Learn CVS, and it will give you all =
the answers..

Learn, and be happy!

Regards,
Denie =20


  ----- Original Message -----=20
  From: Mohammed Aziz Parande=20
  To: linux-lvm@redhat.com=20
  Sent: Friday, February 05, 2010 1:14 AM
  Subject: [linux-lvm] A Question About LVM


  Hi,

  =20

  I am a graduate student in the Department of Information Systems at =
the University of Maryland, Baltimore County (UMBC). I am doing research =
in the area of software engineering. I would very much appreciate if you =
could answer the following questions of mine:

  =20

  1. I was wondering if LVM has gone under any major =
restructuring/redesign initiative in its history. Restructuring/redesign =
initiative can be defined as a concerted effort during a time period in =
which major changes were applied to the code base to improve software =
architecture/design while little or no functional enhancement was made.=20

  =20

  2. If the project has gone under such an initiative, then would it be =
possible for you to give the dates or revision/release numbers that are =
"right before" and "right after" this structuring effort? I would like =
to checkout the source code from the repository to compare structural =
measurements that belong to "before" and "after" snapshots. Note that =
the dates and revision/release numbers should be right before and right =
after the initiative because I would like to be able to isolate and =
observe the effects of this effort.=20

  =20

  Your response will be very helpful in our research. Thank you very =
much for your time in advance. I look forward to hearing from you soon.

  =20

  =20

  Regards,

  =20

  Mohammed Aziz

  =20

  P.S. This research is solely performed for academic purposes.

  =20

  =20



-------------------------------------------------------------------------=
-----


  _______________________________________________
  linux-lvm mailing list
  linux-lvm@redhat.com
  https://www.redhat.com/mailman/listinfo/linux-lvm
  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
------=_NextPart_000_0432_01CAA605.9A090490
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns=3D"http://www.w3.org/TR/REC-html40" xmlns:v =3D=20
"urn:schemas-microsoft-com:vml" xmlns:o =3D=20
"urn:schemas-microsoft-com:office:office" xmlns:w =3D=20
"urn:schemas-microsoft-com:office:word" xmlns:x =3D=20
"urn:schemas-microsoft-com:office:excel" xmlns:m =3D=20
"http://schemas.microsoft.com/office/2004/12/omml"><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META name=3DGENERATOR content=3D"MSHTML 8.00.6001.18876">
<STYLE>@font-face {
	font-family: Cambria Math;
}
@font-face {
	font-family: Calibri;
}
@font-face {
	font-family: Consolas;
}
@page Section1 {size: 8.5in 11.0in; margin: 1.0in 1.0in 1.0in 1.0in; }
P.MsoNormal {
	MARGIN: 0in 0in 0pt; FONT-FAMILY: "Calibri","sans-serif"; FONT-SIZE: =
11pt
}
LI.MsoNormal {
	MARGIN: 0in 0in 0pt; FONT-FAMILY: "Calibri","sans-serif"; FONT-SIZE: =
11pt
}
DIV.MsoNormal {
	MARGIN: 0in 0in 0pt; FONT-FAMILY: "Calibri","sans-serif"; FONT-SIZE: =
11pt
}
A:link {
	COLOR: blue; TEXT-DECORATION: underline; mso-style-priority: 99
}
SPAN.MsoHyperlink {
	COLOR: blue; TEXT-DECORATION: underline; mso-style-priority: 99
}
A:visited {
	COLOR: purple; TEXT-DECORATION: underline; mso-style-priority: 99
}
SPAN.MsoHyperlinkFollowed {
	COLOR: purple; TEXT-DECORATION: underline; mso-style-priority: 99
}
P.MsoPlainText {
	MARGIN: 0in 0in 0pt; FONT-FAMILY: Consolas; FONT-SIZE: 10.5pt; =
mso-style-priority: 99; mso-style-link: "Plain Text Char"
}
LI.MsoPlainText {
	MARGIN: 0in 0in 0pt; FONT-FAMILY: Consolas; FONT-SIZE: 10.5pt; =
mso-style-priority: 99; mso-style-link: "Plain Text Char"
}
DIV.MsoPlainText {
	MARGIN: 0in 0in 0pt; FONT-FAMILY: Consolas; FONT-SIZE: 10.5pt; =
mso-style-priority: 99; mso-style-link: "Plain Text Char"
}
SPAN.EmailStyle17 {
	FONT-FAMILY: "Calibri","sans-serif"; COLOR: windowtext; mso-style-type: =
personal-compose
}
SPAN.PlainTextChar {
	FONT-FAMILY: Consolas; mso-style-priority: 99; mso-style-link: "Plain =
Text"; mso-style-name: "Plain Text Char"
}
.MsoChpDefault {
	mso-style-type: export-only
}
DIV.Section1 {
	page: Section1
}
</STYLE>
<!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]--></HEAD>
<BODY lang=3DEN-US link=3Dblue bgColor=3D#ffffff vLink=3Dpurple>
<DIV><FONT size=3D2 face=3DArial>Hello Mohammed,</FONT></DIV>
<DIV><FONT size=3D2 face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2 face=3DArial>my answers:</FONT></DIV>
<DIV><FONT size=3D2 face=3DArial>1) Yes, LVM has undergone a LOT of =
changes.. The=20
current versions all are actually called ' LVM2' </FONT></DIV>
<DIV><FONT size=3D2 face=3DArial>That does suggest there was a LVM=20
(1)...</FONT></DIV>
<DIV><FONT size=3D2 face=3DArial>LVM(1) was quite a bit different, it =
didn't even=20
need the device mapper !!! </FONT></DIV>
<DIV><FONT size=3D2 face=3DArial>2) There are so much dates and =
revisions, check the=20
ChangeLogs, and try and setup a CVS client for it, it has ALL the gory =
details,=20
with dates and all !!</FONT></DIV>
<DIV><FONT size=3D2 face=3DArial>ALL !! Even the tiniest change is in =
there=20
!!</FONT></DIV>
<DIV><FONT size=3D2 face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2 face=3DArial>Beware, it is a LOT of information =
!!!</FONT></DIV>
<DIV><FONT size=3D2 face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2 face=3DArial>LVM is like any Opensource project, =
following quite=20
a few rules.. Check out wikipedia on it, and see when it has been added =
to the=20
main kernel as experimental, and when the experimetal tag as been =
removed. You=20
can check that out on kernel.org too !!</FONT></DIV>
<DIV><FONT size=3D2 face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2 face=3DArial>Okies, be warned.. learning about this, =
will take=20
time and effort on your side.. All information is there !!! You only =
have=20
to&nbsp;learn how to acces it !</FONT></DIV>
<DIV><FONT size=3D2 face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2 face=3DArial>There is no ready answer for your =
question in the=20
format you request it.</FONT></DIV>
<DIV><FONT size=3D2 face=3DArial>All the information is in the CVS. =
Learn&nbsp;CVS,=20
and it will&nbsp;give you all the answers..</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2 face=3DArial>Learn, and be happy!</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2 face=3DArial>Regards,</FONT></DIV>
<DIV><FONT size=3D2 face=3DArial>Denie</FONT>&nbsp;&nbsp;</DIV>
<DIV><FONT size=3D2 face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2 face=3DArial></FONT>&nbsp;</DIV>
<BLOCKQUOTE=20
style=3D"BORDER-LEFT: #000000 2px solid; PADDING-LEFT: 5px; =
PADDING-RIGHT: 0px; MARGIN-LEFT: 5px; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"FONT: 10pt arial; BACKGROUND: #e4e4e4; font-color: =
black"><B>From:</B>=20
  <A title=3Dparande1@umbc.edu =
href=3D"mailto:parande1@umbc.edu">Mohammed Aziz=20
  Parande</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A =
title=3Dlinux-lvm@redhat.com=20
  href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Friday, February 05, 2010 =
1:14=20
  AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> [linux-lvm] A Question =
About=20
  LVM</DIV>
  <DIV><FONT size=3D2 face=3DArial></FONT><FONT size=3D2 =
face=3DArial></FONT><FONT=20
  size=3D2 face=3DArial></FONT><FONT size=3D2 face=3DArial></FONT><FONT =
size=3D2=20
  face=3DArial></FONT><FONT size=3D2 face=3DArial></FONT><BR></DIV>
  <DIV class=3DSection1>
  <P class=3DMsoPlainText>Hi,<o:p></o:p></P>
  <P class=3DMsoPlainText><o:p>&nbsp;</o:p></P>
  <P class=3DMsoPlainText>I am a graduate student in the Department of =
Information=20
  Systems at the University of Maryland, Baltimore County (UMBC). I am =
doing=20
  research in the area of software engineering. I would very much =
appreciate if=20
  you could answer the following questions of mine:<o:p></o:p></P>
  <P class=3DMsoPlainText><o:p>&nbsp;</o:p></P>
  <P class=3DMsoPlainText>1. I was wondering if LVM has gone under any =
major=20
  restructuring/redesign initiative in its history. =
Restructuring/redesign=20
  initiative can be defined as a concerted effort during a time period =
in which=20
  major changes were applied to the code base <SPAN style=3D"COLOR: =
#1f497d">to=20
  </SPAN>improve software architecture/design<SPAN style=3D"COLOR: =
#1f497d">=20
  </SPAN>while little or no functional enhancement<SPAN style=3D"COLOR: =
#1f497d">=20
  </SPAN>was made. <o:p></o:p></P>
  <P class=3DMsoPlainText><o:p>&nbsp;</o:p></P>
  <P class=3DMsoPlainText>2. If the project has gone under such an =
initiative,=20
  then would it be possible for you to give the dates or =
revision/release=20
  numbers that are "right before" and "right after" this structuring =
effort? I=20
  would like to checkout the source code from the repository to compare=20
  structural measurements that belong to "before" and "after" snapshots. =
Note=20
  that the dates and revision/release numbers should be right before and =
right=20
  after the initiative because I would like to be able to isolate and =
observe=20
  the effects of this effort. <o:p></o:p></P>
  <P class=3DMsoPlainText><o:p>&nbsp;</o:p></P>
  <P class=3DMsoPlainText>Your response will be very helpful in our =
research.=20
  Thank you very much for your time in advance. I look forward to =
hearing from=20
  you soon.<o:p></o:p></P>
  <P class=3DMsoPlainText><o:p>&nbsp;</o:p></P>
  <P class=3DMsoPlainText><o:p>&nbsp;</o:p></P>
  <P class=3DMsoPlainText>Regards,<o:p></o:p></P>
  <P class=3DMsoPlainText><o:p>&nbsp;</o:p></P>
  <P class=3DMsoPlainText>Mohammed Aziz<o:p></o:p></P>
  <P class=3DMsoPlainText><SPAN=20
  style=3D"FONT-FAMILY: 'Calibri','sans-serif'; COLOR: #1f497d; =
FONT-SIZE: 11pt"><o:p>&nbsp;</o:p></SPAN></P>
  <P class=3DMsoPlainText>P.S. This research is solely performed for =
academic=20
  purposes.<o:p></o:p></P>
  <P class=3DMsoNormal><o:p>&nbsp;</o:p></P>
  <P class=3DMsoNormal><o:p>&nbsp;</o:p></P></DIV>
  <P>
  <HR>

  <P></P>_______________________________________________<BR>linux-lvm =
mailing=20
  =
list<BR>linux-lvm@redhat.com<BR>https://www.redhat.com/mailman/listinfo/l=
inux-lvm<BR>read=20
  the LVM HOW-TO at =
http://tldp.org/HOWTO/LVM-HOWTO/</BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0432_01CAA605.9A090490--
