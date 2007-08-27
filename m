Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7RGECbH031835
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 12:14:13 -0400
Received: from server.klug.on.ca (server.klug.on.ca [205.189.48.131])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l7RGE5gT031282
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 12:14:05 -0400
Received: from linux.interlinx.bc.ca (d38-139-100.home1.cgocable.net
	[72.38.139.100])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server.klug.on.ca (Postfix) with ESMTP id 3B3DD2803
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 12:14:04 -0400 (EDT)
Received: from [10.75.22.1] (pc.ilinx [10.75.22.1])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.interlinx.bc.ca (Postfix) with ESMTP id 57B6BEF709
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 12:14:02 -0400 (EDT)
Subject: Re: [linux-lvm] "cannot allocate memory" when trying to do a snapshot?
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <46D2F715.9000308@wpkg.org>
References: <46CEE6FF.1090000@wpkg.org>  <46D2F715.9000308@wpkg.org>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-lpY2OToel63xYynz/q53"
Date: Mon, 27 Aug 2007 12:14:01 -0400
Message-Id: <1188231241.24432.1.camel@pc.ilinx>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--=-lpY2OToel63xYynz/q53
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2007-08-27 at 18:08 +0200, Tomasz Chmielewski wrote:
>=20
> Some more info on that.
> Apparently, this whole snapshotting thing is not very stable, and there=20
> are bugs in it.

This whole snapshotting thing is a known and fixed bug.  I opened a bug
about it in RH's bugzilla about a year ago but am unable to log back in
there to find it specifically for you.  Search for bugs reported by
anyone @interlinx.bc.ca.  Try the word "kcopy" in the bug if there are
too many listed.

Cheers,
b.

--=20
My other computer is your Microsoft Windows server.

Brian J. Murrell

--=-lpY2OToel63xYynz/q53
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBG0vhJl3EQlGLyuXARAoB4AKD8yIfr1eAAYrhEba3htVDWiQRKWQCgtL3P
sGyKPhdEt7JxjzuuyF/UPsc=
=w/uA
-----END PGP SIGNATURE-----

--=-lpY2OToel63xYynz/q53--
