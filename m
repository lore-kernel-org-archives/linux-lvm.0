Received: from firewall.xsintricity.com (vpn-12-226.rdu.redhat.com
	[10.11.12.226])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mB9KMikG013707
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 15:22:45 -0500
Subject: Re: [linux-lvm] shift PV from disk to raid device?
From: Doug Ledford <dledford@redhat.com>
In-Reply-To: <VA.000034fb.04c01c18@news.conactive.com>
References: <VA.000034ec.0056c987@news.conactive.com>
	<493E48DE.3070705@redhat.com>
	<Pine.LNX.4.64.0812091146560.16428@bmsred.bmsi.com>
	<VA.000034f2.04473327@news.conactive.com> <493EB3A0.6020306@redhat.com>
	<VA.000034f4.0456d5b7@news.conactive.com>
	<Pine.LNX.4.64.0812091325290.17327@bmsred.bmsi.com>
	<VA.000034f7.04a27ead@news.conactive.com>
	<1228852584.32405.37.camel@firewall.xsintricity.com>
	<VA.000034fb.04c01c18@news.conactive.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-lulWV/ZtIXbiTGyjuv06"
Date: Tue, 09 Dec 2008 15:22:41 -0500
Message-Id: <1228854161.32405.48.camel@firewall.xsintricity.com>
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


--=-lulWV/ZtIXbiTGyjuv06
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2008-12-09 at 21:15 +0100, Kai Schaetzl wrote:
> Doug Ledford wrote on Tue, 09 Dec 2008 14:56:24 -0500:
>=20
> > The solution to this problem is to create the raid device with a
> > superblock format of 1.1 or 1.2 (aka, -e 1.1 or -e 1.2).
>=20
> Is this an option to mdraid? mdadm --create --help doesn't show me this=20
> option. Might mdadm-2.6.4-1.el5 on 5.2 be too old? Or is this an option t=
o=20
> fdisk/sfdisk?

The various mdadm mode specific help sections (such as --create --help)
only show options specific to that mode.  There are also general options
available from --help-options.  The -e option applies in multiple modes,
so it should be present in the general --help-options section (but it
isn't, even in the latest mdadm version).  It is, however, present and
explained in the man page for mdadm.

--=20
Doug Ledford <dledford@redhat.com>
              GPG KeyID: CFBFF194
              http://people.redhat.com/dledford

Infiniband specific RPMs available at
              http://people.redhat.com/dledford/Infiniband


--=-lulWV/ZtIXbiTGyjuv06
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkk+05EACgkQTzP9PM7pjw+ZQQCdGgpTmDf2oV92GSRzUNzki5yk
yX0An2sDHJTiwV6oYaOLt7Sl7DWHzTPr
=e/NM
-----END PGP SIGNATURE-----

--=-lulWV/ZtIXbiTGyjuv06--
