Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8NGKRV11697
	for <linux-lvm@redhat.com>; Fri, 23 Sep 2005 12:20:27 -0400
Received: from mailout-tlr.thomson.com (mailout-tlr.thomson.com
	[163.231.12.68])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8NGKQfV017366
	for <linux-lvm@redhat.com>; Fri, 23 Sep 2005 12:20:26 -0400
Received: from mailout-tlr.thomson.com (localhost [127.0.0.1])
	by mailout-tlr.thomson.com (Switch-3.1.4/Switch-3.1.0) with ESMTP id
	j8NGKK6m026449
	for <linux-lvm@redhat.com>; Fri, 23 Sep 2005 16:20:20 GMT
Received: from tlrusmneagfe01.ERF.THOMSON.COM (tlrusmneagfe01.erf.thomson.com
	[163.231.22.161])
	by mailout-tlr.thomson.com (Switch-3.1.4/Switch-3.1.0) with ESMTP id
	j8NGKKa8026444
	for <linux-lvm@redhat.com>; Fri, 23 Sep 2005 16:20:20 GMT
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C5C05A.C0D611B9"
Date: Fri, 23 Sep 2005 11:20:19 -0500
Message-ID: <64A66E9DBE859F4993DBE06DECD4F95301B2D688@TLRUSMNEAGMBX21.ERF.THOMSON.COM>
From: <paul.stein@thomson.com>
Subject: [linux-lvm] Recover Partition Table - vgdisplay/vgscan  fails
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.

------_=_NextPart_001_01C5C05A.C0D611B9
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I inadvertantly blew away the partition table on /dev/sdo that was in
use. While the system is still running and no errors have occured...yet,
I need
to get the partition table restored and  be able to vgdisplay the
datavg. Below is the sampling of error messages.
=20
<root@paxton:/proc/lvm># vgdisplay datavg
vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please
run vgscan

<root@paxton:/proc/lvm># vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "rootvg"
vgscan -- found active volume group "localvg"
vgscan -- found active volume group "datavg"
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
volume group "datavg" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
groups
=20
=20
=20
Is it safe to clear VGDA using the "dd if=3D/dev/zero =
of=3DPhysicalVolume
bs=3D512 count=3D1"  shown in the pvcreate man pages and the come back =
and
recreate the VGDA  using pvcreate, or use pvcreate outright not using
the dd method? Or, is there a better method to get /dev/sdo back into
the datavg
group while recreating the partition table?
=20
Paul Stein
=20

------_=_NextPart_001_01C5C05A.C0D611B9
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2800.1515" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D338550616-23092005>I =
inadvertantly blew=20
away the partition table on /dev/sdo that was in use. While the system =
is still=20
running and no errors have occured...yet, I need</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D338550616-23092005>to get =
the partition=20
table restored and&nbsp; be able to vgdisplay the datavg. Below is the =
sampling=20
of error messages.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&lt;<A=20
href=3D"mailto:root@paxton:/proc/lvm">root@paxton:/proc/lvm</A>&gt;# =
vgdisplay=20
datavg<BR>vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT =
consistent;=20
please run vgscan<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&lt;<A=20
href=3D"mailto:root@paxton:/proc/lvm">root@paxton:/proc/lvm</A>&gt;#=20
vgscan<BR>vgscan -- reading all physical volumes (this may take a=20
while...)<BR>vgscan -- found active volume group "rootvg"<BR>vgscan -- =
found=20
active volume group "localvg"<BR>vgscan -- found active volume group=20
"datavg"<BR>vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't =
get=20
data of volume group "datavg" from physical volume(s)<BR>vgscan -- =
"/etc/lvmtab"=20
and "/etc/lvmtab.d" successfully created<BR>vgscan -- WARNING: This =
program does=20
not do a VGDA backup of your volume groups</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><SPAN class=3D338550616-23092005><FONT face=3DArial size=3D2>Is it =
safe to clear=20
VGDA using the "dd if=3D/dev/zero of=3DPhysicalVolume bs=3D512 =
count=3D1"&nbsp; shown in=20
the pvcreate man pages and the come back and</FONT></SPAN></DIV>
<DIV><SPAN class=3D338550616-23092005><FONT face=3DArial =
size=3D2>recreate the=20
VGDA&nbsp; using pvcreate, or use pvcreate outright not using the dd =
method? Or,=20
is there a better method to get /dev/sdo back into the=20
datavg</FONT></SPAN></DIV>
<DIV><SPAN class=3D338550616-23092005><FONT face=3DArial size=3D2>group =
while=20
recreating the partition table?</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV align=3Dleft>
<DIV align=3Dleft><FONT face=3D"Comic Sans MS" size=3D4>Paul =
Stein</FONT></DIV></DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------_=_NextPart_001_01C5C05A.C0D611B9--
