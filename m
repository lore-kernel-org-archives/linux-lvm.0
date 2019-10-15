Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8193C5C1D6
	for <linux-lvm@redhat.com>; Tue, 15 Oct 2019 15:30:20 +0000 (UTC)
Received: from sonic306-20.consmr.mail.ir2.yahoo.com
	(sonic306-20.consmr.mail.ir2.yahoo.com [77.238.176.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0390330084AD
	for <linux-lvm@redhat.com>; Tue, 15 Oct 2019 15:30:19 +0000 (UTC)
References: <8d1e7b13-eeec-18c0-592b-564dc5740636@yahoo.co.uk>
	<20191007164218.GA4398@redhat.com>
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <9ce34b5b-0c44-429b-c74d-a20ba565c397@yahoo.co.uk>
Date: Tue, 15 Oct 2019 16:30:14 +0100
MIME-Version: 1.0
In-Reply-To: <20191007164218.GA4398@redhat.com>
Content-Type: multipart/mixed; boundary="------------5711D6DD4DD01026D1976C3B"
Content-Language: en-US
Subject: Re: [linux-lvm] recovery of a VG - how?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, David Teigland <teigland@redhat.com>

This is a multi-part message in MIME format.
--------------5711D6DD4DD01026D1976C3B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 07/10/2019 17:42, David Teigland wrote:
> On Mon, Oct 07, 2019 at 05:25:15PM +0100, lejeczek wrote:
>> hi guys
>>
>> I have a VG which I try to restore:
>>
>> $ vgcfgrestore --file /etc/lvm/archive/chenbro0.0_00308-2121179640.vg =
chenbro0.0
>> =C2=A0 /dev/mapper/chenbro_a: Checksum error at offset 428544
>> =C2=A0 Couldn't read volume group metadata from /dev/mapper/chenbro_a.=

>> =C2=A0 Metadata location on /dev/mapper/chenbro_a at 428544 has invali=
d summary for VG.
> The latest upstream version of lvm has some improvements to help recove=
r
> from problems like this.  So, you could try building lvm 2.03.05, and
> running 'vgck --updatemetadata'.  Otherwise, the old approach has been =
to
> use pvcreate with --restorefile and --uuid, followed by vgcfgrestore.
> (I'd experiment with that using some test devices if possible.)
> Dave
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

also, is it possible to stop monitoring, or stop whatever is responsible
for flooding the logs with:

=2E..

lrmd[14636]:=C2=A0 notice: chenbro0.1-raid5_monitor_20000:419255:stderr [=
=C2=A0=C2=A0
Couldn't read volume group metadata from /dev/mapper/chenbro_m. ]

=2E..

for a time being?

many thanks, L.


--------------5711D6DD4DD01026D1976C3B
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

--------------5711D6DD4DD01026D1976C3B--
