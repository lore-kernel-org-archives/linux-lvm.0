Message-ID: <002501c335f4$089c9e00$6601a8c0@ajf>
From: "Andrew Fabian" <afabian@anjero.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0020_01C335D2.7FA68690"
Subject: [linux-lvm] Lost Disk, System Recovery
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
Date: Thu Jun 19 08:22:14 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0020_01C335D2.7FA68690
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I'm having a problem that sounds similar to the one described in =
http://lists.sistina.com/pipermail/linux-lvm/2003-February/013420.html.  =
I lost one disk out of a four-disk VG.  I'm 99% sure the disk was empty =
at the time.  Now I can't get vgscan to recognize the VG.  pvscan =
displays:

pvscan -- inactive PV "/dev/hdg1" is associated to unknown VG "vg" (run =
vgscan)
pvscan -- inactive PV "/dev/hdh1" is associated to unknown VG "vg" (run =
vgscan)
pvscan -- inactive PV "/dev/hdc2" is associated to unknown VG "vg" (run =
vgscan)
pvscan -- total: 3 [69.92 GB] / in use: 3 [69.92 GB] / in no VG: 0 [0]

and vgscan displays:

vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of =
volume group "vg" from physical volume(s)

I tried running vgcfgrestore -f /mnt/etc/lvmconf/vg.conf /dev/hdg1 (I'm =
running knoppix off of a CD at the moment, with my root partition =
mounted on /mnt) and got the response:

vgcfgrestore -- this is a backup of volume group "vg"
vgcfgrestore -- physical volume "/dev/hdg1" doesn't belong to volume =
group "vg"

Same result for each other disk.  Any ideas how to get the three =
remaining disks up and running?  Thanks.

Andrew Fabian
------=_NextPart_000_0020_01C335D2.7FA68690
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
<DIV><FONT face=3DArial size=3D2>I'm having a problem that sounds =
similar to the one=20
described in <A=20
href=3D"http://lists.sistina.com/pipermail/linux-lvm/2003-February/013420=
.html">http://lists.sistina.com/pipermail/linux-lvm/2003-February/013420.=
html</A>.&nbsp;=20
I lost one disk out of a four-disk VG.&nbsp; I'm 99% sure the disk was =
empty at=20
the time.&nbsp; Now I can't get vgscan to recognize the VG.&nbsp; pvscan =

displays:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>pvscan -- inactive PV "/dev/hdg1" is =
associated to=20
unknown VG "vg" (run vgscan)</FONT></DIV>
<DIV>
<DIV><FONT face=3DArial size=3D2>pvscan -- inactive PV "/dev/hdh1" is =
associated to=20
unknown VG "vg" (run vgscan)</FONT></DIV>
<DIV>
<DIV><FONT face=3DArial size=3D2>pvscan -- inactive PV "/dev/hdc2" is =
associated to=20
unknown VG "vg" (run vgscan)</FONT></DIV>
<DIV>pvscan -- total: 3 [69.92 GB] / in use: 3 [69.92 GB] / in no VG: 0=20
[0]</DIV>
<DIV>&nbsp;</DIV>
<DIV>and vgscan displays:</DIV>
<DIV>&nbsp;</DIV>
<DIV>vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get =
data of=20
volume group "vg" from physical volume(s)</DIV>
<DIV>&nbsp;</DIV>
<DIV>I tried running vgcfgrestore -f /mnt/etc/lvmconf/vg.conf /dev/hdg1 =
(I'm=20
running knoppix off of a CD at the moment, with my root partition =
mounted on=20
/mnt) and got the response:</DIV>
<DIV>&nbsp;</DIV>
<DIV>vgcfgrestore -- this is a backup of volume group "vg"</DIV>
<DIV>vgcfgrestore -- physical volume "/dev/hdg1" doesn't belong to =
volume group=20
"vg"</DIV>
<DIV>&nbsp;</DIV>
<DIV>Same result for each other disk.&nbsp; Any ideas how to get the =
three=20
remaining disks up and running?&nbsp; Thanks.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Andrew Fabian</DIV></DIV></DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_0020_01C335D2.7FA68690--
