From: Wiktor Wodecki <wodecki@gmx.de>
Subject: Re: [linux-lvm] Spinning down/up drives.
Message-ID: <20020603120614.GA832@kakerlak.hojo-net.de>
References: <12639997890.20020602023603@tnonline.net> <20020602014851.A15117@zealot.blacknet.de> <E17EQ6p-0003ep-00@hermes.sistina.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline
In-Reply-To: <E17EQ6p-0003ep-00@hermes.sistina.com>
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
Date: Mon Jun  3 05:03:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

begin  Adrian Head  quotation:

> On Sun, 2 Jun 2002 09:48, you wrote:
> All depends.  On the RAID5 I have running at work & home I have a hot-spa=
re &=20
> I have a hdparm -y /dev/hdg in rc.local which puts it to sleep after boot=
-up=20
> as its useless having it spin if its not needed.  NOTE: I have never been=
=20
> able to get hdparm -Y /dev/hdg working on any drive even those that are=
=20
> suppost to support it.  Again any pointers or info would be appreciated.

-Y works on recent IBM ide drives. Haven't tried scsi, tho.

--=20
Regards,

Wiktor Wodecki      |    http://johoho.eggheads.org
wodecki@gmx.de      |    IRC: Johoho@IrcNET

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8+1u26SNaNRgsl4MRAmsvAKCo6l6mm5te8kKCdwc5/ildGe4wugCdHky1
JU/or9Jx0Our5twxLPtsYpw=
=KT6c
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
