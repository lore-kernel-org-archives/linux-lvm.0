Date: Tue, 1 Aug 2000 18:20:37 +0200
From: Jens Benecke <jens@pinguin.conetix.de>
Subject: [linux-lvm] repair "lvextend-instead-of-e2fsadm" usage
Message-ID: <20000801182037.B9431@pinguin.conetix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: LVM List <linux-lvm@msede.com>


--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

thanks to all for the last hints ... it works (sort of). Now I've done
something stupid - I've installed a new HDD and

	pvcreate /dev/hdb1
	vgextend /dev/vg01 /dev/hdb1
	vgdisplay /dev/vg01           -> 3737 free 4MB extents
	lvextend +l 3737 /dev/vg01/home

instead of using "e2fsadm" to resize the file system as well.

Is there a way to use resize2fs to get the same result, or would I have to
(can I?) "lvreduce -l -3737 ..." the volume group first? How does the
"reducing" work, does it just cut off the end?


The Trouble Is(tm), umounting the /home partition would include explaining
to 200 scientists why and how long they cannot access their precious data,
and I *really* don't want to go into details here. =3D;()


Thanks!

--=20
ciao, Jens (mailaddr im Header)                 http://www.pinguin.conetix.=
de
"Schiebe nie etwas auf Boshaftigkeit, was           http://www.hitch-hiker.=
de
ausreichend durch Dummheit erkl=E4rt werden kann."       http://www.linuxfa=
q.de

--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iQEXAwUBOYb41LhrARHySzvPFAFifQQAy6rJzDSWxQ82z3DV/plHnWmtEP5VNz9x
xGOhwE5k3fgCNsLeC+pSRJNSjG0lw73gJrsYA03XnGB1llN5VmRaKeKPMfF69cGJ
jqdo9EkwbDfundWCm/WtTsRaHC+r/E63g8AsdpwdC46Mbt9gf+TeTzA6vATfBuLz
vJIg/xCDDooD/ixvOCmb6PfHDe8wQlVhtjpOxkutcXaXWP4V/asyMfaNMrcmOoK5
A/0OPjP7LzSPybudfv/ILLDzCp8Yk30c/07P9yXPh8/pU1T3qnf3UpBV3LB5f6/6
mrt7QiycfABSSXB8JqxQllO0rqCfJs5S5+xdiXmODNqRYn6C5a3imGLS
=US5K
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--
