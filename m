From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: [linux-lvm] ext2online and 2.4.18
Message-ID: <20020621215903.GQ24903@lug-owl.de>
References: <1024512969.1862.6.camel@hiro.prowell.org.bogus> <20020619195508.GA22427@clusterfs.com> <1024521044.1861.6.camel@hiro.prowell.org.bogus> <20020619214731.GB22427@clusterfs.com> <1024525638.1861.54.camel@hiro.prowell.org.bogus> <1024572480.3d11bc400c205@webmail3.wanadoo.nl> <20020620163420.GN22427@clusterfs.com> <482222938.20020621234918@wanadoo.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="63aIh6YiuHX+oBFP"
Content-Disposition: inline
In-Reply-To: <482222938.20020621234918@wanadoo.nl>
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
Date: Fri Jun 21 16:59:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--63aIh6YiuHX+oBFP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2002-06-21 23:49:18 +0200, Sander <boeraa@wanadoo.nl>
wrote in message <482222938.20020621234918@wanadoo.nl>:
> (Response to message from Andreas Dilger, adilger@clusterfs.com on Thursd=
ay, June 20, 2002 6:34:20 PM)
> One message in dmesg which I don't see in a kernel without the patch:
> "EXT2-fs warning: maximal mount count reached, running e2fsck is
> recommended", strange since I have fs checking automatically.

Are you sure that this/those filesystem(s) have a non-zero value in
/etc/fstab's "fs_passno" field (it's the 6th and last value in each
row)?

MfG, JBG

--=20
Jan-Benedict Glaw   .   jbglaw@lug-owl.de   .   +49-172-7608481
	 -- New APT-Proxy written in shell script --
	   http://lug-owl.de/~jbglaw/software/ap2/

--63aIh6YiuHX+oBFP
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9E6GmHb1edYOZ4bsRApDvAJ4mrelmDjlpQOiaZUwfQI5DY/17ggCff7rc
gBQlSxAsVkDfICCYDE7ZSnk=
=EC2H
-----END PGP SIGNATURE-----

--63aIh6YiuHX+oBFP--
