Return-Path: <eli@zendo.net>
Date: Wed, 11 Jul 2001 10:39:24 -0500
From: Eli Criffield <eli@zendo.net>
Subject: Re: [linux-lvm] about to give up
Message-ID: <20010711103923.A1863@zendo.net>
References: <85063BBE668FD411944400D0B744267A64338A@AUSMAIL>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline
In-Reply-To: <85063BBE668FD411944400D0B744267A64338A@AUSMAIL>; from austin@coremetrics.com on Wed, Jul 11, 2001 at 10:30:10AM -0500
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

--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 11, 2001 at 10:30:10AM -0500, Gonyou, Austin wrote:
> perhaps just blowing away your VG, then re-setting the volumes as PVs in
> that vg, then growing them one at a time?

How would you do that? I'm booted to a rescue disk now and have no vg's at
all, sence vgscan finds nothing. How do i reset the volumes as
PVs? /dev/hda3 is the only one i care about, its the only one with data on
it. Right now /dev/hda3 shows its part of the rootvg.

thanks

eli

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7THMrm2VvYlVjW2oRAu4sAJ0fi5oiY1GIyhtJxJmOi/S7TQ9g1QCdEjaA
hNbo20MkuFBjxEf0bYBIfm0=
=TyRf
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
