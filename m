Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB8CnADx017041
	for <linux-lvm@redhat.com>; Mon, 8 Dec 2008 07:49:10 -0500
Received: from LI-ERELAYP01.hag.hilti.com (hgw.hilti.com [193.202.255.201])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mB8CmsD0008593
	for <linux-lvm@redhat.com>; Mon, 8 Dec 2008 07:48:55 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C95933.53DEAFA8"
Subject: RE: [linux-lvm] SCSI errors - qlogic scsi I/O errors qla2xxx_eh_abort
	scsi(0:0:0:1): cmd_timeout_in_sec=0x1e.
Date: Mon, 8 Dec 2008 13:48:53 +0100
Message-ID: <9C203D6FD2BF9D49BFF3450201DEDA5303124171@LI-OWL.hag.hilti.com>
In-Reply-To: <BAY107-W48D83CEC26F385DECFFA8F8FFD0@phx.gbl>
References: <BAY107-W48D83CEC26F385DECFFA8F8FFD0@phx.gbl>
From: "Hagmann, Michael" <Michael.Hagmann@hilti.com>
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

------_=_NextPart_001_01C95933.53DEAFA8
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Mark
=20
we had that onces, was a Firmware issue. Here from the Releasenotes,
check out point 4
=20
Changes to ISP24xx RISC firmware going from V4.00.12 to V4.00.13

1. Fix: Correctly return Sense and Response data in Status IOCB for SCSI
Task Management commands. [ER42546]

2. Fix: Disable Read XFER_RDY in PRLI ACC. [ER42572]

3. Change: Adjust algorithm for enabling multiple splits during memory
read DMA across PCI. [ER42969]

4. Fix: Corrected a problem that could result in RISC Pause condition if
a LOGO was received from a target during IO traffic. [ER43146]

=20

=20

Mike

=20

=20


________________________________

From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Mark Reardon
Sent: Montag, 8. Dezember 2008 12:28
To: linux-lvm@redhat.com
Subject: [linux-lvm] SCSI errors - qlogic scsi I/O errors
qla2xxx_eh_abort scsi(0:0:0:1): cmd_timeout_in_sec=3D0x1e.


Hello All,

Has anybody ever been able to determine the cause of the below errors?

qla2400 0000:10:00.1: qla2xxx_eh_abort scsi cmd_timeout_in_sec=3D0x1e.
qla2400 0000:10:00.1: qla2xxx_eh_abort scsi: cmd_timeout_in_sec=3D0x1e.
qla2400 0000:10:00.0: qla2xxx_eh_abort scsi cmd_timeout_in_sec=3D0x3c.
qla2400 0000:10:00.0: qla2xxx_eh_abort scsi cmd_timeout_in_sec=3D0x3c.
qla2400 0000:10:00.1: RISC paused -- HCCR=3Dffffffff, Dumping firmware!
qla2400 0000:10:00.1: RISC paused -- HCCR=3Dffffffff, Dumping firmware!

Thanks.

Regards,

Mark


________________________________

Take your friends with you with Mobile Messenger. Click Here!
<http://clk.atdmt.com/UKM/go/msnnkmgl0010000001ukm/direct/01/> =20

------_=_NextPart_001_01C95933.53DEAFA8
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<STYLE>.hmmessage P {
	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: =
0px; PADDING-TOP: 0px
}
BODY.hmmessage {
	FONT-SIZE: 10pt; FONT-FAMILY: Verdana
}
</STYLE>

<META content=3D"MSHTML 6.00.2900.3395" name=3DGENERATOR></HEAD>
<BODY class=3Dhmmessage>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D049044612-08122008><FONT =
face=3DArial=20
color=3D#0000ff>Mark</FONT></SPAN></DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D049044612-08122008><FONT =
face=3DArial=20
color=3D#0000ff></FONT></SPAN>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D049044612-08122008><FONT =
face=3DArial=20
color=3D#0000ff>we had that onces, was a Firmware issue. Here from the=20
Releasenotes, check out point 4</FONT></SPAN></DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D049044612-08122008><FONT =
face=3DArial=20
color=3D#0000ff></FONT></SPAN>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D049044612-08122008>
<P>Changes to ISP24xx RISC firmware going from V4.00.12 to V4.00.13</P>
<P>1. Fix: Correctly return Sense and Response data in Status IOCB for =
SCSI Task=20
Management commands. [ER42546]</P>
<P>2. Fix: Disable Read XFER_RDY in PRLI ACC. [ER42572]</P>
<P>3. Change: Adjust algorithm for enabling multiple splits during =
memory read=20
DMA across PCI. [ER42969]</P>
<P>4. Fix: Corrected a problem that could result in RISC Pause condition =
if a=20
LOGO was received from a target during IO traffic. [ER43146]</P>
<P>&nbsp;</P>
<P><FONT face=3DArial color=3D#0000ff></FONT>&nbsp;</P>
<P><SPAN class=3D049044612-08122008><FONT face=3DArial=20
color=3D#0000ff>Mike</FONT></SPAN></P>
<P><SPAN class=3D049044612-08122008><FONT face=3DArial=20
color=3D#0000ff></FONT></SPAN>&nbsp;</P>
<P><SPAN class=3D049044612-08122008><FONT face=3DArial=20
color=3D#0000ff></FONT></SPAN>&nbsp;</P></SPAN></DIV><BR>
<DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr align=3Dleft>
<HR tabIndex=3D-1>
<FONT face=3DTahoma><B>From:</B> linux-lvm-bounces@redhat.com=20
[mailto:linux-lvm-bounces@redhat.com] <B>On Behalf Of </B>Mark=20
Reardon<BR><B>Sent:</B> Montag, 8. Dezember 2008 12:28<BR><B>To:</B>=20
linux-lvm@redhat.com<BR><B>Subject:</B> [linux-lvm] SCSI errors - qlogic =
scsi=20
I/O errors qla2xxx_eh_abort scsi(0:0:0:1):=20
cmd_timeout_in_sec=3D0x1e.<BR></FONT><BR></DIV>
<DIV></DIV>Hello All,<BR><BR>Has anybody ever been able to determine the =
cause=20
of the below errors?<BR><BR>qla2400 0000:10:00.1: qla2xxx_eh_abort scsi=20
cmd_timeout_in_sec=3D0x1e.<BR>qla2400 0000:10:00.1: qla2xxx_eh_abort =
scsi:=20
cmd_timeout_in_sec=3D0x1e.<BR>qla2400 0000:10:00.0: qla2xxx_eh_abort =
scsi=20
cmd_timeout_in_sec=3D0x3c.<BR>qla2400 0000:10:00.0: qla2xxx_eh_abort =
scsi=20
cmd_timeout_in_sec=3D0x3c.<BR>qla2400 0000:10:00.1: RISC paused -- =
HCCR=3Dffffffff,=20
Dumping firmware!<BR>qla2400 0000:10:00.1: RISC paused -- =
HCCR=3Dffffffff, Dumping=20
firmware!<BR><BR>Thanks.<BR><BR>Regards,<BR><BR>Mark<BR><BR>
<HR>
Take your friends with you with Mobile Messenger. <A=20
href=3D"http://clk.atdmt.com/UKM/go/msnnkmgl0010000001ukm/direct/01/"=20
target=3D_new>Click Here!</A> </BODY></HTML>

------_=_NextPart_001_01C95933.53DEAFA8--
