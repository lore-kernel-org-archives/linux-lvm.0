Return-Path: <bg@blacknet.de>
Date: Fri, 29 Jun 2001 00:18:37 +0200
From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] HowTo: EIDE/ATA-100 + RAID 1 + LVM
Message-ID: <20010629001837.K16466@dragon.blacknet.de>
References: <8F120FA493CAD743B30EEB8F356985B5BB57D5@AUSXMBT102VS1.amer.dell.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="6TC23+W66xmFESAX"
Content-Disposition: inline
In-Reply-To: <8F120FA493CAD743B30EEB8F356985B5BB57D5@AUSXMBT102VS1.amer.dell.com>; from Robert_Macaulay@Dell.com on Thu, Jun 28, 2001 at 04:46:10PM -0500
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

--6TC23+W66xmFESAX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Thu, Jun 28 '01 at 16:46, Robert_Macaulay@Dell.com wrote:
> I had a 4G RAM box(HIMEM64 enabled) with Hardware RAID 1 and LVM beta7,
> kernel is from RH 7.1, version 2.4.3-6.
What kind of hardware raid?
If it wasn't such a fake IDE one (or a 3ware encalade), I would have
sticked with it. =20
=20
> [ ... ]
> I know I changed 2 variables(RAM and RAID). I'm going to go back to HW ra=
id
> 1 for now, and see if it makes a difference.
I would try the ram first, I'm not too confident on IA32 boxes handling
more than 4gb correctly (damn it, I'd like to have a box with 1gb ...)

--=20
Goetz Bock                                              IT Consultant
Dipl.-Inf. Univ.

--6TC23+W66xmFESAX
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7O609f5srOMkjkQoRAi5dAKCO8Ci05insvWfxBJ+WT9yb280LdACfVrkT
WovZ5vBYjIm/A6pYK5HFK2c=
=7CBE
-----END PGP SIGNATURE-----

--6TC23+W66xmFESAX--
