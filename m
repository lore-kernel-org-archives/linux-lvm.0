Message-ID: <002501c302a0$e036da60$08e130c1@grey>
From: "Sylvain BERTRAND" <sylvain.bertrand@supelec.fr>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0022_01C302B1.A3B80940"
Subject: [linux-lvm] LVM problem with removing disk from vg
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
Date: Tue Apr 15 08:02:04 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0022_01C302B1.A3B80940
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

    I had a volume group with disks hd{e,f,g,h,b,c,d}. But my IDE =
controler is dead now, and I have only hd{e,f,g,h} remaining. I'm pretty =
sure all the data is on the first disks (linear mode), since there wasnt =
much. I've tried vgreduce to remove hde{b,c,d} from the volume group, =
but it says that the device doesnt exist (of course, it's unplugged). =
I'de like to know if there's a way to reduce this VG to hd{e,f,g,h} =
without destroying the data.
Thanks for your help.
Sincerely,


Sylvain
------=_NextPart_000_0022_01C302B1.A3B80940
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1141" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; I had a volume group =
with disks=20
hd{e,f,g,h,b,c,d}. But my IDE controler is dead now, and I have only =
hd{e,f,g,h}=20
remaining. I'm pretty sure all the data is on the first disks (linear =
mode),=20
since there wasnt much. I've tried vgreduce to remove hde{b,c,d} from =
the volume=20
group, but it says that the device doesnt exist (of course, it's =
unplugged).=20
I'de like to know if there's a way to reduce this VG to hd{e,f,g,h} =
without=20
destroying the data.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Thanks for your help.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Sincerely,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial =
size=3D2>Sylvain</FONT></DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_0022_01C302B1.A3B80940--
