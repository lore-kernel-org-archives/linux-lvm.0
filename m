Message-ID: <003501c3ce26$acb02550$0a00a8c0@brane>
From: "Branko" <brankob@avtomatika.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0032_01C3CE2F.0E68A670"
Subject: [linux-lvm] LVM2 on Gentoo-Dual Opteron/Amd64 system troubles...
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
Date: Tue Dec 30 09:32:15 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0032_01C3CE2F.0E68A670
Content-Type: text/plain;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hi to all,

I'm trying to use LVM on my new dual Opteron with 64-bit Gentoo and have
some troubles.=20
My system is :

- dual Opteron 240 on TYAN Thunder S2885
-2 Gb RAM
-ATA RAID Controller 3Ware Escalade 7506-12 (12 IDE ports, hardware XOR,
supports multiple RAD fields and separate discs, does RAID 0/1/10/5)
- 4 x 180 Gb discs=20
- 6 x 200 Gb discs

4 CDRW units

gentoo kernel 2.6 with usual gentoo patches. Kernel has devfs, pts etc =
compiled-in=20

Driver for 3ware is also compiled in kernel (not as a module) as are all =
main scsi modules...

All CDRW units are connected to MB's primary and secondary channel.

All discs are on 3Ware card.

Five 200 GB units are in RAID5 array and four 180 Gb units and one 200 =
GB are
free.=20

Machine sees 3Ware card as a SCSI controller with one big SCSI 800 Gb =
disc
and five smaller discs.

I have partitioned array in three partitions:
-small ext2 /boot partition (512 Mb or so)
-4 Gb swap partition
-the rest (cca 790 GB) is type 8E partition for LVM to be mounted as /

I have emerged LVM2 tools, made volume group etc and formatted it under
ext3.

I can activate it and mount it, but after reboot kernel doesn't see it
anymore...

Manual recommends using special script called lvmcreate_initdr to do =
initrd initialisations, but my lvm2 doesn't have that script. After many =
trials and errors  i have made initrd which succeeds with LVM =
initialisation, but machine reboots just at the point when it should =
drop initrd environment and jump into root  on LV.

In the initrd environment machine recognises VG and its LV just fine. I =
can mount it and check it, but right after returning from linuxrc script =
machine spews something like:

3w-xxxx driver: shutting off card (0)
3w-xxxx: reboot  (not sure about that one, it is shown just for a short =
moment)


Otherwise, I can boot just fine from any other physical partition on one =
of other discs on the 3Ware card
Lvm gets initialised (vgscan, vgchange -a y etc) and LV is available =
just fine, but that's not what I want.

I guess I'm asking if:

-anyone else has similar machine with 3Ware RAID card and root on LV and =
how did he accomplish this ?

-how does one make initrd with LVM ? I had to scavenge script from LVM1, =
without much success...



Regards,


Branko
------=_NextPart_000_0032_01C3CE2F.0E68A670
Content-Type: text/html;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-2">
<META content=3D"MSHTML 6.00.2800.1276" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2><FONT face=3D"Times New Roman" =
size=3D3>Hi to=20
all,<BR><BR>I'm trying to use LVM on my new dual Opteron with 64-bit =
Gentoo and=20
have<BR>some troubles. <BR>My system is :<BR><BR>- dual Opteron 240 on =
TYAN=20
Thunder S2885<BR>-2 Gb RAM<BR>-ATA RAID Controller 3Ware Escalade =
7506-12 (12=20
IDE ports, hardware XOR,<BR>supports multiple RAD fields and separate =
discs,=20
does RAID 0/1/10/5)<BR>- 4 x 180 Gb discs <BR>- 6 x 200 Gb =
discs<BR><BR>4 CDRW=20
units</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><FONT face=3DArial =
size=3D2></FONT></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><FONT face=3D"Times New Roman" =
size=3D3>gentoo kernel=20
2.6 with usual gentoo patches. K</FONT></FONT><FONT face=3DArial =
size=3D2><FONT=20
face=3D"Times New Roman" size=3D3>ernel has devfs, pts etc compiled-in =
</DIV><FONT=20
face=3DArial size=3D2></FONT><FONT face=3DArial size=3D2></FONT><FONT =
face=3DArial=20
size=3D2></FONT>
<DIV><FONT face=3DArial size=3D2></FONT><FONT face=3DArial =
size=3D2></FONT><BR>Driver=20
for 3ware is also compiled in kernel (not as a module) as are all main =
scsi=20
modules...<BR><BR>All CDRW units are connected to MB's primary and =
secondary=20
channel.<BR><BR>All discs are on 3Ware card.<BR><BR>Five 200 GB units =
are in=20
RAID5 array and four 180 Gb units and one 200 GB&nbsp;are<BR>free. =
</DIV>
<DIV><FONT face=3DArial size=3D2></FONT><FONT face=3DArial =
size=3D2></FONT><FONT=20
face=3DArial size=3D2></FONT><BR>Machine sees 3Ware card as a SCSI =
controller with=20
one big SCSI 800 Gb disc<BR>and five smaller discs.<BR><BR>I have =
partitioned=20
array in three partitions:</DIV>
<DIV>-small ext2 /boot partition (512 Mb or so)</DIV>
<DIV><FONT face=3DArial size=3D2>-</FONT>4 Gb swap partition</DIV>
<DIV>-the rest (cca 790 GB) is&nbsp;type&nbsp;8E partition for LVM to be =
mounted=20
as /<BR><BR>I have emerged LVM2 tools, made volume group etc and =
formatted it=20
under<BR>ext3.<BR><BR>I can activate it and mount it, but after reboot =
kernel=20
doesn't see it<BR>anymore...<BR></DIV>
<DIV>Manual&nbsp;recommends using special script called lvmcreate_initdr =
to do=20
initrd initialisations, but my lvm2 doesn't have that script. After many =
trials=20
and errors&nbsp; i have made initrd which succeeds with LVM =
initialisation, but=20
machine reboots just at the point when it should drop initrd environment =
and=20
jump into root&nbsp; on LV.</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>In the initrd environment machine =
recognises VG and=20
its LV just fine. I can mount it and check it, but right after returning =
from=20
linuxrc script machine spews something like:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>3w-xxxx driver: shutting off card =
(0)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>3w-xxxx: reboot&nbsp; (not sure about =
that one, it=20
is shown just for a short moment)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Otherwise, I can boot just fine from =
any other=20
physical partition on one of other discs on the 3Ware card</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Lvm gets initialised (vgscan, vgchange =
-a y etc)=20
and LV is available just fine, but that's not what I want.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I guess I'm asking if:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>-anyone else has similar machine with =
3Ware RAID=20
card and root on LV and how did he accomplish this ?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>-how does one make initrd with LVM ? I =
had to=20
scavenge script from LVM1, without much success...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Regards,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial =
size=3D2>Branko</FONT></FONT></DIV></FONT></BODY></HTML>

------=_NextPart_000_0032_01C3CE2F.0E68A670--
