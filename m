Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5P3F0u18302
	for <linux-lvm@redhat.com>; Fri, 24 Jun 2005 23:15:00 -0400
Received: from ofb3.ofb.net (h34-aclarke.sv.meer.net [205.217.153.34])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5P3EoG1026668
	for <linux-lvm@redhat.com>; Fri, 24 Jun 2005 23:14:54 -0400
Date: Fri, 24 Jun 2005 20:14:46 -0700
From: jheiss-lvm@ofb.net
Message-ID: <20050625031446.GA9383@ofb.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
Subject: [linux-lvm] vgreduce --removemissing
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


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I have a VG which had two LVs.  I removed the drives for the second LV
=66rom the system without disabling the LV or otherwise letting LVM know.
Now LVM refuses to start the VG back up (which is reasonable behavior).
However, I wish to inform LVM that the two drives I removed are not
going to reappear, and I would like it to start up and just give me the
remaining LV.  The --removemissing flag to vgreduce seems like it should
be exactly what I'm looking for, and when run indicates that it is doing
the right thing.  But it doesn't seem to actually make any changes.

[root@typhoon ~]# pvdisplay
  Couldn't find device with uuid '5Ztw2o-Ooa8-AYX3-XE56-HR9T-uRQI-75YTuA'.
  Couldn't find device with uuid 'O4kqGt-VEKo-yavU-R8yN-PGjF-mWjF-a9tdWt'.
  --- Physical volume ---
  PV Name               /dev/sda1
  VG Name               typhoon
  PV Size               186.28 GB / not usable 0  =20
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              5961
  Free PE               0
  Allocated PE          5961
  PV UUID               tVs73X-iCjn-JkPe-uakW-teze-yCXX-LegeRB
  =20
  --- Physical volume ---
  PV Name               unknown device
  VG Name               typhoon
  PV Size               186.28 GB / not usable 0  =20
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              5961
  Free PE               0
  Allocated PE          5961
  PV UUID               5Ztw2o-Ooa8-AYX3-XE56-HR9T-uRQI-75YTuA
  =20
  --- Physical volume ---
  PV Name               unknown device
  VG Name               typhoon
  PV Size               111.78 GB / not usable 0  =20
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              3577
  Free PE               0
  Allocated PE          3577
  PV UUID               O4kqGt-VEKo-yavU-R8yN-PGjF-mWjF-a9tdWt
  =20
[root@typhoon ~]# vgreduce --removemissing --verbose typhoon
    Finding volume group "typhoon"
  Couldn't find device with uuid '5Ztw2o-Ooa8-AYX3-XE56-HR9T-uRQI-75YTuA'.
  Couldn't find all physical volumes for volume group typhoon.
  Couldn't find device with uuid '5Ztw2o-Ooa8-AYX3-XE56-HR9T-uRQI-75YTuA'.
  Couldn't find device with uuid 'O4kqGt-VEKo-yavU-R8yN-PGjF-mWjF-a9tdWt'.
    Archiving volume group "typhoon" metadata.
    typhoon/backups has missing extents: removing (including dependencies)
    Deactivating (if active) logical volume backups
  Couldn't find device with uuid '5Ztw2o-Ooa8-AYX3-XE56-HR9T-uRQI-75YTuA'.
  Couldn't find device with uuid 'O4kqGt-VEKo-yavU-R8yN-PGjF-mWjF-a9tdWt'.
    Found volume group "typhoon"
  Couldn't find device with uuid '5Ztw2o-Ooa8-AYX3-XE56-HR9T-uRQI-75YTuA'.
  Couldn't find device with uuid 'O4kqGt-VEKo-yavU-R8yN-PGjF-mWjF-a9tdWt'.
    Found volume group "typhoon"
    Removing LV backups from VG typhoon
    typhoon/backups has missing extents: removing (including dependencies)
    Deactivating (if active) logical volume backups
  Couldn't find device with uuid '5Ztw2o-Ooa8-AYX3-XE56-HR9T-uRQI-75YTuA'.
  Couldn't find device with uuid 'O4kqGt-VEKo-yavU-R8yN-PGjF-mWjF-a9tdWt'.
    Found volume group "typhoon"
  Couldn't find device with uuid '5Ztw2o-Ooa8-AYX3-XE56-HR9T-uRQI-75YTuA'.
  Couldn't find device with uuid 'O4kqGt-VEKo-yavU-R8yN-PGjF-mWjF-a9tdWt'.
    Found volume group "typhoon"
    Removing LV backups from VG typhoon
[root@typhoon ~]# pvdisplay
  Couldn't find device with uuid '5Ztw2o-Ooa8-AYX3-XE56-HR9T-uRQI-75YTuA'.
  Couldn't find device with uuid 'O4kqGt-VEKo-yavU-R8yN-PGjF-mWjF-a9tdWt'.
  --- Physical volume ---
  PV Name               /dev/sda1
  VG Name               typhoon
  PV Size               186.28 GB / not usable 0  =20
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              5961
  Free PE               0
  Allocated PE          5961
  PV UUID               tVs73X-iCjn-JkPe-uakW-teze-yCXX-LegeRB
  =20
  --- Physical volume ---
  PV Name               unknown device
  VG Name               typhoon
  PV Size               186.28 GB / not usable 0  =20
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              5961
  Free PE               0
  Allocated PE          5961
  PV UUID               5Ztw2o-Ooa8-AYX3-XE56-HR9T-uRQI-75YTuA
  =20
  --- Physical volume ---
  PV Name               unknown device
  VG Name               typhoon
  PV Size               111.78 GB / not usable 0  =20
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              3577
  Free PE               0
  Allocated PE          3577
  PV UUID               O4kqGt-VEKo-yavU-R8yN-PGjF-mWjF-a9tdWt

--=20
Jason Heiss
PGP key:  http://ofb.net/~jheiss/jheiss.pgp.txt


--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCvMwmmyNX8sTTeO0RAlQGAJ9l2DoOvzcosMIW2TSDpbMXBE7oqgCeMTHJ
xWOqPHkrh2A87mfsVG8HYPQ=
=9izb
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
