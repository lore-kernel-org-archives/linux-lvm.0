Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA88Gpr19466
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 03:16:51 -0500
Received: from mail.fhbb.ch (smtp.fhbb.ch [193.222.241.18] (may be forged))
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iA88Gl7l010163
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 03:16:47 -0500
Received: from IFIC8078 ([10.1.100.183])
	by mail.fhbb.ch (8.12.3/8.12.3/SuSE Linux 0.6) with ESMTP id
	iA88FCE5007183
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 09:15:17 +0100
Date: Mon, 8 Nov 2004 09:16:24 +0100
From: Markus Wiedmer - FHBB <markus.wiedmer@stud.fhbb.ch>
Message-ID: <88707567.20041108091624@stud.fhbb.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha1"; boundary="----------DC1B52472BE9BDBA"
Subject: [linux-lvm] VGs not detected at startup
Reply-To: Markus Wiedmer - FHBB <markus.wiedmer@stud.fhbb.ch>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

------------DC1B52472BE9BDBA
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

hi all,

I'm running lvm2.00.25 on kernel 2.6.9, but I have problems with
detecting the VGs.Immediately after bootup, vgscan returns: no volume
groups found, same for lvscan and pvscan. I have my root
partition on my Primary IDE-Drive (hda) and the VGs lie on the
serial-ATA-Drive (sda).

Now after I run fdisk on /dev/sda (just run it an quit again). all my
VGs mysteriously appear on the next vgscan.

I guess I'm missing something, but I can't see what. Does anyone know
this problem?

Thanks in advance

markus


--=20
Mit freundlichen Gr=FCssen
Markus Wiedmer - FHBB


------------DC1B52472BE9BDBA
Content-Type: application/pgp-signature

-----BEGIN PGP MESSAGE-----
Version: PGP SDK 3.0.4
Comment: ""

iQA/AwUBQY8rWJ9eUGiOXF3kEQK8cACgyra+8NCP0vB0RGI2O1NrmqIwOYwAnjcM
tD/MR3DRUQ80h+5+aOXDbmQW
=e4sz
-----END PGP MESSAGE-----

------------DC1B52472BE9BDBA--
