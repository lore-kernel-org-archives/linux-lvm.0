Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2H7hmY01548
	for <linux-lvm@redhat.com>; Thu, 17 Mar 2005 02:43:48 -0500
Received: from wavehammer.waldi.eu.org (postfix@wavehammer.waldi.eu.org
	[82.139.196.55])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j2H7hmBi012734
	for <linux-lvm@redhat.com>; Thu, 17 Mar 2005 02:43:48 -0500
Date: Thu, 17 Mar 2005 08:43:45 +0100
From: Bastian Blank <bastian@waldi.eu.org>
Subject: Re: [linux-lvm] snapshot reset
Message-ID: <20050317074345.GA27947@wavehammer.waldi.eu.org>
References: <20050316230040.GA6604@wavehammer.waldi.eu.org>
	<20050316231000.GC19749@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline
In-Reply-To: <20050316231000.GC19749@agk.surrey.redhat.com>
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


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 16, 2005 at 11:10:00PM +0000, Alasdair G Kergon wrote:
> On Thu, Mar 17, 2005 at 12:00:40AM +0100, Bastian Blank wrote:
> > Is it possible to reset a snapshot without a delete, create cycle?
> Not sure if I'm answering the right question, but with
> LVM2/device-mapper:

Yes, you were answering the right questions.

> You have to suspend & resume it in the kernel [with existing device-mapper
> implementation; this may change].
>=20
> With LVM2, between those commands, you can just zero out the
> start of the cow device (say first 64k).  And then it'll treat
> it as if it were a new snapshot (based on current state of filesystem.)

Something like this?
| name=3D${vg}-${lv}
| dmsetup suspend $name
| dd if=3D/dev/zero of=3D/dev/mapper/${name}-cow bs=3D64k count=3D1
| dmsetup resume $name

Is it possible to implement that somewhere in the lvm commands?

Bastian

--=20
Power is danger.
		-- The Centurion, "Balance of Terror", stardate 1709.2

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iEYEARECAAYFAkI5NTEACgkQnw66O/MvCNGBbgCfVXf2hFQ5AnV9dr0FEL+0SRoU
NKkAn1VKppqqiBSHq+g9YgyE5DTaQDVl
=IBmK
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
