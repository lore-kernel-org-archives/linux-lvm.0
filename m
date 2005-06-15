Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5FGWmu26870
	for <linux-lvm@redhat.com>; Wed, 15 Jun 2005 12:32:48 -0400
Received: from zrtps0kn.nortelnetworks.com (zrtps0kn.nortelnetworks.com
	[47.140.192.55])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5FGWjP4019201
	for <linux-lvm@redhat.com>; Wed, 15 Jun 2005 12:32:45 -0400
Message-ID: <B06940B80A03814CAB09CDC85B9A987B21AED2@zctfhxm0.corp.nortel.com>
From: "David Plainfosse" <plaindav@nortel.com>
Date: Wed, 15 Jun 2005 12:31:38 -0400
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C571C7.B3F052C7"
Subject: [linux-lvm] Does LVM2 support mirrored volumes
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
To: "'linux-lvm@redhat.com'" <linux-lvm@redhat.com>
Cc: "Gameiro, Philippe" <Philippe.Gameiro@windriver.com>, Rachid Koucha <koucha@nortel.com>, "Giorgi,
	Alexandra" <Alexandra.Giorgi@windriver.com>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C571C7.B3F052C7
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I am looking for a corresponding Linux LVM2 option of the AIX LVM mklv  =
that
enables
mirrored copies when creating a Logical Volume=20

The mklv AIX option is :

-w MirrorWriteConsistency=20
y	Turns on mirror write consistency which insures data consistency
among mirrored copies of a logical volume during normal I/O processing.




I have read in archived emails that the lvcreate  -m1 option enables
mirrored copies but it is not officially
supported. Do you know if a particular LVM2 release support mirrored =
volumes
?
We plan to use lvm2-2.00.32 release.



David Plainfoss=E9
Architect GSM/UMTS Platform
Tel. : (33) 1 69 55 59 13 / ESN : 574 5913=20
Email: plaindav@nortel.com



------_=_NextPart_001_01C571C7.B3F052C7
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2658.2">
<TITLE>Does LVM2 support mirrored volumes</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2 FACE=3D"Arial">Hi,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I am looking for a corresponding Linux =
LVM2 option of the AIX LVM mklv&nbsp; that enables</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">mirrored copies when creating a =
Logical Volume </FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">The mklv AIX option is :</FONT>
</P>

<P><B><FONT FACE=3D"Times New Roman">-w</FONT></B><I> <FONT =
FACE=3D"Times New Roman">MirrorWriteConsistency</FONT></I><FONT =
FACE=3D"Times New Roman"> </FONT>
<BR><B><FONT FACE=3D"Times New =
Roman">y</FONT></B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
FACE=3D"Times New Roman">Turns on mirror write consistency which =
insures data consistency among mirrored copies of a logical volume =
during normal I/O processing. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<BR>
</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">I have read in archived emails that =
the lvcreate&nbsp; -m1 option enables mirrored copies but it is not =
officially</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">supported. Do you know if a =
particular LVM2 release support mirrored volumes ?</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">We plan to use</FONT> <FONT SIZE=3D2 =
FACE=3D"Palatino-Roman">lvm2-2.00.32 release.</FONT>
</P>
<BR>
<BR>

<P><B><FONT FACE=3D"Times New Roman">David Plainfoss=E9<BR>
</FONT></B><FONT FACE=3D"Times New Roman">Architect GSM/UMTS =
Platform<BR>
Tel. : (33) 1 69 55 59 13 / ESN : 574 5913<BR>
Email: plaindav@nortel.com</FONT>
</P>
<BR>

</BODY>
</HTML>
------_=_NextPart_001_01C571C7.B3F052C7--
