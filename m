Date: Wed, 3 Oct 2001 01:41:44 +0200
From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] How does LVM handle physical changes?
Message-ID: <20011003014144.B10834@dragon.blacknet.de>
References: <20011002232426.A1175@balu.kawo2.rwth-aachen.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="dTy3Mrz/UPE2dbVg"
Content-Disposition: inline
In-Reply-To: <20011002232426.A1175@balu.kawo2.rwth-aachen.de>; from mdobel@kawo2.rwth-aachen.de on Tue, Oct 02, 2001 at 11:24:26PM +0200
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
To: linux-lvm@sistina.com

--dTy3Mrz/UPE2dbVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Tue, Oct 02 '01 at 23:24, Markus Dobel wrote:
> Can LVM handle physical changes of my system, like plugging the PVs
> from one controller to another (so the physical device path changes
> e.g. from /dev/hdb to /dev/hdf)?
Yep, as long as the geometry stays the same. I even moved some disks
from /dev/hd[ce] to /dev/sd[ab] and LVM worked like a charm.

(I used a 3ware IDE controller with /dev/sd[ab] configurated as BOD. It
 is an IDE RAID that appears to the system as a SCSI controller)
--=20
Goetz Bock                                              IT Consultant
Dipl.-Inf. Univ.

--dTy3Mrz/UPE2dbVg
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7ulC4f5srOMkjkQoRAjluAKCqLOBNhTdyoQKNiKFHTf7iD3FMRACg0E0I
r7sRpeM686zZgaiUh068EoI=
=AO0K
-----END PGP SIGNATURE-----

--dTy3Mrz/UPE2dbVg--
