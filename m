Message-Id: <200110180957.f9I9v8a04929@lap1.mtg.at>
From: Andreas Kostyrka <andreas@mtg.co.at>
Date: Thu, 18 Oct 2001 11:57:03 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] lvchange and stripes
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi!

I've got a problem that seems to striping related: I cannot extend dev lv=
,=20
probably because LVM insists upon splitting the LV to 3 discs.

Now my problem is, that I haven't found a way to change the stripe=20
configuration of a LV. :(

Andreas
- --=20
Andreas Kostyrka; Raiffeisenstr. 16/9; 2320 Zw=F6lfaxing
Tel: +43/676/4091256; Fax: +43/1/7065299
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.5 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7zqdyHJdudm4KnO0RAmPKAKDdrbjbANL3H/pDJ42V0W0lmnHnPACfWeSD
p+qdfw4bzCXGHGxRj0iz6Ow=3D
=3Dw8fI
-----END PGP SIGNATURE-----
