From: "William Blunn" <bill@tao-group.com>
Subject: Re: [linux-lvm] Directory becomes sticky socket?
Message-Id: <006b01c1ad9a$914595b0$216410ac@tao.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20020204154410.GA14373@wookimus.net>
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
Date: Mon Feb  4 10:41:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: debian-user@lists.debian.org
Cc: linux-lvm@sistina.com, "Chad C. Walstrom" <chewie@wookimus.net>

> I'm not sure how this came about, but I cannot remove the directory
> /usr/share/doc/libldap2.  =20
>=20
>     [09:36:47] chewie@skuld (505)$ ls -lad libldap2=20
>     s-w--w---T  16806 236536206 1076048101 1084824775 Oct  1  2004 =
libldap2=3D
>     [09:36:52] chewie@skuld (506)$ file libldap2
>     libldap2: sticky socket
>     [09:36:58] chewie@skuld (507)$ sudo rm -rf /usr/share/doc/libldap2
>     rm: cannot unlink `/usr/share/doc/libldap2': Operation not =
permitted
>=20
> System: Debian unstable (Sid)
> Kernel: 2.4.17-k7
> Filesystem: ext3 on an LVM logical volume (no extra patches to the
> kernel, vanilla 2.4.17).
>=20
> I've tried removing it while root as well with no success.  I've tried
> using fsck.{ext2,ext3} with no avail.  I relize that I'm going to have
> to do something fairly low-level to the FS to recover this problem.  =
Any
> pointers or suggestions you may have would be quite welcome.

I think: Use "ls -li" to find the object's inode. Then use debugfs to
clear the object's inode. Then fsck it to clear up any hanging bits in
the FS.

Bill
