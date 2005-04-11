Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3BKHRO02375
	for <linux-lvm@redhat.com>; Mon, 11 Apr 2005 16:17:27 -0400
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPartTM-000-d2bfbb41-ae7b-4084-bc5f-4150a0de1dc9"
Date: Mon, 11 Apr 2005 16:17:19 -0400
Message-ID: <20BE9059B6FC2D4B9E8FF2A9E2C4EEBD0BDA5F65@HOS2KEXCHCL.howost.strykercorp.com>
From: "Havassy, Attila" <attila.havassy@stryker.com>
Subject: [linux-lvm] LVextend command
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
To: LINUX-LVM@SISTINA.COM

This is a multi-part message in MIME format.

------=_NextPartTM-000-d2bfbb41-ae7b-4084-bc5f-4150a0de1dc9
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C53ED3.765F7329"

------_=_NextPart_001_01C53ED3.765F7329
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Heinz, I am a Linux apprentice and I have created a logical volume as
follows:
=20
vgcreate sanvg2 /dev/sd[i-q]1
lvcreate -L 65830912 -n sanlv2 sanvg2
mkfs -t ext3 /dev/sanvg2/sanlv2
=20
I made an error and the number above should have been 84639744 (each lun
is 9g) so I would like to extend it by 18g what would the command string
be.
I appreciate your help.
=20
Attila Havassy
Stryker
  Orthopaedics
Cad/Cam Administrator
Phone: (201) 831-5093
Fax: (201) 831-4093
=20

------_=_NextPart_001_01C53ED3.765F7329
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2900.2604" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D928030720-11042005><FONT face=3DArial size=3D2>Heinz, =
I am a Linux=20
apprentice and I have created a logical volume as =
follows:</FONT></SPAN></DIV>
<DIV><SPAN class=3D928030720-11042005><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D928030720-11042005><FONT face=3DArial =
size=3D2>vgcreate sanvg2=20
/dev/sd[i-q]1</FONT></SPAN></DIV>
<DIV><SPAN class=3D928030720-11042005><FONT face=3DArial =
size=3D2>lvcreate -L 65830912=20
-n sanlv2 sanvg2</FONT></SPAN></DIV>
<DIV><SPAN class=3D928030720-11042005><FONT face=3DArial size=3D2>mkfs =
-t ext3=20
/dev/sanvg2/sanlv2</FONT></SPAN></DIV>
<DIV><SPAN class=3D928030720-11042005><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D928030720-11042005><FONT face=3DArial size=3D2>I made =
an error and=20
the number above should have been 84639744 (each lun is 9g) so I would =
like to=20
extend it by 18g what would the command string be.</FONT></SPAN></DIV>
<DIV><SPAN class=3D928030720-11042005><FONT face=3DArial size=3D2>I =
appreciate your=20
help.</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV align=3Dleft>
<DIV><STRONG><FONT color=3D#0000ff>Attila Havassy</FONT></STRONG></DIV>
<DIV><FONT face=3D"Century Gothic"><STRONG>Stryker</STRONG></FONT></DIV>
<DIV><FONT size=3D1>&nbsp; Orthopaedics</FONT></DIV>
<DIV><FONT color=3D#0000ff>Cad/Cam Administrator</FONT></DIV>
<DIV><FONT color=3D#0000ff>Phone: (201) 831-5093</FONT></DIV>
<DIV><FONT color=3D#0000ff>Fax: (201) 831-4093</FONT></DIV></DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------_=_NextPart_001_01C53ED3.765F7329--

------=_NextPartTM-000-d2bfbb41-ae7b-4084-bc5f-4150a0de1dc9--
