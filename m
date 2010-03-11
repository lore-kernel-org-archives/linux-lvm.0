Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2BEYdcv020677
	for <linux-lvm@redhat.com>; Thu, 11 Mar 2010 09:34:39 -0500
Received: from leuphana.de (triton-ge0.uni-lueneburg.de [193.174.46.71])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2BEYL4T007247
	for <linux-lvm@redhat.com>; Thu, 11 Mar 2010 09:34:22 -0500
Received: from [141.39.215.216] (account aolsowsk HELO LAP)
	by leuphana.de (CommuniGate Pro SMTP 5.3.3)
	with ESMTPSA id 28713368 for linux-lvm@redhat.com;
	Thu, 11 Mar 2010 15:34:19 +0100
Date: Thu, 11 Mar 2010 15:34:16 +0100
From: Andreas Olsowski <andreas.olsowski@uni.leuphana.de>
Message-Id: <20100311153416.e781cc16.andreas.olsowski@uni.leuphana.de>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Thu__11_Mar_2010_15_34_16_+0100_PZrg8xa7BS59UdTj"
Subject: [linux-lvm] Recommended method for LVM MirrorLog-Volume with 2
	iSCSI Arrays
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

--Signature=_Thu__11_Mar_2010_15_34_16_+0100_PZrg8xa7BS59UdTj
Content-Type: text/plain; charset=ISO-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

i have 2 iSCSI Arrays that i want to use as physical volumes in a volumegro=
up to use mirror logical volumes.
I have several XEN Servers that will use LVM as storage for the virtual mac=
hines.

After reading the Documentation (Logical_Volume_Manager_Administration.pdf =
and manpages) i am not certain what to do about the mirror-log.
I want the log to be as redundant as the data of the volume itself.
Do i have to create a memory-logged logical volume and use that as the devi=
ce for the disk mirror-log of the logical volume containing my data?

Any suggestions would be greatly appreciated.

With best regards

--=20
Andreas Olsowski <andreas.olsowski@uni.leuphana.de>
Leuphana Universit=E4t L=FCneburg
System- und Netzwerktechnik
Rechenzentrum, Geb 7, Raum 15
Scharnhorststr. 1
21335 L=FCneburg

Tel: ++49 4131 / 6771309

--Signature=_Thu__11_Mar_2010_15_34_16_+0100_PZrg8xa7BS59UdTj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (MingW32)

iQEcBAEBAgAGBQJLmP9oAAoJEJ7WowYEoSMoVQMH/1Vq7GUBw6UE8jBV0NTmY9Xg
VitsCj8/QlKf4g/4ewwVxn/dnBg/RXdtXTjH3iO72Gq141m/TgX7oGTPWZTiZ08+
KwvvjO/w0ThwUxxZDVM5I291t/2SYrR52vfIPVQAJctswT9qMSh9esecufUnRsiI
MvjZdm5Lb6Oe+G+a13Dye/NZGrsSAJ3OJNZp8raVQ7fCvknu1xSaD9WXzK+YWETX
TpQ+UBlE+eDMNw1p8giyPLzWAGMfCdGIzZTGV/+a1dB+SO88/ljvtmwLokkbeSbu
i+LEbJl2g9UCuWlmmZHo4MEXxrb0fpXpEnf9n+G+ouhbOCqAt0vi5X9GYdq+bRs=
=wSLO
-----END PGP SIGNATURE-----

--Signature=_Thu__11_Mar_2010_15_34_16_+0100_PZrg8xa7BS59UdTj--
