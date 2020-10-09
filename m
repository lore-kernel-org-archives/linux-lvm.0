Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAACA2166BA2
	for <linux-lvm@redhat.com>; Fri,  9 Oct 2020 15:58:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B88158EF5A4
	for <linux-lvm@redhat.com>; Fri,  9 Oct 2020 15:58:17 +0000 (UTC)
Received: from mwood by mhw.ulib.iupui.edu with local (Exim 4.93.0.4)
	(envelope-from <mwood@IUPUI.Edu>) id 1kQuUO-0002Gb-HG
	for linux-lvm@redhat.com; Fri, 09 Oct 2020 11:39:24 -0400
Date: Fri, 9 Oct 2020 11:39:24 -0400
From: "Mark H. Wood" <mwood@iupui.edu>
Message-ID: <20201009153924.GC13687@IUPUI.Edu>
References: <fee58e48-151f-9eab-a6a2-eb31c690029c@alteeve.ca>
	<32651cc4-159f-a7f3-83cc-1e1c50071b93@redhat.com>
	<b3d53a4d-dafe-4d92-700a-f9df28061020@alteeve.ca>
MIME-Version: 1.0
In-Reply-To: <b3d53a4d-dafe-4d92-700a-f9df28061020@alteeve.ca>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DIOMP1UsTsWJauNi"
Content-Disposition: inline
Subject: Re: [linux-lvm] LVM PV UUID problem
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--DIOMP1UsTsWJauNi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 09, 2020 at 11:18:38AM -0400, Digimer wrote:
> On 2020-10-09 10:43 a.m., Zdenek Kabelac wrote:
> > Dne 09. 10. 20 v 15:12 Digimer napsal(a):
> >> Hi all,
> >>
> >> =A0=A0 I'm storing LVM information in a postgres database, and wanted =
to use
> >> the UUID from the PVs / VGs / LVs as the UUIDs in the database. I
> >> noticed when I tried to do this that postgres complained that the UUID
> >> was not valid. I checked with an online UUID validator
> >> (https://www.freecodeformat.com/validate-uuid-guid.php) and it also
> >> reported as invalid.
> >>
> >> Example;
> >>
> >> =3D=3D=3D=3D
> >> # pvdisplay | grep UUID
> >> =A0=A0 PV UUID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 jLkli2-dEXx-5=
Y8n-pYlw-nCcy-9dFL-3B6jU3
> >> =3D=3D=3D=3D
> >>
> >> =A0=A0 Is this a known issue?
> >>
> >=20
> > Hi
> >=20
> > At the time of lvm2 devel I believe UUID was just a unique identifier,
> > later some effort to standardize it came in.
> >=20
> > But really you should NOT be using basically internal unique identifier=
s
> > in your DB - this are internal to DM/LVM work and might be changed at
> > any time to something else.
> >=20
> > User is supposed to use=A0 'vgname' & 'lvname'=A0 - so there you can pu=
t those
> > valid UUID sequences - although human readable strings are always nicer=
 ;)
> >=20
> > Zdenek
>=20
> The trick is that VG and LV names can change, so I wanted to use the
> (so-called) UUID as a way to keep track of a given item through name
> changes.
>=20
> I suppose I'll have to rework to use the internal "UUIDs" as more like
> serial numbers instead...

Well, if we are stuck with non-standard "UUID"s, at least they are
meant to be Universally Unique, so they can be treated as unique
opaque string tokens.  Or you might find a library function that can
return the unencoded binary value and you can encode it as you please.
However, the issue of persistence remains.

FWIW I think it's quite reasonable for someone to want immutable
unique identifiers for distinct objects such as LVM PVs, especially
when the "unique identifier" part is already available and quite
visible.

--=20
Mark H. Wood
Lead Technology Analyst

University Library
Indiana University - Purdue University Indianapolis
755 W. Michigan Street
Indianapolis, IN 46202
317-274-0749
www.ulib.iupui.edu

--DIOMP1UsTsWJauNi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEKAB0WIQQuzJQcdfZrSe3FFBWz81Hgm5MobwUCX4CEJQAKCRCz81Hgm5Mo
b2D8AJ9yNwYMu9Hxl2GaANoMtNyhYMN1oACeOU+DDM4SdHGQvD64/ARJxb4zZhA=
=CxHG
-----END PGP SIGNATURE-----

--DIOMP1UsTsWJauNi--
