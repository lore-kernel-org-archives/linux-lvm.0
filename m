From: Nathan E Norman <nnorman@micromuse.com>
Message-Id: <20020204180023.GA28774@micromuse.com>
References: <20020204154410.GA14373@wookimus.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
    protocol="application/pgp-signature";
    boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <20020204154410.GA14373@wookimus.net>
Subject: [linux-lvm] Re: Directory becomes sticky socket?
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
Date: Mon Feb  4 12:06:01 2002
List-Id: <linux-lvm.redhat.com>
To: debian-user@lists.debian.org
Cc: "Chad C. Walstrom" <chewie@wookimus.net>, linux-lvm@sistina.com

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 04, 2002 at 09:44:10AM -0600, Chad C. Walstrom wrote:
> [Note: Please include me in the Cc: of your reply, for expediency's sake.]
>=20
> I'm not sure how this came about, but I cannot remove the directory
> /usr/share/doc/libldap2.  =20
>=20
>     [09:36:47] chewie@skuld (505)$ ls -lad libldap2=20
>     s-w--w---T  16806 236536206 1076048101 1084824775 Oct  1  2004 liblda=
p2=3D
>     [09:36:52] chewie@skuld (506)$ file libldap2
>     libldap2: sticky socket
>     [09:36:58] chewie@skuld (507)$ sudo rm -rf /usr/share/doc/libldap2
>     rm: cannot unlink `/usr/share/doc/libldap2': Operation not permitted
>=20
> System: Debian unstable (Sid)
> Kernel: 2.4.17-k7
> Filesystem: ext3 on an LVM logical volume (no extra patches to the
> kernel, vanilla 2.4.17).
>=20
> I've tried removing it while root as well with no success.  I've tried
> using fsck.{ext2,ext3} with no avail.  I relize that I'm going to have
> to do something fairly low-level to the FS to recover this problem.  Any
> pointers or suggestions you may have would be quite welcome.

# chattr -i /usr/share/doc/libldap2
# rm -r /usr/share/doc/libldap2

If the dir /usr/share/doc/libldap2 contains more borked files, provide
a "-R" to chattr.

--=20
Nathan Norman - Staff Engineer | A good plan today is better
Micromuse Ltd.                 | than a perfect plan tomorrow.
mailto:nnorman@micromuse.com   |   -- Patton

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8Xsw3F/RmbRyJNdgRAbtZAJ9znzGXbaSjuzDjYkzO8gyvMIqEIQCgr5d1
BzOpl19lmCRRFVlgPNoJEaw=
=+cVe
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
