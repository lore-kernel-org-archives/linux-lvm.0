Subject: Re: [linux-lvm] Re: How to handle Bad Block relocation with LVM?
From: "Eric M. Hopper" <hopper@omnifarious.org>
In-Reply-To: <20030218012102.12299.65097.Mailman@hermes.sistina.com>
References: <20030218012102.12299.65097.Mailman@hermes.sistina.com>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-YMAp1KKOSEKH/ARi7GxU"
Message-Id: <1045536586.19711.33.camel@monster.omnifarious.org>
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
Date: Tue Feb 18 08:08:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-YMAp1KKOSEKH/ARi7GxU
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-02-14 at 17:26, Joe Thornber <joe@fib011235813.fsnet.co.uk> wr=
ote:
> Eric,
>=20
> We would like to automate the process that you have described in LVM2
> at some point.  So if you get an error on an LV and new PE will be
> allocated, as much data as possible copied from the bad PE to the new
> PE, and then remap the LV so that it's using the new PE (very much
> like a small pvmove).
>=20
> The EVMS team are writing a bad block relocator target for device
> mapper, but I don't feel it's neccessary to add yet another device
> layer to the LVs.  If I have a bad block I don't mind loosing a whole
> PE (people may not agree with me on this ?)

I actually quite agree.  Here are a few points:

o A PE is typically less than 0.01% of my total disk space.

o Corruption on a drive tends to spread, especially if sectors near the
corruption are accessed frequently, so it's best to avoid a whole
section of a drive around a bad spot.

o In general, I would want to throw away a drive that had so many bad
sectors that it's firmware relocation software could no longer handle
them.  So, my main purpose in relocating the PE is to recover as much
data from it as I can before junking the drive.

Have fun (if at all possible),
--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper)=
 --

--=-YMAp1KKOSEKH/ARi7GxU
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP MESSAGE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+UZ9KjtsvlOwvazYRAj+TAKCpaw8aEQvLvbt/LV4gdBTbTYOjrwCfWkYQ
TJ/X7nQxZueYBjEewyXn11Q=
=IGl0
-----END PGP MESSAGE-----

--=-YMAp1KKOSEKH/ARi7GxU--
