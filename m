Date: Fri, 28 Sep 2001 17:23:20 +0200
From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] Problems with 2.4.10 > lvm 1.0
Message-ID: <20010928172320.A4111@dragon.blacknet.de>
References: <909EA7234316394F80BBB70A85A1EB389609BD@hermes.dimac.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline
In-Reply-To: <909EA7234316394F80BBB70A85A1EB389609BD@hermes.dimac.net>; from conny@dimac.net on Fri, Sep 28, 2001 at 04:46:15PM +0200
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Fri, Sep 28 '01 at 16:46, Conny Brunnkvist / dimac.net wrote:
> Making and installing them worked fine. So did the kernel-patch and its
> compilation, but i get the following when trying to install or newly
> compiled 1.0 module:
Are you sure you patched the same kernel you're running?

> depmod:	get_hardblocksize
>=20
> I've read somewhere else in the list-archive that changing the
> get_hardblocksize lines to get_hardsect_size could help, but I have
There is a 1.0.1rc2 that has fixed this bug, but has a new one with the
min/max macros. For 2.4.10 you have to change the min/max macros to
min_t/max_t.
--=20
Goetz Bock                                              IT Consultant
Dipl.-Inf. Univ.

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7tJXnf5srOMkjkQoRAmB8AJ9Zq4otl7xHACRiSLpx8sfBv9hoCACg1Ri3
EE5iicX/sSF5ttiTvY5h0hc=
=2KP/
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
