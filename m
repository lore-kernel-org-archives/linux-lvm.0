Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7I2sMa08320
	for <linux-lvm@redhat.com>; Tue, 17 Aug 2004 22:54:22 -0400
Message-ID: <025001c484ce$95942560$5208580a@b034547>
From: "Rob Schwartz" <rschwartz@boscovs.com>
Date: Tue, 17 Aug 2004 22:53:48 -0400
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_024D_01C484AD.0E790F80"
Subject: [linux-lvm] vgscan vs vgcfgrestore
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Linux-LVM@Sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_024D_01C484AD.0E790F80
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Heinz,

Forgive me for writing in English.   As I come from the United States I =
am embarassingly uni-lingual.   I have been working with LVM for several =
months now and finally have had the opportunity to get into the guts of =
the lvm configuration.   I am preparing myself for the situation where =
my LVM environment gets corrupted in some manner.  Actually, last week I =
encountered a problem with LVM and was unable to quickly recover so I =
ended up simply rebuilding the LVM PV's, VG's and LV's and restoring =
data.  Fortunately, it was an easy restore.   I have been comparing the =
vgscan utility with vgcfgrestore.   In a test environment I have deleted =
the /etc/lvm* stuff and even deleted the /dev/lvm* stuff and =
successfully recovered the VG and LV by simply doing a vgscan.   Whew... =
nice... I understand vgcfgbackup and vgcfgrestore but am not sure when I =
would need to use the configuration backup.   The VGDA as I understand =
it is stored on the PV's.   If I have the PV's intact I therefore have =
the VGDA and hence am able to recover using vgscan.    When would I need =
to use vgcfgrestore?   I have found much information on LVM on the web =
but nothing that really pinpoints my question.  If there is something =
out there that I can refer to, please tell me.

Regards,
Rob
------=_NextPart_000_024D_01C484AD.0E790F80
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1458" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT size=3D2>Hello Heinz,</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>Forgive me for writing in English.&nbsp;&nbsp; As I =
come from=20
the United States I am embarassingly uni-lingual.&nbsp;&nbsp; I have =
been=20
working with LVM for several months&nbsp;now and finally have had the=20
opportunity to get into the guts of the lvm configuration.&nbsp;&nbsp; I =
am=20
preparing myself for the situation where my LVM environment gets =
corrupted in=20
some manner.&nbsp; Actually, last week I encountered a problem with LVM =
and was=20
unable to quickly recover so I ended up simply rebuilding the LVM PV's, =
VG's and=20
LV's and restoring data.&nbsp; Fortunately, it was an easy =
restore.&nbsp;&nbsp;=20
I have been comparing the vgscan utility with vgcfgrestore.&nbsp;&nbsp; =
In a=20
test environment I have deleted the /etc/lvm* stuff and even deleted the =

/dev/lvm* stuff and successfully recovered the VG and LV by simply doing =
a=20
vgscan.&nbsp;&nbsp; Whew... nice... I understand&nbsp;vgcfgbackup and=20
vgcfgrestore but am not sure when I would need to use the configuration=20
backup.&nbsp;&nbsp; The VGDA as I understand it is stored on the=20
PV's.&nbsp;&nbsp; If I have the PV's intact I therefore have the VGDA =
and hence=20
am able to recover using vgscan.&nbsp;&nbsp;&nbsp; When would I need to =
use=20
vgcfgrestore?&nbsp;&nbsp; I have found much information on LVM on the =
web but=20
nothing that really pinpoints my question.&nbsp; If there is something =
out there=20
that I can refer to, please tell me.</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>Regards,</FONT></DIV>
<DIV><FONT size=3D2>Rob</FONT></DIV></BODY></HTML>

------=_NextPart_000_024D_01C484AD.0E790F80--
