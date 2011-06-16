Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p5GJWWjn015346
	for <linux-lvm@redhat.com>; Thu, 16 Jun 2011 15:32:32 -0400
Received: from wombat.san-francisco.ca.us (wombat.san-francisco.ca.us
	[75.101.60.64])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p5GJWVa2003932
	for <linux-lvm@redhat.com>; Thu, 16 Jun 2011 15:32:31 -0400
Date: Thu, 16 Jun 2011 12:32:30 -0700
From: Keith Keller <kkeller@wombat.san-francisco.ca.us>
Message-ID: <20110616193230.GA7267@wombat.san-francisco.ca.us>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
Subject: [linux-lvm] removing a disk prematurely
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

I have been looking everywhere for a good answer to this issue, with no
success (including searching this list's archives); I hope that coming
directly to the source will help.

I made a mistake in removing physical media from a hot-swap drive bay
before telling LVM I was going to remove it.  I don't actually care
about the data on those disks at all--it was an old test volume that I
hadn't even had mounted for over a year.  But now, when I do any lvm
commands, I get an error like so:

# pvdisplay=20
  /dev/testVG/testLV: read failed after 0 of 4096 at 0: Input/output error

and an error like this in the logs:

scsi 1:0:2:0: rejecting I/O to dead device

What would be the cleanest, most official way to clear this error?  I
have read a lot about vgreduce --removemissing, which seems like it
should work, but I am (perhaps overly) paranoid about messing up other
existing and currently working LVM volumes.

If you need any other information, please let me know, either on or off
list.  Thanks!

--keith

--=20
kkeller@wombat.san-francisco.ca.us


--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAk36Wk4ACgkQhVcNCxZ5ID/0LwCfbUGklvd3xbPtailPRm8PF95y
KSoAn3rEmfJNm/MauFyzX5os9apQrtXz
=Ej3d
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
