Date: Wed, 28 Jul 2010 17:41:12 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20100728164112.GG15417@agk-dp.fab.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline
Subject: [linux-lvm] lvm2-cluster (clvmd) security fix (Moderate)
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
To: linux-lvm@redhat.com, linux-cluster@redhat.com


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I have released version 2.02.72 of LVM2 today to address a security problem.

  ftp://sources.redhat.com/pub/lvm2/LVM2.2.02.72.tgz
  ftp://sources.redhat.com/pub/lvm2/LVM2.2.02.72.tgz.asc

If you are running clvmd on a machine where you also have non-root users
you should seriously consider applying the patch,   The problem has been
in the code base since 2004.  LVM2 on its own is not vulnerable to this
problem.

Vendors were notified last week.

Red Hat's Security Advisories are here:

   https://rhn.redhat.com/errata/RHSA-2010-0567.html
   https://rhn.redhat.com/errata/RHSA-2010-0568.html

Fuller details are in the Red Hat Bugzilla:
   https://bugzilla.redhat.com/CVE-2010-2526

The essential part of the patch is attached there and it should apply to
older releases too.

Alasdair
--=20
agk@redhat.com

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkxQXagACgkQIoGRwVZ+LBfIvACfVtUgEsCbk24o+h1mDX18wNTj
rnEAn2U0QKPuAH/BaTHurrZgEPiXmH4J
=m+89
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
