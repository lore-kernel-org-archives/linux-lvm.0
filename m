From: Tracy R Reed <treed@copilotconsulting.com>
Message-ID: <20030920185757.A9590@copilotconsulting.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline
Subject: [linux-lvm] device-mapper ioctl cmd 2 failed: Invalid argument
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
Date: Mon Sep 22 15:49:08 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Nobody replied to my last message about the kernel oops and I couldn't
figure it out so I thought I would try upgrading to the latest and
greatest including 2.6.0-test5. I seem to be having some sort of problem
with devmapper not communicating properly with something.

I think I've got the latest everything:

lrwxrwxrwx    1 root     root           20 Sep 20 14:35
/lib/libdevmapper.so -> libdevmapper.so.1.00

home:~# lvdisplay --version
  LVM version:     2.00.07 (2003-09-16)
  Library version: 1.00.05-ioctl-cvs (2003-09-01)
  Driver version:  1.0.6

I've got the latest 2.6, the latest devmapper, the latest lvm userland
tools from sistina... But snaps still don't work.

home:~# lvcreate --size 1G --snapshot --name snap /dev/system/tmp
  device-mapper ioctl cmd 2 failed: Invalid argument
  Couldn't load device 'system-snap'.
  Problem reactivating origin tmp

Now I've got an inactive snap lv and an inactive origin lv. I can remove
the snap lv and reactivate the origin lv and everything is fine.

Any ideas what's wrong with my setup?

--=20
Tracy Reed
http://copilotconsulting.com

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj9tBaUACgkQ9PIYKZYVAq0EQwCfZ7xW1FfFEiZUnnU6gPq8zD8U
xv8AoIAXWjm+mcKwlwfcLd6+ykAvixJI
=snza
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
