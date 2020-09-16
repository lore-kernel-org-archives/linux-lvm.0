Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC41510F1BF3
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2020 04:25:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12AFF801181
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2020 04:25:31 +0000 (UTC)
From: =?utf-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 16 Sep 2020 06:25:21 +0200
Message-Id: <2F3E7182-B18D-465E-8BE6-97D215A0C9F3@gmail.com>
References: <cf779b76e25707b8ec3361f55318a1c7@assyoma.it>
In-Reply-To: <cf779b76e25707b8ec3361f55318a1c7@assyoma.it>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: Gionatan Danti <g.danti@assyoma.it>
Cc: LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>

thanks for all the good reflections

the intention is to see if backups can be done in a much more easy way than have ever been built before

commercial hardware based snapshots limits the amount of snapshots to 256 per filesystem forcing operators to select this only for short living retentions
some have even fewer than that

another solution could be to store the lv as file into a larger fs, and snapshot these fs that than works as a group; just to decrease the amount of lv needed by the repository host. possible to do this, but will make the retention management more complex.
and especially if operators want to change retention for a given snapshot, as retention only can be the same for everything stored on the same lv.
that would require a move of the ‘base’ lv file into a separate lv, unless there is a way to rebuild vdo dedup data without a move of the block to represent the file/lv object elsewhere.
like clone of a lv...

perhaps a snapshot of the origin can be a new master? if that is ok, which I think is ok, than that will work without a move

thanks 

Sent from my iPhone

> On 16 Sep 2020, at 00:26, Gionatan Danti <g.danti@assyoma.it> wrote:
> 
> ﻿Il 2020-09-15 23:47 Zdenek Kabelac ha scritto:
>> You likely don't need such amount of 'snapshots' and you will need to
>> implement something to remove snapshot without need, so i.e. after a
>> day you will keep maybe 'every-4-hour' and after couple days maybe
>> only a day-level snapshot. After a month per-week and so one.
> 
> Agree. "Snapshot-thinning" is an essential part of snapshot management.
> 
>> Speaking of thin volumes - there can be at most 2^24 thin devices
>> (this is hard limit you've ask for ;)) - but you have only  ~16GiB of
>> metadata to store all of them - which gives you ~1KiB of data per such
>> volume -
>> quite frankly this is not too much  - unless as said - your volumes
>> are not changed at all - but then why you would be building all this...
>> That all said -  if you really need that intensive amount of snapshoting,
>> lvm2 is likely not for you - and you will need to build something on your own,
>> as you will need way more efficient and 'targeted' solution for your purpose.
> 
> Thinvols are not activated by default - this means it should be not a big problem managing some hundreds of them, as the OP ask. Or am I missing something?
> 
> Regards.
> 
> -- 
> Danti Gionatan
> Supporto Tecnico
> Assyoma S.r.l. - www.assyoma.it
> email: g.danti@assyoma.it - info@assyoma.it
> GPG public key ID: FF5F32A8
