Message-ID: <001e01c31029$015ad760$3c00a8c0@superdatorn>
From: =?iso-8859-1?Q?Hans_T=F6rnquist?= <hanst@geflefxp.net>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001B_01C31039.C4663A00"
Subject: [linux-lvm] vgscan can't find my vg.
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
Date: Sat May 10 08:37:23 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_001B_01C31039.C4663A00
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have change my system from slackware to gentoo and I can't get my lvm =
to work.

When I run vgscan I get:

# vgscan=20
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of =
volume group "ftp_vg" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume =
group

and pvscan:

# pvscan=20
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/ataraid/disc0/disc"                is =
associated to unknown VG "ftp_vg" (run vgscan)
pvscan -- inactive PV "/dev/ide/host2/bus1/target0/lun0/disc"  is =
associated to unknown VG "ftp_vg" (run vgscan)
pvscan -- inactive PV "/dev/ide/host2/bus1/target1/lun0/disc"  is =
associated to unknown VG "ftp_vg" (run vgscan)
pvscan -- inactive PV "/dev/ide/host2/bus0/target1/lun0/disc"  is =
associated to unknown VG "ftp_vg" (run vgscan)
pvscan -- inactive PV "/dev/ide/host0/bus0/target1/lun0/disc"  is =
associated to unknown VG "ftp_vg" (run vgscan)
pvscan -- total: 5 [496.34 GB] / in use: 5 [496.34 GB] / in no VG: 0 [0]

And now to my problem.
when I used slackware all my pv's was located by pvscan at /dev/hdb and =
forward but now at /dev/ide/host?/bus?/lun0/disc.

So if anybody got a clue how to fix it, pleace tell me.=20

/Hans T=F6rnquist
------=_NextPart_000_001B_01C31039.C4663A00
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
<DIV><FONT face=3DArial size=3D2>I have change my system from slackware =
to gentoo=20
and I can't get my lvm to work.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>When I run vgscan I get:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2># vgscan <BR>vgscan -- reading all =
physical volumes=20
(this may take a while...)<BR>vgscan -- ERROR "vg_read_with_pv_and_lv(): =
current=20
PV" can't get data of volume group "ftp_vg" from physical =
volume(s)<BR>vgscan --=20
"/etc/lvmtab" and "/etc/lvmtab.d" successfully created<BR>vgscan -- =
WARNING:=20
This program does not do a VGDA backup of your volume =
group<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>and pvscan:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2># pvscan <BR>pvscan -- reading all =
physical volumes=20
(this may take a while...)<BR>pvscan -- inactive PV=20
"/dev/ataraid/disc0/disc"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
is associated to unknown VG "ftp_vg" (run vgscan)<BR>pvscan -- inactive =
PV=20
"/dev/ide/host2/bus1/target0/lun0/disc"&nbsp; is associated to unknown =
VG=20
"ftp_vg" (run vgscan)<BR>pvscan -- inactive PV=20
"/dev/ide/host2/bus1/target1/lun0/disc"&nbsp; is associated to unknown =
VG=20
"ftp_vg" (run vgscan)<BR>pvscan -- inactive PV=20
"/dev/ide/host2/bus0/target1/lun0/disc"&nbsp; is associated to unknown =
VG=20
"ftp_vg" (run vgscan)<BR>pvscan -- inactive PV=20
"/dev/ide/host0/bus0/target1/lun0/disc"&nbsp; is associated to unknown =
VG=20
"ftp_vg" (run vgscan)<BR>pvscan -- total: 5 [496.34 GB] / in use: 5 =
[496.34 GB]=20
/ in no VG: 0 [0]<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>And now to my problem.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>when I used slackware all my pv's was =
located by=20
pvscan at /dev/hdb and forward but now at=20
/dev/ide/host?/bus?/lun0/disc.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>So if anybody got a clue how to fix it, =
pleace tell=20
me.&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>/Hans =
T=F6rnquist</DIV></FONT></BODY></HTML>

------=_NextPart_000_001B_01C31039.C4663A00--
