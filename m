From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] disk info
Message-ID: <20030806190337.GD6756@kluge.net>
References: <200308061457.22773.vk@mail.lepp.cornell.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UQUSR6hGnEXrhNQw"
Content-Disposition: inline
In-Reply-To: <200308061457.22773.vk@mail.lepp.cornell.edu>
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
Date: Mon Aug 11 07:36:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--UQUSR6hGnEXrhNQw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2003 at 02:57:22PM -0400, Valentine Kouznetsov wrote:
> I'm newbie of using LVM. I'm having the following "strange" behaviour:
> I can lvextend my volumes, but I cannot see the changes using df
> command. Actually df output is different from LV size of lvdisplay
> output. Is it known bug and/or I'm missing something.

It sounds like you're not extending the filesystem after you've extended
the volume.

--=20
Randomly Generated Tagline:
I'm practicing assertiveness.  Do you think that's okay?

--UQUSR6hGnEXrhNQw
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE/MVEJAuOQUeWAs2MRAoXDAKDkgLuYmHKanopdOqxcXx0wO+oXTACg08pI
0cG6Yvgz2U865Gkarb2b8Hs=
=NLSt
-----END PGP SIGNATURE-----

--UQUSR6hGnEXrhNQw--
