Message-ID: <20031218015654.GA1981@amphibian.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline
From: Toad <toad@amphibian.dyndns.org>
Subject: [linux-lvm] LVM2 pvmove
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
Date: Thu Dec 18 07:58:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Having major problems trying to use pvmove on LVM2. I was told that
pvmove was fixed with LVM2 by the person who wrote it and put out
2.0.08. Apparently it isn't. This is a formerly LVM1 format system=20
recently upgraded via vgconvert.

root@amphibian:~# pvmove /dev/ide/host0/bus1/target1/lun0/disc
device-mapper: error adding target to table
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device 'vg--big-pvmove0'.
  ABORTING: Temporary mirror activation failed.
device-mapper: device 254:034 too small for target
device-mapper: dm-stripe: Couldn't parse stripe destination
device-mapper: error adding target to table
  device-mapper ioctl cmd 9 failed: No such device or address
  Couldn't load device 'vg--big-usr--src--cvs'.
device-mapper: device 254:034 too small for target
device-mapper: dm-stripe: Couldn't parse stripe destination
device-mapper: error adding target to table
  device-mapper ioctl cmd 9 failed: No such device or address
  Couldn't load device 'vg--big-var--log--freenet_stable'.

I have seen two reports of similar problems recently, none of which were
successfully concluded. Is it likely that this will be fixed? If not, I
doubt that LVM2 will be regarded as production quality by anyone for a
long time to come... and I'll have to manually mess around with
recreating every last LV... :(
--=20
Matthew J Toseland - toad@amphibian.dyndns.org
Freenet Project Official Codemonkey - http://freenetproject.org/
ICTHUS - Nothing is impossible. Our Boss says so.

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/4Qlmr5e+zmpNTm8RAqUZAJ94F9z92bHMy02RkMhrAQK4ifP86QCfbR4P
EhefseAHGGPv7D1vk6GE07Y=
=XxxZ
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
