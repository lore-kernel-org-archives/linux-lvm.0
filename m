Return-Path: <lewis@sistina.com>
Date: Mon, 12 Mar 2001 23:12:08 -0600
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Problem with vgscan/ vgcfgrestore
Message-ID: <20010312231208.A14087@sistina.com>
References: <20010313012313.A3042@cistron.nl> <200103130056.f2D0uTi01167@webber.adilger.int> <20010313021438.A6401@cistron.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline
In-Reply-To: <20010313021438.A6401@cistron.nl>; from wichert@cistron.nl on Tue, Mar 13, 2001 at 02:14:39AM +0100
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

--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 13, 2001 at 02:14:39AM +0100, Wichert Akkerman wrote:
> BTW, the current LVM tools violate the FHS by putting binaries in
> /sbin/lvm-*/. Would you accept a patch to move that to /lib/lvm-*/
> instead?

Erm.../lib/lvm-*/?  Really?  Hmm...guess I need to read the FHS.  Anyone got
a pointer to that?

I've been planning on putting the connectiva type wrapper scripts into the
mainline LVM src, but haven't had a chance yet.  This would make hard links=
 to
the wrapper script for all of the tools in /sbin, but the tools themselves
would be located in /lib/lvm-*/.  Would that violate the FHS?

More info on this would be very useful.

Thanks,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-379-3951
1313 5th St SE, Suite 111              Fax:    612-379-3952
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
Choose a job you love, and you will never have to work a day in your life.
-----End Obligatory Humorous Quote------------------------------------------

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6rawopE6/iGtdjLERAoWgAJ9XwbVzJwSm/4zNqcyvVvShJy5vNACaAtU8
vnV9wjD4lF4YE15nxNLM0ak=
=zVX7
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
