Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5PH7Au26765
	for <linux-lvm@redhat.com>; Sat, 25 Jun 2005 13:07:10 -0400
Received: from ofb3.ofb.net (h34-aclarke.sv.meer.net [205.217.153.34])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5PH75l3001959
	for <linux-lvm@redhat.com>; Sat, 25 Jun 2005 13:07:09 -0400
Date: Sat, 25 Jun 2005 10:07:02 -0700
From: jheiss-lvm@ofb.net
Subject: Re: [linux-lvm] vgreduce --removemissing
Message-ID: <20050625170702.GB28915@ofb.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y7xTucakfITjPcLV"
Content-Disposition: inline
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


--Y7xTucakfITjPcLV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

--partial doesn't seem to be a valid option for vgreduce.

Or did you mean something like 'lvchange -ay --partial /dev/typhoon/backup'
or 'vgchange -ay --partial typhoon'?

[root@typhoon ~]# lvchange -ay --partial /dev/typhoon/backup
  Partial mode. Incomplete volume groups will be activated read-only.
  Couldn't find device with uuid '5Ztw2o-Ooa8-AYX3-XE56-HR9T-uRQI-75YTuA'.
  Couldn't find device with uuid 'O4kqGt-VEKo-yavU-R8yN-PGjF-mWjF-a9tdWt'.
  One or more specified logical volume(s) not found.                       =
     [root@typhoon ~]# vgchange -ay --partial typhoon
  Partial mode. Incomplete volume groups will be activated read-only.
  Couldn't find device with uuid '5Ztw2o-Ooa8-AYX3-XE56-HR9T-uRQI-75YTuA'.
  Couldn't find device with uuid 'O4kqGt-VEKo-yavU-R8yN-PGjF-mWjF-a9tdWt'.
  Couldn't find device with uuid '5Ztw2o-Ooa8-AYX3-XE56-HR9T-uRQI-75YTuA'.
  Couldn't find device with uuid 'O4kqGt-VEKo-yavU-R8yN-PGjF-mWjF-a9tdWt'.
  Couldn't find device with uuid '5Ztw2o-Ooa8-AYX3-XE56-HR9T-uRQI-75YTuA'.
  Couldn't find device with uuid 'O4kqGt-VEKo-yavU-R8yN-PGjF-mWjF-a9tdWt'.
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device 'typhoon-backups'.
  2 logical volume(s) in volume group "typhoon" now active                 =
    =20

The end result is roughly what the messages indicate, the remaining good
LV is made available read-only.  However, lvdisplay and vgdisplay both
still fail and I'm no closer to dumping the unwanted LV and establishing
a clean configuration.

As for versions, I'm running FC3 patched up to the latest and greatest:

[root@typhoon ~]# rpm -q lvm2
lvm2-2.00.25-1.01
[root@typhoon ~]# uname -a
Linux typhoon.aput.net 2.6.11-1.27_FC3 #1 Tue May 17 20:27:37 EDT 2005 i686=
 athlon i386 GNU/Linux

Jason

On Jun 25, 2005, at 8:30 AM, Alasdair G Kergon wrote:
>=20
> --partial  ?
>=20
> else what version?
>=20

--=20
Jason Heiss
PGP key:  http://ofb.net/~jheiss/jheiss.pgp.txt


--Y7xTucakfITjPcLV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCvY82myNX8sTTeO0RAuDpAJ99yK6LSQEcUAmX5HR3i5XP364H5gCeJPdp
wkjyfiTXzsX4CJngE9DdmJw=
=cxSb
-----END PGP SIGNATURE-----

--Y7xTucakfITjPcLV--
