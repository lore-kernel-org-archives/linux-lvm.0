Received: from mx2.redhat.com (ext-mx01.extmail.prod.ext.rdu2.redhat.com
	[10.11.55.1])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r1E60BVj012122
	for <linux-lvm@redhat.com>; Thu, 14 Feb 2013 01:00:21 -0500
Received: from node140.e-blokos.com (node140.e-blokos.com [67.205.80.140])
	by mx2.redhat.com (8.14.4/8.14.4) with ESMTP id r1E6085l027089
	for <linux-lvm@redhat.com>; Thu, 14 Feb 2013 01:00:09 -0500
Received: from e1705 (localhost.localdomain [127.0.0.1])
	by node140.e-blokos.com (8.14.6/8.14.5) with SMTP id r1E603s5027942
	for <linux-lvm@redhat.com>; Thu, 14 Feb 2013 01:00:03 -0500
Message-ID: <3A3AC927C3D0402BB5FB0BED146C0C0D@e1705>
From: "Madovsky" <infos@madovsky.org>
Date: Thu, 14 Feb 2013 01:00:02 -0500
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_012E_01CE0A4E.9ECF36B0"
Subject: [linux-lvm] intel raid controller 632xESB and dmraid
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.

------=_NextPart_000_012E_01CE0A4E.9ECF36B0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

I noticed since kernel 3.6.7 that
my raid 1 partition from onboard raid controller 632xESB
of the S5000PAL intel mobo is not mounted anymore. (mounted as LVM on =
linux)
it shows 2 distincts hd /dev/sda and /dev/sdb
so it boots linux but starts to crush raid inodes so I have
to go back to kernel 3.6.6 to be ok.

when I type dmraid -a y on kernel 3.6.6 (which works)
I can see strangely
RAID set "ddf1_4c5349202020202080862682000000004711471100001450" already =
active
RAID set "ddf1_4c5349202020202080862682000000004711471100001450" was not =
activated
RAID set "ddf1_4c5349202020202080862682000000004711471100001450p1" =
already active
RAID set "ddf1_4c5349202020202080862682000000004711471100001450p1" was =
not activated

on kernel 3.6.7 I have the same result but the raid partition is not =
mounted.

any idea ?

Thank you very much

Franck

------=_NextPart_000_012E_01CE0A4E.9ECF36B0
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Dwindows-1252" =
http-equiv=3DContent-Type>
<META name=3DGENERATOR content=3D"MSHTML 8.00.6001.19394">
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT size=3D2>
<DIV><FONT size=3D2>Hi,</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>I noticed since kernel 3.6.7 that</FONT></DIV>
<DIV><FONT size=3D2>my raid 1 partition from onboard raid controller=20
632xESB</FONT></DIV>
<DIV><FONT size=3D2>of the S5000PAL intel mobo is not mounted anymore. =
(mounted as=20
LVM on linux)</FONT></DIV>
<DIV><FONT size=3D2>it shows 2 distincts hd /dev/sda and =
/dev/sdb</FONT></DIV>
<DIV><FONT size=3D2>so it boots linux but starts to crush raid inodes so =
I=20
have</FONT></DIV>
<DIV><FONT size=3D2>to go back to kernel 3.6.6 to be ok.</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>when I type dmraid -a y on kernel 3.6.6 (which=20
works)</FONT></DIV>
<DIV><FONT size=3D2>I can see strangely</FONT></DIV>
<DIV><FONT size=3D2>RAID set=20
"ddf1_4c5349202020202080862682000000004711471100001450" already =
active<BR>RAID=20
set "ddf1_4c5349202020202080862682000000004711471100001450" was not=20
activated<BR>RAID set =
"ddf1_4c5349202020202080862682000000004711471100001450p1"=20
already active<BR>RAID set=20
"ddf1_4c5349202020202080862682000000004711471100001450p1" was not=20
activated</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>on kernel 3.6.7 I have the same result but the raid =
partition=20
is not mounted.</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>any idea ?</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>Thank you very much</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>Franck</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_012E_01CE0A4E.9ECF36B0--
