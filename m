Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5LKFH024342
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2004 16:15:17 -0400
Received: from mwinf0801.wanadoo.fr (smtp8.wanadoo.fr [193.252.22.23])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i5LKFBXn028647
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2004 16:15:11 -0400
Received: from tangerine.coulon.evette
	(ADijon-107-1-25-174.w80-13.abo.wanadoo.fr [80.13.95.174])
	by mwinf0801.wanadoo.fr (SMTP Server) with ESMTP id 4B29A1800405
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2004 22:15:03 +0200 (CEST)
Received: from localhost ([127.0.0.1])
	by tangerine.coulon.evette with esmtp (Exim 4.34) id 1BcVBx-0001Y8-Lc
	for linux-lvm@redhat.com; Mon, 21 Jun 2004 22:14:57 +0200
Received: from tangerine.coulon.evette ([127.0.0.1])
	by localhost (tangerine [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03001-06 for <linux-lvm@redhat.com>;
	Mon, 21 Jun 2004 22:14:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=tangerine)
	by tangerine.coulon.evette with esmtp (Exim 4.34) id 1BcVBv-0001Y2-NH
	for linux-lvm@redhat.com; Mon, 21 Jun 2004 22:14:55 +0200
Date: Mon, 21 Jun 2004 22:14:55 +0200
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: Re: [linux-lvm] Failed to boot 2.6.6 with root on lvm
Message-ID: <20040621201455.GE5167@tangerine.coulon.evette>
References: <20040620171255.GA2783@tangerine.coulon.evette>
	<1087834832.5261.42.camel@tesla.mmt.bellhowell.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="PuGuTyElPB9bOcsM"
Content-Disposition: inline
In-Reply-To: <1087834832.5261.42.camel@tesla.mmt.bellhowell.com> (from
	jtlayton@poochiereds.net on lun, jun 21, 2004 at 18:20:33 +0200)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--PuGuTyElPB9bOcsM
Content-Type: text/plain; Format=Flowed; DelSp=Yes; charset=ISO-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jeff,

Le 21.06.2004 18:20:33, Jeffrey Layton a =E9crit=A0:
> On Sun, 2004-06-20 at 13:12, Jean-Luc Coulon (f5ibh) wrote:
>=20
> > If I tell grub:
> > root=3D/dev/ram0 lvm2root=3D/dev/vg00/root_lv I get the following
> messages
> > at boot :
> > [ ... ]
> > device-mapper: 4.1.0-ioct (2003-12-10) initialised:
> dm@uk.syistina.com
> > [ ... ]
> > VFS cannot open root device "ram0" or unknown-block (0,0)
> > Please apped a correct "root=3D" boot option
>=20
> Do you have an appropriate initrd line in the GRUB stanza? Also, do
> you
> have initrd support built into your kernel?

I had the appropriate initrd line but I forgot initrd int he kernel =20
configuration (I had setup the ram device but as a module so he didnt =20
ask me for the initrd).

Thank you for pointing me where was the problem.

2.6.6 is working fine (for the moment) on my lvm system.

--
	Jean-Luc
> -- Jeff
>=20

--PuGuTyElPB9bOcsM
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBA10G/UdGGXzzGnNARAtFAAJ9lnjlgtZBeZPdGAEbOkuyKULffcQCfeeyB
4EkmRpF+XQJLuwHoL5Z0SP4=
=YIq9
-----END PGP SIGNATURE-----

--PuGuTyElPB9bOcsM--
