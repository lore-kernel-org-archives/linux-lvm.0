Date: Thu, 23 Aug 2001 14:54:32 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] segfault running vgscan
Message-ID: <20010823145432.A20622@sistina.com>
References: <Pine.LNX.4.33.0108231329090.4179-100000@bobak.net> <20010823192235.21160.qmail@web20301.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <20010823192235.21160.qmail@web20301.mail.yahoo.com>; from bwlang@yahoo.com on Thu, Aug 23, 2001 at 12:22:35PM -0700
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

On Thu, Aug 23, 2001 at 12:22:35PM -0700, Brad Langhorst wrote:
> so yes dynamically linked...
> the problem was with static linking right?
>=20
> now what?=20
> should I try a less optimized libc?

I know that there was an issue with atexit() with certain versions of
glibc, it's possibly both when dynamically and statically linked.  I'm not
sure.  I am sure that the following tools call atexit() through LVM_LOCK():

lvchange.c
lvcreate.c
lvdisplay.c
lvextend.c
lvm_user.h
lvm_user.h
lvmchange.c
lvmsadc.c
lvreduce.c
lvremove.c
lvrename.c
lvscan.c
pvchange.c
pvchange.c
pvcreate.c
pvdata.c
pvdisplay.c
pvmove.c
pvscan.c
vgcfgbackup.c
vgcfgrestore.c
vgchange.c
vgck.c
vgcreate.c
vgdisplay.c
vgexport.c
vgextend.c
vgimport.c
vgmerge.c
vgmknodes.c
vgreduce.c
vgremove.c
vgrename.c
vgscan.c
vgsplit.c

Can you verify that these are the ones that segfault, or that the other
tools do not?  Can you upgrade glibc?  Or try on a machine with a
different version?

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
There's nary an animal alive that can outrun a greased Scotsman.
   - Groundskeeper Willie
-----End Obligatory Humorous Quote------------------------------------------

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7hV94pE6/iGtdjLERAvrEAKCRdaVoqnXw3yMEr+Onr4ncTu/OYgCffGbd
pkw6d10qHlzsciuTFq0ZxeQ=
=DJ9s
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
