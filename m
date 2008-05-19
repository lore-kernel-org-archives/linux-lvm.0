Date: Mon, 19 May 2008 21:01:26 +0200
From: Hans-Joachim Baader <hjb@pro-linux.de>
Subject: Re: [linux-lvm] Performance of striping
Message-ID: <20080519190126.GB2611@kiwi.hjbaader.home>
References: <20080517091151.GB14292@kiwi.hjbaader.home>
	<20080519124232.GB5134@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline
In-Reply-To: <20080519124232.GB5134@redhat.com>
Sender: Hans-Joachim Baader <hjb@pro-linux.de>
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
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,


> > But this setup was too complicated for me, so I tried a different
> > approach. Still a physical volume for each disk (actually partiton 2
> > which is nearly the complete disk), but only one volume group vg0.
> > The commands used were:
> >=20
> > pvcreate /dev/sda2
> > pvcreate /dev/sdb2
> > pvcreate /dev/sdc2
> > vgcreate vg0 -s 128 /dev/sda2 /dev/sdb2 /dev/sdc2
> >=20
> > On vg0, I created a LV which should span all 3 disks and therefore be
> > equivalent to a RAID 0:
> >=20
> > lvcreate --name=3Dtest -L 10000M -i 3 vg0
> >=20
> > Resulting LV:
> >=20
> >   --- Logical volume ---                                               =
           LV Name                /dev/vg0/ubuntu                          =
                VG Name                vg0
> >   LV Write Access        read/write
> >   LV Status              available
> >   # open                 1
> >   LV Size                10,12 GB
> >   Current LE             81
> >   Segments               1
> >   Allocation             inherit
> >   Read ahead sectors     0
> >   Block device           254:10
> >=20
> > However, I get only half the expected performance. I created an XFS
> > filesystem and mounted it on /mnt/tmp:
> >=20
> > # dd if=3D/dev/zero of=3D/mnt/tmp/bla bs=3D1024k count=3D10000
> > 10485760000 Bytes (10 GB) kopiert, 112,233 Sekunden, 93,4 MB/s
> > # dd if=3D/mnt/tmp/bla of=3D/dev/null bs=3D1024k count=3D10000
> > 10485760000 Bytes (10 GB) kopiert, 88,8886 Sekunden, 118 MB/s
> >=20
> > This was measured with kernel 2.6.23.12 and 2.6.25.1 on AMD64 X2.
> > Is it possible to get 210 MB/s?
>=20
> Have you tried fiddling with read ahead ?
> "blockdev --setra ..." on the striped LV.

read ahead is currently 256 on all devices. Thanks for the hint.
I will try some other values. Any Idea what is recommended?

Thanks,
hjb
--=20
Pro-Linux - Germany's largest volunteer Linux support site
http://www.pro-linux.de/          Public Key ID 0x3DDBDDEA

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIMc6GLbySPj3b3eoRAlHIAJwNpdcWGzZ+t6MuMdGbTzFuEr3aOwCdEF/d
s2jhsh7/Rqs6qg97PWd5Jy8=
=4by+
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
