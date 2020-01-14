Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 706092026D67
	for <linux-lvm@redhat.com>; Tue, 14 Jan 2020 10:47:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BECD98032AA
	for <linux-lvm@redhat.com>; Tue, 14 Jan 2020 10:47:48 +0000 (UTC)
References: <4dd562cd-36ee-9960-58cf-8f504d4085ef@assyoma.it>
	<0fad9406-2354-50c2-7d0f-6f065d40ee91@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <0e759364-6f75-aec7-cea0-3f45830719c0@assyoma.it>
Date: Tue, 14 Jan 2020 11:47:44 +0100
MIME-Version: 1.0
In-Reply-To: <0fad9406-2354-50c2-7d0f-6f065d40ee91@redhat.com>
Content-Language: it
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] lvmcache on non-lvm source?
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 14/01/20 10:17, Zdenek Kabelac wrote:
> Hi
>=20
> You can't use lvm2 on 'raw' device - we do require PV headers to stay=20
> correct.
>=20
> BUT
>=20
> Clearly you can use 'dm-cache' target with 'dmsetup' utility and=20
> maintain the correctness of devices & activation yourself.
>=20
> See: linux/Documentation/admin-guide/device-mapper/
> (or simply google it)=EF=BF=BD how to use individual targets with just dm=
setup
>=20
>=20
> Regard
>=20
> Zdenek
>=20

Hi Zdenek, thank you for the clear reply.

I know I can directly use dm-cache but, from a support standpoint, it=20
would really like to avoid it.

I would rather create a PV on the raw block device.
Thanks.

--=20
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
