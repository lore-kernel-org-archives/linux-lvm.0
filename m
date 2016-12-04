Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uB4Dqv23003460
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sun, 4 Dec 2016 08:52:57 -0500
Received: from nemato.nesselzelle.de (nemato.nesselzelle.de [176.9.85.107])
	by mx1.redhat.com (Postfix) with ESMTP id 3CBAF4E4CA
	for <linux-lvm@redhat.com>; Sun,  4 Dec 2016 13:52:55 +0000 (UTC)
Received: from sturbolzen ([127.0.0.1]:36185)
	by localhost.localdomain with [XMail 1.27 ESMTP Server]
	id <S2E337> for <linux-lvm@redhat.com> from <thomas-forum@orgis.org>;
	Sun, 4 Dec 2016 12:50:42 +0100
Date: Sun, 4 Dec 2016 12:50:40 +0100
From: Thomas Orgis <thomas-forum@orgis.org>
Message-ID: <20161204125040.1fbe0996@sturbolzen>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/opgDQs3HaBx3QqbQkdf9th6";
	protocol="application/pgp-signature"
Subject: [linux-lvm] [PATCH] fix link to dmsetup.static when /sbin and
 /usr/sbin are not the same
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

--Sig_/opgDQs3HaBx3QqbQkdf9th6
Content-Type: multipart/mixed; boundary="MP_/4QnO0gItE9RYMvNI8VoYQAp"

--MP_/4QnO0gItE9RYMvNI8VoYQAp
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

LVM2.2.02.168 (and earlier) has that in Makefile.in

install_dmsetup_dynamic: dmsetup
	$(INSTALL_PROGRAM) -D $< $(sbindir)/$(<F)
	$(LN_S) -f $(<F) $(sbindir)/dmstats

install_dmsetup_static: dmsetup.static
	$(INSTALL_PROGRAM) -D $< $(staticdir)/$(<F)
	$(LN_S) -f $(<F) $(sbindir)/dmstats

This results in

lrwxrwxrwx 1 root root 14  4. Dez 12:33 /sbin/dmstats -> dmsetup.static

=E2=80=A6 while the target for that link is

-r-xr-xr-x 1 root root 1252120  4. Dez 12:33 /usr/sbin/dmsetup.static

I suppose the second link command should create $(staticdir)/dmstats.
Regardless of whether your /sbin is a link to /usr/sbin or the other
way round, this seems more proper. I am not sure if we want to enforce
the link pointing always to the static binary if they end up in the
same directory.

Anyhow, I attached the trivial patch that avoids a broken symlink.


Alrighty then,

Thomas

--MP_/4QnO0gItE9RYMvNI8VoYQAp
Content-Type: text/x-patch
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=lvm-static-dmstats.patch

--- LVM2.2.02.168/tools/Makefile.in.orig	2016-12-04 12:37:11.181407587 +0100
+++ LVM2.2.02.168/tools/Makefile.in	2016-12-04 12:37:16.251407927 +0100
@@ -209,7 +209,7 @@
=20
 install_dmsetup_static: dmsetup.static
 	$(INSTALL_PROGRAM) -D $< $(staticdir)/$(<F)
-	$(LN_S) -f $(<F) $(sbindir)/dmstats
+	$(LN_S) -f $(<F) $(staticdir)/dmstats
=20
 install_device-mapper: $(INSTALL_DMSETUP_TARGETS)
=20

--MP_/4QnO0gItE9RYMvNI8VoYQAp--

--Sig_/opgDQs3HaBx3QqbQkdf9th6
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYRAMQAAoJECMcTLxg1cr+tacP+wYE9+2yR/Ko/nHPyB4N7elq
cYooxTWuKJT91XllcejE9N26OYFG/VEW6AOVaLaet/HqMDwixZdPA3yYSpYDfB5w
4VmCgF9GPmEFf0Bd6blrh3ph2SPBaWP/ZW8c1tXzeHqMJy+aJBi5m6TL2N8CoKbW
V10QkImvdXn0/NYQ+Hi2e/6bYQFO53Pi/m96D8uc2EmtQUs2mqscauKO0xr5TTs8
b5mYWm6FfTyKSP9sprEFPnzG8azdNOZO2dEm/hUhRYTyLV/WIGLYnZsO32tVB8D5
7MRg2Alcz/Hg/op1v4M7HeUnhs8JyZMJaXHfKvy9uTeq8wW0oI0JfVUZDCsJypkZ
pPOziC4UFqzTCVDRAFxh53PBgW2NbQ0+cSq8cg2e5XH7GRcU5zEZ16yjEKS/2qLa
LgUSm8M8/rwEVs24WRpi+rABCgCzX4ceCw9vUMyLlBNqGMpjI/AG1alExh5UBtfq
reftHznFym1ZvdqIQE9BHmpsCY4jYENbSZnR2y8YEgV1oynpoDvFVpLne+u3O6u+
5rdzFoJu75pp9kNVLY+0kDH4ogZA2n23dWAWjjxrCLXqxga2VWOQLh/0nuSp4+Uf
9BqRpRrLsYUud160GxTqsTeg4SKATMhyzhktIdPeTZ33iYmi1FU7/Wc3JJ5h9o4I
01TgjceiZ5tAgYa5lR+E
=ssMs
-----END PGP SIGNATURE-----

--Sig_/opgDQs3HaBx3QqbQkdf9th6--
