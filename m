Return-Path: <blutgens@sistina.com>
Date: Tue, 3 Jul 2001 16:33:50 -0500
From: Ben Lutgens <blutgens@sistina.com>
Subject: Re: [linux-lvm] LVM on Redhat 2.4.3-12 Kernel
Message-ID: <20010703163350.B2043@minime.sistina.com>
References: <994015538.6465.5.camel@detrius> <Pine.LNX.4.33.0107031707230.15782-100000@leopard.dorfam.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="UHN/qo2QbUvPLonB"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0107031707230.15782-100000@leopard.dorfam.ca>; from gerry@dorfam.ca on Tue, Jul 03, 2001 at 05:13:57PM -0400
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

--UHN/qo2QbUvPLonB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 03, 2001 at 05:13:57PM -0400, gerry@dorfam.ca wrote:
>
>In other words, how do I get this going under the new kernel???

We always recommend downloading kernel source from kernel.org, get a copy
of the latest released source from ftp.sistina.com and follow the steps
in the howto.=20

RedHat applies tons of custom patches ( 200+ ) to the vanilla source tree i=
n an
attempt to one-up thier competition. While this is not inherintly bad, it
can make things difficult to sort out when you start trying to apply
patches that were generated based off of stock linus brand kernels. Also
there may be some hidden differences which let you think everything is
working while it in fact is not.


--=20
Ben Lutgens	=09
Sistina Software Inc.=09
Kernel panic: I have no root and I want to scream

--UHN/qo2QbUvPLonB
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7Qjo+LxkxGgLdGQgRAsOBAJ46hPt0YIfmCwijw8KEv+++M0vxNgCffV9g
iF2k6vqX9X0acn1zdzOGJCg=
=YSxA
-----END PGP SIGNATURE-----

--UHN/qo2QbUvPLonB--
