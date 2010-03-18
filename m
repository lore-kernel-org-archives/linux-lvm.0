Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2IFG2bg020650
	for <linux-lvm@redhat.com>; Thu, 18 Mar 2010 11:16:02 -0400
Received: from leuphana.de (triton-ge0.uni-lueneburg.de [193.174.46.71])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2IFFofu009809
	for <linux-lvm@redhat.com>; Thu, 18 Mar 2010 11:15:51 -0400
Received: from [141.39.215.216] (account aolsowsk HELO LAP)
	by leuphana.de (CommuniGate Pro SMTP 5.3.3)
	with ESMTPSA id 28917122 for linux-lvm@redhat.com;
	Thu, 18 Mar 2010 16:15:48 +0100
Date: Thu, 18 Mar 2010 16:15:44 +0100
From: Andreas Olsowski <andreas.olsowski@uni.leuphana.de>
Message-Id: <20100318161544.5aa9eb30.andreas.olsowski@uni.leuphana.de>
In-Reply-To: <4A2CF3C24E05B348A46BAF5A7C4593D406F874F1@BTCMVEXC1-PRD.hq.netapp.com>
References: <4A2CF3C24E05B348A46BAF5A7C4593D406F874F1@BTCMVEXC1-PRD.hq.netapp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Thu__18_Mar_2010_16_15_44_+0100_GHQ4dv_Ix+41=vOl"
Subject: Re: [linux-lvm] how to change the volume group name of the attached
 backup
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

--Signature=_Thu__18_Mar_2010_16_15_44_+0100_GHQ4dv_Ix+41=vOl
Content-Type: text/plain; charset=ISO-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> But I cant mount /dev/sdb as it is on LVM. As both are having same VG
> NAME I can't even mount logical volume.
try:
vgextend NAME /dev/sdb



--=20
Andreas Olsowski <andreas.olsowski@uni.leuphana.de>
Leuphana Universit=E4t L=FCneburg
System- und Netzwerktechnik
Rechenzentrum, Geb 7, Raum 15
Scharnhorststr. 1
21335 L=FCneburg

Tel: ++49 4131 / 6771309

--Signature=_Thu__18_Mar_2010_16_15_44_+0100_GHQ4dv_Ix+41=vOl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (MingW32)

iQEcBAEBAgAGBQJLokOgAAoJEJ7WowYEoSMo3GMH/iuTvFW8EW8qoBeQHzBR+g09
SorMWERAMr9hr2ik57P05yw6InKFdliKeGcMPgeo+u2Gd1a1lHag6hd1Pj4K9PkB
soSTBMWa27uWncLGMUoRV/KkNyuV5OE1OKueQWU2UC1T9W+AD/io6hd3rwu9CBkz
UHG3mDtBzhwpt62AT4H5exsP8kovVjolrJxTcG1F+nFblevvYoJUF3EV7+zhFRPz
jdos38l8RRSuhGVfxlSyITJHy/0gCtAvqDocvspCSp+Fg/neg2Ki5mkAsLrFB7xI
2O1zbZnU5ZeD/o545xOT/viAuwRZmH7RnxkjxRf+ZNAXBgsADr+/HFTjlWXHtUA=
=a7mC
-----END PGP SIGNATURE-----

--Signature=_Thu__18_Mar_2010_16_15_44_+0100_GHQ4dv_Ix+41=vOl--
