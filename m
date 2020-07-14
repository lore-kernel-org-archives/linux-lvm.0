Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FB622166B27
	for <linux-lvm@redhat.com>; Tue, 14 Jul 2020 20:44:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13548800296
	for <linux-lvm@redhat.com>; Tue, 14 Jul 2020 20:44:43 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 14 Jul 2020 22:32:34 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <20200714160556.GA16281@redhat.com>
References: <1juzXg-0002Wp-5c@mx1.helsinki.tools>
	<20200714160556.GA16281@redhat.com>
Message-ID: <a17aaff832c68fd0814e5d2a94547c91@assyoma.it>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] RAID-less parity?
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
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: =?UTF-8?Q?Janne_He=C3=9F?= <janne+lvm@hess.ooo>

Il 2020-07-14 18:05 David Teigland ha scritto:
> On Mon, Jul 13, 2020 at 04:34:52PM +0200, Janne He=C3=9F wrote:
>> However some of my systems are single-disk systems. For those, RAIDs=20
>> are
>> not possible so I was thinking if LVM has some support for single-PV
>> setups with parity on the same PV.
>=20
> Hi,
>=20
> We didn't include integrity+linear because we didn't see much value in=20
> it,
> since it would require going to backups in case of an integrity=20
> failure.
>=20
> dm-integrity will detect but not fix bit rot.

Hi, I really think error detection has value by itself.
So I would suggest implementing it.

>=20
>> So is there any way to get a parity setup with the current state of=20
>> LVM?
>> I was thinking of a RAID-4 with one PV but the current tooling (more
>> specifically lvcreate) doesn't let me do that.
>=20
> It's not currently possible.  We had an implementation for this we=20
> could
> bring back if there is enough interest, so we'd like to hear more about
> how this would be useful for you and others.

For this feature (parity+linear) I don't see much value: if a single=20
physical devices fails hard, all bet of recovery are off. However having=20
it can sometime be useful so, if implementing/maintenance cost are low,=20
why not?

Thanks.

--=20
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
