From: <brad.p@frisurf.no>
Message-ID: <001201c3c24c$cc77c450$0200000a@ray1>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0013_01C3C255.2E3C2C50"
Subject: [linux-lvm] exporting/importing a LVM volume
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
Date: Mon Dec 15 07:57:04 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0013_01C3C255.2E3C2C50
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all, 
 
 
I need to move a lvm volme over to a new os install. And this is what i
did.
 
Before installing the new os, i did a vgexport name
and acording to the howto, all i need to do on my new os is pvscan and
then vgimport name /dev/dev1 + + + + 
 
(http://tldp.org/HOWTO/LVM-HOWTO/x978.html)
 
However when trying to import it i get these messages:
 
pvscan -- reading all physical volumes (this may take a while....)
pvscan -- inactive PV "/dev/sdc1" is in no VG [111.76GB]
pvscan -- total: 1 [111.76GB] / in use: 0 [0] / in no VG: 1 [111.76GB]
 
Its supposed to say something like this: (paste from the howto)
 
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sdb1"  is in EXPORTED VG "design" [996 MB /
996 MB free]
pvscan -- inactive PV "/dev/sdb2"  is in EXPORTED VG "design" [996 MB /
244 MB free]
pvscan -- total: 2 [1.95 GB] / in use: 2 [1.95 GB] / in no VG: 0 [0]

If i try the vgimport i get this message:
 
vgimport -- ERROR "pv_read(): PV identifier invalid" reading physical
volume "/dev/sda1"
 
Anyone got a hint what i need to do to get this LVM up and running again
?
 
Ray

------=_NextPart_000_0013_01C3C255.2E3C2C50
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<TITLE>Melding</TITLE>

<META content=3D"MSHTML 6.00.2800.1276" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial size=3D2>Hi =
all,=20
</FONT></SPAN></DIV>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial size=3D2>I need =
to move a lvm=20
volme over to a new os install. And this is what i =
did.</FONT></SPAN></DIV>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial size=3D2>Before =
installing=20
the new os, i did a vgexport name</FONT></SPAN></DIV>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial size=3D2>and =
acording to the=20
howto, all i need to do on my new os is pvscan and then vgimport name =
/dev/dev1=20
+ + + + </FONT></SPAN></DIV>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial size=3D2>(<A=20
href=3D"http://tldp.org/HOWTO/LVM-HOWTO/x978.html">http://tldp.org/HOWTO/=
LVM-HOWTO/x978.html</A>)</FONT></SPAN></DIV>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial =
size=3D2>However when trying=20
to import it i get these messages:</FONT></SPAN></DIV>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial size=3D2>pvscan =
-- reading=20
all physical volumes (this may take a while....)</FONT></SPAN></DIV>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial size=3D2>pvscan =
-- inactive=20
PV "/dev/sdc1" is in no VG [111.76GB]</FONT></SPAN></DIV>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial size=3D2>pvscan =
-- total: 1=20
[111.76GB] / in use: 0 [0] / in no VG: 1 [111.76GB]</FONT></SPAN></DIV>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial size=3D2>Its =
supposed to say=20
something like this: (paste from the howto)</FONT></SPAN></DIV>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D787150914-14122003>pvscan -- reading all physical =
volumes (this=20
may take a while...)<BR>pvscan -- inactive PV "/dev/sdb1"&nbsp; is in =
EXPORTED=20
VG "design" [996 MB / 996 MB free]<BR>pvscan -- inactive PV =
"/dev/sdb2"&nbsp; is=20
in EXPORTED VG "design" [996 MB / 244 MB free]<BR>pvscan -- total: 2 =
[1.95 GB] /=20
in use: 2 [1.95 GB] / in no VG: 0 [0]<BR></SPAN></DIV>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial size=3D2>If i =
try the=20
vgimport i get this message:</FONT></SPAN></DIV>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial =
size=3D2>vgimport -- ERROR=20
"pv_read(): PV identifier invalid" reading physical volume=20
"/dev/sda1"</FONT></SPAN></DIV>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial size=3D2>Anyone =
got a hint=20
what i need to do to get this LVM up and running again =
?</FONT></SPAN></DIV>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D787150914-14122003><FONT face=3DArial=20
size=3D2>Ray</FONT></DIV></SPAN></BODY></HTML>

------=_NextPart_000_0013_01C3C255.2E3C2C50--
