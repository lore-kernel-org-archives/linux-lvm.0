From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Omv7OPFV59BnNQnK9Z51"
Message-Id: <1069736195.28598.76.camel@pc>
Mime-Version: 1.0
Subject: [linux-lvm] Lost partition table, how can I find the start of the PV?
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
Date: Tue Nov 25 08:03:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-Omv7OPFV59BnNQnK9Z51
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Yes, in a most stupid error, I trashed my partition table, but I know
the disk was partitioned into 3 partitions as follows:

/dev/hda1:/boot with ext2/3 on it
/dev/hda2:swap
/dev/hda3:lvm PV with ext3 on it

Where th partition boundaries are, I am not sure.  :-(

While I may have lost /boot I am hopeful the destructive operation did
not get to /dev/hda3, which had the only PV on the system.

I am hoping somebody can suggest a tool/operation to try to recover at
least enough of a partition table to try to get /dev/hda3 (and hda1 and
hda2 if possible. bit hda3 is most important) back in order, get the VG
up and get the data off it.

Any ideas at all on how to proceed?  Just for reference in versions of
filesystems, LVM, etc. this was a Debian Woody system.

b.

--=20
My other computer is your Microsoft Windows server.

Brian J. Murrell

--=-Omv7OPFV59BnNQnK9Z51
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/wuECl3EQlGLyuXARAuoGAJ95PCjfetpgNhJp69udLrN/OICBTgCfVxeX
Xj/1ZvAUk7/GIw68MFkrXdk=
=XssN
-----END PGP SIGNATURE-----

--=-Omv7OPFV59BnNQnK9Z51--
