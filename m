Return-Path: <lewis@sistina.com>
Date: Tue, 20 Mar 2001 13:17:24 -0600
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] vgscan won't recognize my VG
Message-ID: <20010320131724.B14965@sistina.com>
References: <200103192037.f2JKbQn17560@webber.adilger.int> <3AB7A6F4.4EFA644D@in.tum.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="A6N2fC+uXW/VQSAv"
Content-Disposition: inline
In-Reply-To: <3AB7A6F4.4EFA644D@in.tum.de>; from vidalrod@informatik.tu-muenchen.de on Tue, Mar 20, 2001 at 07:52:37PM +0100
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

--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 20, 2001 at 07:52:37PM +0100, David Vidal Rodriguez wrote:
> OK, I have compiled the beta6 tools.
>=20
> 1) How do I know if the clean linus-2.4.0 kernel has a beta2 lvm module?
> 2) And how do I repair the UUIDs of my PVs?
> 3) Could you tell me where can I download the patch you mentioned?

In answer to questions 1 & 3:
1) a clean linux-2.4.0 kernel does *not* have the beta2 lvm module
3) You also need the beta6 LVM module for best performance.  Look at the
README in the PATCHES directory of the LVM 0.9.1 beta6 source.  This will
explain how to generate the patch for your kernel. =20

Regards,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-379-3951
1313 5th St SE, Suite 111              Fax:    612-379-3952
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
Chaos, panic, pandemonium - my work here is done
-----End Obligatory Humorous Quote------------------------------------------

--A6N2fC+uXW/VQSAv
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6t6zEpE6/iGtdjLERAnemAJ0XAKMzFVPSQDyB4HGcJa1rppD83QCcDz3M
RtO4tN2rUVP4fdB40qBGpHU=
=7Cic
-----END PGP SIGNATURE-----

--A6N2fC+uXW/VQSAv--
