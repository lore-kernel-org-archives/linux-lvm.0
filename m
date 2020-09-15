Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BED52166B28
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2020 22:26:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C8D080029D
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2020 22:26:55 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 16 Sep 2020 00:26:50 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <fad39006-f18f-d15e-b29b-bb7f59a33be1@redhat.com>
References: <2d496550-4609-0a26-489b-8721737c783b@redhat.com>
	<257A9B1C-04AC-4EDE-9671-9E7A60104F9F@gmail.com>
	<fad39006-f18f-d15e-b29b-bb7f59a33be1@redhat.com>
Message-ID: <cf779b76e25707b8ec3361f55318a1c7@assyoma.it>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM, =?UTF-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>, general discussion and development <linux-lvm@redhat.com>

Il 2020-09-15 23:47 Zdenek Kabelac ha scritto:
> You likely don't need such amount of 'snapshots' and you will need to
> implement something to remove snapshot without need, so i.e. after a
> day you will keep maybe 'every-4-hour' and after couple days maybe
> only a day-level snapshot. After a month per-week and so one.

Agree. "Snapshot-thinning" is an essential part of snapshot management.

> Speaking of thin volumes - there can be at most 2^24 thin devices
> (this is hard limit you've ask for ;)) - but you have only  ~16GiB of
> metadata to store all of them - which gives you ~1KiB of data per such
> volume -
> quite frankly this is not too much  - unless as said - your volumes
> are not changed at all - but then why you would be building all this...
> 
> That all said -  if you really need that intensive amount of 
> snapshoting,
> lvm2 is likely not for you - and you will need to build something on 
> your own,
> as you will need way more efficient and 'targeted' solution for your 
> purpose.

Thinvols are not activated by default - this means it should be not a 
big problem managing some hundreds of them, as the OP ask. Or am I 
missing something?

Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
