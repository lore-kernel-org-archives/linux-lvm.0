Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E0FC6012A
	for <linux-lvm@redhat.com>; Thu, 10 Oct 2019 14:59:09 +0000 (UTC)
Received: from sonic312-25.consmr.mail.ir2.yahoo.com
	(sonic312-25.consmr.mail.ir2.yahoo.com [77.238.178.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3BB8F3086E2F
	for <linux-lvm@redhat.com>; Thu, 10 Oct 2019 14:59:08 +0000 (UTC)
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <b718d8ef-1602-76e8-aa57-277846091070@yahoo.co.uk>
Date: Thu, 10 Oct 2019 15:59:05 +0100
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------82EF88C910D09088F0FF6921"
Content-Language: en-US
Subject: [linux-lvm] smartmontools experts roaming around? - multipath
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
--------------82EF88C910D09088F0FF6921
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

hi guys,

a simple & short question - is smartmontool smart about devices to which
are multiple paths? Is there a difference between single & multiple
paths from smartd's perspective?

many thanks, L.


--------------82EF88C910D09088F0FF6921
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

--------------82EF88C910D09088F0FF6921--
