Return-Path: <lewis@sistina.com>
Date: Mon, 30 Jul 2001 07:04:57 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Changing partition names?
Message-ID: <20010730070457.A10441@sistina.com>
References: <Pine.LNX.4.21.0107302345400.12575-100000@server.gordon.co.nz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0107302345400.12575-100000@server.gordon.co.nz>; from donald@gordon.co.nz on Mon, Jul 30, 2001 at 11:48:56PM +1200
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

--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 30, 2001 at 11:48:56PM +1200, Donald Gordon wrote:
> I can't seem to see any way to tell lvm that the name of one of the
> partitions it is using has changed (from /dev/sda10 to /dev/sda8; I'm
> transitioning a system to LVM).  Should it pick this up on reboot or is
> there some config file I need to prod?

vgscan will do this for you automatically.

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
Your mouse has moved. Windows NT must be restarted for the change to take
effect. Reboot now? [ OK ]
-----End Obligatory Humorous Quote------------------------------------------

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7ZU1ppE6/iGtdjLERAoGpAJ92NoF5zm1QRw27bTJXFQ6U14GUagCeN384
VAaw+gM5UZ9bZBlmxszLOmA=
=idzC
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
