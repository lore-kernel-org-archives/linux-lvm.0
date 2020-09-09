Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 063C820B1B46
	for <linux-lvm@redhat.com>; Wed,  9 Sep 2020 18:16:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C23418A19A0
	for <linux-lvm@redhat.com>; Wed,  9 Sep 2020 18:16:38 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 09 Sep 2020 20:16:26 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <83152674.4938205.1599663690759.JavaMail.zimbra@karlsbakk.net>
References: <79061390.1069833.1599071934227.JavaMail.zimbra@karlsbakk.net>
	<53661d4eefb635710b51cf9bfee894ef@assyoma.it>
	<83152674.4938205.1599663690759.JavaMail.zimbra@karlsbakk.net>
Message-ID: <3503b4f5b55345beb24de4b156ee75c7@assyoma.it>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Looking ahead - tiering with LVM?
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
Cc: Roy Sigurd Karlsbakk <roy@karlsbakk.net>, =?UTF-8?Q?H=C3=A5kon?= <hawken@thehawken.org>

Il 2020-09-09 17:01 Roy Sigurd Karlsbakk ha scritto:
> First, filelevel is usually useless. Say you have 50 VMs with Windows
> server something. A lot of them are bound to have a ton of equal
> storage in the same areas, but the file size and content will vary
> over time. With blocklevel tiering, that could work better.

It really depends on the use case. I applied it to a fileserver, so=20
working at file level was the right choice. For VMs (or big files) it is=20
useless, I agree.

> This is all known.

But the only reason to want tiering vs cache is the additional space the=20
former provides. If this additional space is so small (compared to the=20
combined, total volume space), tiering's advantage shrinks to (almost)=20
nothing.

> If you look at IOPS instead of just sequencial speed, you'll see the
> difference. A set of 10 drives in a RAID-6 will perhaps, maybe, give
> you 1kIOPS, while a single SSD might give you 50kIOPS or even more.
> This makes a huge impact.

IOPs are already well server by LVM cache. So, I genuinely ask: what=20
would be tiering advantage here? I'll love to ear a reasonable use case.

> =E2=80=A6which was the reason I asked this question, and which should be =
quite
> clear in the original post.

Yeah, but this need a direct reply from a core LVM developer, which I=20
wellcome ;)
Thanks.

--=20
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
