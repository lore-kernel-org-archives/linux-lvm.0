Date: Mon, 31 Jan 2000 03:36:52 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: [linux-lvm] Patch 0.8i to 2.3.40: error during make
Message-ID: <20000131033652.A19554@ev-stift-gymn.guetersloh.de>
Reply-To: jbglaw@lug-owl.de
References: <Pine.LNX.4.20.0001301910280.5714-100000@claudius.mgmt-inc.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
In-Reply-To: <Pine.LNX.4.20.0001301910280.5714-100000@claudius.mgmt-inc.com>; from jec+list.lvm@mgmt-inc.com on Sun, Jan 30, 2000 at 07:11:04PM -0500
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 30, 2000 at 07:11:04PM -0500, Jim Cain wrote:
> All,
>=20
> After applying the patch and running make config and make dep, make shows
> the following:
>=20
> make[2]: Entering directory `/usr/src/linux-2.3.40-lvm/kernel'
> gcc -D__KERNEL__ -I/usr/src/linux-2.3.40-lvm/include -D__SMP__ -Wall -Wst=
rict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -pipe -fno-st=
rength-reduce  -DCPU=3D686 -march=3Di686   -DEXPORT_SYMTAB -c ksyms.c
> ksyms.c:258: `block_fsync' undeclared here (not in a function)
> ksyms.c:258: initializer element for `__ksymtab_block_fsync.value' is not=
 constant
> ksyms.c:269: `blkdev_close' undeclared here (not in a function)
> ksyms.c:269: initializer element for `__ksymtab_blkdev_close.value' is no=
t constant
> make[2]: *** [ksyms.o] Error 1
>=20
> Has anyone else had a similar problem with this patch?

Yes, /me... I've got no unmodified file handy and I'm working on a very slow
machine so try this:

- edit ./include/linux/fs.h
- locate line 775
- add the following two lines:

extern int blkdev_close(struct inode *, struct file *);
extern int block_fsync(struct file *, struct dentry *);


--> That's all. It's simply a problem of two missing declarations;(

MfG, JBG

--=20
Fehler eingestehen, Gr=F6=DFe zeigen: Nehmt die Rechtschreibreform zur=FCck=
!!!
keyID=3D0x8399E1BB fingerprint=3D250D 3BCF 7127 0D8C A444 A961 1DBD 5E75 83=
99 E1BB

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEAREBAAYFAjiU9UQACgkQHb1edYOZ4bsPSwCeOArk6mQx2Qb0ytSMPKNNbpBf
XJ0An2n7q0qX7v+wuoxJ9Gv+dfnAzoAM
=nUhQ
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
