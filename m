Return-Path: <hopper@omnifarious.mn.org>
Date: Mon, 30 Apr 2001 08:23:19 -0500
From: "Eric M. Hopper" <hopper@omnifarious.org>
Subject: Re: [linux-lvm] Interesting note on 2.4.4 (off topic)
Message-ID: <20010430082319.A4878@omnifarious.org>
References: <3AED1F1A.BA8DD33A@gecpalau.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline
In-Reply-To: <3AED1F1A.BA8DD33A@gecpalau.com>; from glenn@gecpalau.com on Mon, Apr 30, 2001 at 05:15:22PM +0900
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

--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 30, 2001 at 05:15:22PM +0900, Glenn Shannon wrote:
> I have just seen another effect of running 2.4.4 (on my system only???)
>=20
> Apparently the DevFS in this kernel is buggy....
>=20
> I just tried to open an xterm...apparently I have no ptys available
> (what?????????)
>=20
> Hmmmmmmmmmmmmmm

	I'm not using DevFS, and I've had suing from root to someone
else fail for reasons that also seem to involve ptys.  Also, using the
loop device crashed every program that tried to access files on the
mounted filesystem caused evil looking kernel messages about
dereferencing NULL pointers and made everything unstable until I
rebooted.

	I think it's back to 2.4.3 for me.  :-(

Have fun (if at all possible),
--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper)=
 --

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE67WdHG4QeWBeRdS8RAsCdAKCOyKRPscprcFsEz3/l1ei8HS/8qQCePbnk
VHTIBw8wpx5jxvnHPd6SdUg=
=ECHJ
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
