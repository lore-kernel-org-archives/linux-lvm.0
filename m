Return-Path: <lewis@sistina.com>
Date: Thu, 26 Jul 2001 15:17:25 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Nasty bug in lvm and/or md and/or reiserfs
Message-ID: <20010726151725.A28574@sistina.com>
References: <20010726131928.D1779@linux.com> <20010726134732.A27706@sistina.com> <20010726160701.H1779@linux.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline
In-Reply-To: <20010726160701.H1779@linux.com>; from tack@linux.com on Thu, Jul 26, 2001 at 04:07:01PM -0400
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

--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 26, 2001 at 04:07:01PM -0400, Jason Tackaberry wrote:
> > Umm...try this one:
> >=20
> >   mkreiserfs /dev/md3
> >   mount /dev/md3 /space
> >   cd /space
> >   dd if=3D/dev/zero of=3D/dev/md3 bs=3D1024k count=3D500
> >=20
> > is that a bug?
>=20
> Good point.
>=20
> Still, the bugs that surface in md and reiserfs make me a little
> worried.  md has been around for a while now, hasn't it?  I get the
> feeling it's a bit fragile.  Well, maybe it's just me.

I personally don't know a whole lot about MD, but there seem to be a lot
of people using it.  Maybe people on the list using MD and LVM together can
comment.

I'm just not sure if we can rely on something like /proc/mounts for pvcreate
and vgcreate...I will look into it though.  If you have any suggestions, or
if you want to send patches, I would appreciate it.

Regards,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
Computers make very fast, very accurate mistakes.
-----End Obligatory Humorous Quote------------------------------------------

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7YHrVpE6/iGtdjLERAhbsAJ9h/mj95izXUqanXKPWx6pZF1xGtwCfYPgh
1Im1anfjzDi1mUiIw9yLf9M=
=OLpv
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
