Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mA2ErNC3025649
	for <linux-lvm@redhat.com>; Sun, 2 Nov 2008 09:53:23 -0500
Received: from bay0-omc2-s8.bay0.hotmail.com (bay0-omc2-s8.bay0.hotmail.com
	[65.54.246.144])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mA2ErLYI031972
	for <linux-lvm@redhat.com>; Sun, 2 Nov 2008 09:53:21 -0500
Message-ID: <BAY107-W6A079930227977BE31E098F220@phx.gbl>
Content-Type: multipart/alternative;
	boundary="_b992a730-e219-4400-934c-036b3ef7c06d_"
From: Mark Reardon <markreardon4@hotmail.com>
Date: Sun, 2 Nov 2008 14:53:20 +0000
MIME-Version: 1.0
Subject: [linux-lvm] Error messages during reboot
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

--_b992a730-e219-4400-934c-036b3ef7c06d_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hi All=2C

I've recently rebooted my Rhel 5 server=2C and noticed the following messag=
es during the boot.

Can anybody explain these? Is this some sort of filesystem corruption?

Nov  2 20:11:10 dsgl01 kernel:  emcpowery: p11 exceeds device capacity
Nov  2 20:11:11 dsgl01 kernel: Buffer I/O error on device emcpowery11=2C lo=
gical block 235921904
Nov  2 20:11:11 dsgl01 kernel: attempt to access beyond end of device
Nov  2 20:11:12 dsgl01 kernel: emcpowery: rw=3D0=2C want=3D1904152696=2C li=
mit=3D1887436800
Nov  2 20:11:12 dsgl01 kernel: attempt to access beyond end of device

Thanks for your help=2C

Mark.

_________________________________________________________________
See the most popular videos on the web=20
http://clk.atdmt.com/GBL/go/115454061/direct/01/=

--_b992a730-e219-4400-934c-036b3ef7c06d_
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
Hi All=2C<br><br>I've recently rebooted my Rhel 5 server=2C and noticed the=
 following messages during the boot.<br><br>Can anybody explain these? Is t=
his some sort of filesystem corruption?<br><br>Nov&nbsp=3B 2 20:11:10 dsgl0=
1 kernel:&nbsp=3B emcpowery: p11 exceeds device capacity<br>Nov&nbsp=3B 2 2=
0:11:11 dsgl01 kernel: Buffer I/O error on device emcpowery11=2C logical bl=
ock 235921904<br>Nov&nbsp=3B 2 20:11:11 dsgl01 kernel: attempt to access be=
yond end of device<br>Nov&nbsp=3B 2 20:11:12 dsgl01 kernel: emcpowery: rw=
=3D0=2C want=3D1904152696=2C limit=3D1887436800<br>Nov&nbsp=3B 2 20:11:12 d=
sgl01 kernel: attempt to access beyond end of device<br><br>Thanks for your=
 help=2C<br><br>Mark.<br><br /><hr />Read amazing stories to your kids on M=
essenger <a href=3D'http://clk.atdmt.com/UKM/go/117588488/direct/01/' targe=
t=3D'_new'>Try it Now!</a></body>
</html>=

--_b992a730-e219-4400-934c-036b3ef7c06d_--
