Message-ID: <20031109213821.GA4425@amphibian.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
From: Toad <toad@amphibian.dyndns.org>
Subject: [linux-lvm] Instability with 2.6, recovering (meta)data?
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
Date: Mon Nov 10 11:13:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Each time I have deleted an LV on LVM2 on 2.6, it has corrupted my
metadata. Last time I did a vgcfgrestore on 2.4 and it worked, however I
have recently been bitten by some sort of incompatibility bug and my LVM
now only works on 2.6 (it might work on a 2.4+devmapper kernel, I'll
look into that). Here is what happens when I try to get my metadata
back:
root@amphibian:/usr/src/linux# vgdisplay -d -v
    Finding all volume groups
    Finding volume group "vg-big"
  invalid lv in extent map
  Couldn't fill logical volume maps.
  Volume group "vg-big" doesn't exist
root@amphibian:/usr/src/linux# pvscan -d -v
    Wiping cache of LVM-capable devices
    Wiping internal cache
    Walking through all physical volumes
  invalid lv in extent map
  Couldn't fill logical volume maps.
  No matching physical volumes found
root@amphibian:/usr/src/linux# vgcfgrestore -v -d vg-big
  PV /dev/hda is a different format (lvm1)
  Restore failed.

That last one is particularly perverse; I was always told that LVM1 and
LVM2 are compatible. Of course later I discovered this not to be the
case; after some operation or other (creating an LV? resizing one?) on
LVM on 2.6, I could no longer access my LVs under 2.4/LVM1.

Any help?
--=20
Matthew J Toseland - toad@amphibian.dyndns.org
Freenet Project Official Codemonkey - http://freenetproject.org/
ICTHUS - Nothing is impossible. Our Boss says so.

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/rrPNr5e+zmpNTm8RAi2KAJ9JsvivnL7twIY/aXeext+ugDzMjACfWhps
VoVj3Pg2AbZ8ARjKKK/vn0w=
=AXHB
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
