Return-Path: <lewis@sistina.com>
Date: Tue, 19 Jun 2001 16:19:30 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] LVM problems
Message-ID: <20010619161930.A15720@sistina.com>
References: <85063BBE668FD411944400D0B744267A481A88@AUSMAIL>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline
In-Reply-To: <85063BBE668FD411944400D0B744267A481A88@AUSMAIL>; from austin@coremetrics.com on Tue, Jun 19, 2001 at 02:28:05PM -0500
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

--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 19, 2001 at 02:28:05PM -0500, Gonyou, Austin wrote:
> Why in the hell is this NOT in the source tree by default. This has really
> got be boggled. I've seen tons of others have this proble, I've had this
> problem, and still it doesn't seem to get itself into the tree. Is this
> because it is a temporary problem or something?

It *is* in the source tree by default.  It is in the CVS.  It is not in
LVM 0.9.1 Beta7 because LVM 0.9.1 Beta7 was released before linux 2.4.4,
which is when the problem surfaced.  We have not had a release since then,
so it is not in the latest release.

You can now grab the patch and apply it to beta7, which fixes the problem,
or you can use the CVS repository.  I really don't know what else you expect
us to do.

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
geep!
-----End Obligatory Humorous Quote------------------------------------------

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7L8HipE6/iGtdjLERAnBzAKCD2bvJAoELbnOG9Ofkux1yJOzDnACfVFy+
vuVxZrL8YuWixdH5OPsHcIM=
=oc0+
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
