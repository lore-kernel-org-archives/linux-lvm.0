Return-Path: <lewis@sistina.com>
Date: Tue, 5 Jun 2001 22:44:43 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Data loss - vg gone
Message-ID: <20010605224443.B21110@sistina.com>
References: <5179B27750A9D411B968009027E06E27012D7290@exback.corp.auctionwatch.com> <20010606010707.N30880@jensbenecke.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Content-Disposition: inline
In-Reply-To: <20010606010707.N30880@jensbenecke.de>; from lvm@jensbenecke.de on Wed, Jun 06, 2001 at 01:07:07AM +0200
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

--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 06, 2001 at 01:07:07AM +0200, Jens Benecke wrote:
> On Tue, Jun 05, 2001 at 12:47:37PM -0700, Michael S. Fischer wrote:
> > Hello,
> >=20
> > vgscan found no volumes (and vgdisplay reports none), but according to
> > pvscan the physical volume signature is still there.  If I try to
> > recreate the volume I get the error message that the physical volume
> > already belongs to the volume group.
>=20
> Possible solution (worked here):
>=20
> You need to edit the disk signatures and for each PV, insert all the
> _other_ PV signatures in the right place. Go to #lvm on
> irc.openprojects.org and bug 'roadrunner', he walked me through this and =
it
> worked. ;)

Yeah, do that.  We should be able to fix you up.  I should be on the channel
by 0900 CDT tomorrow (June 6).

Regards,
--=20
AJ Lewis (aka, roadrunner)
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
Error: Keyboard not attached. Press F1 to continue.
-----End Obligatory Humorous Quote------------------------------------------

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7HacqpE6/iGtdjLERAmgmAKCCGpQhxlUTiTQqvi3iOtwwOwAE2wCfbmIS
GwzX3LTAzc4YWvHMKicZkRs=
=UKiY
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--
