Return-Path: <jbooth@ccbill.com>
Message-ID: <074101c0e3e9$72bf5200$5300000a@cavecreek.net>
From: "Justin Booth" <jbooth@ccbill.com>
Date: Wed, 23 May 2001 17:35:35 -0700
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_073E_01C0E3AE.C63EE840"
Subject: [linux-lvm] Problem deleteing PV's
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
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_073E_01C0E3AE.C63EE840
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

 I have a problem deleteing 4 PV's that I managed to create None of the =
PV's are in a VG, and I can't figure out how to get rid of them

when I do a pvscan It returns something like this:

pvscan -- reading all physical volumes (this may take a while)
pvscan -- inactive PV "/dev/sdb" is in no VG [12.16] MB
pvscan -- inactive PV "/dev/sdb1" is in no VG [8.54] GB
pvscan -- inactive PV "/dev/sdc" is in no VG [12.16] MB
pvscan -- inactive PV "/dev/sdc1" is in no VG [8.54] GB
pvscan -- total: 4 [17.11 GB] / in use 0 [0] / in no VG:  4 [17.11 GB]


How do I get rid of these entries to start over again?
I've tried deleteing the partition table and recreating them but a =
subsequent vgscan always brings them back into pvscan


 Thanks much,
      Justin Booth

------=_NextPart_000_073E_01C0E3AE.C63EE840
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4134.100" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;I have a problem deleteing 4 PV's =
that I=20
managed to create None of the PV's are in a VG, and I can't figure out =
how to=20
get rid of them</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>when I do a pvscan It returns something =
like=20
this:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>pvscan -- reading all physical volumes =
(this may=20
take a while)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>pvscan -- inactive PV "/dev/sdb" is in =
no VG=20
[12.16] MB</FONT></DIV>
<DIV>
<DIV><FONT face=3DArial size=3D2>pvscan -- inactive PV "/dev/sdb1" is in =
no VG=20
[8.54] GB</FONT></DIV>
<DIV>
<DIV><FONT face=3DArial size=3D2>pvscan -- inactive PV "/dev/sdc" is in =
no VG=20
[12.16] MB</FONT></DIV>
<DIV>
<DIV><FONT face=3DArial size=3D2>pvscan -- inactive PV "/dev/sdc1" is in =
no VG=20
[8.54] GB</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>pvscan -- total: 4 [17.11 GB] / in use =
0 [0] / in=20
no VG:&nbsp; 4 [17.11 GB]</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>How do I get rid of these entries to =
start over=20
again?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I've tried deleteing the partition =
table and=20
recreating them but a subsequent vgscan always brings them back into=20
pvscan</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;Thanks much,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Justin=20
Booth</FONT></DIV></DIV></DIV></DIV></BODY></HTML>

------=_NextPart_000_073E_01C0E3AE.C63EE840--
