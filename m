From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Message-ID: <20030107092849.GE2529@lug-owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BZaMRJmqxGScZ8Mx"
Content-Disposition: inline
Subject: [linux-lvm] DM: Possible disk corruption?
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
Date: Tue Jan  7 03:28:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--BZaMRJmqxGScZ8Mx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

For testing purposes, I've placed a HDD with a number of PVs (assembling
to one VG with one LV) into a test box and installed 2.4.19 with the
dewnloadable DM patch (official release) and installed LVM2. Initially,
this ran quite well, and I added another HDD (this is the third HDD. One
is for the system, the other two large ones to store data).

After playing a bit with DM+LVM2, I shutted the box down to bring it to
another location, but it didn't any longer boot:-( I reinstalled the
base system (the LVs came up again with no problems:-), but rebooting
the box again, it didn't boot up again:-(

This time, I used gpart to try to recover, and it found useful data to
assemble a new partition table. Before writing it, I backed up the first
1.44MB of /dev/hda (guess where I stored it on:-> to do
post-mortem-inspection.

The first 512 byted of mentioned boot HDD where overwritten by some
Samba log! This is followed by some KB of 0x00. However, hda was never
ever itself (or any partition on it) used with LVM or anything else what
could IMHO caused this. The only difference compared to dozends of
machines I installed is DM + LVM2 userland tools (used with LVM1
metadata). Is it possible that the DM version downloadable at sistina
isn't really stable (for basic use)? Should I try some CVS checkout?

MfG, JBG
PS: If you would like to have the floppy's contents for your own
inspection, I can place it somewhere...

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet!
   Shell Script APT-Proxy: http://lug-owl.de/~jbglaw/software/ap2/

--BZaMRJmqxGScZ8Mx
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+Gp3RHb1edYOZ4bsRAqo7AJ48yzGiCOo+owrwUXxxLgDzDYO0qACghifL
MAtc1H9wWTvlVQJSONk4zko=
=tC3V
-----END PGP SIGNATURE-----

--BZaMRJmqxGScZ8Mx--
