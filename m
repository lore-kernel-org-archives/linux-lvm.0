Return-Path: <jackmc-linux-lvm@lorentz.com>
From: "Jack McKinney" <jackmc-linux-lvm@lorentz.com>
Date: Thu, 7 Jun 2001 11:32:07 -0500
Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
Message-ID: <20010607113207.A30712@stocks.pillory.com>
References: <20010605210727.C1870@pc.ilinx> <3B1F9E1C.1984FAF8@wrkhors.com> <20010607104301.A29848@stocks.pillory.com> <20010607182636.H3232@jensbenecke.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline
In-Reply-To: <20010607182636.H3232@jensbenecke.de>; from lvm@jensbenecke.de on Thu, Jun 07, 2001 at 06:26:36PM +0200
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

--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Big Brother tells me that Jens Benecke wrote:
> >     After installation, do:
> > cd / ; mv tmp tmp.old ; ln -s /var/tmp .  reboot rm -rf /tmp.old
> >     Now you don't have to worry about root filling up at all...
>=20
> er... I wouldn't do that (at least not on a Debian system).=20
>=20
> Usually /var/tmp is _assumed_ to be only root-writeable, so all sorts of
> daemons and programs running as root put their stuff there. This could op=
en
> a number of security holes, when /var/tmp doesn't get treated as carefully
> as /tmp.

    Hmmm... I run Debian, and /var/tmp is certainly world-writable:

drwxrwxrwt    7 root     root         2048 Jun  7 07:56 /var/tmp


    It has been this way on every Debian system I have installed...

--
Whoever put the '.' next to the '/'       Jack McKinney
on a keyboard obviously never used        jackmc@lorentz.com
the -R option to /bin/chown               http://www.lorentz.com
1024D/D68F2C07 4096g/38AEF076

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAjsfrIcACgkQimeon9aPLAc/JgCdHahUzCznKyVY8gHDbNtYI0IH
75oAn1JHxDpfF3TmqiLNt8tefaSABoW8
=8SQ4
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
