From: "Chad C. Walstrom" <chewie@wookimus.net>
Message-Id: <20020204154410.GA14373@wookimus.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline
Subject: [linux-lvm] Directory becomes sticky socket?
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
Date: Mon Feb  4 09:46:02 2002
List-Id: <linux-lvm.redhat.com>
To: debian-user@lists.debian.org
Cc: linux-lvm@sistina.com

--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Note: Please include me in the Cc: of your reply, for expediency's sake.]

I'm not sure how this came about, but I cannot remove the directory
/usr/share/doc/libldap2.  =20

    [09:36:47] chewie@skuld (505)$ ls -lad libldap2=20
    s-w--w---T  16806 236536206 1076048101 1084824775 Oct  1  2004 libldap2=
=3D
    [09:36:52] chewie@skuld (506)$ file libldap2
    libldap2: sticky socket
    [09:36:58] chewie@skuld (507)$ sudo rm -rf /usr/share/doc/libldap2
    rm: cannot unlink `/usr/share/doc/libldap2': Operation not permitted

System: Debian unstable (Sid)
Kernel: 2.4.17-k7
Filesystem: ext3 on an LVM logical volume (no extra patches to the
kernel, vanilla 2.4.17).

I've tried removing it while root as well with no success.  I've tried
using fsck.{ext2,ext3} with no avail.  I relize that I'm going to have
to do something fairly low-level to the FS to recover this problem.  Any
pointers or suggestions you may have would be quite welcome.

Thanks.

--=20
Chad Walstrom <chewie@wookimus.net>                 | a.k.a. ^chewie
http://www.wookimus.net/                            | s.k.a. gunnarr
Get my public key, ICQ#, etc. $(mailx -s 'get info' chewie@wookimus.net)

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8XqxKDMcLGCBsWv0RApK7AKCun98NNB2fHdBtaQblkdfYQqNovwCg0sXo
y3KsiLSD7gChpwlpL+FBBww=
=KUEU
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
