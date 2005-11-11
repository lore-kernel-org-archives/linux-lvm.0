Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAB4sKV03826
	for <linux-lvm@redhat.com>; Thu, 10 Nov 2005 23:54:20 -0500
Received: from mail-server.amherst.edu (mailf2.amherst.edu [148.85.136.79])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jAB4sCCM001467
	for <linux-lvm@redhat.com>; Thu, 10 Nov 2005 23:54:12 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C5E67B.F3F3C13B"
Date: Thu, 10 Nov 2005 23:53:59 -0500
Message-ID: <0456A130F613AD459887FF012652963F073A83@mail7.amherst.edu>
From: "Steffen Plotner" <swplotner@amherst.edu>
Subject: [linux-lvm] Removing a snapshot under heavy IO causes LVM hangs
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

------_=_NextPart_001_01C5E67B.F3F3C13B
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I have found 2 scenarios using FC4 (2.6.13-latest) that cause LVM =
problems:
=20
1.
=20
700GB volume, create a snapshot of 100Gb, copy the snap to another disk, =
remove the snapshot. The snapshot remove never ends it just hangs. One =
can type lvscan, it will display a few LVs and then hang, press Ctrl-C =
to get out of that. Ctrl-C does not work with lvremove. No =
/var/log/messages indicating cause.
=20
We believe this might happen because the volume copy takes about 8hours, =
however if I do a snap and then instantly remove it, it works fine. The =
8 hour time frame + plus moderate IO appears to be the problem.
=20
=20
2.
=20
Labtest: create a 20G volume, create a 8G snap. From another terminal do =
dd if=3D/dev/zero of=3D/dev/vg/lv bs=3D1M, after running for a few =
minutes remove the snapshot - it cannot be removed until ALL IO ceases =
on the original volume.
=20
I have tried the development FC4 2.6.14 kernel today and that causes the =
same problems. lvm2 tools: lvm2-2.01.08-2.1
=20
=20
=20
________________________________=20
Steffen Plotner=20
Systems Administrator/Programmer=20
Systems & Networking=20
Amherst College=20
PO BOX 5000=20
Amherst, MA 01002-5000=20
Tel (413) 542-2348=20
Fax (413) 542-2626=20
Email: swplotner@amherst.edu=20
________________________________=20

------_=_NextPart_001_01C5E67B.F3F3C13B
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"><HTML =
DIR=3Dltr><HEAD><META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1"></HEAD><BODY>=0A=
<DIV id=3DidOWAReplyText78031 dir=3Dltr>=0A=
<DIV dir=3Dltr><FONT face=3DArial color=3D#000000 =
size=3D2>Hi,</FONT></DIV><FONT =0A=
face=3DArial size=3D2>=0A=
<DIV dir=3Dltr><BR>I have found 2 scenarios using FC4 (2.6.13-latest) =
that cause =0A=
LVM problems:</DIV>=0A=
<DIV dir=3Dltr>&nbsp;</DIV>=0A=
<DIV dir=3Dltr>1.</DIV>=0A=
<DIV dir=3Dltr>&nbsp;</DIV>=0A=
<DIV dir=3Dltr>700GB volume, create a snapshot of 100Gb, copy the snap =
to another =0A=
disk, remove the snapshot. The snapshot remove never ends it just hangs. =
One can =0A=
type lvscan, it will display a few LVs and then hang, press Ctrl-C to =
get out of =0A=
that. Ctrl-C does not work with lvremove. No /var/log/messages =
indicating =0A=
cause.</DIV>=0A=
<DIV dir=3Dltr>&nbsp;</DIV>=0A=
<DIV dir=3Dltr>We believe this might happen because the volume copy =
takes about =0A=
8hours, however&nbsp;if I do a snap and then instantly remove it, it =
works fine. =0A=
The 8 hour time frame + plus moderate IO appears to be the problem.</DIV>=0A=
<DIV dir=3Dltr>&nbsp;</DIV>=0A=
<DIV dir=3Dltr>&nbsp;</DIV>=0A=
<DIV dir=3Dltr>2.</FONT></DIV>=0A=
<DIV dir=3Dltr><FONT face=3DArial color=3D#000000 =
size=3D2></FONT>&nbsp;</DIV>=0A=
<DIV dir=3Dltr><FONT face=3DArial size=3D2>Labtest: create a 20G volume, =
create a 8G =0A=
snap. From another terminal do dd if=3D/dev/zero of=3D/dev/vg/lv =
bs=3D1M, after =0A=
running for a few minutes remove the snapshot - it cannot be removed =
until ALL =0A=
IO ceases on the original volume.</FONT></DIV>=0A=
<DIV dir=3Dltr><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>=0A=
<DIV dir=3Dltr><FONT face=3DArial size=3D2>I have tried the development =
FC4 2.6.14 =0A=
kernel today and that causes the same problems. lvm2 tools: =0A=
lvm2-2.01.08-2.1</FONT></DIV>=0A=
<DIV dir=3Dltr><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>=0A=
<DIV dir=3Dltr><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>=0A=
<DIV dir=3Dltr><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></DIV>=0A=
<DIV id=3DidSignature18434 dir=3Dltr>=0A=
<DIV><FONT face=3DArial color=3D#000000 size=3D2>=0A=
<DIV><FONT face=3DVerdana =
size=3D1>________________________________</FONT> </DIV>=0A=
<DIV><FONT face=3DVerdana size=3D1>Steffen Plotner</FONT> <BR><FONT =
face=3DVerdana =0A=
size=3D1>Systems Administrator/Programmer</FONT> <BR><FONT =
face=3DVerdana =0A=
size=3D1>Systems &amp; Networking</FONT> </DIV>=0A=
<DIV><FONT face=3DVerdana size=3D1>Amherst College</FONT> <BR><FONT =
face=3DVerdana =0A=
size=3D1>PO BOX 5000</FONT> <BR><FONT face=3DVerdana size=3D1>Amherst, =
MA =0A=
01002-5000</FONT> <BR><FONT face=3DVerdana size=3D1>Tel (413) =
542-2348</FONT> =0A=
<BR><FONT face=3DVerdana size=3D1>Fax (413) 542-2626</FONT> <BR><FONT =
face=3DVerdana =0A=
size=3D1>Email:<U> </U></FONT><U><FONT face=3DVerdana color=3D#0000ff =0A=
size=3D1>swplotner@amherst.edu </FONT></U><BR><FONT face=3DVerdana =0A=
size=3D1>________________________________</FONT> =0A=
</DIV></FONT></DIV></DIV></BODY></HTML>
------_=_NextPart_001_01C5E67B.F3F3C13B--
