Date: Fri, 28 Sep 2001 00:35:01 +0200
From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] Re: 2.4.10 patch fails: min() -> min_t() etc.
Message-ID: <20010928003501.B2728@dragon.blacknet.de>
References: <20010927222718.W31294@jensbenecke.de> <20010927224201.X31294@jensbenecke.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="9zSXsLTf0vkW971A"
Content-Disposition: inline
In-Reply-To: <20010927224201.X31294@jensbenecke.de>; from lvm@jensbenecke.de on Thu, Sep 27, 2001 at 10:42:01PM +0200
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
To: LVM List <linux-lvm@sistina.com>

--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Thu, Sep 27 '01 at 22:42, Jens Benecke wrote:
> > the 2.4.10 patch fails, because min() has been made more strict in rega=
rd
> > to data types, and the old function is now min_t(). (according to alan's
> > changelog)
>=20
> OK, sue me. I've looked into CVSweb and noticed there were changes
> regarding min/max already. =20
In linux 2.4.9 the min and max macros have been changed to require three
parameters: type, a, b. LVM 1.0.1-rc2 CVS has been fixed to support
this.
Alan (and others) have never supported this change, had proposed a
better version (that is compatible to 2.4.8 and before) this new version
has been adpoted in 2.4.10.=20
This has not yet been fixed in LVM. You have to grep through your patch
and fix the min/max macros. The exact locations have been posted on this
list.
--=20
Goetz Bock                                              IT Consultant
Dipl.-Inf. Univ.

--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7s6mUf5srOMkjkQoRAuX5AKCTBnSR8NGIJDPf+0lzaOCFTXoFywCgw982
va82XnssDKSnDjyhOYIkDUQ=
=qmhL
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--
