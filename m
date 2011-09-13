Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p8DJQOjX019975
	for <linux-lvm@redhat.com>; Tue, 13 Sep 2011 15:26:24 -0400
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8DJQIgh028644
	for <linux-lvm@redhat.com>; Tue, 13 Sep 2011 15:26:19 -0400
Received: by eyx24 with SMTP id 24so749453eyx.33
	for <linux-lvm@redhat.com>; Tue, 13 Sep 2011 12:26:18 -0700 (PDT)
Message-ID: <4E6FAC6C.9010207@gmail.com>
Date: Tue, 13 Sep 2011 21:18:04 +0200
From: Klaus Lichtenwalder <lichtenwalder@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig496D39C4066EDDA2ADD94C1D"
Subject: [linux-lvm] RHEL: special ownership for lv devices?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig496D39C4066EDDA2ADD94C1D
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I just can't find any pointers. Problem is, our database guys want to
use Oracle ASM (which is some kind of raw devices). To not mix things up
between regular volumes and ASM devices, we decided to put them into a
special vg (yes, oracle recommends against it, but you somehow has to
administer the machines. And looking into their shell scripts, it seems
to not being a thing of reason but more the lack of know how of handling
arbitrary block devices).
Anyway, we'd like the devices to end up with owner oracle:dba. There
seems to be no way, as udev does not create the devices but vgchange, to
change the ownership than by using a start script somewhere between
vgchange time and oracle asm start up.

Is there any other, more "canonical" way?

Klaus
--=20
------------------------------------------------------------------------
 Klaus Lichtenwalder, Dipl. Inform.,  http://www.lichtenwalder.name
 PGP Key fingerprint: BF52 72FA 1F5A 1E29 C0F8  498C C4C6 633C 2821 97DA


--------------enig496D39C4066EDDA2ADD94C1D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQIcBAEBAgAGBQJOb6xsAAoJEMTGYzwoIZfa8VYQAOC9AevCztTOQcCD+GcC33DZ
bmP0/TKRgX5wt3lVxLMQFi9zcdCLrYEbVGRofpzxnzDofsZEuba6UvOlBreDG0yL
8Gq6Ll4jjkaK/tk0pAyQkohKZM0hCpUcd0XLEhJjoWQ7cItmckbkbm9BVDA0tPSn
m1GCxJ/EXM9sIM+6aAmFjXY/9fHnfg4MB7K9PUysvaI0XWMVtvS98iGtCatSMDd1
gAIkikbZJP6DI1YdpNkmAPW/ueh6n7MOBMY1wcs0FFQtGQn+qsMmhcZTZq0ZzIGU
rwGKElSsWhf6XsdfhjC49jRUuUG87tCuKXHWY5gQqK+UJP53DNQd9YvZObrOAdh0
ndhrkQVEZLUXz/C8wkj/i5YlAtfcwbSUU+6sH8xOYalYZVICRvSOt6DzC0uVXLtS
OglyEKQZUYp5FQoGz9RBUoXwtjP1YHu6JcU2p3SyALD0KeBS5yvNeC5T+Xma66Sa
QM2AqOiWQK7D0hNwjBrolyVTazu0fvIfpZQOHgQTgaeYfgDnJ3lQRD7nAqNL7G58
YLSJOypK0p4xZCM7J3Gwvp6MSRXxmOnW2GYZa0wNsWapFsHb0Xrpmq2i+KC13qcJ
ODmiJE/RWtHcJ9b57r66J1uYiF7lyb9IuKP0DrQVqTd9FcutKLAYTScCk/5aKrXG
srsdS8k1mEuJxYrMG3GE
=G6zl
-----END PGP SIGNATURE-----

--------------enig496D39C4066EDDA2ADD94C1D--
