Return-Path: <lewis@sistina.com>
Date: Mon, 18 Jun 2001 10:07:18 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] LVM and lilo
Message-ID: <20010618100718.A32155@sistina.com>
References: <Pine.LNX.4.33.0106181211400.22455-100000@vie-ac.office.ecetra.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0106181211400.22455-100000@vie-ac.office.ecetra.com>; from alciocca@ecetra.com on Mon, Jun 18, 2001 at 12:19:51PM +0200
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

--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 18, 2001 at 12:19:51PM +0200, Adam Cioccarelli wrote:
> I am pretty new to LVM on Linux and have just set up a disk using LVM but
> I am having problems with lilo. I have the following setup. I have my
> /boot partition on /dev/hda1 which is not using LVM and the rest of my
> partitions including root on /dev/hdb3 which is basically the whole of my
> second disk. I used my Linux installation on /dev/hda4 to set up the LVM
> installation, made the compressed image and modified lilo.conf in the new
> root partition. Then I did a lilo -C on the new lilo.conf and rebooted.
> Everything went fine but now I would like to modify my lilo.conf and all I
> get is; Fatal: Sorry, don't know how to handle device 0x3a00
>=20
> Any ideas?

Is /boot mounted?  I've had problems like this when I hadn't mounted /boot.

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
There are two ways to write error-free programs. Only the third one works.
-----End Obligatory Humorous Quote------------------------------------------

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7LhkmpE6/iGtdjLERAkDAAJwOmE1VOI5/ubHAUQelWtBhScWl2wCeLiLb
p5HUpXBHH9qjHSgVhDoX0UE=
=U2uS
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
