Date: Tue, 1 Aug 2000 20:21:09 +0200
From: Jens Benecke <jens@pinguin.conetix.de>
Subject: Re: [linux-lvm] repair "lvextend-instead-of-e2fsadm" usage
Message-ID: <20000801202109.B10252@pinguin.conetix.de>
References: <200008011704.e71H4Rv15918@webber.adilger.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
In-Reply-To: <200008011704.e71H4Rv15918@webber.adilger.net>; from adilger@turbolinux.com on Tue, Aug 01, 2000 at 11:04:27AM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Linux LVM mailing list <linux-lvm@msede.com>


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 01, 2000 at 11:04:27AM -0600, Andreas Dilger wrote:
> Jens, writes:

> > ...  The Trouble Is(tm), umounting the /home partition would include
> > explaining to 200 scientists why and how long they cannot access their
> > precious data, and I *really* don't want to go into details here. =3D;()
=20
> resize2fs /dev/vg01/home

That's what I did. I managed to shutdown the database and umount /home and
do this by staying at work till 8pm =3D;()

Thanks. :)
=20
> (i.e. don't specify the size) and it will extend the filesystem to the
> full size of the partition.  Note that using resize2fs will be much
> faster than doing e2fsadm, because you don't really need an fsck before
> doing the resize, but e2fsadm does it anyways.

well... resize2fs told me I should check the FS, and because this is
production data, I did it. Just to be sure.
=20
> If you have the online resize patch in your kernel already, but didn't do

I didn't even know it existed. =3D;)

> I have updated e2fsadm to call either ext2online or (resize2fs or
> ext2resize) depending on what is available and if the filesystem is
> mounted or not.  I will send a patch to linux-lvm shortly.

OK. Great work :)

What I am still somewhat missing in LVM is "cosmetics".  I suppose there is
no easy way to integrate all those tools into one consistent UI (needn't be
"G"UI) so that they are not used in the wrong order ... or is there?
=20

--=20
ciao, Jens (mailaddr im Header)                 http://www.pinguin.conetix.=
de
"Schiebe nie etwas auf Boshaftigkeit, was           http://www.hitch-hiker.=
de
ausreichend durch Dummheit erkl=E4rt werden kann."       http://www.linuxfa=
q.de

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iQEXAwUBOYcVFbhrARHySzvPFAEneAP/TK2+n+D4OJZZ/Fju/lJR567CY09sFJkD
VINKbvJawi+Q9iIstXXQWn/NkPKNXCIfIG05n84k0YBqP9EG0y1TpA7KF3Rr2Jbv
inGg442d3Qbu8OGrvjLdKpSUTdLtJqUWlQBytQZ3IRgDphCgTyuVROvtU0Q3L/hs
EChAu5RE2qwEAMCOnexNY1MewUCTVyJfSKdyB2udS18I5PJfwJwkjNogNUR4Y0F3
4A1qrEGqAj5SbA/I6iuAqo3O2DmHj9ukFAvsfNDUrsb8U+M/urqWWUMTdfdL4LL/
Q37LkY67yhio3KC6sLi2BRfYKC4Rpu2bwBwOVqqj1YGUREiHioHmmWDg
=i46M
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
