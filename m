Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1MEu2K07727
	for <linux-lvm@redhat.com>; Tue, 22 Feb 2005 09:56:02 -0500
Received: from rose.ctd.hcltech.com (rose.ctd.hcltech.com [202.54.64.23])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j1MEtx7C009014
	for <linux-lvm@redhat.com>; Tue, 22 Feb 2005 09:56:00 -0500
Content-Class: urn:content-classes:message
Message-ID: <5E95F910B7011042BCE5578F9A98A35602E1E7C9@sakthi.ctd.hcltech.com>
From: "Thiruvel Thirumoolan  - CTD, Chennai." <thiruvelt@hcltech.com>
Subject: RE: [linux-lvm] PV Name      unknown device 
Date: Tue, 22 Feb 2005 20:25:51 +0530
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C518EE.99F1A240"
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
To: LVM general discussion and development <linux-lvm@redhat.com>, jbg@qwest.net

This is a multi-part message in MIME format.

------_=_NextPart_001_01C518EE.99F1A240
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset="iso-8859-1"

I had a similar problem sometime back. I was using LVM2 and hence =
performed
a 'vgcfgrestore' and that helped me.
=20
Thiruvel

-----Original Message-----
From: James Griffith [mailto:jbg@qwest.net]
Sent: Tuesday, February 22, 2005 8:59 AM
To: linux-lvm@redhat.com
Subject: [linux-lvm] PV Name unknown device=20


I have a problem... my lvm is broken.. I ran pvscan and got this then =
ran
pvdisplay /dev/gdc and got that and then ran pvdisplay /dev/hdd and got
that. I was working then I broke it somehow..... Any help will be
appreciated greatly...
=20
James
=20
     # pvscan
  /dev/hdb: open failed: No medium found
  Couldn't find device with uuid =
'1UD81y-U11m-zUe1-Doya-cLmP-5Qy5-PM36GU'.
  PV /dev/hdc         VG vg_ftp   lvm2 [232.75 GB / 768.00 MB free]
  PV unknown device   VG vg_ftp   lvm2 [232.75 GB / 10.75 GB free]
  Total: 2 [465.50 GB] / in use: 2 [465.50 GB] / in no VG: 0 [0   ]

     #  pvdisplay /dev/hdc
  Couldn't find device with uuid =
'1UD81y-U11m-zUe1-Doya-cLmP-5Qy5-PM36GU'.
  Couldn't find all physical volumes for volume group vg_ftp.
  format_text: _vg_read failed to read VG vg_ftp
  Couldn't find device with uuid =
'1UD81y-U11m-zUe1-Doya-cLmP-5Qy5-PM36GU'.
  Couldn't find all physical volumes for volume group vg_ftp.
  format_text: _vg_read failed to read VG vg_ftp
  --- NEW Physical volume ---
  PV Name               /dev/hdc
  VG Name
  PV Size               232.88 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               ty0TuP-Xj5v-MZh3-1wV0-OHDm-uvu2-Goay71
=20
     # pvdisplay /dev/hdd
  --- Physical volume ---
  PV Name               /dev/hdd
  VG Name               vg_ftp
  PV Size               232.75 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       262144
  Total PE              931
  Free PE               43
  Allocated PE          888
  PV UUID               1UD81y-U11m-zUe1-Doya-cLmP-5Qy5-PM36GU
=20
=20
DISCLAIMER=20
This message and any attachment(s) contained here are information that =
is confidential, proprietary to HCL Technologies=20
and its customers. Contents may be privileged or otherwise protected by =
law. The information is solely intended for the=20
individual or the entity it is addressed to. If you are not the intended =
recipient of this message, you are not authorized to=20
read, forward, print, retain, copy or disseminate this message or any =
part of it. If you have received this e-mail in error,=20
please notify the sender immediately by return e-mail and delete it from =
your computer


------_=_NextPart_001_01C518EE.99F1A240
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 6.00.2800.1491" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><SPAN class=3D225565314-22022005><FONT face=3DArial color=3D#0000ff =
size=3D2>I had=20
a similar problem sometime back. I was using LVM2 and hence performed a=20
'vgcfgrestore' and that helped me.</FONT></SPAN></DIV>
<DIV><SPAN class=3D225565314-22022005><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D225565314-22022005><FONT face=3DArial color=3D#0000ff =

size=3D2>Thiruvel</FONT></SPAN></DIV>
<BLOCKQUOTE dir=3Dltr style=3D"MARGIN-RIGHT: 0px">
  <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
  size=3D2>-----Original Message-----<BR><B>From:</B> James Griffith=20
  [mailto:jbg@qwest.net]<BR><B>Sent:</B> Tuesday, February 22, 2005 8:59 =

  AM<BR><B>To:</B> linux-lvm@redhat.com<BR><B>Subject:</B> [linux-lvm] =
PV Name=20
  unknown device <BR><BR></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>I have a problem... my lvm is =
broken.. I ran=20
  pvscan and got this then ran pvdisplay /dev/gdc and got that and then =
ran=20
  pvdisplay /dev/hdd and got that. I was working then I broke it =
somehow.....=20
  Any help will be appreciated greatly...</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>James</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp;&nbsp; # =
pvscan<BR>&nbsp;=20
  /dev/hdb: open failed: No medium found<BR>&nbsp; Couldn't find device =
with=20
  uuid '1UD81y-U11m-zUe1-Doya-cLmP-5Qy5-PM36GU'.<BR>&nbsp; PV=20
  /dev/hdc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG =
vg_ftp&nbsp;&nbsp;=20
  lvm2 [232.75 GB / 768.00 MB free]<BR>&nbsp; PV unknown =
device&nbsp;&nbsp; VG=20
  vg_ftp&nbsp;&nbsp; lvm2 [232.75 GB / 10.75 GB free]<BR>&nbsp; Total: 2 =
[465.50=20
  GB] / in use: 2 [465.50 GB] / in no VG: 0 [0&nbsp;&nbsp; =
]<BR></DIV></FONT>
  <DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp;&nbsp; #&nbsp; =
pvdisplay=20
  /dev/hdc<BR>&nbsp; Couldn't find device with uuid=20
  '1UD81y-U11m-zUe1-Doya-cLmP-5Qy5-PM36GU'.<BR>&nbsp; Couldn't find all =
physical=20
  volumes for volume group vg_ftp.<BR>&nbsp; format_text: _vg_read =
failed to=20
  read VG vg_ftp<BR>&nbsp; Couldn't find device with uuid=20
  '1UD81y-U11m-zUe1-Doya-cLmP-5Qy5-PM36GU'.<BR>&nbsp; Couldn't find all =
physical=20
  volumes for volume group vg_ftp.<BR>&nbsp; format_text: _vg_read =
failed to=20
  read VG vg_ftp<BR>&nbsp; --- NEW Physical volume ---<BR>&nbsp; PV=20
  =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
  /dev/hdc<BR>&nbsp; VG Name<BR>&nbsp; PV=20
  =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
  232.88 GB<BR>&nbsp;=20
  =
Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  NO<BR>&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0<BR>&nbsp;=20
  Total=20
  =
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
  0<BR>&nbsp; Free=20
  =
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
  0<BR>&nbsp; Allocated =
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  0<BR>&nbsp; PV=20
  =
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
  ty0TuP-Xj5v-MZh3-1wV0-OHDm-uvu2-Goay71</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp;&nbsp; # pvdisplay=20
  /dev/hdd<BR>&nbsp; --- Physical volume ---<BR>&nbsp; PV=20
  =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
  /dev/hdd<BR>&nbsp; VG=20
  =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
  vg_ftp<BR>&nbsp; PV=20
  =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
  232.75 GB / not usable 0<BR>&nbsp;=20
  =
Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  yes<BR>&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  262144<BR>&nbsp; Total=20
  =
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
  931<BR>&nbsp; Free=20
  =
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
  43<BR>&nbsp; Allocated=20
  PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 888<BR>&nbsp; =
PV=20
  =
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
  1UD81y-U11m-zUe1-Doya-cLmP-5Qy5-PM36GU</FONT></DIV>
  <DIV>&nbsp;</DIV>
  <DIV><FONT face=3DArial =
size=3D2></FONT>&nbsp;</DIV></BLOCKQUOTE><div><p><font size=3D"1">
<a><b>DISCLAIMER:<br>=20
This message and any attachment(s) contained here are information that =
is confidential, proprietary to HCL Technologies=20
and its customers. Contents may be privileged or otherwise protected by =
law. The information is solely intended for the=20
individual or the entity it is addressed to. If you are not the intended =
recipient of this message, you are not authorized to=20
read, forward, print, retain, copy or disseminate this message or any =
part of it. If you have received this e-mail in error,=20
please notify the sender immediately by return e-mail and delete it from =
your computer
</a>

</font></p></div>
</BODY></HTML>

------_=_NextPart_001_01C518EE.99F1A240--
