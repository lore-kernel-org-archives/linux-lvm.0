Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6AF6ccB017471
	for <linux-lvm@redhat.com>; Thu, 10 Jul 2008 11:06:38 -0400
Received: from tzm.it (relay2.tzm.it [195.137.128.2])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6AF6PnX018622
	for <linux-lvm@redhat.com>; Thu, 10 Jul 2008 11:06:26 -0400
Message-ID: <002301c8e29e$cca45110$ae00a8c0@ferroamd64>
From: "Alessandro Ferrari" <alexferro@tiscali.it>
Date: Thu, 10 Jul 2008 17:08:24 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0020_01C8E2AF.8FEF2DB0"
Subject: [linux-lvm] vgscan problem: Snapshot and origin LVs must differ.
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

------=_NextPart_000_0020_01C8E2AF.8FEF2DB0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Guys!

I tell you my LVM story....

I have add LVM1 capability to my linux box kernel 2.4.36.5.

So I make (whit success) a snapshot of my /dev/VOLHOME/HOMELV! =
Snapshot's name is SNAPHOME.

Than I restart my linux box.

Now I can't mount /dev/VOLHOME/HOMELV and "vgscan -v" write this =
messages:

:
:
    /dev/sdb1: size is 3906204687 sectors
    /dev/sdb1: lvm1 label detect
    Locking /var/lock/lvm/V_VOLHOME RB
  Finding volume group "VOLHOME"
    /dev/sdb1: lvm1 label detected
    Found /dev/sdb1 in VG VOLHOME
Snapshot and origin LVs must differ.
Couldn't add snapshot.
    Found /dev/sdb1 in VG VOLHOME
Snapshot and origin LVs must differ.
Couldn't add snapshot.
Volume group "VOLHOME" not found
    Unlocking /var/lock/lvm/V_VOLHOME
:
:

I don't know what's happen!

Help me please, thanks Alessandro

------=_NextPart_000_0020_01C8E2AF.8FEF2DB0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2900.3354" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DCourier size=3D2>Hi Guys!</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>I tell you my LVM =
story....</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>I have add LVM1 capability to my =
linux box kernel=20
2.4.36.5.</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>So I make (whit success) =
a&nbsp;snapshot of my=20
/dev/VOLHOME/HOMELV! Snapshot's name is SNAPHOME.</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>Than I restart my linux =
box.</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>Now I can't mount /dev/VOLHOME/HOMELV =
and=20
</FONT><FONT face=3DCourier size=3D2>"vgscan -v" write this =
messages:</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>:</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>:</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>&nbsp;&nbsp;&nbsp; /dev/sdb1: size is =
3906204687=20
sectors</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>&nbsp;&nbsp;&nbsp; /dev/sdb1: lvm1 =
label=20
detect</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>&nbsp;&nbsp;&nbsp; Locking=20
/var/lock/lvm/V_VOLHOME RB</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>&nbsp;&nbsp;Finding volume group=20
"VOLHOME"</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>&nbsp;&nbsp;&nbsp; /dev/sdb1: lvm1 =
label=20
detected</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>&nbsp;&nbsp;&nbsp; Found /dev/sdb1 in =
VG=20
VOLHOME</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>Snapshot and origin LVs must =
differ.</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>Couldn't add snapshot.</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>&nbsp;&nbsp;&nbsp; Found /dev/sdb1 in =
VG=20
VOLHOME</FONT></DIV>
<DIV>
<DIV><FONT face=3DCourier size=3D2>Snapshot and origin LVs must =
differ.</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>Couldn't add =
snapshot.</FONT></DIV></DIV>
<DIV><FONT face=3DCourier size=3D2>Volume group "VOLHOME" not =
found</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>&nbsp;&nbsp;&nbsp; Unlocking=20
/var/lock/lvm/V_VOLHOME</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>:</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2>:</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>I don't know what's =
happen!</FONT></DIV>
<DIV><FONT face=3DCourier size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DCourier size=3D2>Help me please, thanks =
Alessandro</FONT></DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0020_01C8E2AF.8FEF2DB0--
