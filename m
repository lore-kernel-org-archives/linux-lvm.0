From: Austin Gonyou <austin@coremetrics.com>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-encrypted";
	boundary="=-olY/gCTqH7KOg8cE8LQZ"
Message-Id: <1023224082.9106.17.camel@UberGeek>
Mime-Version: 1.0
Subject: [linux-lvm] LVM 1.1rc2 compile error
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
Date: Tue Jun  4 15:55:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-olY/gCTqH7KOg8cE8LQZ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

kernel 2.4.19-pre9-aa2
LVM 1.1rc2 source, patch created applies cleanly.=20

lvm-snap.c:364: structure has no member named `blocks'
lvm-snap.c:369: structure has no member named `blocks'


The struct being used is indeed named blocks..but seems undefined or
inaccessible. Should it be something else?

--=20
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-698-7250
email: austin@coremetrics.com

"One ought never to turn one's back on a threatened danger and=20
try to run away from it. If you do that, you will double the danger.=20
But if you meet it promptly and without flinching, you will=20
reduce the danger by half."
Sir Winston Churchill

--=-olY/gCTqH7KOg8cE8LQZ
Content-Type: application/pgp-encrypted; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA8/SkS94g6ZVmFMoIRAsTeAKDxrTukS7EqultTh1wCkx0i5rE/yQCfcD9k
M7YSZwONktt7A6lVG6eyMgs=
=s6mu
-----END PGP SIGNATURE-----

--=-olY/gCTqH7KOg8cE8LQZ--
