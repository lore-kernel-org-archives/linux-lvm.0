Return-Path: <hopper@omnifarious.mn.org>
Date: Mon, 2 Jul 2001 14:29:39 -0500
From: "Eric M. Hopper" <hopper@omnifarious.org>
Subject: Re: [linux-lvm] RedHat 7.0?
Message-ID: <20010702142939.A14730@omnifarious.org>
References: <139803A793E0D311AFF60050DA2BC540030214C3@qtiexch1.qgraph.com> <001301c1032b$4da153e0$0300000a@pacbell.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <001301c1032b$4da153e0$0300000a@pacbell.net>; from e@arix.com on Mon, Jul 02, 2001 at 12:15:06PM -0700
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

--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 02, 2001 at 12:15:06PM -0700, Erick Calder wrote:
> I've searched through the archives but have not found anyone else
> using Redhat 7.0 (Guiness) with LVM.  I've found a thread about 7.1
> (Seawolf) but that uses the 2.4.2 kernel and I'm running the 2.2.19
> kernel.
>=20
> I found the RPMs on the site but they are for 6.2 (Zoot)... does
> anyone know whether I can use the 6.2 RPMs on 7.0?  if not, are there
> RPMs for 7.0 that I could use?
>=20
> alternatively, has anyone compiled from the tarball and successfully
> used LVM on my platform?

	I'm using RH Linux 7.0.  I got it compiled into the kernel,
though it was a bit of a chore as I recall.  I had to disable the
software RAID subsystem completely to make it work.

	When the 2.4 kernel came out, I eventually switched to it, and
just compiled a raw kernel, not an RH patched one.  It worked fine, and
I'm still running it.

Have fun (if at all possible),
--=20
"It does me no injury for my neighbor to say there are twenty gods or no Go=
d.
It neither picks my pocket nor breaks my leg."  --- Thomas Jefferson
"Go to Heaven for the climate, Hell for the company."  -- Mark Twain
-- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper)=
 --

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7QMujG4QeWBeRdS8RAnjyAKDf+xH+JqJ8/l9Mj5jmxTxs9HBpswCcCkco
5aRKSp03EB+p1KtEfk6i0kU=
=VHIo
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
