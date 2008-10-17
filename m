Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9HIpcI6022407
	for <linux-lvm@redhat.com>; Fri, 17 Oct 2008 14:51:38 -0400
Received: from server.klug.on.ca (server.klug.on.ca [205.189.48.131])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9HIpQ1E030188
	for <linux-lvm@redhat.com>; Fri, 17 Oct 2008 14:51:26 -0400
Received: from linux.interlinx.bc.ca (d193-213-184.home3.cgocable.net
	[67.193.213.184])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server.klug.on.ca (Postfix) with ESMTP id 84ED72805
	for <linux-lvm@redhat.com>; Fri, 17 Oct 2008 14:51:25 -0400 (EDT)
Received: from [10.75.22.1] (pc.ilinx [10.75.22.1])
	by linux.interlinx.bc.ca (Postfix) with ESMTP id CFB8C875B
	for <linux-lvm@redhat.com>; Fri, 17 Oct 2008 14:51:23 -0400 (EDT)
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Jub6IpAse7A+a80XgJFf"
Date: Fri, 17 Oct 2008 14:51:23 -0400
Message-Id: <1224269483.17821.39.camel@pc.ilinx>
Mime-Version: 1.0
Subject: [linux-lvm] dmraid - where is the raid done?
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


--=-Jub6IpAse7A+a80XgJFf
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I think this is the right place for dmraid questions.  Please redirect
me if it's not.  Thanx.

I understand that dmraid is just some kind of interface to the
_software_ raid that is provided on a number of SATA interface cards
such as the Promise and Adaptec cards.

Reading http://ata.wiki.kernel.org/index.php/SATA_RAID_FAQ I get the
message loud and clear that this is not real hardware RAID but rather
it's done in the BIOS on the card.

The message there seems to be, if you are going to do it in software
anyway, why not just skip the IO card RAID and just use MD?

The one reason I could think of for using the BIOS provided RAID would
be to reduce the data needing to traverse the PCI bus.  With host-raid
(i.e. MD) every write to disk needs to actually be written over the PCI
bus twice, once for each disk, right?

But do the BIOS RAID cards out there only need the write command and
data once and they do the work of writing it to the two disks on-board
the IO card?

b.


--=-Jub6IpAse7A+a80XgJFf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkj43qsACgkQl3EQlGLyuXDFvQCeL8xAt26iLVywXIeSx0TQDGxW
oQoAoIFa3Qq17KKUe66JdNFYjBGnbboL
=kdd2
-----END PGP SIGNATURE-----

--=-Jub6IpAse7A+a80XgJFf--
