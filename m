Date: Tue, 4 Sep 2001 07:43:28 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] My VG is gone...
Message-ID: <20010904074328.A29128@sistina.com>
References: <20010831071518.07f51602.rasmus.wiman@sami.se> <20010831102206.A391@btconnect.com> <20010902200715.73773199.rasmus.wiman@sami.se>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <20010902200715.73773199.rasmus.wiman@sami.se>; from rasmus.wiman@sami.se on Sun, Sep 02, 2001 at 08:07:15PM +0200
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 02, 2001 at 08:07:15PM +0200, Rasmus Wiman wrote:
> Joe Thornber <thornber@btconnect.com> skrev:
> > You're right sdb1 appears to have been added twice with seperate
> > UUID's.  I'm at a loss to explain this at the moment.  Did you run
> > pvcreate more than once on sdb1 ? (I want to know where that extra
> > uuid came from).
>=20
> Well here's the full story:
> I added the new disk, made a new LVM partition, ran pvcreate on it. Did a
> vgextend vg1 /dev/sdb1. Rebooted. No vg:s found, Panic: root not found.
> Spent a bunch of hours hackaing a Slackware 8 boot floppy with LVM 1.0
> support. It found the vg. Next idea: Maybe it's because of devfs. I hacked
> the disk a bit further yo use devfs, and now it didn't find the VG:s. I
> started looking for any LVM list archive, found something about small
> initrd:s so I put an 8 MB initrd image on the root floppy, and wow, the VG
> was there. Tried to put a larger initrd on the boot partition and re-ran
> lilo. Rebooted, no success. Later I realised that a initrd_size=3D8912k
> might have done the trick. Booted from the floppy again and did a vgreduce
> vg1 /dev/sdb1. Now it would boot. Here I should really have backed up
> everything to a non LVM partition, but instead I did a vgextend vg1 sdb1.
> Re-ran lvmcreate_initrd, re-ran lilo and rebooted. That's where I am now.
> Two SDB1:s with separate UUID's. Can this be fixed or should I format and
> reinstall? It would really feel bad because I've never had to format and
> reinstall a Linux system except for the occasional hardware failure.

Did you try the uuid_fixer program at ftp://ftp.sistina.com/pub/LVM/contrib

That may fix your problem, but it would be nice to get as much info out of
your system as possible before you use it to figure out what went wrong...

--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3CD1 25EE DBE3 1B69 F3C7  A1FB 2A81 D686 34A2 2=
E9E

-----Begin Obligatory Humorous Quote----------------------------------------
Life's short and hard, kind of like a bodybuilding elf
-----End Obligatory Humorous Quote------------------------------------------

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7lMxwb2fpvETN3pURAuqmAKCFy3gHx4IqR5Fz54B+qTeHGaoOTwCgkcK0
2NTc7hltK0RgsbJDKaViHpw=
=86Ah
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
