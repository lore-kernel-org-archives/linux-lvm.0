Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81B031001DD8
	for <linux-lvm@redhat.com>; Mon,  7 Oct 2019 16:25:22 +0000 (UTC)
Received: from sonic304-22.consmr.mail.ir2.yahoo.com
	(sonic304-22.consmr.mail.ir2.yahoo.com [77.238.179.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7EA514FCD9
	for <linux-lvm@redhat.com>; Mon,  7 Oct 2019 16:25:20 +0000 (UTC)
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <8d1e7b13-eeec-18c0-592b-564dc5740636@yahoo.co.uk>
Date: Mon, 7 Oct 2019 17:25:15 +0100
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------DE48E623D59168A0EA7FDCBF"
Content-Language: en-US
Subject: [linux-lvm] recovery of a VG - how?
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------DE48E623D59168A0EA7FDCBF
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

hi guys

I have a VG which I try to restore:

$ vgcfgrestore --file /etc/lvm/archive/chenbro0.0_00308-2121179640.vg
chenbro0.0
=C2=A0 /dev/mapper/chenbro_a: Checksum error at offset 428544
=C2=A0 Couldn't read volume group metadata from /dev/mapper/chenbro_a.
=C2=A0 Metadata location on /dev/mapper/chenbro_a at 428544 has invalid
summary for VG.
=C2=A0 Failed to read metadata summary from /dev/mapper/chenbro_a
=C2=A0 Failed to scan VG from /dev/mapper/chenbro_a
=C2=A0 /dev/mapper/chenbro_e: Checksum error at offset 422912
=C2=A0 Couldn't read volume group metadata from /dev/mapper/chenbro_e.
=C2=A0 Metadata location on /dev/mapper/chenbro_e at 422912 has invalid
summary for VG.
=C2=A0 Failed to read metadata summary from /dev/mapper/chenbro_e
=C2=A0 Failed to scan VG from /dev/mapper/chenbro_e
=C2=A0 /dev/mapper/chenbro_m: Checksum error at offset 422912
=C2=A0 Couldn't read volume group metadata from /dev/mapper/chenbro_m.
=C2=A0 Metadata location on /dev/mapper/chenbro_m at 422912 has invalid
summary for VG.
=C2=A0 Failed to read metadata summary from /dev/mapper/chenbro_m
=C2=A0 Failed to scan VG from /dev/mapper/chenbro_m
=C2=A0 Scan of VG chenbro0.0 from /dev/mapper/chenbro_p found mda_checksu=
m
a6dbb1e8 mda_size 5723 vs previous c6a5d174 5727
=C2=A0 /dev/mapper/chenbro_s: Checksum error at offset 422912
=C2=A0 Couldn't read volume group metadata from /dev/mapper/chenbro_s.
=C2=A0 Metadata location on /dev/mapper/chenbro_s at 422912 has invalid
summary for VG.
=C2=A0 Failed to read metadata summary from /dev/mapper/chenbro_s
=C2=A0 Failed to scan VG from /dev/mapper/chenbro_s
=C2=A0 /dev/mapper/chenbro_v: Checksum error at offset 422912
=C2=A0 Couldn't read volume group metadata from /dev/mapper/chenbro_v.
=C2=A0 Metadata location on /dev/mapper/chenbro_v at 422912 has invalid
summary for VG.
=C2=A0 Failed to read metadata summary from /dev/mapper/chenbro_v
=C2=A0 Failed to scan VG from /dev/mapper/chenbro_v
=C2=A0 Scan of VG chenbro0.0 from /dev/mapper/chenbro_w found mda_checksu=
m
a6dbb1e8 mda_size 5723 vs previous c6a5d174 5727
=C2=A0 /dev/mapper/chenbro_y: Checksum error at offset 422912
=C2=A0 Couldn't read volume group metadata from /dev/mapper/chenbro_y.
=C2=A0 Metadata location on /dev/mapper/chenbro_y at 422912 has invalid
summary for VG.
=C2=A0 Failed to read metadata summary from /dev/mapper/chenbro_y
=C2=A0 Failed to scan VG from /dev/mapper/chenbro_y
=C2=A0 Scan of VG chenbro0.0 from /dev/mapper/chenbro_z found mda_checksu=
m
a6dbb1e8 mda_size 5723 vs previous c6a5d174 5727
=C2=A0 Scan of VG chenbro0.0 from /dev/mapper/chenbro_aa found mda_checks=
um
a6dbb1e8 mda_size 5723 vs previous c6a5d174 5727
=C2=A0 /dev/mapper/chenbro_ab: Checksum error at offset 422912
=C2=A0 Couldn't read volume group metadata from /dev/mapper/chenbro_ab.
=C2=A0 Metadata location on /dev/mapper/chenbro_ab at 422912 has invalid
summary for VG.
=C2=A0 Failed to read metadata summary from /dev/mapper/chenbro_ab
=C2=A0 Failed to scan VG from /dev/mapper/chenbro_ab
=C2=A0 Couldn't find device with uuid 3UQeFN-hOMe-nwi9-Ld1D-0bNH-JSvO-EaP=
clH.
=C2=A0 Couldn't find device with uuid qcmpwi-AAbV-lpl3-3B0U-2aeS-VzJ6-ZEM=
NYo.
=C2=A0 Couldn't find device with uuid DpJTbc-t0Oe-BImz-pdlo-TkQz-G0Hu-ojS=
ekc.
=C2=A0 Couldn't find device with uuid ylGuQS-L7Xi-7nu7-ZHfA-ECba-8t4n-qIs=
vqc.
=C2=A0 Couldn't find device with uuid XOop3m-0Mw7-4Ysx-vjxD-xjbd-RKi2-XqL=
3ba.
=C2=A0 Couldn't find device with uuid GQDoib-Uus6-N1B9-Rk0B-tULK-XKc0-856=
QO9.
=C2=A0 Couldn't find device with uuid UW3TaW-tkKd-N5sy-Z8dD-S8wl-362C-ssT=
Z7j.
=C2=A0 Cannot restore Volume Group chenbro0.0 with 7 PVs marked as missin=
g.
=C2=A0 Restore failed.

Would you know if possible and if so then how to recover from such a
failure?

many thanks, L


--------------DE48E623D59168A0EA7FDCBF
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

mQENBFxA2+oBCADNEtjjWJ07WtHPIaz73oKgaXWOBiPMDpYiFqfwquJeU4w4Mkb3
+huzAfmMRvpaWyoc0HeInkwd0IEeHdVFjeLuRUHQNCIujjwlTnI+Ee/BmCYRf4D8
jMjvZvNcHh1QLOn2UU6dNsQMlF10YqZPrwXW9X7TA67IsTC8n58kOI39gv/4D5ag
NbhUrg2c8OZD85miXW1IXsk3e7wiqNxQmhKbT3cbmPpJfGf/RN1URIavnhkLs4RQ
bL+UFz2t8fvX5i72zMQYbCjJkvkatFJuAbzbUn0ZRMFkJJQHokORSzJIs1nv5kPC
BikSnbj4AI5fcuEjpTJynQRj9v2z2e4QQohBABEBAAG0HmxlamVjemVrIDxwZWxq
YXN6QHlhaG9vLmNvLnVrPokBVAQTAQgAPhYhBJMFnyQe7uHQdpqF9FWRir8hIk66
BQJcQNvqAhsDBQkB4TOABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEFWRir8h
Ik66BxUIAIfflSVCcXjqQlQguVZGF8W+9WhgWjXA+0t1o8hCTlK6ejpeU3w216xx
VJnYlTv1Q9oIndLT0s7Q2j5O33ozQFMAE9JSdnOc5X6TxDH6jk7Y5EtcnvriXyT/
zwIfCTjUWSVyesjNZdid6+7GqdoPsLjggrFGlyRvNftWxvt6yhhKJfbZqfmVl0gg
w2Q9QVwYbNf2qP8lycZ8Q4eMAp65TdAtl5Ik/XjdjgJ8ZE1XoZoSXTWQYVdfJrmb
gYk55a4Z7PM7LKxZK4OsLDs8SpqsbUwVSW8QKt5nxd6espvubgRutCrsc8DCnFb4
4H8xEZgIwQKzhOt/ulf+QEP2op4W0/u5AQ0EXEDb6gEIAK2p19xkCOehxOwONlKl
/bMo4Bov4wfSw8CImuV5ABV80acSahKf5hX9qPyxNl7JKaWU+5gntA3m+jUEbobs
mRDvkwi3SLLh9fIqn8yv7JtEKzgxShWtOoPsilD1Ytz7D3HYZof4mrrYI6FQrR3I
eYYVkyFKOLcE1q70vyuEGsxC96lF+n7ajwk78nXYvSynK8l5pmEb1DL1uQnbLUga
0KXmVxCVmqbvA31ncT8WVrfk4f1TVQTCpoaKOTBoSMzFTQLhgiOB4KNk6Wj+s6vQ
h96hbmiiZZYADbZh73HDokWoAzV6jf3UGeIPlavkBuVW3OHUggR6PB0JM0HMoo5z
x/kAEQEAAYkBPAQYAQgAJhYhBJMFnyQe7uHQdpqF9FWRir8hIk66BQJcQNvqAhsM
BQkB4TOAAAoJEFWRir8hIk66El4H/25/osXtnjiFwwj5Pqb4TEHlMh+Jze0zLZML
J+lI/K+07u9DhQ9ZtwxyZZlTRINZDoqQYnMob4tWXUtHngqwGnSP/ZJkmS2Uquob
76aEyYm0fyEeq67j+o15o2atjCAcfWvbMxra0/c2JTzP0wMKTStbsMZrTFRFM1wE
DffR9HA9jIW+w2Jgru9/awd9HX+0q/UcMQQ2j+vfxjm345lEQHceeUgTwf3TzdXg
FpdD3/T2HYHWkBm8TZGdgZDZB+kj8IMKMSA72j28F1UilHQuFfdAD7M9UXVwiMFZ
3Tfexjv9OPa4wEDC9Z9YcYOpoimgNRAW2ZK7JlAgIbkejoRFHpg=3D
=3DIiFi
-----END PGP PUBLIC KEY BLOCK-----

--------------DE48E623D59168A0EA7FDCBF--
