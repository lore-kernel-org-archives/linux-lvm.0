Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8NHAYr28541
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2004 13:10:34 -0400
Received: from dcs.nac.uci.edu (root@dcs.nac.uci.edu [128.200.34.32])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i8NHASrD001501
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2004 13:10:28 -0400
Subject: Re: [linux-lvm] LVM UUIDs are not UUIDs!?
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
In-Reply-To: <20040923084741.GA5658@engelschall.com>
References: <20040923084741.GA5658@engelschall.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-puFiNt39/uifypxEtf5Y"
Message-Id: <1095959414.26438.27.camel@tesuji.nac.uci.edu>
Mime-Version: 1.0
Date: Thu, 23 Sep 2004 10:10:15 -0700
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: rse@engelschall.com, LVM general discussion and development <linux-lvm@redhat.com>


--=-puFiNt39/uifypxEtf5Y
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Same in concept, different implementation, easier to use?

The Lustre does the same thing: It has what it calls UUID's, that are
actually more descriptive strings than what the standard calls for.

On Thu, 2004-09-23 at 01:47, Ralf S. Engelschall wrote:
> While setting up an LVM2 based 3TB storage the last days I've stumbled
> over LVM2's "UUID" strings as displayed by its pvdisplay, vgdisplay, and
> lvdisplay commands. It is clear that LVM2 requires those ids, but *WHY*
> are they called "UUID"?
>=20
> They do NOT conform in any way to the standardized ISO/IEC 11578:1996
> compliant Universally Unique Identifier (UUID) strings. Neither by the
> way they are created (LVM2 UUIDs are just random numbers while ISO v4
> random UUIDs are fixed bit-fields plus random remaining bits) nor the
> way they are formatted. Examples:
>=20
> LVM2               UUID: H9C8iE-braW-70bk-Fx9x-lMIX-Rmmy-5XgkM9
> ISO/IEC 11578:1996 UUID: 4a8287f4-0d33-11d9-8068-0002b31abd79
>=20
> So, wouldn't it be reasonable that either LVM2 uses a real open-source
> UUID library for dealing with standardized UUIDs (ext2fs's libuuid, OSSP
> uuid, etc) or at least names its ids own id strings just "ID" or even
> "LVMID"?
>=20
> Perhaps at least in the visible output strings in order to reduce
> confusion with standardized UUIDs...
>=20
>                                        Ralf S. Engelschall
>                                        rse@engelschall.com
>                                        www.engelschall.com
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--=20
Dan Stromberg DCS/NACS/UCI <strombrg@dcs.nac.uci.edu>


--=-puFiNt39/uifypxEtf5Y
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQBBUwN2o0feVm00f/8RAmFrAKCB7byS1M7ycGduQ7eKeaKS/dl5XgCdFvvv
zFq+alzEgvHGVLkns/3u31w=
=hQvF
-----END PGP SIGNATURE-----

--=-puFiNt39/uifypxEtf5Y--
