Return-Path: <lewis@sistina.com>
From: lewis@sistina.com
Date: Thu, 14 Dec 2000 09:24:57 -0600
Message-ID: <20001214092457.A14120@sistina.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
Subject: [linux-lvm] [russell@coker.com.au: Re: lvm - I'll maintain it. - ITP lvm24]
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
To: lvm-devel@sistina.com, linux-lvm@sistina.com

--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This from the debian devel list.  Is this a known issue with LVM 0.8.1?  I
haven't heard mention of it before.

----- Forwarded message from Russell Coker <russell@coker.com.au> -----

Delivered-To: lewis@sistina.com
From: Russell Coker <russell@coker.com.au>
Reply-To: Russell Coker <russell@coker.com.au>
To: lewis@sistina.com, debian-devel@lists.debian.org
Subject: Re: lvm - I'll maintain it. - ITP lvm24
Date: Thu, 14 Dec 2000 14:05:03 +0100
X-Mailer: KMail [version 1.1.99]
In-Reply-To: <20001213100137.A7828@sistina.com>

On 2000-12-13 17:01, lewis@sistina.com wrote:
>> OK.  I'll create a new package named lvm24 which conflicts with lvm and
>> provides lvm.
>
>Umm...AFAIK, joe is still working on an LVM 0.9 package.
>
>BTW, What is this lvm24 you are talking about?  Have you seen that LVM 0.8=
.1
>and 0.9 are out now?

Naming the packages after the protocol would be a good idea if the protocol=
=20
numbers were known.  With raidtools/raidtools2 there is little confusion. =
=20
Naming a package lvm6 would not make things easier (even I am not sure yet=
=20
which version is which!).

I have packages of 0.8.1 and 0.9 under development.  0.9 seems to be for a=
=20
newer version of lvm than is in the 2.4.0-test10 kernel.

0.8.1 doesn't work correctly, it does not automatically update /etc/lvmtab.=
d=20
or create backups of the configuration which seems to be necessary.  I am=
=20
still playing with it.
Also lvm doesn't seem to be designed to work with devfs, I use devfs=20
exclusively so I'll try and get it going for devfs and for old style /dev.

Any input from other Debian or offers to test this would be appreciated.

--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page

----- End forwarded message -----

--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-379-3951
1313 5th St SE, Suite 111              Fax:    612-379-3952
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648

Quitters never win, and winners never quit,
but those who never quit AND never win are idiots.

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6OOZJpE6/iGtdjLERArGhAKCDxgKj5DGW4HLplS8UqMtIDAAy9QCglnFP
5PwUOj5+rkOEcLGVCIXgEE4=
=g2z1
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
