Return-Path: <blutgens@sistina.com>
Date: Thu, 31 May 2001 15:48:09 -0500
From: Ben Lutgens <blutgens@sistina.com>
Subject: Re: [linux-lvm] LVM on / and SuSE 7.1
Message-ID: <20010531154809.A21575@minime.sistina.com>
References: <3B16A8B9.761EFB83@swipnet.se>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline
In-Reply-To: <3B16A8B9.761EFB83@swipnet.se>; from daleto@swipnet.se on Thu, May 31, 2001 at 10:25:29PM +0200
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

--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 31, 2001 at 10:25:29PM +0200, Tomas Dalebj=F6rk wrote:
>Hi,
>
>I tryed to create:
>Volume Group : rootvg
>(Containing)
>Logical Volume : rootvol1
>
>But when I get to the point where I need to install my LiLO, I recieved
>the following message:
>Fatal : Not a number : "/dev/rootvg/rootvol1"

No I think this is a lilo problem. You may want to try upgrading.

>
>This disk was already pre-filled from SuSE installations, and I have
>allready done all the needed installations.
>If I read the man pages for lvmcreate_initrd,=20
>lvmcreate_initrd assumes that /dev/vg00/root contains  the  root
>filesystem. But my volume group is rootvg, and my logical volume is
>rootvol1.


>
>
>Is this step important to make the image bootable.

>
>Please help me.
>
>Thanks in advance.
>
>Regards Tomas
>                                ,,,,,
>                                (o o)
>---------------------------o000--(_)--000o-----------------------
>
>Tomas Dalebj=F6rk                            Mail: Tomas@daleto.com
>=20
>=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
>Back up my hard drive? I can't find the reverse switch!
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

--=20
Ben Lutgens	=09
Sistina Software Inc.=09
MIS Geek / Gentoo Developer=20
http://dolly-llama.org | http://www.gentoo.org/ | http://sistina.com/
Kernel panic: I have no root and I want to scream

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7Fq4JLxkxGgLdGQgRAuVlAJ0avqy1BQd+5El0j/0TRpWPtJLXdgCgqrFW
VNSMqI3PELoAOdFcnYhWPUs=
=S6vZ
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
