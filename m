Message-ID: <012401c2958a$6b6baf40$4b66699f@win.doc.state.vt.us>
From: "Joseph Kezar" <jkezar@doc.state.vt.us>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0121_01C29560.8284DE60"
Subject: [linux-lvm] LVM for a Database
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
Date: Tue Nov 26 14:29:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0121_01C29560.8284DE60
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

We are in the process of building a database on a 4 processor 1.8GHz, =
4GB RAM Dell 6650.

I am trying to figure out the most efficient way to use LVM for our raw =
data storage.  We have a RAID array with 8x36GB drives in it.  Should I =
do a raid 1+0(mirror 4 disks, and span them to get one logical volume)?

If so this leaves me a /dev/sdb.  Or would I get better performance if I =
mirror 1 + 5, 2 + 6, 3 + 7, 4+ 8 to give me /dev/sd[b-e].
Is it possible to figure out where the center of our spindles are?  So I =
can arrange for the heads to spend little time seeking?

Any perfomance hints would be greatly appreciated.

thanks
Joe K.
------=_NextPart_000_0121_01C29560.8284DE60
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
<DIV><FONT face=3DArial size=3D2>We are in the process of building a =
database on a 4=20
processor 1.8GHz, 4GB RAM Dell 6650.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I am trying to figure out the most =
efficient way to=20
use LVM for our raw data storage.&nbsp; We have a RAID array with 8x36GB =
drives=20
in it.&nbsp;&nbsp;Should I do a raid 1+0(mirror 4 disks, and span them =
to get=20
one logical volume)?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>If so this leaves me a /dev/sdb.&nbsp; =
Or would I=20
get better performance if I mirror 1 + 5, 2 + 6, 3 + 7, 4+ 8 to give me=20
/dev/sd[b-e].</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Is it possible to figure out where the =
center of=20
our spindles are?&nbsp; So I can arrange for the heads to spend little =
time=20
seeking?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Any perfomance hints would be greatly=20
appreciated.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>thanks</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Joe K.</FONT></DIV></BODY></HTML>

------=_NextPart_000_0121_01C29560.8284DE60--
