Return-Path: <lewis@sistina.com>
Date: Mon, 4 Jun 2001 17:15:12 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Migrating to an LVM system (boot/root) disk
Message-ID: <20010604171512.A348@sistina.com>
References: <3B1AC411.D6E307CD@tls.msk.ru> <200106041734.f54HYLbh020302@webber.adilger.int>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
In-Reply-To: <200106041734.f54HYLbh020302@webber.adilger.int>; from adilger@turbolinux.com on Mon, Jun 04, 2001 at 11:34:21AM -0600
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

--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 04, 2001 at 11:34:21AM -0600, Andreas Dilger wrote:
> Yes, you are correct that you know in advance which IOP version you need.
> However, it is much easier for lvmcreate_initrd to just copy all of the
> programs (including the wrapper) to the initrd, instead of trying to find
> which ones are needed and which are not needed.  In the end, the wrapper
> is one disk block + a few directory entries (no more space needed).
>=20
> The problem is that "sed" is used in the wrapper script.  AFAIK, I do not
> have "sed" in my wrapper script, so I don't know where it came from.  Can
> you tell me where the wrapper script comes from that you are using and/or
> post a copy to this list so it can be fixed?

Hmm...I put 'sed' in the debian package wrapper scripts since Debian put's
basename in /usr/bin and if you don't use an initrd script and you have your
/usr partition on LVM, you can't use the wrapper...

Is there an easy way we can work around this?  Maybe hack up the
create_initrd script a bit more?  I can just adjust it in the debian
packages too i guess.

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
FATAL ERROR! SYSTEM HALTED! - Press any key to do nothing...
-----End Obligatory Humorous Quote------------------------------------------

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7HAhwpE6/iGtdjLERAtcaAJ9Jd4ipUEdm0WDxFre4m5RYUbeFVQCfaXZK
cpXL1DRH6mG2UGIQedAYZYw=
=/H6H
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
