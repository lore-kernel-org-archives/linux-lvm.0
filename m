Subject: Re: [linux-lvm] How to mirror or Replicate a primary server's data
	to a secondarymachine
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
In-Reply-To: <1113495234.25261.28.camel@grma-lap>
References: <1113495234.25261.28.camel@grma-lap>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-pgse1VIh1PXyZfw/27Jf"
Date: Thu, 14 Apr 2005 10:37:30 -0700
Message-Id: <1113500250.4707.197.camel@seki.nac.uci.edu>
Mime-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Gary.Mansell@ricardo.com, LVM general discussion and development <linux-lvm@redhat.com>
Cc: nahant-list@redhat.com, linux-poweredge@dell.com, taroon-list@redhat.com


--=-pgse1VIh1PXyZfw/27Jf
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


One way sync: rsync
Two way sync: unison

I'm partial to "balance" (you can find it on freshmeat) for load
balancing and failover of stateless protocols.

On Thu, 2005-04-14 at 17:13 +0100, Gary Mansell wrote:
> Hi,
>=20
> I am considering whether to go down the path of a dual server, manual
> failover solution for one of my RHEL fileservers.
>=20
> I would have two identical servers in two different machine rooms on our
> site and if the main server failed then I would manually reconfigure the
> secondary server with the primary server's IP address so that the client
> machines can carry on working.
>=20
> Can anyone recommend to me what I need to do to mirror the data across
> the two servers so that updates to the primary server are also made to
> the secondary server
>=20
> Thanks in advance for any help
>=20
> Regards
>=20
> Gary Mansell

--=-pgse1VIh1PXyZfw/27Jf
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBCXqpao0feVm00f/8RAjBuAJ9tELoQ6y9sTMNwt9Fac3fzyf85IgCfahPa
Iq2QcPGSZD6kzeY6SJqhCBI=
=Paih
-----END PGP SIGNATURE-----

--=-pgse1VIh1PXyZfw/27Jf--
