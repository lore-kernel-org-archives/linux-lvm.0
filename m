From: Austin Gonyou <austin@coremetrics.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="=-oc38M7WmpvCoaaZfxGlU"
Message-Id: <1012459640.17154.13.camel@UberGeek>
MIME-Version: 1.0
Subject: [linux-lvm] [OT] Request for assistance. Reply off-list.
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
Date: Thu Jan 31 00:48:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-oc38M7WmpvCoaaZfxGlU
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I've got a major Oracle problem and I'm not sure what to do. I can't
figure it out and I need some ideas on how to go about trouble
shooting/fixing this problem. If you've got oracle+linux+XFS experience,
I can REALLY use your help.=20

Problem: sqlplus segfaults when trying to compile packages. (stored
procedures)

Linux Distro: RH 7.1/7.2 SGI XFS installed
Kernels: 2.4.10 ->2.4.17
Glibc 2.2.2-10 -> 2.2.5 compiled
gcc 2.96-81 -> 3.0.3 compiled.=20

I've got several systems that work without much issue.=20
They are dual PIII 550. 2GB ram. 45GB hdd(9+36)

The server I'm trying to get going is a Dell 6450 8GB RAM, 4P 700Mhz
Xeon. 204GB Disk space 8x36.=20

the re-linked binaries on the target platform are larger than on the
servers that are currently working and don't display the issue.=20

I've tried to use gdb and strace to figure out what's going on, but
there is never any descriptive info when this occurrs. Core files are
found, but do not yeild any information as there are no symbols and the
segfault I get  is a "generic error".=20

There's been info about eval.c:36 in relation to the dumps, but that's
usually about it.=20

Thanks for you time and sorry for the bother. This project is VERY
important, and I'm getting short on time. Yes, we've opened a TAR with
Oracle already, but they're not very quick to respond.=20
--=20
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-698-7250
email: austin@coremetrics.com

"It is the part of a good shepherd to shear his flock, not to skin it."
Latin Proverb

--=-oc38M7WmpvCoaaZfxGlU
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA8WOh494g6ZVmFMoIRAth+AJ9ylSf2s7mPvjd62DZEbtuG0f8bIgCg5K1c
PvfuqAaR8C0Cavrkvff/kIs=
=fG7a
-----END PGP SIGNATURE-----

--=-oc38M7WmpvCoaaZfxGlU--
