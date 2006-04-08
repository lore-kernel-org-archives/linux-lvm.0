Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k38NHC0p031247
	for <linux-lvm@redhat.com>; Sat, 8 Apr 2006 19:17:12 -0400
Received: from mail.nederland.net (mail.nederland.net [83.137.20.15])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k38NHAWT015436
	for <linux-lvm@redhat.com>; Sat, 8 Apr 2006 19:17:11 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by romeo.computel.nl (Postfix) with ESMTP id 5A5D614027
	for <linux-lvm@redhat.com>; Sun,  9 Apr 2006 01:17:09 +0200 (CEST)
Received: from mail.nederland.net ([127.0.0.1])
	by localhost (romeo.computel.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 29972-18 for <linux-lvm@redhat.com>;
	Sun,  9 Apr 2006 01:17:03 +0200 (CEST)
Received: from balefirehome (balefire.demon.nl [212.238.240.59])
	by romeo.computel.nl (Postfix) with ESMTP id B7DE914007
	for <linux-lvm@redhat.com>; Sun,  9 Apr 2006 01:17:03 +0200 (CEST)
Message-ID: <00a001c65b62$e7e624a0$64c8a8c0@balefirehome>
From: "Sander Steffann" <s.steffann@computel.nl>
References: <1144412972.44365b2c36361@mail.sify.com>
Subject: Re: [linux-lvm] LVM over IP network
Date: Sun, 9 Apr 2006 01:19:37 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_009D_01C65B73.AB382D30"
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

------=_NextPart_000_009D_01C65B73.AB382D30
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
  I have 10 Dell workstation on a LAN. Each  workstation has 80
  GB hard drive. Two workstations consumed most of the disk space and
  remaining eight workstations still has plenty of disk space unused.

  ...

  What I want basically, if I could just collect those 800 GB
  excess space (not utilized) and assign it to the work stations =
starving
  for disk space. Is this achievable through LVM or EVMS?
I would never do something like this. You make each workstation =
dependent on all the other workstations. If one of them is turned off, =
crashes, dies, etc. your other workstations lose their data. Disks are =
cheap these days. Just buy an extra drive for the workstations that need =
it.

Good luck,
Sander

------=_NextPart_000_009D_01C65B73.AB382D30
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2900.2802" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
<BLOCKQUOTE=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">I have 10 Dell workstation on a LAN. =
Each&nbsp;=20
  workstation has 80<BR>GB hard drive. Two workstations consumed most of =
the=20
  disk space and<BR>remaining eight workstations still has plenty of =
disk space=20
  unused.</DIV>
  <DIV style=3D"FONT: 10pt arial"><BR>...</DIV>
  <DIV style=3D"FONT: 10pt arial">&nbsp;</DIV>
  <DIV style=3D"FONT: 10pt arial">What I want basically, if I could just =
collect=20
  those 800 GB<BR>excess space (not utilized) and assign it to the work =
stations=20
  starving<BR>for disk space. Is this achievable through LVM or=20
EVMS?</DIV></BLOCKQUOTE>
<DIV style=3D"FONT: 10pt arial">I would never do something like this. =
You make=20
each workstation dependent on all the other workstations. If one of them =
is=20
turned off, crashes, dies, etc. your other workstations lose their data. =
Disks=20
are cheap these days. Just buy an extra drive for the workstations that =
need=20
it.</DIV>
<DIV style=3D"FONT: 10pt arial">&nbsp;</DIV>
<DIV style=3D"FONT: 10pt arial">Good luck,</DIV>
<DIV style=3D"FONT: 10pt arial">Sander</DIV>
<DIV style=3D"FONT: 10pt arial">&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_009D_01C65B73.AB382D30--
