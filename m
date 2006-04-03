Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k33Dlu7d029571
	for <linux-lvm@redhat.com>; Mon, 3 Apr 2006 09:47:56 -0400
Received: from lug-owl.de (lug-owl.de [195.71.106.12])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k33Dltfx011431
	for <linux-lvm@redhat.com>; Mon, 3 Apr 2006 09:47:55 -0400
Date: Mon, 3 Apr 2006 15:47:54 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: [linux-lvm] LVM NOT scary!
Message-ID: <20060403134754.GV1259@lug-owl.de>
References: <443115F0.8030503@watford53.freeserve.co.uk>
	<20060403124112.GP19029@fencepost>
	<20060403124601.GR1259@lug-owl.de>
	<443125FE.9020501@watford53.freeserve.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O3bhLwMadv7h6/J9"
Content-Disposition: inline
In-Reply-To: <443125FE.9020501@watford53.freeserve.co.uk>
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


--O3bhLwMadv7h6/J9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2006-04-03 14:41:18 +0100, Jim Ford <jaford@watford53.freeserve.co.=
uk> wrote:
> Jan-Benedict Glaw wrote:
> >Full ACK. The most scary cases are those where people expect to get
> >
> >high-availability by LVM'ing some IDE disks together.
> >
> >Hey, LVM on MD really is a nice thing, even dm-crypt ontop, works
> >flawlessly :)
> What, you mean Mini Disk - the little magneto optical disks used for=20
> personal audio players? What's the advantage in that, aren't they only=20
> about a 1 gig storage?

No, Linux' MultiDisk stuff was ment (SoftRAID). You take a bunch of
HDDs, put it to different controllers and configure those *carefully*
after *thinking* to show up as a RAID device. Then you can use LVM
(again, after careful thinking) with these.

MfG, JBG

--=20
Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481             =
_ O _
"Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg  =
_ _ O
 f=C3=BCr einen Freien Staat voll Freier B=C3=BCrger"  | im Internet! |   i=
m Irak!   O O O
ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA)=
);

--O3bhLwMadv7h6/J9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFEMSeKHb1edYOZ4bsRAl5kAKCRZsxnXiOleRrzEJX2CxNwAf7VIgCfZpST
Rhcu3NRPIUCDLDqa/Efs9E4=
=nSLz
-----END PGP SIGNATURE-----

--O3bhLwMadv7h6/J9--
