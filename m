Return-Path: <lewis@sistina.com>
Date: Tue, 13 Mar 2001 11:40:54 -0600
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Problem with vgscan/ vgcfgrestore
Message-ID: <20010313114054.E15679@sistina.com>
References: <GIEGKMCLIJBKBNBCCHEACEJACAAA.heimdall@mail.org> <200103130059.f2D0xsJ01176@webber.adilger.int> <20010313084102.A28227@colombina.comedia.it>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KuLpqunXa7jZSBt+"
Content-Disposition: inline
In-Reply-To: <20010313084102.A28227@colombina.comedia.it>; from bluca@comedia.it on Tue, Mar 13, 2001 at 08:41:02AM +0100
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

--KuLpqunXa7jZSBt+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 13, 2001 at 08:41:02AM +0100, Luca Berra wrote:
> i have a couple of ideas, but no time to code (sorry)
> 1) using realpath in the tools to solve issue 2

This should be done no matter what.  I can't think of any good reason not to
have the tools follow sym-links.

> 2) checking if the devices mentioned in /proc/partition do really exist, =
else
>   switch the cache to "scan the dev directory mode"

I believe this is the way it works at present

> 	but better than the above=20
> 3) add another structure to the cache which contains aliases to the device
>  we have in the cache, aliases are added dynamically when found on the co=
mmand
>  line or in the VGDA of a PV. We use=20
> 	alias[c].name=3Dpossible alias;
> 	lstat(possible alias, &statbuf)
> 	if (S_ISLNK(statbuf.st_mode)) {
> 		alias[c].target=3Dlvm_dir_cache_find(realpath(possible alias));
> 		if !(alias[c].target) stat(realptah(possible alias), &statbuf)
> 	}
> 	if (S_ISBLK(statbuf.st_mode)) {
> 		alias[c].target=3Dlvm_dir_cache_find_dev(statbuf.st_dev>>8,statbuf.st_m=
ode&((1<<8)-1));
> 		/* the above function has to be written*/
> 	}
> 	if (!alias[c].target) complain(loudly);
> 	c++;
>=20
>   then we modify lvm_dir_cache_find to loop also on alias[], before it st=
arts searching th
>   cache.

This looks interesting...and could possibly help a lot as well.

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
Life's short and hard, kind of like a bodybuilding elf
-----End Obligatory Humorous Quote------------------------------------------

--KuLpqunXa7jZSBt+
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6rlumpE6/iGtdjLERApjAAKCBg3ZmGvOY+VMd0Wy5zz5rWDytdgCeMx6H
jOdare16cNlhmCR0GEtjhtw=
=U4Sv
-----END PGP SIGNATURE-----

--KuLpqunXa7jZSBt+--
