Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0QMMnFR024393
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 17:22:49 -0500
Received: from mckesson.com (mailgw01.mckesson.com [143.112.144.27])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0QMMXXx027336
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 17:22:33 -0500
From: "Allen, Jack" <Jack.Allen@mckesson.com>
Content-class: urn:content-classes:message
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C98004.799ED8E3"
Date: Mon, 26 Jan 2009 16:21:45 -0600
Message-ID: <4905EFD192EEDF4A9A19EEE98C32B7F70EC5207D@DBQV3005.na.corp.mckesson.com>
Subject: [linux-lvm] Why is part of a PV not usable?
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

------_=_NextPart_001_01C98004.799ED8E3
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello:=20
        When I do "vgdisplay -v" or pvdisplay to see the PV, why is =
part
of the PV not usable?=20

 --- Physical volume ---=20
  PV Name               /dev/sdd1=20
  VG Name               vg01=20
  PV Size               10.00 GB / not usable 3.98 MB=20
  Allocatable           yes=20
  PE Size (KByte)       4096=20
  Total PE              2559=20
  Free PE               740=20
  Allocated PE          1819=20
  PV UUID               Q3LoGB-474h-ztit-HBA7-AUEX-OxpE-xoRo0J=20

-----=20
Thanks=20
Jack Allen=20


------_=_NextPart_001_01C98004.799ED8E3
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>

<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.5.7652.24">
<TITLE>Why is part of a PV not usable?</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT SIZE=3D2 FACE=3D"Arial">Hello:</FONT>

<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">When I do &quot;vgdisplay -v&quot; or pvdisplay to see =
the PV, why is part of the PV not usable?</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;--- Physical volume ---</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; PV =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; /dev/sdd1</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; VG =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; vg01</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; PV =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; 10.00 GB / not usable 3.98 MB</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; =
Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
yes </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; PE Size =
(KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; Total =
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 2559</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; Free =
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; 740</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; Allocated =
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1819</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; PV =
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; Q3LoGB-474h-ztit-HBA7-AUEX-OxpE-xoRo0J</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">-----</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Thanks</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Jack Allen</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C98004.799ED8E3--
