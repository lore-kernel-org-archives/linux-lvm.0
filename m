Message-Id: <009701c1a4e9$57c83b80$9b09360a@ar.attla.corp>
From: "Emiliano Ariel Lesende" <emiliano.lesende@constack.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
    boundary="----=_NextPart_000_0094_01C1A4D0.31E9E710"
Subject: [linux-lvm] Importing Problems
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
Date: Thu Jan 24 09:12:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0094_01C1A4D0.31E9E710
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello everyone. I'm new to the list but I'm an old LVM user. Lately I =
decided to change distro so I did an export of my LVM volumes. Replace =
the whole distro, and import them
back again. This works like a charm. The LVM system mounts perfectly =
without a problem, but I do have an issue... My storage is running out =
of disk space so I bought a new hard disk, I connected it and tried to =
extend the volume but I got a VERY strange behavior. Look at this =
output:

------------------------- TERMINAL =
-----------------------------------------------------
root@brokenworld:/# uname -a
Linux brokenworld 2.4.17 #1 Wed Jan 23 08:00:20 ART 2002 i686 unknown
root@brokenworld:/# vgchange --version
vgchange: Logical Volume Manager 1.0.1
Heinz Mauelshagen, Sistina Software  26/11/2001 (IOP 10)
root@brokenworld:/# vgchange -ay system
vgchange -- volume group "system" already active

root@brokenworld:/# vgextend system =
/dev/ide/host0/bus1/target1/lun0/part1
vgextend -- ERROR: volume group "system" must be active for extension

root@brokenworld:/# vgscan                                               =
  =20
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "system"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume =
group

root@brokenworld:/# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/ide/host0/bus1/target0/lun0/part1" of VG =
"system" [27.96 GB / 80.00 MB free]
pvscan -- inactive PV "/dev/ide/host0/bus0/target0/lun0/part4" of VG =
"system" [24.67 GB / 0 free]
pvscan -- inactive PV "/dev/ide/host0/bus0/target1/lun0/part1" of VG =
"system" [27.95 GB / 0 free]
pvscan -- total: 3 [80.59 GB] / in use: 3 [80.59 GB] / in no VG: 0 [0]

------------------------- TERMINAL =
-----------------------------------------------------

Look at the vgextend command... it says that my volume is not active, =
but when I do a vgchange -ay I tells me that it is already activated. =
Other thing I don't
understand is why my physical volumes are all inactive the the system is =
mounted?

Did I do something wrong? Can I correct this?

Any help is appreciated, thanks in advance.
Emiliano Lesende

------=_NextPart_000_0094_01C1A4D0.31E9E710
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.3103.1000" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello everyone. I'm new to the list but =
I'm an old=20
LVM user. Lately I decided to change distro so I did an export of my LVM =

volumes. Replace the whole distro, and import them</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>back again. This works like a charm. =
The LVM system=20
mounts perfectly without a problem, but I do have an issue... My storage =
is=20
running out of disk space so I bought a new hard disk, I connected it =
and tried=20
to extend the volume but I got a VERY strange behavior. Look at this=20
output:</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>------------------------- TERMINAL=20
-----------------------------------------------------</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>root@brokenworld:/# uname -a<BR>Linux =
brokenworld=20
2.4.17 #1 Wed Jan 23 08:00:20 ART 2002 i686 =
unknown<BR>root@brokenworld:/#=20
vgchange --version<BR>vgchange: Logical Volume Manager 1.0.1<BR>Heinz=20
Mauelshagen, Sistina Software&nbsp; 26/11/2001 (IOP =
10)<BR>root@brokenworld:/#=20
vgchange -ay system<BR>vgchange -- volume group "system" already=20
active</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>root@brokenworld:/# vgextend system=20
/dev/ide/host0/bus1/target1/lun0/part1<BR>vgextend -- ERROR: volume =
group=20
"system" must be active for extension</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>root@brokenworld:/#=20
vgscan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;=20
<BR>vgscan -- reading all physical volumes (this may take a =
while...)<BR>vgscan=20
-- found inactive volume group "system"<BR>vgscan -- "/etc/lvmtab" and=20
"/etc/lvmtab.d" successfully created<BR>vgscan -- WARNING: This program =
does not=20
do a VGDA backup of your volume group</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>root@brokenworld:/# pvscan<BR>pvscan -- =
reading all=20
physical volumes (this may take a while...)<BR>pvscan -- inactive PV=20
"/dev/ide/host0/bus1/target0/lun0/part1" of VG "system" [27.96 GB / =
80.00 MB=20
free]<BR>pvscan -- inactive PV "/dev/ide/host0/bus0/target0/lun0/part4" =
of VG=20
"system" [24.67 GB / 0 free]<BR>pvscan -- inactive PV=20
"/dev/ide/host0/bus0/target1/lun0/part1" of VG "system" [27.95 GB / 0=20
free]<BR>pvscan -- total: 3 [80.59 GB] / in use: 3 [80.59 GB] / in no =
VG: 0=20
[0]</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><FONT face=3DArial =
size=3D2>-------------------------=20
TERMINAL=20
-----------------------------------------------------</FONT></FONT></DIV>=

<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Look at the vgextend command... it says =
that my=20
volume is not active, but when I do a vgchange -ay I tells me that it is =
already=20
activated. Other thing I don't</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>understand is why my physical volumes =
are all=20
inactive the the system is mounted?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Did I do something wrong? Can I correct =

this?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Any help is appreciated, thanks in=20
advance.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Emiliano =
Lesende</FONT></DIV></BODY></HTML>

------=_NextPart_000_0094_01C1A4D0.31E9E710--
