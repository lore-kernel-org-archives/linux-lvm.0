Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6CM4IGV028446
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 18:04:18 -0400
Received: from mail2.renkhoff.de (mail2.renkhoff.de [62.157.182.252])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6CM49n3016879
	for <linux-lvm@redhat.com>; Wed, 12 Jul 2006 18:04:10 -0400
Received: from s01edv50.warema.de (localhost [127.0.0.1])
	by mail2.renkhoff.de (Postfix) with ESMTP id DA1C99B376
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 00:04:02 +0200 (CEST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C6A5FF.152958A4"
Date: Thu, 13 Jul 2006 00:04:01 +0200
Message-ID: <7CA7BBF7F95AA245ACAB8E28A6285EB905191D94@s01edv50.warema.de>
From: "Fiederling, Daniel" <daniel.fiederling@warema.de>
Subject: [linux-lvm] SAN setup with host mirrored disks
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

------_=_NextPart_001_01C6A5FF.152958A4
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm relatively new to SAN setup with linux boxes, so maybe this is a
very easy question. Today I set up a linux box with two qlogic hbas,
each one is connected to a EMC Clarion. So I got two disks (/dev/sda and
/dev/sdb) from my storages that I have to mirror on the host system.
There is on mirror set up in the san environment!

How can I set up mirroring of the two disks if I want to use lvm for the
ease of later disk expansion? If I use raidtools (md-stuff) will it be
possible to expand the two disks and the logical disk without data loss?
What are the needed steps if I have to increase the disk space? First
expand the md devices through raidreconf and then expand the volume
group and file system? As far as I read the man pages raidreconf only
works with raid 0 and 5. It seems to me as if I'm not on the right
lane...

Is it possible to use lvm for mirroring physical volumes? If this is
possible I expect that this will be the better solution.

Hope someone can tell me about his experiences with such an scenario.

Ciao
Daniel


------_=_NextPart_001_01C6A5FF.152958A4
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.5.7650.28">
<TITLE>SAN setup with host mirrored disks</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT SIZE=3D2 FACE=3D"Arial">Hi,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I'm relatively new to SAN setup with =
linux boxes, so maybe this is a very easy question. Today I set up a =
linux box with two qlogic hbas, each one is connected to a EMC Clarion. =
So I got two disks (/dev/sda and /dev/sdb) from my storages that I have =
to mirror on the host system. There is on mirror set up in the san =
environment!</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">How can I set up mirroring of the two =
disks if I want to use lvm for the ease of later disk expansion? If I =
use raidtools (md-stuff) will it be possible to expand the two disks and =
the logical disk without data loss? What are the needed steps if I have =
to increase the disk space? First expand the md devices through =
raidreconf and then expand the volume group and file system? As far as I =
read the man pages raidreconf only works with raid 0 and 5. It seems to =
me as if I'm not on the right lane...</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Is it possible to use lvm for mirroring =
physical volumes? If this is possible I expect that this will be the =
better solution.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Hope someone can tell me about his =
experiences with such an scenario.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Ciao</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Daniel</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C6A5FF.152958A4--
