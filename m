Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8JGCivN007500
	for <linux-lvm@redhat.com>; Wed, 19 Sep 2007 12:12:44 -0400
Received: from christel.heitec.net (christel.heitec.net [62.206.253.11])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l8JGCaUl013668
	for <linux-lvm@redhat.com>; Wed, 19 Sep 2007 12:12:37 -0400
Received: from prag.er.heitec.net (paladin.heitec.net [62.206.253.14])
	by christel.heitec.net (Postfix) with ESMTP id C105FA894B
	for <linux-lvm@redhat.com>; Wed, 19 Sep 2007 18:04:03 +0200 (CEST)
Date: Wed, 19 Sep 2007 18:04:04 +0200
From: Holger Rauch <holger.rauch@heitec.de>
Subject: Re: [linux-lvm] Question on duplicating equally-sized HDs with dd and
	changing VG name and PV UUIDs
Message-ID: <20070919160404.GA1008@heitec.net>
References: <20070907121306.GA27457@heitec.net>
	<20070907175345.GA5931@racke.local>
	<20070910085921.GC22296@heitec.net>
	<20070910171709.GA5117@us.ibm.com>
	<20070911100036.GA26592@heitec.net>
	<20070911101250.GB26592@heitec.net>
	<20070917211944.GT18444@agk.fab.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
In-Reply-To: <20070917211944.GT18444@agk.fab.redhat.com>
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


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alasdair (and all the other list members),

first of all, thanks for having mentioned pvchange -u but the man page of
pvchange really gives no clue on how to actually use the -u switch. The
output of pvchange --help suggests that the -u switch takes no additional
parameter. So, if I understand you right, pvchange -u should both *generate
and assign* a new UUID to the specified PV and thus do what I need?

TIA for clarification on this issue.

Greetings,

	Holger

On Mon, 17 Sep 2007, Alasdair G Kergon wrote:

> On Tue, Sep 11, 2007 at 12:12:50PM +0200, Holger Rauch wrote:
> > Replying to myself this time :-) Just found out about uuidgen. Would th=
at be
> > OK? I'm thinking about invoking pvcreate like this:
> > pvcreate --uuid $(uuidgen) /dev/sdb
>=20
> There's something strange going on here.
> The tools should be quite capable of generating a new uuid for you.
> Perhaps it's a documentation problem.
>=20
> Try pvchange -u.
>=20
> Alasdair

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFG8Uh0biVtWpZdKQIRAnukAJ4yQ9qVlKJN2+VzZ0S7FWY/U+Jy+gCeIZrM
BD33BHPShskHBHLvSwpqkek=
=X59G
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
