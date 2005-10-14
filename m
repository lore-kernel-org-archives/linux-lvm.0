Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9E1tRV28179
	for <linux-lvm@redhat.com>; Thu, 13 Oct 2005 21:55:28 -0400
Received: from PET-MSTRUZAK (63-197-247-13.turinnetworks.com [63.197.247.13])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id j9E1tD4X021421
	for <linux-lvm@redhat.com>; Thu, 13 Oct 2005 21:55:21 -0400
Message-ID: <06d201c5d062$4c0474a0$7b02010a@turin.turinnetworks.com>
From: "Marcin Struzak" <marcin-list@struzak.com>
Date: Thu, 13 Oct 2005 18:55:04 -0700
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_06CF_01C5D027.9F81E800"
Subject: [linux-lvm] renaming vg and lvs
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

------=_NextPart_000_06CF_01C5D027.9F81E800
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi --

I am running FC3, LVM2, and GRUB, and would like to change the names of =
the installed by default VGs and LVs.  I have a total of 1 VG containing =
3 LVs; one of the LVs is mounted as /.  I am assuming that I can use =
lvrename and vgrename to accomplish this.  Do I need to do it in a =
certain sequence (e.g., VG first, reboot, followed by the LVs)?  I am =
assuming that /etc/fstab is all I need to modify after the rename.  =
Since the VG and one of the LVs are related to /, I guess I will have to =
also edit /boot/grub/grub.conf; do I need to reinstall the bootstrap =
(e.g., with grub-install)?=20

Thanks in advance for any and all comments. =20

--Marcin
------=_NextPart_000_06CF_01C5D027.9F81E800
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1498" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi --</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I am running FC3, LVM2,&nbsp;and GRUB, =
and would=20
like to change the names of the installed by default VGs and LVs.&nbsp; =
I have a=20
total of 1 VG containing 3 LVs; one of the LVs is mounted as /.&nbsp; I =
am=20
assuming that I can use lvrename and vgrename to accomplish this.&nbsp; =
Do I=20
need to do it in a certain sequence (e.g., VG first, reboot, followed by =
the=20
LVs)?&nbsp; I am assuming that /etc/fstab is all I need to modify after =
the=20
rename.&nbsp; Since the VG and one of the LVs are related to /, I guess =
I will=20
have to also edit /boot/grub/grub.conf; do I need to reinstall the =
bootstrap=20
(e.g., with grub-install)?&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks in advance for any and all =
comments.&nbsp;=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>--Marcin</FONT></DIV></BODY></HTML>

------=_NextPart_000_06CF_01C5D027.9F81E800--
