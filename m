Return-Path: <lewis@sistina.com>
Date: Wed, 1 Aug 2001 12:38:00 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] using LVM from two machines
Message-ID: <20010801123800.A6008@sistina.com>
References: <20010801152451.41897.qmail@web14403.mail.yahoo.com> <20010801170828.G2603@tykepenguin.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline
In-Reply-To: <20010801170828.G2603@tykepenguin.com>; from caulfield@sistina.com on Wed, Aug 01, 2001 at 05:08:28PM +0100
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

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2001 at 05:08:28PM +0100, Patrick Caulfield wrote:
> The only way to achieve what you want to do at the moment is to unload th=
e VGs
> on one machine (vgchange -ay after closing all the volumes), make the cha=
nges
                  ^^^^^^^^^^^^
i believe patrick meant 'vgchange -an' here.

> on the other machine and then re-run vgscan on the first machine and remo=
unt the
> volumes. This applies to *any* changes you make to the LVM configuration.

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
The three most dangerous things are a programmer with a soldering iron, a
manager who codes, and a user who gets ideas.
-----End Obligatory Humorous Quote------------------------------------------

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD4DBQE7aD54pE6/iGtdjLERAiLTAJ9i10LFMncTpX/CSpee52mZmL5WdgCYjR7C
6jcE5CaS6yQLyXj9Wc8fIw==
=JkIY
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
