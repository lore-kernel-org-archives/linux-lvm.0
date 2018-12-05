Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B0B1183D1
	for <linux-lvm@redhat.com>; Wed,  5 Dec 2018 06:20:01 +0000 (UTC)
Received: from mail.chelmska.waw.pl (mail.chelmska.waw.pl [80.55.22.106])
	by mx1.redhat.com (Postfix) with ESMTP id 6558D2553
	for <linux-lvm@redhat.com>; Wed,  5 Dec 2018 06:19:49 +0000 (UTC)
Date: Wed, 5 Dec 2018 07:19:38 +0100
From: Marcin Wolcendorf <antymat+redhat@chelmska.waw.pl>
Message-ID: <20181205061938.vbkwk6ydnehacxml@chelmska.waw.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4mlv4s5qeyxp6fir"
Content-Disposition: inline
Subject: [linux-lvm] lvmcache writethrough synchronisation at system startup
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


--4mlv4s5qeyxp6fir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Everyone,

Recently I have set up a simple lvmcache on my machine. This is a write-thr=
ough
cache, so in my view it should never be necessary to copy data from the
cachepool to the origin LV. But this is exactly what happens: on system sta=
rt
the=20

lvs -o+cache_policy,cache_settings,cache_mode

displays something like:
  LV     VG   Attr       LSize   Pool     Origin       Data%  Meta%  Move L=
og Cpy%Sync Convert CachePolicy CacheSettings CacheMode  =20
  home   main Cwi-aoC---  21.83t [cache1] [home_corig] 99.99  0.55         =
   90.39            smq                       writethrough

and for a next day or two it writes the whole cachepool to the origin. The =
data
on the cached LV seems fine as long as sha512 is concerned.=20

Is this supposed to be that way?

My setup:
I have 2 mdraid devices: one 24T raid6, one 1T raid1, and one separate SSD.=
 All
are LUKS-encrypted, SSD is partitioned into MBR boot partition, encrypted /=
boot
partition and a big encrypted partition for a PV. The encrypted block devic=
es
(except /boot) are PVs in my VG. The 24T RAID holds the origin LV, the 1T R=
AID
is made into a cachepool.

BR,
M.W.

--=20
On a paper submitted by a physicist colleague:

"This isn't right.  This isn't even wrong."
		-- Wolfgang Pauli

--4mlv4s5qeyxp6fir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEc1aVXvdCiZL/i+MRsxZ5Hnq8h/cFAlwHbeAACgkQsxZ5Hnq8
h/dNOQ//azhhKkHidZs+M7a4O5Yziiu7BgR+z6KJnVhyuiYoITJg9uk+i0Xdy7Bt
SdDk1WLJMOyhjXNlPE3wEsTEWdA6FUTS4thmBK2HybNe1mCdIcY6q4+VnXLREkLg
uBzH7MMIRZBcF7ATNdmiaPn9avnPAXLePSFP8CKUwIHHl7vMeVzBjz+QHjlg/vBG
umNJE+4+HnbYb5n3yUGy75RXWJt48eN5csQDgDp0XkmdcHe2i6xdKsafiUAuG5cz
3pyHYYw4Wj5Ng20yGcc0kyGdtxJk3d3n7O2aRcFXtc8qV+LIaZRsqfTXxdplqAV0
cBwyqE4oLgEdCFtM2wDn8ybcM3YQpWNjHLPMBNYefu0ofN03POb+63fxld8Ans90
6aA6d/eShs7IyvgfTuJSVwbu5pTcBXdinliYiZwGk3/zAEjE76W7VQMY/Z4oumVe
2IOiFlARsuzqjWjU9a23eQoC1jxuQhqncUVkRNxnA1fZxzUuRXxUS/awdWO4dJFa
cB4ZyZ4Z4aRU7a1NudF9krfi00MNJF6ZIqU2YWsHnmMqmXD4+VqqSxgrgd9WKdqB
+xsAMBm2FENq8xuqYWt7VRZO9/sY8LTIsQYvPCCN1j8gf732OShwEuP29JF11G92
pH9+vrKQgqq2Z18WlfKT/UvNGEOrepexpTxyfj3PUk32uLij2yk=
=PTLe
-----END PGP SIGNATURE-----

--4mlv4s5qeyxp6fir--
