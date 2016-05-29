Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4TGoKYv028062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sun, 29 May 2016 12:50:20 -0400
Received: from cdptpa-oedge-vip.email.rr.com
	(cdptpa-outbound-snat.email.rr.com [107.14.166.229])
	by mx1.redhat.com (Postfix) with ESMTP id 455C06331E
	for <linux-lvm@redhat.com>; Sun, 29 May 2016 16:50:19 +0000 (UTC)
From: Phillip Susi <psusi@ubuntu.com>
Message-ID: <574B1DC9.2090700@ubuntu.com>
Date: Sun, 29 May 2016 12:50:17 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM says physical volumes are missing, but they are not
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

I upgraded last night to Ubuntu 16.04, and LVM has ( even when booting
back into 15.10 ) decided that two of my three physical volumes are
missing, but they are not:

psusi@faldara:~$ sudo pvs
  PV         VG      Fmt  Attr PSize   PFree
  /dev/md0   faldara lvm2 a-m  101.91g  58.91g
  /dev/md1   faldara lvm2 a-m    1.69t 264.86g
  /dev/sdb1  faldara lvm2 a--    1.82t   1.81t
psusi@faldara:~$ sudo vgchange -ay
  Refusing activation of partial LV faldara/Music.  Use
'--activationmode partial' to override.
  Refusing activation of partial LV faldara/Videos.  Use
'--activationmode partial' to override.
  Refusing activation of partial LV faldara/swap.  Use
'--activationmode partial' to override.
  Refusing activation of partial LV faldara/trusty-old.  Use
'--activationmode partial' to override.
  Refusing activation of partial LV faldara/vivid.  Use
'--activationmode partial' to override.
  Refusing activation of partial LV faldara/pool0.  Use
'--activationmode partial' to override.
  Refusing activation of partial LV faldara/xenial.  Use
'--activationmode partial' to override.
  6 logical volume(s) in volume group "faldara" now active

If I use --activationmode partial, then all volumes are correctly
mapped, with no missing extents:

psusi@faldara:~$ sudo dmsetup table faldara-vivid
0 44040192 linear 9:1 2468358144
44040192 24969216 linear 9:1 2996840448
69009408 14876672 linear 8:17 2048
psusi@faldara:~$ sudo dmsetup table faldara-xenial
0 83886080 linear 9:0 98304

How can it claim the pvs are missing, and then go ahead and use them?
 Is there a way to manually clear the missing flag from the pv?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCgAGBQJXSx3JAAoJEBB5UWFcu6UWR2kIAKZIGGP3cM09FZqgtkj9VweH
upjc6Sw79jrPBVDbaZQICoFM5rrqra3ehWRge3nKNIZ78QRW9jKJoz9H1MJtFtCd
npfE4s/0URL/UTjChHzV4VR4RHU5bg8NzfeQjyb89k+yTPw6I0zEbmDDlk0H5LCD
9Uho3WILFHrrYE9C/PE1Kb7qx5y9gp/64PYEkRXsVKvvfOq6BPKLlMyjpplVYuxV
wZ7sLpwzOkC2iqex/OleqaiOPrroH2vasVwWtuHBpxFe4z1JsXTHdSSJ8HtrEdii
JnX9ff9fygl7OsOyldSkIZhfuYyPBXmae1qQwLa8SJyurnUE9vE18JFqZFHTGhg=
=Fn0J
-----END PGP SIGNATURE-----
