Message-ID: <000d01c3b159$0e603e60$100119ac@hydro>
From: "<hYdRo>" <hydro@blueyonder.co.uk>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000A_01C3B159.0E294FE0"
Subject: [linux-lvm] LVM2 and whole disk booting
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
Date: Mon Nov 24 17:23:05 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_000A_01C3B159.0E294FE0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I've noticed LVM2 PVs in a partition don't use the first sector, does =
this mean you can now put lilo in the first sector of a whole disk PV =
and boot from it?

The problem is I have already alocated 2 SATA disks as Whole disks (not =
a great idea in hindsight) and now my IDE boot disk is giving me SMART =
failure hints.  I would like to move root to an LV on the other disks =
and just remove the IDE disk and not replace it.


Thanks
Ateeq
------=_NextPart_000_000A_01C3B159.0E294FE0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1276" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I've noticed LVM2 PVs in a partition =
don't use the=20
first sector, does this mean you can&nbsp;now put&nbsp;lilo in the first =
sector=20
of a whole disk PV and boot from it?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The problem is I have already alocated =
2 SATA disks=20
as Whole disks (not a great idea in hindsight) and now my IDE boot disk =
is=20
giving me SMART failure hints.&nbsp; I would like to move root to an LV =
on the=20
other disks and just remove the IDE disk and not replace =
it.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Ateeq</FONT></DIV></BODY></HTML>

------=_NextPart_000_000A_01C3B159.0E294FE0--
