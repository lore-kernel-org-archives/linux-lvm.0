Return-Path: <chewie@wookimus.net>
Date: Thu, 30 Nov 2000 02:44:49 -0600
From: Chewie <chewie@wookimus.net>
Subject: Re: [linux-lvm] lvm 0.9 kernel build problems
Message-ID: <20001130024449.J1381@wookimus.net>
References: <OLEAJMNOEMOMMNEIMMINMENJCBAA.pswartz@digitalrom.com> <20001129211909.C26635@srv.t-online.de> <005c01c05a4d$ee072080$a56cfea9@miguel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5me2qT3T17SWzdxI"
Content-Disposition: inline
In-Reply-To: <005c01c05a4d$ee072080$a56cfea9@miguel>; from falcon_lvm@yahoo.com on Wed, Nov 29, 2000 at 10:47:09PM +0100
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--5me2qT3T17SWzdxI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2000 at 10:47:09PM +0100, Falcon wrote:
> You must to change gcc by kgcc in the Makefile

<rant>
Is it just me, or does this sound like a Red Hat-like solution?  Gee.
Let's package an old version of gcc just so we can compile the kernel
correctly.  We can't simply use a stable gcc as our standard compiler.
We have to reach back into the bag of the ancients to keep our
machines running and make it LOOK like we're using the bleeding edge
with gcc 2.96!
</rant>

--=20
Chad "^chewie, gunnarr" Walstrom <chewie@wookimus.net>
             http://www.wookimus.net/

--5me2qT3T17SWzdxI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6JhOBDMcLGCBsWv0RApw7AJ9QLozXap1gIirg5Xeb1y7N6PcxMwCfXoel
+V8p7NxBPZd+eX9yUEvv7Yk=
=qttq
-----END PGP SIGNATURE-----

--5me2qT3T17SWzdxI--
