Return-Path: <bg@blacknet.de>
Date: Tue, 21 Aug 2001 16:00:12 +0200
From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] vgscan && vgchange -ay at startup
Message-ID: <20010821160012.E25747@dragon.blacknet.de>
References: <20010821130033.D402@sky.net> <20010821070403.A16248@sistina.com> <3B8267F5.D3174CAB@tls.msk.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="XuV1QlJbYrcVoo+x"
Content-Disposition: inline
In-Reply-To: <3B8267F5.D3174CAB@tls.msk.ru>; from mjt@tls.msk.ru on Tue, Aug 21, 2001 at 05:53:57PM +0400
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

--XuV1QlJbYrcVoo+x
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Tue, Aug 21 '01 at 17:53, Michael Tokarev wrote:
> But how to have root mounted read-only?
> I resolved problem with only one file that needs to be read-write --
> it is /etc/mtab that I moved out to /var/run (modified glibc and
this should be fixable with making /etc/mtab a link to /proc/mounts

> mount itself).  So my root is now read-only at all times.  But how
> to deal with lvm?  Should I move /etc/lvm* to /var also?
The ideal solution would be to have LVM not write any files at all and
do everything in memory. If I want to make a backup (e.g. when changing
anything) either make the meta data journaling or save the backup to
some where in /var

just my =DB0.02 (soon equal to $0.02, btw on my mac this is an euro sign)
   =20
But, I won't complain. LVM rocks as it is and I'm happy with it.=20
--=20
Goetz Bock                                              IT Consultant
Dipl.-Inf. Univ.

--XuV1QlJbYrcVoo+x
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7gmlrf5srOMkjkQoRAsVrAKDTWcnBlRYNZouA4RAEpkq7LCwjNgCeNUBO
EuMa35SSRQkJB/3Q4ftpIsE=
=e4kH
-----END PGP SIGNATURE-----

--XuV1QlJbYrcVoo+x--
