Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9K2KVEd002835
	for <linux-lvm@redhat.com>; Thu, 19 Oct 2006 22:20:31 -0400
Received: from mail129.messagelabs.com (mail129.messagelabs.com
	[216.82.250.147])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k9K2KUJC001726
	for <linux-lvm@redhat.com>; Thu, 19 Oct 2006 22:20:30 -0400
Received: (from b034547 [10.88.35.2])
	by smtp.boscovs.com (SAVSMTP 3.1.7.47) with SMTP id
	M2006101922233901818
	for <linux-lvm@redhat.com>; Thu, 19 Oct 2006 22:23:39 -0400
Message-ID: <00f301c6f3ee$0b2f40d0$0223580a@b034547>
From: "Rob Schwartz" <rschwartz@boscovs.com>
Date: Thu, 19 Oct 2006 22:18:33 -0400
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00F0_01C6F3CC.83CA29A0"
Subject: [linux-lvm] vgcfgrestore -o 
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
To: listserv lvm posting <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

------=_NextPart_000_00F0_01C6F3CC.83CA29A0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hey everyone,

I'm having some difficulties... kernel 2.4.19 and lvm 3.0.6.   I'm =
trying to restore a vg config .   On the cfg backup the original pv was =
/dev/dasdt1 (PV UUID last digits KgtiDw).  The current pv is /dev/dasdu1 =
and I mucked up the VGDA on that PV so that it has another PV UUID).  =
Now I'm trying to fix it...=20

 vgcfgrestore -f /etc/lvmconf/vgdata.conf.1.old  --name vgdata -o =
/dev/dasdt1 -v /dev/dasdu1

says
vgcfgrestore -- "/dev/dasdu1" may not be an actual physical volume of =
volume group "vgdata"

Why can't I get LVM to just write the /dev/dasdt1 backup onto the =
/dev/dasdu1 VGDA??

Thanks,
Rob

------=_NextPart_000_00F0_01C6F3CC.83CA29A0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2900.2963" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT size=3D2>Hey everyone,</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>I'm having some difficulties... kernel 2.4.19 and =
lvm=20
3.0.6.&nbsp;&nbsp; I'm trying to restore a vg config .&nbsp;&nbsp; On =
the cfg=20
backup the original pv was /dev/dasdt1 (PV UUID last digits =
KgtiDw).&nbsp; The=20
current pv is /dev/dasdu1 and I mucked up the VGDA on that PV so that it =
has=20
another PV UUID).&nbsp; Now I'm trying to fix it... </FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>&nbsp;vgcfgrestore -f =
/etc/lvmconf/vgdata.conf.1.old&nbsp;=20
--name vgdata -o /dev/dasdt1 -v /dev/dasdu1<BR></FONT></DIV>
<DIV><FONT size=3D2>says</FONT></DIV>
<DIV><FONT size=3D2>vgcfgrestore -- "/dev/dasdu1" may not be an actual =
physical=20
volume of volume group "vgdata"</DIV></FONT>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>Why can't I get LVM to just write the /dev/dasdt1 =
backup onto=20
the /dev/dasdu1 VGDA??</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>Thanks,</FONT></DIV>
<DIV><FONT size=3D2>Rob</FONT></DIV>
<DIV><FONT size=3D2>&nbsp;</DIV></FONT></BODY></HTML>

------=_NextPart_000_00F0_01C6F3CC.83CA29A0--
