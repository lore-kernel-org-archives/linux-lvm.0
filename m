Message-ID: <00d201c2eabc$ade459d0$0100a8c0@voyager>
From: "Emiliano Lesende" <emiliano.lesende@constack.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00C6_01C2EAA3.839082D0"
Subject: [linux-lvm] HELP! pvcreate on wrong disk
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
Date: Wed Mar 19 08:25:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_00C6_01C2EAA3.839082D0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have four PVs on one LV. I was adding the five disk when by accident I =
pvcreate'ed a disk device that was already in the LV. I dont know how =
LVM let go through with this, but it did. Consequently the pvscan showed =
four PVs, one inactive and with no VG associated with it. Immediatly I =
run a vgcfgrestore on the device and everything return to normal, or so =
I think? My question is, did the pvcreate erased the data on the disk? =
or just the PV header? Can I sleep safely thinking that everything is =
ok?

Thanks in advance
Emiliano
------=_NextPart_000_00C6_01C2EAA3.839082D0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1126" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I have four PVs on one LV. I was adding =
the five=20
disk when by accident I pvcreate'ed a disk device that was already in =
the LV. I=20
dont know how LVM let go through with this, but it did. Consequently the =
pvscan=20
showed four PVs, one inactive and with no VG associated with it. =
Immediatly I=20
run a vgcfgrestore on the device and everything return to normal, or so =
I think?=20
My question is, did the pvcreate erased the data on the disk? or just =
the PV=20
header? Can I sleep safely thinking that everything is ok?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks in advance</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Emiliano</FONT></DIV></BODY></HTML>

------=_NextPart_000_00C6_01C2EAA3.839082D0--
