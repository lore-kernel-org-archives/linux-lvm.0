From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Nnk9ZZon+TOGIF5KyqO3"
Message-Id: <1065625602.7061.42.camel@pc>
Mime-Version: 1.0
Subject: [linux-lvm] lvmcreate_initrd: depmod without -F?
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
Date: Thu Oct  9 08:18:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-Nnk9ZZon+TOGIF5KyqO3
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I am trying to create an LVM aware initrd on Debian stable (a.k.a.
Woody, 3.0) and running into a problem.  The problem is so basic though,
that I must be missing something somewhere else.

I have built and installed a new kernel, but not yet booted it (because
I need the initrd to boot it).  When I try to create the initrd with
"lvmcreate_initrd <KVER>" it complains:

lvmcreate_initrd -- ERROR running depmod

When I try to run depmod just as the script does (depmod -a <KVER>) it
indeed does error out with a bunch of unresolved symbols.  But they are
symbols provided by the kernel and hence the command "depmod -F
/boot/System.map-<KVER> <KVER>" is successful.

How/why does this work for everyone else?  If this were a bug (not
passing the System.map to depmod) as I outline it above, surely it would
have been fixed by now.

b.

--=20
My other computer is your Microsoft Windows server.

Brian J. Murrell

--=-Nnk9ZZon+TOGIF5KyqO3
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/hCgCl3EQlGLyuXARAvGpAKCpWSN7Xk51432Az31SJNbWDMREqQCg/v1n
oqXJMsGxgd45HhzCKf+lS4I=
=APD6
-----END PGP SIGNATURE-----

--=-Nnk9ZZon+TOGIF5KyqO3--
