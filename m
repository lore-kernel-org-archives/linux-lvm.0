Return-Path: <lewis@sistina.com>
Date: Tue, 21 Aug 2001 07:13:33 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] naming conventions of vgcfg-backups?
Message-ID: <20010821071333.B16248@sistina.com>
References: <29386.998395265@www26.gmx.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Content-Disposition: inline
In-Reply-To: <29386.998395265@www26.gmx.net>; from grobe@gmx.net on Tue, Aug 21, 2001 at 02:01:05PM +0200
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

--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 21, 2001 at 02:01:05PM +0200, Lars Grobe wrote:
> After resizing, I have to restore my previous lvm configuration. I'm just
> not sure about the default naming of the backups?
>=20
> Am I right that <vgname>.conf is the current config (which is in use now -
> and which is wrong), while <vgname>.conf.1.old is the previous (which I h=
ave
> to restore) and <vgname>.[2345].old are the older backups?

That should be correct I believe, but you could probably take a look at the
timestamp on the file to verify when it was created.  Depending upon which
tools you've used, the first couple might be with the current config or a
variant.

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
A bad random number generator: 1, 1, 1, 1, 1, 4.33e+67, 1, 1, 1...
-----End Obligatory Humorous Quote------------------------------------------

--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7glBtpE6/iGtdjLERAqHEAKCTh72rD8ddrXjDENmGWFuWcwoQ9QCfYcKD
926XJ7qrF/NiOYMMzSsNsz4=
=dsW/
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--
