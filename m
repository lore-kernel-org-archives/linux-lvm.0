Subject: Re: [linux-lvm] LVM and RAID
Message-ID: <20031109221838.GD4425@amphibian.dyndns.org>
References: <21E8E34076807C41A646FDC666B15BDF0876A1@minna.combox.de> <1067952111.20554.26.camel@lupin>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tEFtbjk+mNEviIIX"
Content-Disposition: inline
In-Reply-To: <1067952111.20554.26.camel@lupin>
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
Date: Mon Nov 10 11:13:09 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--tEFtbjk+mNEviIIX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2003 at 01:21:51PM +0000, Geoff Dolman wrote:
> On Tue, 2003-11-04 at 13:09, Tobias Gablunsky wrote:
> > >=20
> > > -----BEGIN PGP SIGNED MESSAGE-----
> > > Hash: SHA1
> > >=20
> > > On Tuesday 04 November 2003 11:49, Tobias Gablunsky wrote:
> > > > Hi all!
> > > >=20
> > > > I didn't find clear information about how to use LVM on an=20
> > > (Software)
> > > > RAID-Mirror (or RAID-5). All I found, were problems: LVM=20
> > > uses Partition
> > > > Type
> > >  0x8E but Linux Soft-RAID uses 0xFD - this dosn't look very
> > > > compatible... A solution would be to use Hardware-RAID of=20
> > > course. But I'm
> > > > wondering if there is a way to use Software-RAID and LVM=20
> > > together - I
> > > > cannot believe that I am the first one with this question! Am I?
> > >=20
> > > I just created the software raid, and pointed pvcreate at it.
> > > Works like a charm.
> >=20
> > Well thats fine but if you want your kernel to boot use your RAID-Volum=
es
> > automatically you have to give it partition type 0xFD. And if you want
> > automatically mounted LVM you need to give it the partition type 0x8E=
=20
>=20
>=20
> But why? Your RAID set will be made on say /dev/hda1 and /dev/hdb1
> creating say /dev/md0, but your lvm partition will exist on /dev/md0.

Does the kernel autodetection work in this case? Would you need to
partition /dev/md0 into a boot partition and an LVM PV?
>=20
> --=20
> Geoff Dolman
> JDRF/WT Diabetes and Inflammation Laboratory
> Cambridge Institute for Medical Research
> University of Cambridge
> http://www-gene.cimr.cam.ac.uk/todd/
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--=20
Matthew J Toseland - toad@amphibian.dyndns.org
Freenet Project Official Codemonkey - http://freenetproject.org/
ICTHUS - Nothing is impossible. Our Boss says so.

--tEFtbjk+mNEviIIX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/rr0+r5e+zmpNTm8RAoJkAJ9FI0mmLOrptXHSo8d0ma6nav8hHgCfcLjv
VTm6XWQD7IzuvdoiB8K3cEY=
=J0La
-----END PGP SIGNATURE-----

--tEFtbjk+mNEviIIX--
