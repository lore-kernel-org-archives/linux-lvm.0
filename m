Date: Mon, 15 May 2000 18:21:26 -0500
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Re: [linux-lvm] How can activate the LVM in start
Message-ID: <20000515182126.A17908@omnifarious.mn.org>
References: <00a201bfbe75$7395a020$4b1f04d5@migue> <20000515194742.A1442@home.ds9a.nl> <392048A3.BA78B2A3@ednet.ns.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
In-Reply-To: <392048A3.BA78B2A3@ednet.ns.ca>; from boutilpj@ednet.ns.ca on Mon, May 15, 2000 at 03:57:40PM -0300
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Patrick Boutilier <boutilpj@ednet.ns.ca>
Cc: linux-lvm@msede.com


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2000 at 03:57:40PM -0300, Patrick Boutilier wrote:
> Or stick it in your system startup files like /etc/rc.d/rc.sysinit on REd=
Hat
> Linux.

	That's all fine and good, but where in rc.sysinit?  I tried
putting it just before the root filesystems are mounted read/write, and
that didn't seem to work.

Have fun (if at all possible),
--=20
Its name is Public Opinion.  It is held in reverence. It settles everything.
Some think it is the voice of God.  Loyalty to petrified opinion never yet
broke a chain or freed a human soul.     ---Mark Twain
-- Eric Hopper (hopper@omnifarious.mn.org  http://omnifarious.mn.org/~hoppe=
r) --

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE5IIZ2G4QeWBeRdS8RAowyAKC9l6uMbMHgnV/R4NDqbZxSI3KnOgCg0472
rcxPRaQrHIWUpkI/WcKvFr0=
=f+7O
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
