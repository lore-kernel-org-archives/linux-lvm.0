Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2P4G30A032526
	for <linux-lvm@redhat.com>; Wed, 25 Mar 2009 00:16:03 -0400
Received: from QMTA09.westchester.pa.mail.comcast.net
	(qmta09.westchester.pa.mail.comcast.net [76.96.62.96])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2P4FhtF006350
	for <linux-lvm@redhat.com>; Wed, 25 Mar 2009 00:15:43 -0400
Received: from [10.10.0.90] (gw.dugas.lan [10.10.0.1]) (authenticated bits=0)
	by mail.dugas.cc (8.13.8/8.13.8) with ESMTP id n2P3ROCb007692
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2009 23:27:29 -0400
Subject: Re: [linux-lvm] CLVM Snapshot HOWTO?
From: Paul Dugas <Paul@dugas.cc>
In-Reply-To: <49C854B8.3080009@sivell.com>
References: <1237863480.6512.66.camel@ltpad.dugas.lan>
	<49C854B8.3080009@sivell.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-T8OQlZpkdM4n4jb9chC8"
Date: Wed, 25 Mar 2009 00:15:29 -0400
Message-Id: <1237954529.6512.101.camel@ltpad.dugas.lan>
Mime-Version: 1.0
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


--=-T8OQlZpkdM4n4jb9chC8
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2009-03-23 at 22:34 -0500, Vu Pham wrote:
> Paul Dugas wrote:
> > I apologize if this has been covered already or is written up elsewhere
> > but I can't seem to find it.  I've got a couple of AoE volumes that I'm
> > using for LVM VGs.  They have GFS filesystems on LVs that are sized to
> > fill 90% of the the VGs; 10% space left over for snapshots.  I have 4
> > CENTOS 5.2 machines clustered and mounting the GFS filesystems.  That's
> > working well.
> >=20
> > Having used LVM snapshots in non-cluster environments before, I figured
> > I'd just use the same logic for backing up the volumes; lvcreate -s,
> > mount, backup, umount, lvremove.  This quickly fell apart and I started
> > to think about it more.  I ended up wondering how snapshots of the
> > volume could ever really work without coordinating with the other
> > nodes. =20
> >=20
> > My question is this.  Should I be able to use snapshots on clustered
> > volumes like this?  If not, are there plans to support it later?  If so=
,
> > can someone point me to a working example?
> >=20
>=20
> I think you have to freeze the GFS volume before you create a snapshot,=20
> then you unfreeze it. man gfs_tool

That's what I was looking for.  Much thanks for getting me further but I
think I'm still missing a step.  Currently, this is what my "pre-backup"
script is doing:

        COOKIE=3D`gfs_tool list | egrep " $LK_TBL_NM.[0-9][0-9]*\$" | awk '=
{print \$1}'`
        gfs_tool freeze $COOKIE
        lvcreate --size ${SIZE} --snapshot --name SNAP /dev/${VG}/${LV}
        gfs_tool unfreeze $COOKIE
        gfs_fsck -y /dev/${VG}/SNAP
        mount -t gfs -o ro,lockproto=3Dlock_nolock /dev/${VG}/SNAP ${MNTPT}

I'm getting a "File Exists" error from the mount which I believe is
because I'm trying to mount both the device and the snapshot at the same
time and they share the same lock-table-name.   Now that I think of it,
I don't really need to mount the original version of the file system so
I may be able to move past this hitch but I'm wondering if there's a
good way to address this?  Could I rename the lock table via "gfs_tool
sb /dev/${VG}/$SNAP table $LK_TBL_NM.SNAP" to get around it?  Would that
change be cleared when the snapshot is removed?

P
--=20
Paul Dugas - paul@dugas.cc - 404.932.1355

--=-T8OQlZpkdM4n4jb9chC8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAknJr+EACgkQZadkToPsM6FPZQCgoMOnl3fiZzSphk9KGTkFOxck
tUsAniO+dYFIODjLyIKdYIPpl02NoSE/
=B/V2
-----END PGP SIGNATURE-----

--=-T8OQlZpkdM4n4jb9chC8--
