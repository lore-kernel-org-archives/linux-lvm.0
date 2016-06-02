Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u52DqpHg014308
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 2 Jun 2016 09:52:51 -0400
Received: from partidopirata.com.ar (partidopirata.com.ar [192.71.218.196])
	(using TLSv1 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25007486A2
	for <linux-lvm@redhat.com>; Thu,  2 Jun 2016 13:52:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by partidopirata.com.ar (Postfix) with ESMTPSA id 554312A1159
	for <linux-lvm@redhat.com>; Thu,  2 Jun 2016 09:52:46 -0400 (EDT)
References: <574CB690.5030401@partidopirata.com.ar>
	<dc632a53-2e8a-651e-5c95-fcf467d6628d@redhat.com>
	<574D8EE6.8020903@partidopirata.com.ar>
	<fadf6004-73b7-ebd6-035f-9167764ff7a8@redhat.com>
	<5750371C.2070201@partidopirata.com.ar>
From: fauno <fauno@partidopirata.com.ar>
Message-ID: <57503A2A.6050405@partidopirata.com.ar>
Date: Thu, 2 Jun 2016 10:52:42 -0300
MIME-Version: 1.0
In-Reply-To: <5750371C.2070201@partidopirata.com.ar>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="PTkhNn6Ij9CEIJlRVtSWRqIQNcj8NNSCB"
Subject: Re: [linux-lvm] [dm-crypt] LVM on LUKS: volumes missing
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
--PTkhNn6Ij9CEIJlRVtSWRqIQNcj8NNSCB
Content-Type: multipart/mixed; boundary="Bq0UiBe25BlGHik5LiAHHh9FE0axXpUT7"
From: fauno <fauno@partidopirata.com.ar>
To: linux-lvm@redhat.com
Message-ID: <57503A2A.6050405@partidopirata.com.ar>
Subject: Re: [linux-lvm] [dm-crypt] LVM on LUKS: volumes missing
References: <574CB690.5030401@partidopirata.com.ar>
	<dc632a53-2e8a-651e-5c95-fcf467d6628d@redhat.com>
	<574D8EE6.8020903@partidopirata.com.ar>
	<fadf6004-73b7-ebd6-035f-9167764ff7a8@redhat.com>
	<5750371C.2070201@partidopirata.com.ar>
In-Reply-To: <5750371C.2070201@partidopirata.com.ar>

--Bq0UiBe25BlGHik5LiAHHh9FE0axXpUT7
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 02/06/16 10:39, fauno wrote:
> On 02/06/16 10:22, Ondrej Kozina wrote:
>=20
>> This is very strange pvscan -vvvv output. Reading upstream lvm2 code, =
it
>> doesn't make much sense to me. Most notably I can't see full error pat=
h.
>> Could it be that pvscan -vvvv output was cut off somehow?
>>
>> Regards
>> O.
>=20
> that's exactly as it was printed

fwiw, on dm-crypt list i was suggested to read the opened device with
`strings` and `hexedit`, but i couldn't find any lvm2 info


--=20
http://partidopirata.com.ar


--Bq0UiBe25BlGHik5LiAHHh9FE0axXpUT7--

--PTkhNn6Ij9CEIJlRVtSWRqIQNcj8NNSCB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQF8BAEBCgBmBQJXUDoqXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQ0OUY3MDdBMUNCMzY2QzU4MEU2MjVCM0M0
NTYwMzJENzE3QTRDRDlDAAoJEEVgMtcXpM2cf9QH/1V3pb4VXASeFzjSD47281T1
Axcu08ga5YIawZDm77pKx+EguKlFNn9VHgDk89eW8cSvcEenQBDsOX0wvrV+iFXk
vtIN3NP5zLN2t6fq5XB7kFmc5bK6U2c9lSS1BReodXoxuAoPKpwnum50cPay5AJe
6cebkHu99APMzYJSTcpur+COPf0RFaqXBvHfz1QOWRpExyNDjP5PddYO0ueuSD4L
uw/PTmX4JEdV7DWJnTg1oN+sq2fc0BVxGr8RKCi5yLO5u1b+dYELx5wZpwLhjJRu
J3TeU/r9n8q7fXA8bwdWexDzbJjavGftMlRGSFU8we/S5BqXJRdavM+CdrJ0Kis=
=YSGI
-----END PGP SIGNATURE-----

--PTkhNn6Ij9CEIJlRVtSWRqIQNcj8NNSCB--
