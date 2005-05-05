Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j457DfO14376
	for <linux-lvm@redhat.com>; Thu, 5 May 2005 03:13:41 -0400
Received: from mpls-qmqp-01.inet.qwest.net (mpls-qmqp-01.inet.qwest.net
	[63.231.195.112])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j457DYD3009335
	for <linux-lvm@redhat.com>; Thu, 5 May 2005 03:13:34 -0400
Date: Thu, 5 May 2005 00:12:25 -0700
Message-ID: <003101c55141$eee53510$6401a8c0@zd7168cl>
From: "James Griffith" <jbg@qwest.net>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_002E_01C55107.1DC1ACA0"
Subject: [linux-lvm] can't find both drives using pvscan
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

------=_NextPart_000_002E_01C55107.1DC1ACA0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I had a power outage and of course don't have a UPS even though I was =
looking at one last week...
I rebooted and something broke

Couldn't find device with uuid 'Cg20dy-acXl-asa5-4L7v-5H5v-Iowz-LnWRXX'.
Couldn't find all physical volumes for volume group vg_ftp.
Volume group "vg_ftp" not found
=20
I have 2 250Gig /dev/hdc and /dev/hdd=20

pvscan can only see one drive and of course I have an old backup which i =
was just thinking about again....

Anyway is there a way that I can set the uuid to the pv and fix my vg =
and lv and still have my data??

Thanks in advance,
James
------=_NextPart_000_002E_01C55107.1DC1ACA0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2900.2627" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I had a power outage and of course =
don't have a UPS=20
even though I was looking at one last week...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I rebooted and something =
broke</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Couldn't find device with uuid=20
'Cg20dy-acXl-asa5-4L7v-5H5v-Iowz-LnWRXX'.<BR>Couldn't find all physical =
volumes=20
for volume group vg_ftp.<BR>Volume group "vg_ftp" not=20
found<BR>&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I have 2 250Gig /dev/hdc and=20
/dev/hdd&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>pvscan can only see one drive and of =
course I have=20
an old backup which i was just thinking about again....</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Anyway is there a way that I can set =
the uuid to=20
the pv and fix my vg and lv and still have my data??</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks in advance,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>James</DIV></FONT></BODY></HTML>

------=_NextPart_000_002E_01C55107.1DC1ACA0--
