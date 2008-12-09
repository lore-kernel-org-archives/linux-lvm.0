Received: from firewall.xsintricity.com (vpn-12-226.rdu.redhat.com
	[10.11.12.226])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mB9KpG5S017828
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 15:51:17 -0500
Subject: Re: [linux-lvm] shift PV from disk to raid device?
From: Doug Ledford <dledford@redhat.com>
In-Reply-To: <VA.000034fc.04d542d4@news.conactive.com>
References: <VA.000034ec.0056c987@news.conactive.com>
	<493E48DE.3070705@redhat.com>
	<Pine.LNX.4.64.0812091146560.16428@bmsred.bmsi.com>
	<VA.000034f2.04473327@news.conactive.com> <493EB3A0.6020306@redhat.com>
	<VA.000034f4.0456d5b7@news.conactive.com>
	<Pine.LNX.4.64.0812091325290.17327@bmsred.bmsi.com>
	<VA.000034f7.04a27ead@news.conactive.com>
	<1228852584.32405.37.camel@firewall.xsintricity.com>
	<VA.000034fc.04d542d4@news.conactive.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-8GNYEz8Ggl1sxQZ82YDv"
Date: Tue, 09 Dec 2008 15:51:13 -0500
Message-Id: <1228855873.32405.53.camel@firewall.xsintricity.com>
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
To: maillists@conactive.com, LVM general discussion and development <linux-lvm@redhat.com>


--=-8GNYEz8Ggl1sxQZ82YDv
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2008-12-09 at 21:38 +0100, Kai Schaetzl wrote:
> Doug Ledford wrote on Tue, 09 Dec 2008 14:56:24 -0500:
>=20
> > superblock
>=20
> another question: this is not the same as the filesystem superblock,=20
> right? e.g. "dumpe2fs -h /dev/mdn" shows me "Bad magic number in super-
> block" on all raid arrays that have LVM on them. That's to be expected,=20
> right?

Yes.  The md raid stack, the lvm stack, and every file system all have
their own unique superblocks.  You use mdadm to read md raid
superblocks, various lvm tools to read lvm superblocks, and filesystem
specific tools for filesystem superblocks.

--=20
Doug Ledford <dledford@redhat.com>
              GPG KeyID: CFBFF194
              http://people.redhat.com/dledford

Infiniband specific RPMs available at
              http://people.redhat.com/dledford/Infiniband


--=-8GNYEz8Ggl1sxQZ82YDv
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkk+2kEACgkQTzP9PM7pjw+f5wCcCczDrp/xvqZbrDQKkzLvrB2f
dSEAn22cusmdS03eA+wxmINAS4J12RZP
=IA/c
-----END PGP SIGNATURE-----

--=-8GNYEz8Ggl1sxQZ82YDv--
