Return-Path: <hopper@omnifarious.org>
Subject: Re: [linux-lvm] Writing forward compatible applications using /proc
From: "Eric M. Hopper" <hopper@omnifarious.org>
In-Reply-To: <20010812135402.A452@dardhal.mired.net>
References: <20010812135402.A452@dardhal.mired.net>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-4z4oXTy6nzqU1Za6Avm/"
Date: 12 Aug 2001 12:10:31 -0500
Message-Id: <997636232.20870.2.camel@monster.omnifarious.org>
Mime-Version: 1.0
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

--=-4z4oXTy6nzqU1Za6Avm/
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 12 Aug 2001 13:54:02 +0000, Jos=E9 Luis Domingo L=F3pez wrote:
> As far as I know, there are plans to remove much of the thingss that
> currently appear under /proc. It seems that only information about
> processes currently running will remain under /proc.
>=20
> Kernel parameters, system information, kernel variables and kernel
> tunables will probably disappear and will be replaced by some sort of
> user-space application that will allow query and modfication of kernel
> values and tunables. Something similar to Solaris' ndd, AFAIK.

This is sad.  The whole point of the filesystem under Unix is to provide
a unified namespace for all the system objects you might want to talk
about.

I can see adding a new filesystem for kernel parameters that's
completely seperate from /proc, but getting rid of the ability to have
access to them directly through the filesystem is a bad idea IMHO.

:-(,
--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.org=20
http://www.omnifarious.org/~hopper) --

--=-4z4oXTy6nzqU1Za6Avm/
Content-Type: application/pgp-signature

-----BEGIN PGP MESSAGE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA7driHG4QeWBeRdS8RAur+AKCgYJ8bVTF4MMeluXVrStbuarh7TACgvXPG
EWDA/H5J8Zv1NbXuEO4Ef5c=
=hSkX
-----END PGP MESSAGE-----

--=-4z4oXTy6nzqU1Za6Avm/--
