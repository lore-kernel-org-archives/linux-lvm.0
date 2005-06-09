Date: Thu, 9 Jun 2005 10:49:49 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] lvcreate goes into deep-sleep while creating an xfs
	snapshot
Message-ID: <20050609154949.GA4872@null.msp.redhat.com>
References: <6A58CFF91886D54BBDA1FE988C4DF79D025065@bagex01.baghus-lan.net>
	<42A81719.9080801@gmx.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
In-Reply-To: <42A81719.9080801@gmx.net>
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
Cc: linux-xfs@oss.sgi.com


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2005 at 12:16:57PM +0200, Klaus Strebel wrote:
> Sven Riedel schrieb:
> >Hi,
> >I'm creating a backup script for a database using lvm snapshots.
> >The script ran fine for a few test runs, then I added xfs_freeze -f=20
> >just before the lvcreate command, as per HOWTO recipe. Now
> >lvcreate went into deep-sleep and wont wake up:
> >
> >update:~/bin# ps ax | grep lvcreate
> >25053 pts/2    D<L+   0:00 lvcreate -s -L 55M -n tables_snap=20
> >   /dev/database_vg/tables_lv
> >
> >Running lvdisplay in a different terminal to see if lvm itself
> >is still seeing all LVs results in lvdisplay going into=20
> >deep-sleep mode as well. Doing an strace -p 25053=20
> >doesn't display anything (strace won't catch my interrupts
> >either, but according to ps it's in a regular sleep).
> >
> >dmesg doesn't say anything to this situation.
> >
> >Is there a known issue with snapshots and xfs_freeze?=20
> >Any way I can gather pertinent debugging info?
> >
> >I'm running lvm 2.01.04 (package from debian unstable).
>=20
> The HOWTO is way old, with LVM2 the XFS filesystem is 'frozen'=20
> automaticly on the mount -onouuid,ro ( not quite sure, but probably also=
=20
> for LVM1 ..., think it's in the XFS code ).
> So, forget xfs_freeze. It's freezing your box, not your filesystems.

I'm *slowly* working on getting the howto updated for LVM2.  I should have =
the
xfs_freeze-related lines out today.  I've been meaning to do that for a whi=
le.
Please e-mail me if you see other things that are wrong in the HowTo.

Thanks,=20
--=20
AJ Lewis                                   Voice:  612-638-0500
Red Hat Inc.                               E-Mail: alewis@redhat.com
One Main Street SE, Suite 209
Minneapolis, MN 55414
  =20
Current GPG fingerprint =3D D9F8 EDCE 4242 855F A03D  9B63 F50C 54A8 578C 8=
715
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...


--gKMricLos+KVdGMg
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCqGUd9QxUqFeMhxURApLoAJ0eRWMxsCAyrSHPdpXWzKdjANr2ywCePK0M
2XsSmUsLSdbnzxraZ5afQ1U=
=oGOi
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
