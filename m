Return-Path: <lewis@sistina.com>
Date: Wed, 30 May 2001 09:25:15 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Re: Help! Upgrade 2.2.18 -> 2.4.4 killed a PV
Message-ID: <20010530092515.B8950@sistina.com>
References: <20010529010628.E1971@jensbenecke.de> <20010529093436.A792@jensbenecke.de> <20010529211128.B27030@sistina.com> <20010529214021.A1594@jensbenecke.de> <20010530112809.C30938@sistina.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qlTNgmc+xy1dBmNv"
Content-Disposition: inline
In-Reply-To: <20010530112809.C30938@sistina.com>; from Mauelshagen@sistina.com on Wed, May 30, 2001 at 11:28:09AM +0200
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--qlTNgmc+xy1dBmNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Just an update on this:

Jens and I talked on IRC (irc.openprojects.net #lvm) about the problem.
Turns out it was our old friend the missing UUID again.  We fixed it by
manually adding the missing UUIDs in using a hexeditor on a copy of the
metadata, then using dd to copy the metadata back onto the disk.  Nothing
else seemed to work.

Regards,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
Quitters never win, and winners never quit,
but those who never quit AND never win are idiots.
-----End Obligatory Humorous Quote------------------------------------------

--qlTNgmc+xy1dBmNv
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7FQLJpE6/iGtdjLERAsDyAKCEnywRQWEXMQdacblXU0tqhE/7EwCfT3Wu
7HITvcNUJMj+MCJZAMTRaEY=
=c3zp
-----END PGP SIGNATURE-----

--qlTNgmc+xy1dBmNv--
