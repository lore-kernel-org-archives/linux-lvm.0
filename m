Return-Path: <lewis@sistina.com>
Date: Sun, 5 Aug 2001 20:20:23 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] LVM with multi-path disks?
Message-ID: <20010805202023.B6570@sistina.com>
References: <3B6B30C4.B4427F3D@cup.hp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Content-Disposition: inline
In-Reply-To: <3B6B30C4.B4427F3D@cup.hp.com>; from defranco@cup.hp.com on Fri, Aug 03, 2001 at 04:16:20PM -0700
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

--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 03, 2001 at 04:16:20PM -0700, John DeFranco wrote:
> Does LVM work with multi-path disks? For example I have
> a fibre channel configuration in which I have two paths
> to each disk. I pvcreate a disk and am able to use it
> within a vg but when I reboot and do a vgscan, lvm cannot
> find any vg's. If I remove the second path lvm can see
> the vg fine.
>=20
> Are there some configuration settings or such that need
> to be enabled?

Just to make it clear.  LVM does not currently have multipath support.  It
is planned for inclusion into LVM or possibly a separate driver to stack
with LVM after LVM 1.0 is released.

We are currently too busy dealing with trying to get a stable LVM release
out to start adding new features now, but hopefully multipathing and other
highly requested features will be supported soon.

For now it sounds like the best option is to patch MD to support
multipathing and stack LVM on top of that.

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
Choose a job you love, and you will never have to work a day in your life.
-----End Obligatory Humorous Quote------------------------------------------

--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7bfDXpE6/iGtdjLERAnqOAJ4m2UCYm01omzME1jjkAYyt7hxnHACffP/W
KLqXStTgWw8OvXISM2tKqRQ=
=ljML
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--
