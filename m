Return-Path: <chewie@wookimus.net>
Date: Thu, 8 Feb 2001 11:00:44 -0600
From: "Chad C. Walstrom" <chewie@wookimus.net>
Subject: Re: [linux-lvm] debianized lvm 0.9.1b3 package
Message-ID: <20010208110044.C5273@wookimus.net>
References: <20010207110140.H22166@sistina.com> <Pine.LNX.4.32.0102081004230.4021-100000@falka.mfa.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vEao7xgI/oilGqZ+"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.32.0102081004230.4021-100000@falka.mfa.kfki.hu>; from dice@mfa.kfki.hu on Thu, Feb 08, 2001 at 10:08:01AM +0100
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

--vEao7xgI/oilGqZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 08, 2001 at 10:08:01AM +0100, Gergely Tamas wrote:
> Hi!
>=20
> I've debianized the lvm 0.9.1b3 sources based on your 0.9 packages.
>=20
> http://dice.mfa.kfki.hu/download/lvm/

There's been a lot of work going on this lately.  You should really
try to download Tom Lees' <tom@debian.org> packages[1] and upgrade
from there.  AJ's packages install the binaries and libraries under
the /usr directories, which is a Bad Thing(TM).  (I didn't catch this
when I did an apt-get upgrade and installed AJ's packages.  I added
beta3 to the Kernel and rebooted, to find my system couldn't boot!
Why?  My /usr directory was on, you guessed it, an LVM Logical Volume.
*grin*)  AJ reported to me that his next version of debian packages
will come out when they have library naming resolved, and he will roll
in the features found in Tom's packages.  Tom is still the active
(yes, he's active), developer for the Debian packages.

If you would like packages based off Tom's packages, point your
'apt-get source lvm10' to[2]:

    deb-src http://www.wookimus.net/debian ./

You should manually download Tom's 'lvm-common' package that contains
the init.d script and other common configurations for all versions of
lvm.[3]

FOOTNOTES
---------
1.  Tom Lees' Debian packages: http://tal26.joh.cam.ac.uk/files/debian/
2.  I did not make the i386 binary apt-get'able for a reason.  I want
    you to realize that I make no guarantees on the package.  You can
    still manually download the package, but I'd prefer to disable the
    unattended upgrades you can achieve with 'apt-get upgrade', with
    respect to the lvm binaries.  On the other hand, the source should
    be apt-get'able.
3.  It seems that I have taken my preference not to enable
    apt-get'able lvm binaries from Tom's lead, whether intentional or
    not.  ;-)=20
   =20
--=20
Chad Walstrom <chewie@wookimus.net>                 | a.k.a. ^chewie
http://www.wookimus.net/                            | s.k.a. gunnarr
Key fingerprint =3D B4AB D627 9CBD 687E 7A31  1950 0CC7 0B18 206C 5AFD


--vEao7xgI/oilGqZ+
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6gtC8DMcLGCBsWv0RAtFiAJ9tLsrMHxINktu864U4N9Z0RNXrVACbBEQq
wMtw1URbaBh1KqYzZStsco4=
=k3a5
-----END PGP SIGNATURE-----

--vEao7xgI/oilGqZ+--
