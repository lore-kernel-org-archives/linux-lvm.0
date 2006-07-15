Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6FMRSQ7020248
	for <linux-lvm@redhat.com>; Sat, 15 Jul 2006 18:27:28 -0400
Received: from ik57067.ikexpress.com (ik57067.ikexpress.com [213.246.57.67])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6FMRRAb007384
	for <linux-lvm@redhat.com>; Sat, 15 Jul 2006 18:27:27 -0400
Received: from deplagne by ik57067.ikexpress.com with local (Exim 4.50)
	id 1G1saW-0000nx-9m
	for linux-lvm@redhat.com; Sun, 16 Jul 2006 00:26:16 +0200
Date: Sun, 16 Jul 2006 00:26:16 +0200
From: Eric Deplagne <Eric.Deplagne@wanadoo.fr>
Message-ID: <20060715222616.GA22932@ik57067.ikexpress.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline
Subject: [linux-lvm] lvm1 physical volume unaccessible after too big lv
	expansion
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi...

I'm getting into big trouble with a lvm1 physical volume=20
after I wanted to resize a logical volume and lvresize barked
something like
  "cannot grow a lv more than 64K extents"...

The problem is after that I cannot access my data...

I copy the output of pvdisplay -vv and pvscan at the end
of the message...

Trying to go any further tells me it did not find the volume group...

Any idea ?

I'm using ubuntu on a ppc (powerbook)

root@ubuntu:/home/ubuntu# pvdisplay -vv /dev/sdc
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
    Using physical volume(s) on command line
      /dev/sdc: lvm1 label detected
      Reading physical volume data /dev/sdc from disk
      Found /dev/sdc in VG vg
  --- Physical volume ---
  PV Name               /dev/sdc
  VG Name               vg
  PV Size               233.76 GB / not usable 2.44 MB
  Allocatable           yes
  PE Size (KByte)       1024
  Total PE              239370
  Free PE               239370
  Allocated PE          0

root@unbuntu:/home/ubuntu# pvscan /dev/sdc
  logical extent (0) already mapped.
  Couldn't fill logical volume maps.
  logical extent (0) already mapped.
  Couldn't fill logical volume maps.
  No matching physical volumes found

--=20
  Eric Deplagne

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFEuWuIej7DisjVpq4RAlXYAKCHWSI9+lZKJzYo0SbNxamvgCDt+gCffoLm
63iePlPGwEgXHTPIpwnqUfw=
=GvZZ
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
