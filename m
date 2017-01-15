Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0FH5iMr001282
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sun, 15 Jan 2017 12:05:44 -0500
Received: from mail.reox.at (mail.reox.at [88.198.22.87])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 89D4DB7CEE
	for <linux-lvm@redhat.com>; Sun, 15 Jan 2017 17:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.reox.at (Postfix) with ESMTP id A677058DF97
	for <linux-lvm@redhat.com>; Sun, 15 Jan 2017 17:57:57 +0100 (CET)
Received: from mail.reox.at ([127.0.0.1])
	by localhost (mail.reox.at [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XZYVWxmD9AyZ for <linux-lvm@redhat.com>;
	Sun, 15 Jan 2017 17:57:56 +0100 (CET)
Received: from [172.16.23.77] (188-22-177-122.adsl.highway.telekom.at
	[188.22.177.122])
	by mail.reox.at (Postfix) with ESMTPSA id 468D858DF7A
	for <linux-lvm@redhat.com>; Sun, 15 Jan 2017 17:57:56 +0100 (CET)
References: <20170101141514.jnazw5dd4kfpcip4@cebalrai>
	<db547e6d-c328-561c-b4d0-de848dc2e1fa@free-minds.net>
From: Sebastian Bachmann <me@free-minds.net>
Message-ID: <476a92b3-a993-dfed-0c8b-8ba557e1f980@free-minds.net>
Date: Sun, 15 Jan 2017 17:57:50 +0100
MIME-Version: 1.0
In-Reply-To: <db547e6d-c328-561c-b4d0-de848dc2e1fa@free-minds.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="FCgA1U64PD8f4JAcpdSmoEjLw2iqU5fSC"
Subject: Re: [linux-lvm] Change stripe cache for lvm raid5
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FCgA1U64PD8f4JAcpdSmoEjLw2iqU5fSC
Content-Type: multipart/mixed; boundary="2rTkwubQW9qjx5TknFhTPmVA4623W5w2x";
	protected-headers="v1"
From: Sebastian Bachmann <me@free-minds.net>
To: linux-lvm@redhat.com
Message-ID: <476a92b3-a993-dfed-0c8b-8ba557e1f980@free-minds.net>
Subject: Re: [linux-lvm] Change stripe cache for lvm raid5
References: <20170101141514.jnazw5dd4kfpcip4@cebalrai>
	<db547e6d-c328-561c-b4d0-de848dc2e1fa@free-minds.net>
In-Reply-To: <db547e6d-c328-561c-b4d0-de848dc2e1fa@free-minds.net>

--2rTkwubQW9qjx5TknFhTPmVA4623W5w2x
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi again!

Actually setting the stripe cache using dmsetup reload works. You just
have to resume the device after it was reloaded. I did not read the
documentation well enough to recognize that:

$ dmsetup table
[...]
myvg-lv: 0 11525947392 raid raid5_ls 3 128 region_size 8192 3 254:5
254:6 254:7 254:8 254:9 254:10
[...]
$ dmsetup reload myvg-lv --table '0 11525947392 raid raid5_ls 5 128
stripe_cache 16384 region_size 8192 3 254:5 254:6 254:7 254:8 254:9 254:1=
0'
$ dmsetup resume myvg-lv
$ dmsetup table
[...]
myvg-lv: 0 11525947392 raid raid5_ls 5 128 region_size 8192 stripe_cache
16534 3 254:5 254:6 254:7 254:8 254:9 254:10
[...]

If you do this, there is actually a speedup, as suggested in various
threads about mdraid.

Is there now any way to make this persistent? I saw there are udev hooks
for lvm, but I think you can not simply put the new dmsetup table
argument there...

regards
sebastian

On 01/01/2017 05:45 PM, Sebastian Bachmann wrote:
> Hi!
>=20
> Just a sidenote: I tried to set the stripe_cache option via dmsetup
> reload in a debian jessie VM. With the 3.16 kernel, it crashed with a
> null pointer dereference error in raid5_set_cache_size function.
> I upgraded to a newer kernel version (4.8.11) and tried it again,
> the cache size can be set there using reload:
>=20
> Jan  1 15:44:56 jessie kernel: [   33.913336] device-mapper: raid: 1638=
4
> stripe cache entries
>=20
>=20
> I then upgraded the kernel on my machine with the RAID5 and found out,
> that even without any cache settings, the RAID is now two to four times=

> faster in writing than before. I now get around 80-100MB/s.
> It seems that there were a lot of changes between 3.16 and 4.8 regardin=
g
> speed, not only fixing this crash.
>=20
> I tried now setting the stripe cache size on the RAID5 but the speed
> does not get higher though...
> According to the numerous reports on the internet, the impact on write
> performance should be great - so it would still be interesting if the
> stripe_cache is actually set correctly when using dmsetup reload (if I
> run dmsetup table again, i still see the old line) and if it somehow ca=
n
> be set persistently with LVM.
>=20
> regards
> sebastian
>=20
> On 01/01/2017 03:15 PM, Sebastian Bachmann wrote:
>> Hi!
>> I'm using a LVM RAID5 on a machine but the write performance is pretty=
 poor
>> (about 20-30MB/s),
>> where the read performance is quite good (about 280MB/s).
>> I read about the stripe_cache_size for md raid and as far as I underst=
and LVM
>> raid, it uses md as well.
>> In the design document for lvm2-raid
>> (https://git.fedorahosted.org/cgit/lvm2.git/tree/doc/lvm2-raid.txt) I =
can find
>> that a option --stripecache is specified there, but as it seems those =
options
>> were never implemented.
>>
>> Is it possible to set the stripe cache size somewhere else? It seems t=
o me that
>> lvm2 uses dmsetup to create the raid, where a stripe cache can be set =
while
>> creation. But it seems to me there is no interface to change such valu=
es
>> later on?
>>
>> Thanks in advance!
>>
>> regards
>> Sebastian
>>
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20


--2rTkwubQW9qjx5TknFhTPmVA4623W5w2x--

--FCgA1U64PD8f4JAcpdSmoEjLw2iqU5fSC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJGBAEBCAAwFiEEZFa7XEAmJF3nZlHUb9vYxvk7X4sFAlh7qg4SHG1lQGZyZWUt
bWluZHMubmV0AAoJEG/b2Mb5O1+L9psP/ie630akZvgRd4KVc0YEBy/kRml1/Sk0
eRNgw4FBVQJmf37q4zINAviBU9DyqnEmsGCxgzVEjtZTCerO4e+20nArY7EdHk16
GcgtE6S2/u8XmaLq+izBceIzoMlt+/Ik3gGxPHWevUz1Kp48WuNIReeDz7V/3hrq
rl1HK23v+yDbspcCtE9SXdEGvufsqauctXP5bLng6GVi13f2oEdSHluyf+QGmN7+
JcbKD7VB9llM287YhxJNQaGz1MNLuLNmAyGfaN6SOdRCjRXaz2umaTjEY3pNIrHl
2aYfSKUkrlI8Et8Q2BTsxb99pql68TeHcDe4aI4HtLnxOFpdSyEAvoJuEvF1OAqI
/4mwgveQG4M2Tt9uM+3iW59BkAIlshy+tkpb6DAc8HqH9lIOErvFcyzygtI5kTJM
sl2spACLPQgVnyJ2DhRho/BGbwv2FTPe6x2sqeviw+n1nTlFCj5iafXHKQYR+aAd
iZYTh+S54X/h+4MpUzsJAN5Y2CsfSM7FPVcRsBAH6YQr48oWsKkDcPnuDaXDBQQk
VLtuX0YPZNyvQB9AGyquwF0a2Z11+Cr1BsIl7XQfYXpn4lc2YSeg+hzWyYc6vHS8
2oV+JcR7ueuTpIWKm2i5wvqh49G/eeKtMnbhG0yARJH+4yUek/nyrdLCBM1L+Cp9
qsLzU3q/mZyk
=nuCz
-----END PGP SIGNATURE-----

--FCgA1U64PD8f4JAcpdSmoEjLw2iqU5fSC--
