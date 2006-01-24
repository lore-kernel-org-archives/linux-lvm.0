Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0OLwL110295
	for <linux-lvm@redhat.com>; Tue, 24 Jan 2006 16:58:21 -0500
Received: from oxhp.com (mx2.oxhp.com [199.97.64.17])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0OLwEhA009044
	for <linux-lvm@redhat.com>; Tue, 24 Jan 2006 16:58:15 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C62130.EFB940FB"
Date: Tue, 24 Jan 2006 16:55:48 -0500
Message-ID: <CF88E297901EB040B49935FE71B99A2D01F49E12@CTTRBEXVS01.oxhp.com>
From: "Kapadia, Nayan U." <nkapadia@oxhp.com>
Subject: [linux-lvm] file descriptor 3 left open
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

------_=_NextPart_001_01C62130.EFB940FB
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I keep seeing "file descriptor 3 left open" at boot after the initrd is
loaded.  The systems boots to the 2.6.9-22.0.1 kernel and works fine.  I
have ran fsck against all filesystems however the error messages still
appears.  I noticed that when I run system-config-lvm these errors are
more predominant. =20
=20
File descriptor 13 left open
File descriptor 3 left open
File descriptor 4 left open
File descriptor 8 left open
File descriptor 9 left open
File descriptor 10 left open
File descriptor 11 left open
File descriptor 12 left open
File descriptor 13 left open
File descriptor 3 left open
File descriptor 4 left open
File descriptor 8 left open
File descriptor 9 left open
File descriptor 10 left open
File descriptor 11 left open
File descriptor 12 left open
File descriptor 13 left open

=20
I recently installed the new kernel 2.6.9-22.0.2 but the system does not
find kernel at boot.  I think the file descriptor messages are a symptom
to some greater problem.  Please help.
=20
thank you!
=20
Nayan
=20
=20

------_=_NextPart_001_01C62130.EFB940FB
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2900.2180" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D575134921-24012006><FONT face=3DArial size=3D2>I keep =
seeing "file=20
descriptor 3 left open" at boot after the initrd is loaded.&nbsp; The =
systems=20
boots to the 2.6.9-22.0.1 kernel and works fine.&nbsp; I have ran fsck =
against=20
all filesystems however the error messages still appears.&nbsp; I =
noticed that=20
when I run system-config-lvm these errors are more predominant.&nbsp;=20
</FONT></SPAN></DIV>
<DIV><SPAN class=3D575134921-24012006><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D575134921-24012006><FONT face=3DArial size=3D2>File =
descriptor 13=20
left open<BR>File descriptor 3 left open<BR>File descriptor 4 left =
open<BR>File=20
descriptor 8 left open<BR>File descriptor 9 left open<BR>File descriptor =
10 left=20
open<BR>File descriptor 11 left open<BR>File descriptor 12 left =
open<BR>File=20
descriptor 13 left open<BR>File descriptor 3 left open<BR>File =
descriptor 4 left=20
open<BR>File descriptor 8 left open<BR>File descriptor 9 left =
open<BR>File=20
descriptor 10 left open<BR>File descriptor 11 left open<BR>File =
descriptor 12=20
left open<BR>File descriptor 13 left open<BR></FONT></SPAN></DIV>
<DIV><SPAN class=3D575134921-24012006><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D575134921-24012006><FONT face=3DArial size=3D2>I =
recently installed=20
the new kernel 2.6.9-22.0.2 but the system does not find kernel at =
boot.&nbsp; I=20
think the file descriptor messages are a symptom to some greater =
problem.&nbsp;=20
Please help.</FONT></SPAN></DIV>
<DIV><SPAN class=3D575134921-24012006><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D575134921-24012006><FONT face=3DArial size=3D2>thank=20
you!</FONT></SPAN></DIV>
<DIV><SPAN class=3D575134921-24012006><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D575134921-24012006><FONT face=3DArial=20
size=3D2>Nayan</FONT></SPAN></DIV>
<DIV><SPAN class=3D575134921-24012006><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D575134921-24012006><FONT face=3DArial=20
size=3D2>&nbsp;</DIV></FONT></SPAN></BODY></HTML>

------_=_NextPart_001_01C62130.EFB940FB--
