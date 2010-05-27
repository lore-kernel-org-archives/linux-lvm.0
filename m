Received: from firewall.xsintricity.com
	(ovpn01.gateway.prod.ext.phx2.redhat.com [10.5.9.1])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4RGex2B007746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 27 May 2010 12:41:20 -0400
Received: from firewall.xsintricity.com (firewall.xsintricity.com [172.31.0.1])
	(authenticated bits=0)
	by firewall.xsintricity.com (8.14.3/8.14.3) with ESMTP id
	o4RGewPi005297
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 27 May 2010 12:40:58 -0400
Message-ID: <4BFEA099.9020005@redhat.com>
Date: Thu, 27 May 2010 12:40:57 -0400
From: Doug Ledford <dledford@redhat.com>
MIME-Version: 1.0
References: <4BF5A883.7060503@tlinx.org>	<20100521051021.GA1412@maude.comedia.it>	<4BF62CBF.3070702@tlinx.org>
	<20100522072321.GB12294@maude.comedia.it>
In-Reply-To: <20100522072321.GB12294@maude.comedia.it>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig5A1AB7CA1D2F6322B4DE4D92"
Subject: Re: [linux-lvm] Volume alignment over RAID
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

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig5A1AB7CA1D2F6322B4DE4D92
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 05/22/2010 03:23 AM, Luca Berra wrote:
> On Thu, May 20, 2010 at 11:48:31PM -0700, Linda A. Walsh wrote:
>> Luca Berra wrote:
>>>> I'm using a RAID 'chunk' size of 64k as suggested by the RAID
>>>> documentation
>>>> and am using 6 disks to create a RAID6, giving 4 units of
>>>> data/stripe.  Does
>>> I suppose by raid you mean md, so i wonder what documentation you wer=
e
>>> looking at?
>> ---
>>     Well, doc in 2 different raid controllers LSI and rocket raid both=

>> suggest 64K as a unit size (forget, their exact term).

Hardware raid and software raid are two entirely different things when
it comes to optimization.

>>> I think 64k might be small as a chunk size, depending on your array s=
ize
>>> you probably want a bigger size.
>> ---
>>     Really?  What are the trade offs?  Array size well 6 disks and 4
>> of data.
> ok, i trew the stone ..
> First we have to consider usage scenarios, i.e. average read and averag=
e
> write size, large reads benefit from larger chunks, small writes with
> too large chunks would still result on whole stripe Read-Modify-Write.
>=20
> there were people on linux-raid ml doing benchmarks, and iirc using
> chunks between 256k and 1m gave better average results

That was me.  The best results are with 256 or 512k chunk sizes.  Above
512k you don't get any more benefit.

--=20
Doug Ledford <dledford@redhat.com>
              GPG KeyID: CFBFF194
	      http://people.redhat.com/dledford

Infiniband specific RPMs available at
	      http://people.redhat.com/dledford/Infiniband


--------------enig5A1AB7CA1D2F6322B4DE4D92
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkv+oJoACgkQg6WylM+/8ZSJPwCgqWYRd2amgNfahXoMq1muYIlB
F1gAn25SSQ7kkj5GX5TwHpW5t+/KnaIA
=HQ5W
-----END PGP SIGNATURE-----

--------------enig5A1AB7CA1D2F6322B4DE4D92--
