Date: Wed, 2 Aug 2000 12:04:57 +0200
From: Jens Benecke <jens@pinguin.conetix.de>
Subject: Re: [linux-lvm] Generic resize tool
Message-ID: <20000802120457.E28254@pinguin.conetix.de>
References: <200008011842.e71IgcS27484@webber.adilger.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="qlTNgmc+xy1dBmNv"
In-Reply-To: <200008011842.e71IgcS27484@webber.adilger.net>; from adilger@turbolinux.com on Tue, Aug 01, 2000 at 12:42:38PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Linux LVM mailing list <linux-lvm@msede.com>


--qlTNgmc+xy1dBmNv
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 01, 2000 at 12:42:38PM -0600, Andreas Dilger wrote:

> Hello, I'm wondering if people are interested in having a more generic
> resize tool than the current e2fsadm.  I've updated e2fsadm to have
> support for the GNU ext2resize tools (ext2resize and ext2online) in
> addition to resize2fs, but I was wondering about adding support for
> reiserfs resizing as well.  At this point e2fsadm isn't a very good name
> for it anymore.
=20
One suggestion, also for Heinz: PLEASE put a notice into "lvresize" that
you might actually be better off with e2fsadm, if the lv is formatted ext2.
So that you use

	pvcreate
	vgextend
	e2fsadm

instead of

	pvcreate
	vgextend
	lvextend

and then being stuck with not knowing how (and how much) to resize the FS
within.


Another question: If I shrink a LV, how do I know what PVs in the VG get
freed? i.e. I have  one big LV in VG00 =3D (hda1 hdb2 hdc1)  and I want to
remove hdb2 out of the VG.=20


--=20
ciao, Jens (mailaddr im Header)                 http://www.pinguin.conetix.=
de
"Schiebe nie etwas auf Boshaftigkeit, was           http://www.hitch-hiker.=
de
ausreichend durch Dummheit erkl=E4rt werden kann."       http://www.linuxfa=
q.de

--qlTNgmc+xy1dBmNv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iQEXAwUBOYfySbhrARHySzvPFAEoTwQAjnY9w5MyPLtjM3CsvJdhZIkssG7N9+BS
uBxPVyfkHFBvvks7eC+7cMw8BHsJ8nWiIqhf+zZgVbYQdhoWBL/JGjd98dT6YklU
nTmzqOBMy37O3K+2c/MQJCaYtH9+l9GUTMPQtB92bQjnlDrZtJSdoOAnfE7qvj4w
2UFQMZVzClUEAKnOo1cVbzmCLclmoCJg6xbMasR/PrtQ7yhkls+0/6tsv62TyuCs
nWdT0TYe1G6cexbQ3Rkdft0UczSA5inYCBoFsPCqG70ZmV9w5ED9FfjsguwujCEe
RV49UFAOqdLajWoRg3nQf58K9urOVb68V2NqFE/GCTDTpWk/y5wXEB9u
=sLId
-----END PGP SIGNATURE-----

--qlTNgmc+xy1dBmNv--
