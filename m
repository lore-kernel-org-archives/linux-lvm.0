Message-ID: <007001c29531$c63392c0$dc64a8c0@pcjeffrey>
From: "Jeffrey van Hout - Van Boxtel Software BV" <jvhout@van-boxtel-software.nl>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_006D_01C2953A.2737B800"
Subject: [linux-lvm] vgchange with lvm_snapshot_fill_COW_page failed
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
Date: Tue Nov 26 03:50:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_006D_01C2953A.2737B800
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

When we changed the physical position of the harddrives we were able to
mount the existing volumegroup.

When we rechanged these drives to the original position and tried to
activate the volume group with vhchange -a y we got the following error:


vgchange -ay
vgchange -- ERROR "Bad address" activating volume group "lvmgroup1"
.
vm -- _pv_get_number failed for rdev =3D 65535
lvm -- lvm_snapshot_fill_COW_page failed

(I tried:
lvscan -D
vgscan
vgchange -a y)

Do you have any suggestions?

Regards,
Jeffrey (jvhout@van-boxtel-sftware.nl)



------=_NextPart_000_006D_01C2953A.2737B800
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4807.2300" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2><FONT face=3D"Times New Roman" =
size=3D3>Hi,<BR><BR>When=20
we changed the physical position of the harddrives we were able =
to<BR>mount the=20
existing volumegroup.<BR><BR>When we rechanged these drives to the =
original=20
position and tried to<BR>activate the volume group with vhchange -a y we =
got the=20
following error:<BR><BR><BR>vgchange -ay<BR>vgchange -- ERROR "Bad =
address"=20
activating volume group "lvmgroup1"<BR>.<BR>vm -- _pv_get_number failed =
for rdev=20
=3D 65535<BR>lvm -- lvm_snapshot_fill_COW_page failed<BR><BR>(I =
tried:<BR>lvscan=20
-D<BR>vgscan<BR>vgchange -a y)<BR><BR>Do you have any=20
suggestions?<BR><BR>Regards,<BR>Jeffrey (</FONT><A=20
href=3D"mailto:jvhout@van-boxtel-sftware.nl"><FONT face=3D"Times New =
Roman"=20
size=3D3>jvhout@van-boxtel-sftware.nl</FONT></A><FONT face=3D"Times New =
Roman"=20
size=3D3>)</FONT><BR><BR></FONT></DIV></BODY></HTML>

------=_NextPart_000_006D_01C2953A.2737B800--
