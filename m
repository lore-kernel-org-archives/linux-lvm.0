From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] RH AS 2.1 and LVM
Message-ID: <20040128202405.GF29473@kluge.net>
References: <51202.12.9.207.199.1075320425.squirrel@24.199.16.170>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3y/CVJp2vtgPOhvS"
Content-Disposition: inline
In-Reply-To: <51202.12.9.207.199.1075320425.squirrel@24.199.16.170>
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
Date: Thu Jan 29 09:14:01 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--3y/CVJp2vtgPOhvS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2004 at 12:07:05PM -0800, lvm@silvex.com wrote:
> Does LVM support comes from RH or sistine for AS 2.1? Is LVM on RH AS 3.0
> stable enough to be used in production ? Can it co exist with Secure Path
> ?

LVM isn't in the xS 2.1 releases, but it is in 3.0.  RH won't give you
support for stuff they don't provide, so you'd have to goto 3.0 if you
wanted supported LVM from RH.  3.0 has 1.0.5 in the kernel w/ 1.0.3 utils.
Both are probably modified, knowing RH.

I have no idea about Secure Path.

> Will Veritas Volume Manager be a musch better solution?

Depends what you're going for I suppose.  If you want software RAID, LVM
isn't going to do anything for you.  However, VxVM will cost you extra and
you'll have to deal with Veritas vs LVM which comes standard with the OS.

I personally prefer VxVM over LVM in general, but I also have never
bought VxVM for a Linux box...  I'll either use LVM, or more likely I'll
let HW RAID tools handle the segmenting of disks into volume sizes I want.

YMMV. :)

--=20
Randomly Generated Tagline:
Bush: The menorah represents an ancient miracle, in which a lamp with
 only enough oil for one day burned eight.
 Black: Wow.  That is a miracle.  It's not every day you hear George Bush
 promote oil conservation!
         - Lewis Black, The Daily Show, Dec 12 2002

--3y/CVJp2vtgPOhvS
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD4DBQFAGBpl7tgKAJaXVyoRAhlhAJj1L0NUnONJYiUxyF6JOBy7rtU8AJ9LTAMy
sjBKVBzSYdQLXQbpZhDRMQ==
=AIXe
-----END PGP SIGNATURE-----

--3y/CVJp2vtgPOhvS--
