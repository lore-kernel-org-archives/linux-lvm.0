Message-ID: <007801c3207b$32639880$f500a8c0@xerxes>
From: =?iso-8859-1?Q?Kim_Kr=FCger-Monsen?= <lvm@nibland.org>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0075_01C3208B.F5B6D990"
Subject: [linux-lvm] Disc crash when using LVM...
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
Date: Tue May 27 06:26:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0075_01C3208B.F5B6D990
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I'm desperate... please help...

First of all I'm rather new to this LVM business, but I managed to get a =
three disc LVM up and running, but now everything is chaos. One disc =
just crashed and I can't retrieve any of the information from the 2 =
remaining discs, please help me retrieve my data. Yes, it was an IBM =
drive, but it was of a rather new model (80GB) and not much used, so I =
was rather astonished about the crash.

I have read about another guy who also experienced a disc crash (IBM) =
and he solved it by replacing the faulty drive with another one, but he =
didn't mention how he managed to get it up and running again. Did he use =
a replacement drive of the same size? What commands did he have to use =
in order to get it up and running again?

I've been searching for hours to find any relevant information about =
what to do in order to retrieve the remaining data from my other drives. =
I'm not good at this so I really don't want to issue any commands that =
will delete my remaining data permanently.

Here's how it looks like now:

>pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdd1"  is associated to unknown VG "vg01" =
(run vgscan)
pvscan -- inactive PV "/dev/hda8"  is associated to unknown VG "vg01" =
(run vgscan)
pvscan -- total: 2 [139.70 GB] / in use: 2 [139.70 GB] / in no VG: 0 [0]

>vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of =
volume group "vg01" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume =
group

>lvscan
lvscan -- no volume groups found

I have no idea what has happened to my volume group, it seems like it =
has disappeared. All I can do is scan for the physical volumes.

What to do next?? I'm still searching for information relevant to the =
problem, but please give me a hint or two...

    /Kim


------=_NextPart_000_0075_01C3208B.F5B6D990
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1170" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I'm desperate... please =
help...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>First of all I'm rather new to this LVM =
business,=20
but I managed to get a three disc LVM up and running, but now everything =
is=20
chaos.&nbsp;One disc just crashed and I can't retrieve any of the =
information=20
from the 2 remaining discs, please help me retrieve my data. Yes, it was =
an IBM=20
drive, but it was of a rather new model (80GB) and not much used, so I =
was=20
rather astonished about the crash.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have read about another guy who also =
experienced=20
a disc crash (IBM) and he solved it by replacing the faulty drive with =
another=20
one, but he didn't mention how he managed to get it up and running =
again. Did he=20
use a replacement drive of the same size? What commands did he have to =
use in=20
order to get it up and running again?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I've been searching for hours to find =
any relevant=20
information about what to do in order to retrieve the remaining data =
from my=20
other drives. I'm not good at this so I really don't want to issue any =
commands=20
that will delete my remaining data permanently.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Here's how it looks like =
now:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&gt;pvscan</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>pvscan -- reading all physical volumes =
(this may=20
take a while...)<BR>pvscan -- inactive PV "/dev/hdd1"&nbsp; is =
associated to=20
unknown VG "vg01" (run vgscan)<BR>pvscan -- inactive PV =
"/dev/hda8"&nbsp; is=20
associated to unknown VG "vg01" (run vgscan)<BR>pvscan -- total: 2 =
[139.70 GB] /=20
in use: 2 [139.70 GB] / in no VG: 0 [0]<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&gt;vgscan</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>vgscan -- reading all physical volumes =
(this may=20
take a while...)<BR>vgscan -- ERROR "vg_read_with_pv_and_lv(): current =
PV" can't=20
get data of volume group "vg01" from physical volume(s)<BR>vgscan --=20
"/etc/lvmtab" and "/etc/lvmtab.d" successfully created<BR>vgscan -- =
WARNING:=20
This program does not do a VGDA backup of your volume =
group<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&gt;lvscan</DIV></FONT>
<DIV><FONT face=3DArial size=3D2>lvscan -- no volume groups =
found<BR></DIV></FONT>
<DIV><FONT face=3DArial size=3D2>I have no idea what has happened to my =
volume=20
group, it seems like it has disappeared. All I can do is scan for the =
physical=20
volumes.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>What to do next?? I'm still searching =
for=20
information relevant to the problem, but please give me a hint or=20
two...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; /Kim</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;</DIV></FONT></BODY></HTML>

------=_NextPart_000_0075_01C3208B.F5B6D990--
