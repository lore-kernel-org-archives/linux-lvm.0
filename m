Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3RCB2v20404
	for <linux-lvm@redhat.com>; Tue, 27 Apr 2004 08:11:02 -0400
Received: from mwinf0401.wanadoo.fr (smtp4.wanadoo.fr [193.252.22.27])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i3RCB0KG029216
	for <linux-lvm@redhat.com>; Tue, 27 Apr 2004 08:11:00 -0400
Received: from tangerine.coulon.evette
	(ADijon-107-1-13-223.w81-250.abo.wanadoo.fr [81.250.94.223])
	by mwinf0401.wanadoo.fr (SMTP Server) with ESMTP id C146B5800794
	for <linux-lvm@redhat.com>; Tue, 27 Apr 2004 14:10:54 +0200 (CEST)
Received: from localhost ([127.0.0.1])
	by tangerine.coulon.evette with esmtp (Exim 4.32) id 1BIRQM-0002zp-2F
	for linux-lvm@redhat.com; Tue, 27 Apr 2004 14:10:54 +0200
Received: from tangerine.coulon.evette ([127.0.0.1])
	by localhost (tangerine [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11483-01 for <linux-lvm@redhat.com>;
	Tue, 27 Apr 2004 14:10:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=tangerine)
	by tangerine.coulon.evette with esmtp (Exim 4.32) id 1BIRQ2-0002za-Sw
	for linux-lvm@redhat.com; Tue, 27 Apr 2004 14:10:34 +0200
Date: Tue, 27 Apr 2004 14:10:34 +0200
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: Re: [linux-lvm] About extending partiton with lvm+ext3
Message-ID: <20040427121034.GG2990@tangerine.coulon.evette>
References: <200404261903.i3QJ3HTk030443@smtp.doruk.net.tr>
	<20040426222921.GB16292@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="MIdTMoZhcV1D07fI"
Content-Disposition: inline
In-Reply-To: <20040426222921.GB16292@redhat.com> (from mauelshagen@redhat.com
	on mar, avr 27, 2004 at 00:29:21 +0200)
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


--MIdTMoZhcV1D07fI
Content-Type: text/plain; Format=Flowed; DelSp=Yes; charset=ISO-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 27.04.2004 00:29:21, Heinz Mauelshagen a =E9crit=A0:
> On Mon, Apr 26, 2004 at 09:59:54PM +0300, Vahric MUHTARYAN wrote:
> > Hi Everybody ,
> >
> > I'm reading lvm-how to and I wonder those any tools like e2fsadm ,
> > ext2resize ?!! in Redhat ... Because I want to exten ext3
> >
> > Does command for only ext2 ?!
>=20
> Yes.

You can resize an ext3 filesystem with the resize2fs command. Both =20
enlarge or shrink it.
But : this is allowed only on an *offline* (umounted) filsystem, =20
resize2fs doesnt take care of the underlaying partition, you have to =20
enlarge the partition (logical volume) before an enlarge operation or =20
shrink it after a shrink operation.

man 8 resize2fs

<<
RESIZE2FS(8)

NAME
       resize2fs - ext2/ext3 file system resizer

[ ... ]
>>

Do the operation as following:
-unmount the logical volume holding the filesystem you want to enlarge
-lvwextend to enlarge the partition
-resize2fs to enlarge the filesystem
-remount the logical volume

--
		- Jean-Luc
>=20
> >
> > # export E2FSADM_RESIZE_CMD=3Dext2resize
> > # e2fsadm /dev/ops/batch -L+500M
> >
> > Thanks Everybody ...
> > Vahric
>=20
> --
>=20
> Regards,
> Heinz    -- The LVM Guy --
>=20

--MIdTMoZhcV1D07fI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBAjk26UdGGXzzGnNARAiktAKCVZvZraJ2M5fS5wGR7ARYl84S3/ACdFebm
vRaDQaXiqHHRtIbE9/nLAcc=
=Fr4Y
-----END PGP SIGNATURE-----

--MIdTMoZhcV1D07fI--
