Subject: Re: [linux-lvm] Howto create a Compressed ROM File initrd with lvmcreate_initrd
Message-ID: <20030127123502.GB11514@pc.ilinx>
References: <001001c2c581$d7d579a0$240b892c@pe1mhp.ampr.org> <20030127082655.GB1698@tykepenguin.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E39vaYmALEf/7YXx"
Content-Disposition: inline
In-Reply-To: <20030127082655.GB1698@tykepenguin.com>
From: lvm@interlinx.bc.ca
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
Date: Mon Jan 27 06:36:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--E39vaYmALEf/7YXx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2003 at 08:26:55AM +0000, Patrick Caulfield wrote:
>=20
> Yes, the Debian kernels don't have ext2 compiled in TTBOMK, only cramfs.

That is my (very limited) Debian experience as well.  In fact my
experience with trying to do md RAID and LVM (including / on
LVM) with Debian was enough to make me not want to go back there.
Mandrake work[s|ed] a lot better for me.  Just more polished.

Sure I could build a custom kernel and install some tools and modify
the initrd creator on Debian, but I don't want to.  I have better
things to do with my time than build basic system tools.  Why spend
that time, when a distro vendor does it for me?

Mandrake supports all this stuff (and even has LVM creation support
available during install!) right out of the box.  In their 9.1 release
they will support creating / on LVM as well (I finally got off my ass
and submitted my patch to their installer to do it :-).

> Unfortunately, LVM likes to write to the root filesystem during vgscan an=
d so
> you can't use a RO filesystem like cramfs - which is why lvmcreate_initrd
> creates an ext2 filesystem.

Right.  But in the final analysis, it is silliness.  The data that it
writes is thrown away when the initrd is thrown away anyway.

> The simplest wasy to acheive this is to build your own kernel with ext2 b=
uilt in
> and use that for the initrd.

Right.  But there should be a switch to vgscan/vgchange to not write
data to the filesystem.  Maybe LVM2 makes this all go away.  I dunno.
I have not looked at LVM2 yet.

> Root on LVM is complicated anyway so if youre not prepared to do this the=
n you
> really shouldn't be trying root on LVM either....

It's not complicated at all on a distro with good support of it.  Of
course that's not an excuse to not learn how it all works.  You will
need that knowledge if it breaks on you.

b.

--=20
Brian J. Murrell

--E39vaYmALEf/7YXx
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+NSd2l3EQlGLyuXARAv34AJsHr6ic9VjWwbTx6Fj+0OHEJ/oXJgCeIIEO
Rm+deiMpgyg4ctkj/aLS0yw=
=Z0C1
-----END PGP SIGNATURE-----

--E39vaYmALEf/7YXx--
