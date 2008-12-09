Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB98wUQ9024642
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 03:58:30 -0500
Received: from bay0-omc2-s15.bay0.hotmail.com (bay0-omc2-s15.bay0.hotmail.com
	[65.54.246.151])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mB98wFAI028720
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 03:58:15 -0500
Message-ID: <BAY107-W52506771954AE1B5160FD48FFA0@phx.gbl>
Content-Type: multipart/alternative;
	boundary="_887cf32a-90c8-49cb-8d1a-0706843db847_"
From: Mark Reardon <markreardon4@hotmail.com>
Subject: RE: [linux-lvm] SCSI errors - qlogic scsi I/O errors
	qla2xxx_eh_abort	scsi(0:0:0:1): cmd_timeout_in_sec=0x1e.
Date: Tue, 9 Dec 2008 08:58:14 +0000
In-Reply-To: <9C203D6FD2BF9D49BFF3450201DEDA5303124171@LI-OWL.hag.hilti.com>
References: <BAY107-W48D83CEC26F385DECFFA8F8FFD0@phx.gbl>
	<9C203D6FD2BF9D49BFF3450201DEDA5303124171@LI-OWL.hag.hilti.com>
MIME-Version: 1.0
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

--_887cf32a-90c8-49cb-8d1a-0706843db847_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Many thanks Michael for the swift response.

Subject: RE: [linux-lvm] SCSI errors - qlogic scsi I/O errors qla2xxx_eh_ab=
ort	scsi(0:0:0:1): cmd_timeout_in_sec=3D0x1e.
Date: Mon=2C 8 Dec 2008 13:48:53 +0100
From: Michael.Hagmann@hilti.com
To: linux-lvm@redhat.com










Mark
=20
we had that onces=2C was a Firmware issue. Here from the=20
Releasenotes=2C check out point 4
=20

Changes to ISP24xx RISC firmware going from V4.00.12 to V4.00.13
1. Fix: Correctly return Sense and Response data in Status IOCB for SCSI Ta=
sk=20
Management commands. [ER42546]
2. Fix: Disable Read XFER_RDY in PRLI ACC. [ER42572]
3. Change: Adjust algorithm for enabling multiple splits during memory read=
=20
DMA across PCI. [ER42969]
4. Fix: Corrected a problem that could result in RISC Pause condition if a=
=20
LOGO was received from a target during IO traffic. [ER43146]
=20
=20
Mike
=20
=20



From: linux-lvm-bounces@redhat.com=20
[mailto:linux-lvm-bounces@redhat.com] On Behalf Of Mark=20
Reardon
Sent: Montag=2C 8. Dezember 2008 12:28
To:=20
linux-lvm@redhat.com
Subject: [linux-lvm] SCSI errors - qlogic scsi=20
I/O errors qla2xxx_eh_abort scsi(0:0:0:1):=20
cmd_timeout_in_sec=3D0x1e.


Hello All=2C

Has anybody ever been able to determine the cause=20
of the below errors?

qla2400 0000:10:00.1: qla2xxx_eh_abort scsi=20
cmd_timeout_in_sec=3D0x1e.
qla2400 0000:10:00.1: qla2xxx_eh_abort scsi:=20
cmd_timeout_in_sec=3D0x1e.
qla2400 0000:10:00.0: qla2xxx_eh_abort scsi=20
cmd_timeout_in_sec=3D0x3c.
qla2400 0000:10:00.0: qla2xxx_eh_abort scsi=20
cmd_timeout_in_sec=3D0x3c.
qla2400 0000:10:00.1: RISC paused -- HCCR=3Dffffffff=2C=20
Dumping firmware!
qla2400 0000:10:00.1: RISC paused -- HCCR=3Dffffffff=2C Dumping=20
firmware!

Thanks.

Regards=2C

Mark



Take your friends with you with Mobile Messenger. Click Here!
_________________________________________________________________
Imagine a life without walls.=A0 See the possibilities.=20
http://clk.atdmt.com/UKM/go/122465943/direct/01/=

--_887cf32a-90c8-49cb-8d1a-0706843db847_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<style>
.hmmessage P
{
margin:0px=3B
padding:0px
}
body.hmmessage
{
font-size: 10pt=3B
font-family:Verdana
}
</style>
</head>
<body class=3D'hmmessage'>
Many thanks Michael for the swift response.<br><br><hr id=3D"stopSpelling">=
Subject: RE: [linux-lvm] SCSI errors - qlogic scsi I/O errors qla2xxx_eh_ab=
ort	scsi(0:0:0:1): cmd_timeout_in_sec=3D0x1e.<br>Date: Mon=2C 8 Dec 2008 13=
:48:53 +0100<br>From: Michael.Hagmann@hilti.com<br>To: linux-lvm@redhat.com=
<br><br>




<style>
.ExternalClass .EC_hmmessage P
{padding-right:0px=3Bpadding-left:0px=3Bpadding-bottom:0px=3Bpadding-top:0p=
x=3B}
.ExternalClass BODY.EC_hmmessage
{font-size:10pt=3Bfont-family:Verdana=3B}
</style>



<div dir=3D"ltr" align=3D"left"><span class=3D"EC_049044612-08122008"><font=
 color=3D"#0000ff" face=3D"Arial">Mark</font></span></div>
<div dir=3D"ltr" align=3D"left"><span class=3D"EC_049044612-08122008"><font=
 color=3D"#0000ff" face=3D"Arial"></font></span>&nbsp=3B</div>
<div dir=3D"ltr" align=3D"left"><span class=3D"EC_049044612-08122008"><font=
 color=3D"#0000ff" face=3D"Arial">we had that onces=2C was a Firmware issue=
. Here from the=20
Releasenotes=2C check out point 4</font></span></div>
<div dir=3D"ltr" align=3D"left"><span class=3D"EC_049044612-08122008"><font=
 color=3D"#0000ff" face=3D"Arial"></font></span>&nbsp=3B</div>
<div dir=3D"ltr" align=3D"left"><span class=3D"EC_049044612-08122008">
Changes to ISP24xx RISC firmware going from V4.00.12 to V4.00.13<BR>
1. Fix: Correctly return Sense and Response data in Status IOCB for SCSI Ta=
sk=20
Management commands. [ER42546]<BR>
2. Fix: Disable Read XFER_RDY in PRLI ACC. [ER42572]<BR>
3. Change: Adjust algorithm for enabling multiple splits during memory read=
=20
DMA across PCI. [ER42969]<BR>
4. Fix: Corrected a problem that could result in RISC Pause condition if a=
=20
LOGO was received from a target during IO traffic. [ER43146]<BR>
&nbsp=3B<BR>
<font color=3D"#0000ff" face=3D"Arial"></font>&nbsp=3B<BR>
<span class=3D"EC_049044612-08122008"><font color=3D"#0000ff" face=3D"Arial=
">Mike</font></span><BR>
<span class=3D"EC_049044612-08122008"><font color=3D"#0000ff" face=3D"Arial=
"></font></span>&nbsp=3B<BR>
<span class=3D"EC_049044612-08122008"><font color=3D"#0000ff" face=3D"Arial=
"></font></span>&nbsp=3B<BR></span></div><br>
<div class=3D"EC_OutlookMessageHeader" dir=3D"ltr" align=3D"left" lang=3D"e=
n-us">
<hr>
<font face=3D"Tahoma"><b>From:</b> linux-lvm-bounces@redhat.com=20
[mailto:linux-lvm-bounces@redhat.com] <b>On Behalf Of </b>Mark=20
Reardon<br><b>Sent:</b> Montag=2C 8. Dezember 2008 12:28<br><b>To:</b>=20
linux-lvm@redhat.com<br><b>Subject:</b> [linux-lvm] SCSI errors - qlogic sc=
si=20
I/O errors qla2xxx_eh_abort scsi(0:0:0:1):=20
cmd_timeout_in_sec=3D0x1e.<br></font><br></div>
<div></div>Hello All=2C<br><br>Has anybody ever been able to determine the =
cause=20
of the below errors?<br><br>qla2400 0000:10:00.1: qla2xxx_eh_abort scsi=20
cmd_timeout_in_sec=3D0x1e.<br>qla2400 0000:10:00.1: qla2xxx_eh_abort scsi:=
=20
cmd_timeout_in_sec=3D0x1e.<br>qla2400 0000:10:00.0: qla2xxx_eh_abort scsi=20
cmd_timeout_in_sec=3D0x3c.<br>qla2400 0000:10:00.0: qla2xxx_eh_abort scsi=20
cmd_timeout_in_sec=3D0x3c.<br>qla2400 0000:10:00.1: RISC paused -- HCCR=3Df=
fffffff=2C=20
Dumping firmware!<br>qla2400 0000:10:00.1: RISC paused -- HCCR=3Dffffffff=
=2C Dumping=20
firmware!<br><br>Thanks.<br><br>Regards=2C<br><br>Mark<br><br>
<hr>
Take your friends with you with Mobile Messenger. <a href=3D"http://clk.atd=
mt.com/UKM/go/msnnkmgl0010000001ukm/direct/01/">Click Here!</a><br /><hr />=
Win John Lewis vouchers with BigSnapSearch.com  <a href=3D'http://clk.atdmt=
.com/UKM/go/117442309/direct/01/' target=3D'_new'>Search now</a></body>
</html>=

--_887cf32a-90c8-49cb-8d1a-0706843db847_--
