Subject: Re: [linux-lvm] vgscan can't find my vg.
Message-ID: <20031109214432.GB4425@amphibian.dyndns.org>
References: <001e01c31029$015ad760$3c00a8c0@superdatorn>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WhfpMioaduB5tiZL"
Content-Disposition: inline
In-Reply-To: <001e01c31029$015ad760$3c00a8c0@superdatorn>
From: Toad <toad@amphibian.dyndns.org>
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
Date: Mon Nov 10 11:13:04 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--WhfpMioaduB5tiZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

What kernel are you using? Does it have device mapper enabled? Have you
tried vgcfgrestore ? IIRC On LVM1, that's vgcfgrestore -n <physical volume>=
 ,
on LVM2 it's vgcfgrestore <volume group name>

On Thu, May 01, 2003 at 11:31:19PM +0200, Hans T?rnquist wrote:
> I have change my system from slackware to gentoo and I can't get my lvm t=
o work.
>=20
> When I run vgscan I get:
>=20
> # vgscan=20
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of =
volume group "ftp_vg" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume =
group
>=20
> and pvscan:
>=20
> # pvscan=20
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/ataraid/disc0/disc"                is associa=
ted to unknown VG "ftp_vg" (run vgscan)
> pvscan -- inactive PV "/dev/ide/host2/bus1/target0/lun0/disc"  is associa=
ted to unknown VG "ftp_vg" (run vgscan)
> pvscan -- inactive PV "/dev/ide/host2/bus1/target1/lun0/disc"  is associa=
ted to unknown VG "ftp_vg" (run vgscan)
> pvscan -- inactive PV "/dev/ide/host2/bus0/target1/lun0/disc"  is associa=
ted to unknown VG "ftp_vg" (run vgscan)
> pvscan -- inactive PV "/dev/ide/host0/bus0/target1/lun0/disc"  is associa=
ted to unknown VG "ftp_vg" (run vgscan)
> pvscan -- total: 5 [496.34 GB] / in use: 5 [496.34 GB] / in no VG: 0 [0]
>=20
> And now to my problem.
> when I used slackware all my pv's was located by pvscan at /dev/hdb and f=
orward but now at /dev/ide/host?/bus?/lun0/disc.
>=20
> So if anybody got a clue how to fix it, pleace tell me.=20
>=20
> /Hans T?rnquist
--=20
Matthew J Toseland - toad@amphibian.dyndns.org
Freenet Project Official Codemonkey - http://freenetproject.org/
ICTHUS - Nothing is impossible. Our Boss says so.

--WhfpMioaduB5tiZL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/rrU/r5e+zmpNTm8RArwRAJ447b4RRid8swJSQabPeWU4uHTUqACdFHyZ
B4Y+mKyrPhGw39/6wDoR72A=
=T4+/
-----END PGP SIGNATURE-----

--WhfpMioaduB5tiZL--
