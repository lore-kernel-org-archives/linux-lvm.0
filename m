Date: Thu, 30 Aug 2001 15:44:48 -0500
From: AJ Lewis <lewis@sistina.com>
Message-ID: <20010830154448.A28281@sistina.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline
Subject: [linux-lvm] *** ANNOUNCEMENT *** LVM 1.0.1-rc2 available at www.sistina.com
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
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com, lvm-devel@sistina.com

--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

We have a new 1.0.1 Release Candidate!  The major difference between rc1 and
rc2 is that rc2 uses PV version 1 metadata on all new PVs and PVs modified
with the rc2 tools.

A tarball is available now at

   <http://www.sistina.com/>

for download (Follow the "download" link in the announcement on that page).

This release candidate should allow you to continue to use the old data
format (version 1) which was used by beta7 tools and below, as well as the
new format (version 2) which was used by beta8 and 1.0.  There is no longer
a need to undertake the upgrade process which was described in the 0.9.1
beta8 and LVM 1.0 release notes.  It also has support for linux-2.4.9 as
well as a couple of minor bug fixes.  If you have already upgraded to
LVM 1.0, there is no need to update to LVM 1.0.1-rc2.

Being a release candidate this has not received as much testing as our
normal releases.  It will become LVM 1.0.1 provided no problems are
discovered.

Feed back LVM related information to <linux-lvm@sistina.com>.

Thanks a lot for your support of LVM.

--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3CD1 25EE DBE3 1B69 F3C7  A1FB 2A81 D686 34A2 2=
E9E

-----Begin Obligatory Humorous Quote----------------------------------------
This message has been brought to you by the language C and the number F.
-----End Obligatory Humorous Quote------------------------------------------

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7jqXAb2fpvETN3pURAk05AKCM2mLrFg0zujWJs7dBbt2cfZZxmgCfaEkc
bkX+u8vsGXnRtRqmiuqqwEk=
=tkYm
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
