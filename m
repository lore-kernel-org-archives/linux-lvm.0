Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB8BSWHX015400
	for <linux-lvm@redhat.com>; Mon, 8 Dec 2008 06:28:32 -0500
Received: from bay0-omc2-s26.bay0.hotmail.com (bay0-omc2-s26.bay0.hotmail.com
	[65.54.246.162])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mB8BSE5d025240
	for <linux-lvm@redhat.com>; Mon, 8 Dec 2008 06:28:14 -0500
Message-ID: <BAY107-W48D83CEC26F385DECFFA8F8FFD0@phx.gbl>
Content-Type: multipart/alternative;
	boundary="_a7584195-f888-4dd5-b7bd-0e23b8515d4b_"
From: Mark Reardon <markreardon4@hotmail.com>
Date: Mon, 8 Dec 2008 11:28:13 +0000
MIME-Version: 1.0
Subject: [linux-lvm] SCSI errors - qlogic scsi I/O errors qla2xxx_eh_abort
 scsi(0:0:0:1): cmd_timeout_in_sec=0x1e.
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

--_a7584195-f888-4dd5-b7bd-0e23b8515d4b_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hello All=2C

Has anybody ever been able to determine the cause of the below errors?

qla2400 0000:10:00.1: qla2xxx_eh_abort=20
scsi cmd_timeout_in_sec=3D0x1e.
qla2400 0000:10:00.1: qla2xxx_eh_abort scsi:=20
cmd_timeout_in_sec=3D0x1e.
qla2400=20
0000:10:00.0: qla2xxx_eh_abort scsi cmd_timeout_in_sec=3D0x3c.
qla2400 0000:10:00.0: qla2xxx_eh_abort=20
scsi cmd_timeout_in_sec=3D0x3c.
qla2400 0000:10:00.1: RISC paused -- HCCR=3Dffffffff=2C Dumping=20
firmware!
qla2400 0000:10:00.1: RISC=20
paused -- HCCR=3Dffffffff=2C Dumping firmware!

Thanks.

Regards=2C

Mark

_________________________________________________________________
Are you a PC?=A0 Upload your PC story and show the world=20
http://clk.atdmt.com/UKM/go/122465942/direct/01/=

--_a7584195-f888-4dd5-b7bd-0e23b8515d4b_
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
Hello All=2C<br><br>Has anybody ever been able to determine the cause of th=
e below errors?<br><br>qla2400 0000:10:00.1: qla2xxx_eh_abort=20
scsi cmd_timeout_in_sec=3D0x1e.<br>qla2400 0000:10:00.1: qla2xxx_eh_abort s=
csi:=20
cmd_timeout_in_sec=3D0x1e.<br>qla2400=20
0000:10:00.0: qla2xxx_eh_abort scsi cmd_timeout_in_sec=3D0x3c.<br>qla2400 0=
000:10:00.0: qla2xxx_eh_abort=20
scsi cmd_timeout_in_sec=3D0x3c.<br>qla2400 0000:10:00.1: RISC paused -- HCC=
R=3Dffffffff=2C Dumping=20
firmware!<br>qla2400 0000:10:00.1: RISC=20
paused -- HCCR=3Dffffffff=2C Dumping firmware!<br><br>Thanks.<br><br>Regard=
s=2C<br><br>Mark<br><br /><hr />Take your friends with you with Mobile Mess=
enger. <a href=3D'http://clk.atdmt.com/UKM/go/msnnkmgl0010000001ukm/direct/=
01/' target=3D'_new'>Click Here!</a></body>
</html>=

--_a7584195-f888-4dd5-b7bd-0e23b8515d4b_--
