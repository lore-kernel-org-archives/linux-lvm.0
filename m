Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED18210060FA
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2020 04:58:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8D30800800
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2020 04:58:58 +0000 (UTC)
From: =?utf-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 16 Sep 2020 06:58:50 +0200
Message-Id: <E99B2EFD-42A3-4EAA-81C5-E04325569E8D@gmail.com>
References: <cf779b76e25707b8ec3361f55318a1c7@assyoma.it>
In-Reply-To: <cf779b76e25707b8ec3361f55318a1c7@assyoma.it>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] lvm limitations
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
Content-Type: text/plain; charset="iso-8859-1"
To: Gionatan Danti <g.danti@assyoma.it>
Cc: LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>

just curious about this:

> Worth to note there is fixed strict limit of the ~16GiB maximum
> thin-pool kernel metadata size - which surely can be exhausted -
> mapping holds info about bTree mappings and sharing chunks between
> devices....
would that mean that one single thin-pool can maximum hold 16GiB/16 nr of b=
locks?

and how about if LVM2 uses VDO as backend, are there more limitations that =
I need to consider there that are not reflected here

Sent from my iPhone

> On 16 Sep 2020, at 00:26, Gionatan Danti <g.danti@assyoma.it> wrote:
>=20
> =EF=BB=BFIl 2020-09-15 23:47 Zdenek Kabelac ha scritto:
>> You likely don't need such amount of 'snapshots' and you will need to
>> implement something to remove snapshot without need, so i.e. after a
>> day you will keep maybe 'every-4-hour' and after couple days maybe
>> only a day-level snapshot. After a month per-week and so one.
>=20
> Agree. "Snapshot-thinning" is an essential part of snapshot management.
>=20
>> Speaking of thin volumes - there can be at most 2^24 thin devices
>> (this is hard limit you've ask for ;)) - but you have only  ~16GiB of
>> metadata to store all of them - which gives you ~1KiB of data per such
>> volume -
>> quite frankly this is not too much  - unless as said - your volumes
>> are not changed at all - but then why you would be building all this...
>> That all said -  if you really need that intensive amount of snapshoting,
>> lvm2 is likely not for you - and you will need to build something on you=
r own,
>> as you will need way more efficient and 'targeted' solution for your pur=
pose.
>=20
> Thinvols are not activated by default - this means it should be not a big=
 problem managing some hundreds of them, as the OP ask. Or am I missing som=
ething?
>=20
> Regards.
>=20
> --=20
> Danti Gionatan
> Supporto Tecnico
> Assyoma S.r.l. - www.assyoma.it
> email: g.danti@assyoma.it - info@assyoma.it
> GPG public key ID: FF5F32A8
