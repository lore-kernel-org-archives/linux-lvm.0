From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Message-ID: <20040119134934.GP3669@tangerine.coulon.evette>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="w2JjAQZceEVGylhD"
Content-Disposition: inline
Subject: [linux-lvm] Mivration from lvm1 to lvm2
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
Date: Mon Jan 19 12:12:01 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--w2JjAQZceEVGylhD
Content-Type: text/plain; Format=Flowed; DelSp=Yes; charset=ISO-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I plan to migrate from lvm1 to lvm2 to be compliant with 2.6.x.
I've Debian sid with linux 2.4.24 with the device mapper compiled as a =20
module.

I've installed both the packages lvm10 and lvm2.

The device mapper module is loaded but the system seems to be using =20
lvm1.

I have a couple of questions:
 - What is to be done to switch to lvm2 ?
 - I use lvm for / and I build and initrd with the lvmcreate-initrd =20
tool. Such a tool is not part of lvm2. How can I create the initrd ? =20
With the tools from initrd-tools package ?

--
Regards
			- Jean-Luc
--w2JjAQZceEVGylhD
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBAC+BuUdGGXzzGnNARAuqyAJ9V09ga9XcSzDT+mHhUbNyJvm2/iQCeMe4T
yyKReJB3VaKrT6MYKtdqk/k=
=Bq9e
-----END PGP SIGNATURE-----

--w2JjAQZceEVGylhD--
