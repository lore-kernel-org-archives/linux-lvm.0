Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6QGfPV24176
	for <linux-lvm@redhat.com>; Tue, 26 Jul 2005 12:41:25 -0400
Received: from msr61.hinet.net (msr61.hinet.net [168.95.4.161])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j6QGfIEC005850
	for <linux-lvm@redhat.com>; Tue, 26 Jul 2005 12:41:19 -0400
Received: from asuspc (61-230-202-133.dynamic.hinet.net [61.230.202.133])
	by msr61.hinet.net (8.9.3/8.9.3) with SMTP id AAA01800
	for <linux-lvm@redhat.com>; Wed, 27 Jul 2005 00:41:14 +0800 (CST)
Message-ID: <008001c59203$1553fc70$7e01a8c0@asuspc>
From: =?big5?B?sWmnyqZ7?= <ctc1230@ms67.hinet.net>
Date: Wed, 27 Jul 2005 00:57:16 +0800
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_007D_01C59246.21F02740"
Subject: [linux-lvm] How to recover data corrupted by vgcreate
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

------=_NextPart_000_007D_01C59246.21F02740
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

Hi,

I have a Linux PC with Fedora C3 installed.
The disk was partitioned automatically when Linux was installed.
So, LVM2 partition was created.
The CPU is damaged today and I move the disk to another Linux PC and try =
to read data out.
The disk is connected to device /dev/hdd. /dev/hdd2 is the LVM2 =
partition.
But, I do a stupid thing. I invoke vgcreate command on /dev/hdd2.

    vgcreate vg_name /dev/hdd2

The partition seems to be lost.
How can I recover the data in /dev/hdd2?
It's very important data to me.
Thanks for any help.

Davis

------=_NextPart_000_007D_01C59246.21F02740
Content-Type: text/html;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Dbig5">
<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3D=B2=D3=A9=FA=C5=E9 size=3D2>
<DIV><FONT size=3D2>Hi,</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>I have a Linux PC with Fedora C3 =
installed.</FONT></DIV>
<DIV><FONT size=3D2>The disk was partitioned automatically when =
Linux&nbsp;was=20
installed.</FONT></DIV>
<DIV><FONT size=3D2>So, LVM2 partition&nbsp;was created.</FONT></DIV>
<DIV><FONT size=3D2>The CPU is damaged today and I move the disk to =
another Linux=20
PC and try to read data out.</FONT></DIV>
<DIV><FONT size=3D2>The disk is connected to device /dev/hdd. /dev/hdd2 =
is the=20
LVM2 partition.</FONT></DIV>
<DIV><FONT size=3D2>But, I do a stupid thing. I invoke vgcreate command =
on=20
/dev/hdd2.</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>&nbsp;&nbsp;&nbsp; vgcreate vg_name =
/dev/hdd2</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>The partition seems to be lost.</FONT></DIV>
<DIV><FONT size=3D2>How can I recover the data in =
/dev/hdd2?</FONT></DIV>
<DIV><FONT size=3D2>It's very important data to me.</FONT></DIV>
<DIV><FONT size=3D2>Thanks for any help.</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>Davis</FONT></DIV>
<DIV>&nbsp;</DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_007D_01C59246.21F02740--
