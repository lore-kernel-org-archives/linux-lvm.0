Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l87CDKgo020987
	for <linux-lvm@redhat.com>; Fri, 7 Sep 2007 08:13:20 -0400
Received: from christel.heitec.net (christel.heitec.net [62.206.253.11])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l87CDC2K024609
	for <linux-lvm@redhat.com>; Fri, 7 Sep 2007 08:13:13 -0400
Received: from prag.er.heitec.net (paladin.heitec.net [62.206.253.14])
	by christel.heitec.net (Postfix) with ESMTP id B0F7FA893E
	for <linux-lvm@redhat.com>; Fri,  7 Sep 2007 14:13:06 +0200 (CEST)
Date: Fri, 7 Sep 2007 14:13:07 +0200
From: Holger Rauch <holger.rauch@heitec.de>
Message-ID: <20070907121306.GA27457@heitec.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
Subject: [linux-lvm] Question on duplicating equally-sized HDs with dd and
	changing VG name and PV UUIDs
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
To: linux-lvm@redhat.com


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline

Hi,

I got a machine having two HDs of the same size (250 GB each), devices
/dev/sda and /dev/sdb. /dev/sda contains VG rootvg which in turn contains
several LVs. VG rootvg consists of one PV, /dev/sda5. All this was set up
using LVM2.

I want to have the same HD partition/VG/LV layout on /dev/sdb with the
following differences:

- A different VG name: backupvg instead of rootvg
- A different UUID for PV /dev/sdb5 (since that's supposed to be the underlying
  PV for VG backupvg)

Purpose of that setup is to be able to easily copy filesystem contents
between filesystems located on LVs of the same name but in different VGs.
(Apart from that, the filesystems are of the same type and size).

I looked at the LVM2 FAQ, the LVM HOWTO and googled but unfortunately
there seems to be no HOWTO for this task (which still seems somewhat
common to me since many PCs these days contain 2 equally-sized HDs).

I know that

dd if=/dev/sda of=/dev/sdb

is going to give me the same partition layout but what LVM commands can I
use for the following tasks (provided that the newly created VG is not
online yet):

- Generating a new UUID and assigning that to PV /dev/sdb5
- Renaming a VG while it's offline. Does vgrename support this?
- "Telling" the renamed VG about the fact that /dev/sdb5 has got a new UUID
  but still it's supposed to be used as the underlying PV for VG backupvg

I also know that LVM2 metadata resides in /etc/lvm but I don't feel
confident playing around there without having additional information
(provided this is the right place to look at for the above mentioned tasks).

Thanks in advance for any hints, links, etc.

In case there are any additional questions, please feel free to ask.

Kind regards,

	Holger

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFG4UBSbiVtWpZdKQIRApgXAJsG6i3YTB3QEn3zFrrtIHl0T0k7KgCgk9Ey
TTVuiq5wqFC3qq7k1U0bh+Q=
=xP6a
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
