From: "Eric M. Hopper" <hopper@omnifarious.org>
Subject: Re: [linux-lvm] RAID support...
Message-Id: <20011228123140.A9647@omnifarious.org>
References: <3C2CBAFB.90103@cdimed.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline
In-Reply-To: <3C2CBAFB.90103@cdimed.com>; from morourke@cdimed.com on Fri,
    Dec 28, 2001 at 01:33:31PM -0500
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
Date: Fri Dec 28 12:29:01 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com
Cc: morourke@cdimed.com

--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 28, 2001 at 01:33:31PM -0500, Michael O'Rourke wrote:
> To whom it may concern,
>=20
> Not that this is a show stopper, but it seems that the LVM is missing=20
> important capabilities such as RAID 1 & 5.  I see that you already=20
> support RAID 0, but that's it.  In my opinion, it makes sense to merge=20
> the RAID support (seperate product) with the LVM product.  Because the=20
> two really complement each other. =20

	I think the two problems are completely orthogontal and
complement eachother in much the same way as applications complement an
OS.  I question whether even RAID0 support is really necessary in LVM.
RAID should be stacked below, or above LVM, not packed inside.

Have fun (if at all possible),
--=20
"It does me no injury for my neighbor to say there are twenty gods or no Go=
d.
It neither picks my pocket nor breaks my leg."  --- Thomas Jefferson
"Go to Heaven for the climate, Hell for the company."  -- Mark Twain
-- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper)=
 --

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8LLqMjtsvlOwvazYRAr5SAJ0eFlNKR70aySZ+qm8c9MjvFzrT7ACg2ztP
BTFVh9SkXmrEms+UwKdTwls=
=Hz5W
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
