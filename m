Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B6CCEAFA6
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2020 19:16:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13F371021F60
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2020 19:16:21 +0000 (UTC)
From: =?utf-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 15 Sep 2020 21:16:08 +0200
Message-Id: <55D97810-92C9-4A4F-96BC-3016D458C588@gmail.com>
References: <8a3a46b57b9264039885e8e7401e9dbd@assyoma.it>
In-Reply-To: <8a3a46b57b9264039885e8e7401e9dbd@assyoma.it>
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

thanks for the feedback=20

in previous older versions of LVM, I guess that each lv requires a minor, m=
ajor and these are might have limitations of how many can be addressed=20

but how about LVM2?

if I intend to have many hundred thousands of LV, would that be any issue?

Sent from my iPhone

> On 1 Sep 2020, at 15:21, Gionatan Danti <g.danti@assyoma.it> wrote:
>=20
> =EF=BB=BFIl 2020-08-30 21:30 Zdenek Kabelac ha scritto:
>> Hi
>> Lvm2 has only ascii metadata (so basically what is stored in
>> /etc/lvm/archive is the same as in PV header metadata area -
>> just without spaces and some comments)
>> And while this is great for manual recovery, it's not
>> very efficient in storing larger number of LVs - there basically
>> some sort of DB attemp would likely be needed.
>> So far however there was no real worthy use case - so safety
>> for recovery scenarios wins ATM.
>=20
> Yes, I agree.
>=20
>> Thin - just like any other LV takes some 'space' - so if you want
>> to go with higher amount - you need to specify bigger metadata areas
>> to be able to store such large lvm2 metadata.
>> There is probably not a big issue with lots of thin LVs in thin-pool as =
long
>> as user doesn't need to have them active at the same time. Due to a natu=
re of
>> kernel metadata handling, the larger amount of active thin LVs from
>> the same thin-pool v1 may start to compete for the locking when
>> allocating thin pool chunks thus killing performance - so here is
>> rather better to stay in some 'tens' of actively provisioning thin
>> volumes when the 'performance' is factor.
>=20
> Interesting.
>=20
>> Worth to note there is fixed strict limit of the ~16GiB maximum
>> thin-pool kernel metadata size - which surely can be exhausted -
>> mapping holds info about bTree mappings and sharing chunks between
>> devices....
>=20
> Yes, I know about this specific limitation.
>=20
> Thanks.
>=20
> --=20
> Danti Gionatan
> Supporto Tecnico
> Assyoma S.r.l. - www.assyoma.it
> email: g.danti@assyoma.it - info@assyoma.it
> GPG public key ID: FF5F32A8
