Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8BA0pvr020092
	for <linux-lvm@redhat.com>; Tue, 11 Sep 2007 06:00:51 -0400
Received: from christel.heitec.net (christel.heitec.net [62.206.253.11])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l8BA0gQX022086
	for <linux-lvm@redhat.com>; Tue, 11 Sep 2007 06:00:43 -0400
Received: from prag.er.heitec.net (paladin.heitec.net [62.206.253.14])
	by christel.heitec.net (Postfix) with ESMTP id BE847A8916
	for <linux-lvm@redhat.com>; Tue, 11 Sep 2007 12:00:36 +0200 (CEST)
Date: Tue, 11 Sep 2007 12:00:36 +0200
From: Holger Rauch <holger.rauch@heitec.de>
Subject: Re: [linux-lvm] Question on duplicating equally-sized HDs with dd and
	changing VG name and PV UUIDs
Message-ID: <20070911100036.GA26592@heitec.net>
References: <20070907121306.GA27457@heitec.net>
	<20070907175345.GA5931@racke.local>
	<20070910085921.GC22296@heitec.net>
	<20070910171709.GA5117@us.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline
In-Reply-To: <20070910171709.GA5117@us.ibm.com>
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
To: linux-lvm@redhat.com


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi to everybody,

ok, if running pvcreate is necessary, what tool can I use for generating
my own UUID (for passing them to the --uuid cmd line switch of pvcreate)
just in case the PV previously belonged to a different VG?

TIA.

Greetings,

	Holger

On Mon, 10 Sep 2007, malahal@us.ibm.com wrote:

> I don't think so. /dev/sdb will have the same partition table as
> /dev/sda from the sfdisk command.  I bet you need to run pvcreate and
> vgcreate before running the rest of the script.
>=20
> Thanks, Malahal.
> [...]

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFG5mdEbiVtWpZdKQIRAhxKAJwKs0M91DxTBk4iuVaioy9IE+nocQCghoS8
LQMwiU4istvxH/x+686ldj4=
=zeSZ
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
