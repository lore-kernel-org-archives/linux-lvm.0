From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: [linux-lvm] resize an ext3 on an LV
Message-ID: <20030129163508.GW30184@lug-owl.de>
References: <20030129152817.GT30184@lug-owl.de> <Pine.LNX.4.44.0301290929500.25534-100000@zeus.itg.uiuc.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VQx8a0J3gVIvXT58"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0301290929500.25534-100000@zeus.itg.uiuc.edu>
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
Date: Wed Jan 29 10:36:01 2003
List-Id: <linux-lvm.redhat.com>
To: Linux LVM Sistina <linux-lvm@sistina.com>

--VQx8a0J3gVIvXT58
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-01-29 09:32:33 -0600, Alexander Lazarevich <alazarev@itg.uiuc.=
edu>
wrote in message <Pine.LNX.4.44.0301290929500.25534-100000@zeus.itg.uiuc.ed=
u>:
> The LV is already expanded. All I want to do is resize the ext3 filesyste=
m=20
> to the new size of the LV, which is now 275GB.
>=20
> But I need to know the commands. Or some hint of what the command is. Is=
=20
> it just "resize2fs /dev/homevg/userslv"? I've seen some posts saying that=
=20

That's what I used several times. That's on a file server doing
kernel.org/debian.org/... rsync mirrors. Those where added one by one,
each time linked with at least one (for debian.org, this reads 4)
extending sessions...

> using resize2fs will destroy an ext3 filesystem, is that not true? Will=
=20
> the journal stay intact? What's the command that you use?

For me (LVM1 metadata on 2.2.19-rcX patched to run with lvm2 userland +
device-mapper), resize2fs just "worked" with ext3. However, LVM version
should be irrelevant (sp?) wrt. to a (non)functional resize2fs. For me,
it did it's job.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet!
   Shell Script APT-Proxy: http://lug-owl.de/~jbglaw/software/ap2/

--VQx8a0J3gVIvXT58
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+OAK8Hb1edYOZ4bsRAkLQAJoDM7CoGTNu6/6oOX3qQKmHNI+M7QCgj/Hv
7y9UMsBO6ovotClIFZ1dEW4=
=Z6T6
-----END PGP SIGNATURE-----

--VQx8a0J3gVIvXT58--
