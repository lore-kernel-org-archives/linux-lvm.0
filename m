Return-Path: <lewis@sistina.com>
From: lewis@sistina.com
Date: Mon, 18 Dec 2000 10:29:45 -0600
Subject: Re: [linux-lvm] Patches for 0.8.1
Message-ID: <20001218102945.A30254@sistina.com>
References: <00121619514201.00774@lyta>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
In-Reply-To: <00121619514201.00774@lyta>; from russell@coker.com.au on Sat, Dec 16, 2000 at 07:51:42PM +0100
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

--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 16, 2000 at 07:51:42PM +0100, Russell Coker wrote:
> This one removes an unnecessary library check (which doesn't work) and ad=
ds=20
> version data to the config file (this is so handy).

Now we just have to make sure we rev the version number before a release.  =
;)

> +AC_SUBST(VERSION)
> +VERSION=3D0.8final

Shouldn't this be '+VERSION=3D0.8.1'?

I'm not going to put this completely in until we get the ./configure stuff
worked out, but I'll hand apply most of it to the 'LVM_0-9-patches' and
'LVM_0-8-1-patches' tagged version of the CVS.  Make sure you're working wi=
th
those as you continue.

Thanks,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-379-3951
1313 5th St SE, Suite 111              Fax:    612-379-3952
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com
Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648

I have yet to meet a C compiler that is more friendly and easier to use
than eating soup with a knife.

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6Pjt5pE6/iGtdjLERAhQzAKCEOjVOJdpGvkKWTJsZrRCHD4ZQpgCfSE8B
EQk8tvoJq8fbVdFzb6YiIzs=
=lC5Z
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
