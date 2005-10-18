Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9INAVV03027
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2005 19:10:31 -0400
Received: from server4.bfc.net (mail.bfc.net [83.220.131.8])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9INAPJH001272
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2005 19:10:25 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C5D439.16447BC0"
Date: Wed, 19 Oct 2005 01:10:10 +0200
Message-ID: <ED9BF0756A45484AB3EAB2E20D1AD49C7D9DC5@server4.bfc.net>
From: "Durnin, Robert" <robert.durnin@bfc.net>
Subject: [linux-lvm] error on extending ext3
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

------_=_NextPart_001_01C5D439.16447BC0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


I have been looking about for some info on this, but Im quite lost as to =
whether it is a problem of the lvm or my attempts to extend the =
partition which is now using it.

I am using Enterprise Linux 4

and have an existing Logical volume (80gb) with an ext3 file system on =
it. I have recently tried to extend the partition by adding a new =
physical volume (another 80gb drive) and then adding the volume to the =
group. According to the lvm (tool) the physical volume is there, and has =
been added. In fact, the logical volume (when displayed etc) shows =
itself to be the correct size. However, when I try to run resize2fs I =
get messages coming back which say it is impossible and even full.

Im sure Im missing something obvious, perhaps someone can give me some =
pointers, I am not having so much luck with the step-by-steps on the =
internet (for resizing, the initial setup was fine).

thanks, robert

------_=_NextPart_001_01C5D439.16447BC0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.5.7233.28">
<TITLE>error on extending ext3</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->
<BR>

<P><FONT SIZE=3D2>I have been looking about for some info on this, but =
Im quite lost as to whether it is a problem of the lvm or my attempts to =
extend the partition which is now using it.<BR>
<BR>
I am using Enterprise Linux 4<BR>
<BR>
and have an existing Logical volume (80gb) with an ext3 file system on =
it. I have recently tried to extend the partition by adding a new =
physical volume (another 80gb drive) and then adding the volume to the =
group. According to the lvm (tool) the physical volume is there, and has =
been added. In fact, the logical volume (when displayed etc) shows =
itself to be the correct size. However, when I try to run resize2fs I =
get messages coming back which say it is impossible and even full.<BR>
<BR>
Im sure Im missing something obvious, perhaps someone can give me some =
pointers, I am not having so much luck with the step-by-steps on the =
internet (for resizing, the initial setup was fine).<BR>
<BR>
thanks, robert</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C5D439.16447BC0--
