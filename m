Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0O0aUO13354
	for <linux-lvm@redhat.com>; Sun, 23 Jan 2005 19:36:30 -0500
Received: from bluebottle-fe4.bluebottle.com (bluebottle-fe4.bluebottle.com
	[67.107.78.248])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0O0aOp2007898
	for <linux-lvm@redhat.com>; Sun, 23 Jan 2005 19:36:24 -0500
Date: Mon, 24 Jan 2005 00:38:02 +0000
From: Robin Green <greenrd@greenrd.org>
Subject: Re: [linux-lvm] Reducing/Resizing LVM where "/" filesystem is
	included in the LVM
Message-ID: <20050124003802.GB23702@pob>
References: <1106517355.26963.213384700@webmail.messagingengine.com>
	<20050124002632.GA23702@pob>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Content-Disposition: inline
In-Reply-To: <20050124002632.GA23702@pob>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 24, 2005 at 12:26:32AM +0000, Robin Green wrote:
> On Sun, Jan 23, 2005 at 01:55:55PM -0800, fromkth+lvm@fastmail.fm wrote:
> > Now I want to free some space from the linux LVM(hda6) and create a
> > FAT32 partition as hda7.
> >=20
> > So how to reduce that LVM?
>=20
> I suggest you use qtparted. Basically you need to:
>=20
> 1. Resize /

Oh and of course, to do this, you must be running a separate copy of Linux
- like a live CD. Knoppix, for example, boots with usually no user interven=
tion
required, and contains qtparted and everything it needs.

--=20
Robin

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFB9ENqtPCt67UksSYRAu7eAKC/dfxrlBvP2jAdkQXv/HsPt9A7MgCfawTp
nK4nKTJK2sDL2i5PxK6sbww=
=y0h5
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--
