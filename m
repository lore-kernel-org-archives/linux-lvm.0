Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0BIs5r14221
	for <linux-lvm@redhat.com>; Tue, 11 Jan 2005 13:54:05 -0500
Received: from dcs.nac.uci.edu (root@dcs.nac.uci.edu [128.200.34.32])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0BIrtqn011696
	for <linux-lvm@redhat.com>; Tue, 11 Jan 2005 13:53:56 -0500
Subject: Re: [linux-lvm] stripped or not ?
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
In-Reply-To: <20050111184621.52d06aef@eric.placeverte.home>
References: <20050111184621.52d06aef@eric.placeverte.home>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-VgZFk9emStK9Nxa2B3l1"
Date: Tue, 11 Jan 2005 10:53:47 -0800
Message-Id: <1105469627.6118.14.camel@localhost.localdomain>
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


--=-VgZFk9emStK9Nxa2B3l1
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2005-01-11 at 18:46 +0100, messmate wrote:
> Hi,
> I'm in doubt if my volumes are stripped or not.
> They were setted-up by the debian-installer ( no choice=20
> for stripping or not).
>=20
> How can I seen they are striped ?
> Thanks in advance
> mess-mate

You could probably use dstat to verify this:

1) Fire up a dstat

2) Write a significant amount of data to the "mirror"

3) If both disks show heavy activity in dstat, then you're probably good
to go


There are probably other ways as well.


--=-VgZFk9emStK9Nxa2B3l1
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBB5CC7o0feVm00f/8RAtTCAKCKMINr3cnolWT+fy9D4ZoqFmnj9wCfXmBX
vB3mkLiPwggRj8LaACOenyo=
=a7z3
-----END PGP SIGNATURE-----

--=-VgZFk9emStK9Nxa2B3l1--
