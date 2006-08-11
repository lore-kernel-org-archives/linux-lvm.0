Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7BJbiq9027797
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 15:37:44 -0400
Received: from exchange2k.lims.com (exchange2k.lims.com [65.119.219.231])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7BJbZPb028457
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 15:37:35 -0400
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C6BD7D.951BD730"
Subject: RE: RE: [linux-lvm] LVM2 on hardware RAID
Date: Fri, 11 Aug 2006 15:37:29 -0400
Message-ID: <73A8ABE78537AE4E9DB1D70863B8275F0330CD7F@exchange2k.lims.com>
From: "Musil, William" <wmusil@labvantage.com>
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

------_=_NextPart_001_01C6BD7D.951BD730
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_002_01C6BD7D.951BD730"


------_=_NextPart_002_01C6BD7D.951BD730
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thank you Greg, that was exactly what I needed. I was looking at =
pvextend. My
mistake.
I can now create another lv in the resized vg. Thanks again.
=20

William T. Musil=20
Manager, Technical Services=20

LabVantage Solutions, Inc.=20
1160 US Highway 22 East, Bridgewater, NJ 08807=20
p| 908.333.0111=20
f | 908.707.1179=20
e| wmusil@labvantage.com=20
i | www.labvantage.com=20

The information in this e-mail is confidential and may contain legally
privileged information. It is intended solely for the person or entity =
to
which it is addressed. Access to this e-mail by anyone else is =
unauthorized.
If you are not the intended recipient, any disclosure, copying, =
distribution,
action taken, or action omitted to be taken in reliance on it, is =
prohibited
and may be unlawful. If you received this e-mail in error, please =
contact the
sender and delete the material from any computer.

-----Original Message-----
From: linux-lvm-bounces@redhat.com =
[mailto:linux-lvm-bounces@redhat.com]On
Behalf Of Greg Hartzog
Sent: Friday, August 11, 2006 3:27 PM
To: 'LVM general discussion and development'
Subject: RE: [linux-lvm] LVM2 on hardware RAID



I believe you will do the following:

=20

"pvresive /dev/sdb"

=20

That will make the volume group now be 600GB.

=20

Then use "lvextend" to enlarge the logical volumes, and whatever the =
proper
tool is to extend the EXT3 filesystem.

=20

Best to have the logical volumes & volume group offline ("vgchange -a =
n")
before starting resizing.

=20

Just my $0.02.

=20


  _____ =20


From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] =
On
Behalf Of Musil, William
Sent: Friday, August 11, 2006 12:49 PM
To: linux-lvm@redhat.com
Subject: [linux-lvm] LVM2 on hardware RAID

=20

Hello all.=20

I have an issue, that I am not sure how to address.=20

How can I resize the physical volume if I change the geometry of the =
disk
(non-destructive resize of RAID volume at the hardware level)=20

I can see that the OS has picked up the new size of the disk and I would =
like
to resize the existing pv. I don't know how.

I started with a hardware raid 5 (400GB), linux automatically recognizes =
disk
as /dev/sdb=20

a simplistic representation of the setup is as follows=20

pvcreate /dev/sdb=20
vgcreate VolGroup10 /dev/sdb=20
lvcreate -n LogVol10 VolGroup10=20
mkfs.ext3 /dev/mapper/VolGroup10-LogVol10=20

I have added a disk and expand the array to 600GB I can still see every =
thing
but I don't know how to extend the PV.=20

filesystems OK=20
logical volumes OK=20
volume groups OK=20

linux sees /dev/sdb as 600GB=20
pvs shows pv /dev/sdb is 400GB. I wish to, non-destructively, =
reinitialize
/dev/sdb so that pvs shows 600GB. how?=20

=20

William T. Musil=20
Manager, Technical Services=20

LabVantage Solutions, Inc.=20
1160 US Highway 22 East, Bridgewater, NJ 08807=20
p| 908.333.0111=20
f | 908.707.1179=20
e| wmusil@labvantage.com=20
i | www.labvantage.com=20

The information in this e-mail is confidential and may contain legally
privileged information. It is intended solely for the person or entity =
to
which it is addressed. Access to this e-mail by anyone else is =
unauthorized.
If you are not the intended recipient, any disclosure, copying, =
distribution,
action taken, or action omitted to be taken in reliance on it, is =
prohibited
and may be unlawful. If you received this e-mail in error, please =
contact the
sender and delete the material from any computer.

<<Musil, William.vcf>>=20


------_=_NextPart_002_01C6BD7D.951BD730
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns=3D"http://www.w3.org/TR/REC-html40" xmlns:v =3D=20
"urn:schemas-microsoft-com:vml" xmlns:o =3D=20
"urn:schemas-microsoft-com:office:office" xmlns:w =3D=20
"urn:schemas-microsoft-com:office:word" xmlns:st1 =3D=20
"urn:schemas-microsoft-com:office:smarttags"><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<TITLE>LVM2 on hardware RAID</TITLE>

<META content=3D"MSHTML 6.00.2800.1561" name=3DGENERATOR><!--[if !mso]>
<STYLE>v\:* {
	BEHAVIOR: url(#default#VML)
}
o\:* {
	BEHAVIOR: url(#default#VML)
}
w\:* {
	BEHAVIOR: url(#default#VML)
}
.shape {
	BEHAVIOR: url(#default#VML)
}
</STYLE>
<![endif]--><o:SmartTagType name=3D"PostalCode"=20
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"></o:SmartTagT=
ype><o:SmartTagType=20
name=3D"State"=20
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"></o:SmartTagT=
ype><o:SmartTagType=20
name=3D"City"=20
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"></o:SmartTagT=
ype><o:SmartTagType=20
name=3D"place"=20
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"></o:SmartTagT=
ype><o:SmartTagType=20
name=3D"Street"=20
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"></o:SmartTagT=
ype><o:SmartTagType=20
name=3D"address"=20
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"></o:SmartTagT=
ype><o:SmartTagType=20
name=3D"PersonName"=20
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"></o:SmartTagT=
ype><!--[if !mso]>
<STYLE>st1\:* {
	BEHAVIOR: url(#default#ieooui)
}
</STYLE>
<![endif]-->
<STYLE>@font-face {
	font-family: Tahoma;
}
@page Section1 {size: 8.5in 11.0in; margin: 1.0in 1.0in 1.0in 1.0in; }
P.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: "Times New Roman"
}
LI.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: "Times New Roman"
}
DIV.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: "Times New Roman"
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
P {
	FONT-SIZE: 12pt; MARGIN-LEFT: 0in; MARGIN-RIGHT: 0in; FONT-FAMILY: =
"Times New Roman"; mso-margin-top-alt: auto; mso-margin-bottom-alt: auto
}
SPAN.EmailStyle18 {
	COLOR: navy; FONT-FAMILY: Arial; mso-style-type: personal-reply
}
DIV.Section1 {
	page: Section1
}
</STYLE>
</HEAD>
<BODY lang=3DEN-US vLink=3Dpurple link=3Dblue>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D773233519-11082006>Thank=20
you Greg, that was exactly what I needed. I was looking at pvextend. My=20
mistake.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D773233519-11082006>I can=20
now create another lv in the resized vg. Thanks =
again.</SPAN></FONT></DIV>
<DIV>&nbsp;</DIV>
<P><B><FONT face=3DArial color=3D#000000>William T. Musil</FONT></B> =
<BR><FONT=20
face=3DArial color=3D#000000 size=3D2>Manager, Technical Services</FONT> =
</P>
<P><FONT face=3DArial color=3D#000000 size=3D2>LabVantage Solutions, =
Inc.</FONT>=20
<BR><FONT face=3DArial color=3D#000000 size=3D2>1160 US Highway 22 East, =
Bridgewater,=20
NJ 08807</FONT> <BR><B><FONT face=3DArial color=3D#000000 =
size=3D2>p|</FONT></B><FONT=20
face=3DArial color=3D#000000 size=3D2> 908.333.0111</FONT> <BR><B><FONT =
face=3DArial=20
color=3D#000000 size=3D2>f |</FONT></B><FONT face=3DArial =
color=3D#000000 size=3D2>=20
908.707.1179 </FONT><BR><B><FONT face=3DArial color=3D#000000=20
size=3D2>e|</FONT></B><FONT face=3DArial color=3D#000000 =
size=3D2></FONT><U> <FONT=20
face=3DArial color=3D#0000ff size=3D2>wmusil@labvantage.com</FONT></U> =
<BR><B><FONT=20
face=3DArial color=3D#000000 size=3D2>i |</FONT></B><FONT face=3DArial =
color=3D#000000=20
size=3D2> www.labvantage.com</FONT><U></U> </P>
<P><FONT face=3DArial color=3D#000000 size=3D1>The information in this =
e-mail is=20
confidential and may contain legally privileged information. It is =
intended=20
solely for the person or entity to which it is addressed. Access to this =
e-mail=20
by anyone else is unauthorized. If you are not the intended recipient, =
any=20
disclosure, copying, distribution, action taken, or action omitted to be =
taken=20
in reliance on it, is prohibited and may be unlawful. If you received =
this=20
e-mail in error, please contact the sender and delete the material from =
any=20
computer.</FONT></P>
<BLOCKQUOTE dir=3Dltr style=3D"MARGIN-RIGHT: 0px">
  <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
  size=3D2>-----Original Message-----<BR><B>From:</B> =
linux-lvm-bounces@redhat.com=20
  [mailto:linux-lvm-bounces@redhat.com]<B>On Behalf Of </B>Greg=20
  Hartzog<BR><B>Sent:</B> Friday, August 11, 2006 3:27 PM<BR><B>To:</B> =
'LVM=20
  general discussion and development'<BR><B>Subject:</B> RE: [linux-lvm] =
LVM2 on=20
  hardware RAID<BR><BR></FONT></DIV>
  <DIV class=3DSection1>
  <P class=3DMsoNormal><FONT face=3DArial color=3Dnavy size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt; COLOR: navy; FONT-FAMILY: Arial">I believe =
you will do=20
  the following:<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial color=3Dnavy size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt; COLOR: navy; FONT-FAMILY: =
Arial"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial color=3Dnavy size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt; COLOR: navy; FONT-FAMILY: =
Arial">&#8220;pvresive=20
  /dev/sdb&#8221;<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial color=3Dnavy size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt; COLOR: navy; FONT-FAMILY: =
Arial"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial color=3Dnavy size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt; COLOR: navy; FONT-FAMILY: Arial">That will =
make the=20
  volume group now be 600GB.<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial color=3Dnavy size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt; COLOR: navy; FONT-FAMILY: =
Arial"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial color=3Dnavy size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt; COLOR: navy; FONT-FAMILY: Arial">Then use =
&#8220;lvextend&#8221;=20
  to enlarge the logical volumes, and whatever the proper tool is to =
extend the=20
  EXT3 filesystem.<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial color=3Dnavy size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt; COLOR: navy; FONT-FAMILY: =
Arial"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial color=3Dnavy size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt; COLOR: navy; FONT-FAMILY: Arial">Best to =
have the=20
  logical volumes &amp; volume group offline (&#8220;vgchange &#8211;a =
n&#8221;) before starting=20
  resizing.<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial color=3Dnavy size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt; COLOR: navy; FONT-FAMILY: =
Arial"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial color=3Dnavy size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt; COLOR: navy; FONT-FAMILY: Arial">Just my=20
  $0.02.<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial color=3Dnavy size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt; COLOR: navy; FONT-FAMILY: =
Arial"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <DIV>
  <DIV class=3DMsoNormal style=3D"TEXT-ALIGN: center" =
align=3Dcenter><FONT=20
  face=3D"Times New Roman" size=3D3><SPAN style=3D"FONT-SIZE: 12pt">
  <HR tabIndex=3D-1 align=3Dcenter width=3D"100%" SIZE=3D2>
  </SPAN></FONT></DIV>
  <P class=3DMsoNormal><B><FONT face=3DTahoma size=3D2><SPAN=20
  style=3D"FONT-WEIGHT: bold; FONT-SIZE: 10pt; FONT-FAMILY: =
Tahoma">From:</SPAN></FONT></B><FONT=20
  face=3DTahoma size=3D2><SPAN style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Tahoma">=20
  linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] =
<B><SPAN=20
  style=3D"FONT-WEIGHT: bold">On Behalf Of </SPAN></B>Musil, =
William<BR><B><SPAN=20
  style=3D"FONT-WEIGHT: bold">Sent:</SPAN></B> Friday, August 11, 2006 =
12:49=20
  PM<BR><B><SPAN style=3D"FONT-WEIGHT: bold">To:</SPAN></B> =
<st1:PersonName=20
  w:st=3D"on">linux-lvm@redhat.com</st1:PersonName><BR><B><SPAN=20
  style=3D"FONT-WEIGHT: bold">Subject:</SPAN></B> [linux-lvm] LVM2 on =
hardware=20
  RAID</SPAN></FONT><o:p></o:p></P></DIV>
  <P class=3DMsoNormal><FONT face=3D"Times New Roman" size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Hello all.</SPAN></FONT> =

  <o:p></o:p></P>
  <P><FONT face=3DArial size=3D2><SPAN style=3D"FONT-SIZE: 10pt; =
FONT-FAMILY: Arial">I=20
  have an issue, that I am not sure how to address.</SPAN></FONT>=20
<o:p></o:p></P>
  <P><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">How can I resize the =
physical=20
  volume if I change the geometry of the disk (non-destructive resize of =
RAID=20
  volume at the hardware level) </SPAN></FONT><o:p></o:p></P>
  <P><FONT face=3DArial size=3D2><SPAN style=3D"FONT-SIZE: 10pt; =
FONT-FAMILY: Arial">I=20
  can see that the OS has picked up the new size of the disk and I would =
like to=20
  resize the existing pv. I don't know how.</SPAN></FONT><o:p></o:p></P>
  <P><FONT face=3DArial size=3D2><SPAN style=3D"FONT-SIZE: 10pt; =
FONT-FAMILY: Arial">I=20
  started with a hardware raid 5 (400GB), linux automatically recognizes =
disk as=20
  /dev/sdb</SPAN></FONT> <o:p></o:p></P>
  <P><FONT face=3DArial size=3D2><SPAN style=3D"FONT-SIZE: 10pt; =
FONT-FAMILY: Arial">a=20
  simplistic representation of the setup is as follows</SPAN></FONT>=20
  <o:p></o:p></P>
  <P><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">pvcreate =
/dev/sdb</SPAN></FONT>=20
  <BR><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">vgcreate VolGroup10=20
  /dev/sdb</SPAN></FONT> <BR><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">lvcreate -n LogVol10=20
  VolGroup10</SPAN></FONT> <BR><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">mkfs.ext3=20
  /dev/mapper/VolGroup10-LogVol10</SPAN></FONT> <o:p></o:p></P>
  <P><FONT face=3DArial size=3D2><SPAN style=3D"FONT-SIZE: 10pt; =
FONT-FAMILY: Arial">I=20
  have added a disk and expand the array to 600GB I can still see every =
thing=20
  but I don't know how to extend the PV.</SPAN></FONT> <o:p></o:p></P>
  <P><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">filesystems =
OK</SPAN></FONT>=20
  <BR><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">logical volumes =
OK</SPAN></FONT>=20
  <BR><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">volume groups =
OK</SPAN></FONT>=20
  <o:p></o:p></P>
  <P><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">linux sees /dev/sdb as=20
  600GB</SPAN></FONT> <BR><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">pvs shows pv /dev/sdb is =
400GB. I=20
  wish to, non-destructively, reinitialize /dev/sdb so that pvs shows =
600GB.=20
  how?</SPAN></FONT> <o:p></o:p></P>
  <P class=3DMsoNormal><FONT face=3D"Times New Roman" size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P><B><FONT face=3DArial color=3Dblack size=3D3><SPAN=20
  style=3D"FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: black; =
FONT-FAMILY: Arial">William=20
  T. Musil</SPAN></FONT></B> <BR><FONT face=3DArial color=3Dblack =
size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: Arial">Manager, =
Technical=20
  Services</SPAN></FONT> <o:p></o:p></P>
  <P><FONT face=3DArial color=3Dblack size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: Arial">LabVantage =

  Solutions, Inc.</SPAN></FONT> <BR><st1:Street w:st=3D"on"><st1:address =

  w:st=3D"on"><FONT face=3DArial color=3Dblack size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: Arial">1160 US=20
  Highway</SPAN></FONT></st1:address></st1:Street><FONT face=3DArial =
color=3Dblack=20
  size=3D2><SPAN style=3D"FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: =
Arial"> 22=20
  East, <st1:place w:st=3D"on"><st1:City =
w:st=3D"on">Bridgewater</st1:City>,=20
  <st1:State w:st=3D"on">NJ</st1:State> <st1:PostalCode=20
  w:st=3D"on">08807</st1:PostalCode></st1:place></SPAN></FONT> =
<BR><B><FONT=20
  face=3DArial color=3Dblack size=3D2><SPAN=20
  style=3D"FONT-WEIGHT: bold; FONT-SIZE: 10pt; COLOR: black; =
FONT-FAMILY: Arial">p|</SPAN></FONT></B><FONT=20
  face=3DArial color=3Dblack size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: Arial">=20
  908.333.0111</SPAN></FONT> <BR><B><FONT face=3DArial color=3Dblack =
size=3D2><SPAN=20
  style=3D"FONT-WEIGHT: bold; FONT-SIZE: 10pt; COLOR: black; =
FONT-FAMILY: Arial">f=20
  |</SPAN></FONT></B><FONT face=3DArial color=3Dblack size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: Arial"> =
908.707.1179=20
  </SPAN></FONT><BR><B><FONT face=3DArial color=3Dblack size=3D2><SPAN=20
  style=3D"FONT-WEIGHT: bold; FONT-SIZE: 10pt; COLOR: black; =
FONT-FAMILY: Arial">e|</SPAN></FONT></B><U>=20
  </U><U><FONT face=3DArial color=3Dblue size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; COLOR: blue; FONT-FAMILY: =
Arial">wmusil@labvantage.com</SPAN></FONT></U>=20
  <BR><B><FONT face=3DArial color=3Dblack size=3D2><SPAN=20
  style=3D"FONT-WEIGHT: bold; FONT-SIZE: 10pt; COLOR: black; =
FONT-FAMILY: Arial">i=20
  |</SPAN></FONT></B><FONT face=3DArial color=3Dblack size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: Arial">=20
  www.labvantage.com</SPAN></FONT> <o:p></o:p></P>
  <P><FONT face=3DArial color=3Dblack size=3D1><SPAN=20
  style=3D"FONT-SIZE: 7.5pt; COLOR: black; FONT-FAMILY: Arial">The =
information in=20
  this e-mail is confidential and may contain legally privileged =
information. It=20
  is intended solely for the person or entity to which it is addressed. =
Access=20
  to this e-mail by anyone else is unauthorized. If you are not the =
intended=20
  recipient, any disclosure, copying, distribution, action taken, or =
action=20
  omitted to be taken in reliance on it, is prohibited and may be =
unlawful. If=20
  you received this e-mail in error, please contact the sender and =
delete the=20
  material from any computer.</SPAN></FONT><o:p></o:p></P>
  <P><FONT face=3DArial color=3Dblack size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: =
Arial">&lt;&lt;Musil,=20
  William.vcf&gt;&gt;=20
</SPAN></FONT><o:p></o:p></P></DIV></BLOCKQUOTE></BODY></HTML>

------_=_NextPart_002_01C6BD7D.951BD730--

------_=_NextPart_001_01C6BD7D.951BD730
Content-Type: text/x-vcard;
	name="Musil, William.vcf"
Content-Transfer-Encoding: base64
Content-Description: Musil, William.vcf
Content-Disposition: attachment;
	filename="Musil, William.vcf"

QkVHSU46VkNBUkQNClZFUlNJT046Mi4xDQpOOk11c2lsO1dpbGxpYW0NCkZOOk11c2lsLCBXaWxs
aWFtDQpBRFI7V09SSzo7QnJpZGdld2F0ZXINCkxBQkVMO1dPUks6QnJpZGdld2F0ZXINCkVNQUlM
O1BSRUY7SU5URVJORVQ6V011c2lsQGxhYnZhbnRhZ2UuY29tDQpSRVY6MjAwNDAzMDNUMTg1MjI0
Wg0KRU5EOlZDQVJEDQo=

------_=_NextPart_001_01C6BD7D.951BD730--
