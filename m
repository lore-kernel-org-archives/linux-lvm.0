Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0NFfKVW014177
	for <linux-lvm@redhat.com>; Wed, 23 Jan 2008 10:41:20 -0500
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id m0NFeoua023340
	for <linux-lvm@redhat.com>; Wed, 23 Jan 2008 10:40:50 -0500
Message-ID: <C01E9F21E783445AB830B0D165A98DE6@t1000>
From: "David Steinberg" <klusou@gmx.de>
Date: Wed, 23 Jan 2008 16:42:31 +0100
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0068_01C85DDE.F25F64C0"
Subject: [linux-lvm] How to set the "OPEN" - Attribute manual to 0 
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

------=_NextPart_000_0068_01C85DDE.F25F64C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

i am using Xen and LVM2. On one Hypervisor - Machine (Dom0) i have a =
very special problem. When I create a Windows - machine on a logical - =
volume (lv), an Windows makes a partition within, i cannot=20
"lvchange -an /dev/vg/lv " because vgdisplay shows me an Open-Count of =
1. After deleting the partition within (fdisk /dev/vg/lv), its "open" =
count is zero again and ich can handel the lv normally.
The same procedure on a different pc shows "OPEN =3D 0" in the moment =
when the Virtual machine is stopped.

Primary - I am interrested in how to change this attribute

Secondary - What goes wrong

Sry for my bad english.


David
------=_NextPart_000_0068_01C85DDE.F25F64C0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.6000.16587" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>i am using Xen and LVM2. On one =
Hypervisor -=20
Machine (Dom0) i have a very special problem. When I create a Windows - =
machine=20
on a logical - volume (lv), an Windows makes a partition within, i =
cannot=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>"lvchange -an /dev/vg/lv " because =
vgdisplay shows=20
me an Open-Count of&nbsp;1. After deleting the partition within (fdisk=20
/dev/vg/lv), its "open" count is zero again and ich can handel the lv=20
normally.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>The same procedure on a different pc =
shows "OPEN =3D=20
0" in the moment when the Virtual machine is stopped.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Primary - I am interrested in how to =
change this=20
attribute</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Secondary - What goes =
wrong</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Sry for my bad english.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>David</FONT></DIV></BODY></HTML>

------=_NextPart_000_0068_01C85DDE.F25F64C0--
