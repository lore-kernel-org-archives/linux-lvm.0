Message-ID: <20020909170214.GA6879@amnesiac.homelinux.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
From: Jay Hap-hang Yu <jay@amnesiac.homelinux.org>
Subject: [linux-lvm] How does LVM handle disk failure?
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Sep  9 12:02:02 2002
List-Id: <linux-lvm.redhat.com>
To: Linux LVM mailing list <linux-lvm@sistina.com>

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

I know this must be a very common question and has been asked many
times. I'm evaluating LVM and skimmed the LVM-HOWTO. AFAIK there's no
info on what the sysadmin should do in case one of the PVs of a VG
crashes and cannot be remounted. My questions are:

- will the failure of a single PV take down the whole VG it's in?
- does the entire VG have to be rebuilt? or are there methods to simply
  replace the faulty PV with a new HDD and restore the lost data from
  backup (assume using linear mode)

Cheers,
--=20

- jhy

"If you are reading this line you've too much time to waste."

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9fNQWOvjkdPa97yIRAuRDAJ99EkbZCo+pTOILsK8e3f6zkCYo3gCeIRjk
v4UujVFyVAN61n14DPx3iPk=
=m/SL
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
