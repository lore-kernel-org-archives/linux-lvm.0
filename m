Date: Wed, 5 Sep 2001 15:41:56 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] My VG is gone...
Message-ID: <20010905154156.A6046@sistina.com>
References: <B51F0C636E578A4E832D3958690CD73E0130BFFB@es04snlnt>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline
In-Reply-To: <B51F0C636E578A4E832D3958690CD73E0130BFFB@es04snlnt>; from jdiehl@sandia.gov on Wed, Sep 05, 2001 at 12:56:10PM -0600
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

--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 05, 2001 at 12:56:10PM -0600, Diehl, Jeffrey wrote:
> I will be formating 311Gb of hard drives today.  These drives were 40% fu=
ll.
> This is the second time that LVM has bitten me.  The first time I tried to
> expand a VG, the VG was gone when the machine rebooted.  Same thing this
> time.  AND THERE IS APEARANTLY NO WAY TO RECOVER!  It seems that all of t=
he
> vg data is recorded in each member pv.  So, why isn't there a utility to
> recover a vg in this situation?  This is very fragile!=20

Did you try the uuid_fixer previously mentioned?

>=20
> -----Original Message-----
> From: Rasmus Wiman
> To: linux-lvm@sistina.com
> Sent: 9/5/2001 2:04 AM
> Subject: Re: [linux-lvm] My VG is gone...
>=20
> "Diehl, Jeffrey" <jdiehl@sandia.gov> skrev:
>=20
> > Any ideas about how to recover without losing my data.  I need to get
> > going
> > soon, so if I haven't fixed it by late this week, I'm going to
> > reformat....
> > And lose several Gb of data.
>=20
> I have already reformated my hard disks, alas. I didn't have time to
> wait
> for a solution. But If someone would have helped me or suppllied code
> that
> fixed the problem, it could have beed the start of a Doctor LVM project.
> I
> think there should really be crash recover tools for any file system and
> LVM system since they all do crash some times.
>=20
>=20
> ---------------------
> Rasmus Wiman
> SAMI Labs
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 60F3 160D C0D5 2C4B 751B  4FF9 6F67 E9BC 44CD D=
E95

-----Begin Obligatory Humorous Quote----------------------------------------
FATAL ERROR! SYSTEM HALTED! - Press any key to do nothing...
-----End Obligatory Humorous Quote------------------------------------------

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7lo4Ub2fpvETN3pURAj/3AJ9vwafShb7bLscEsi3PPog/hXgCgACfZPib
6+O4KnlouLkh6RyjBeB7X9Q=
=QK91
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
