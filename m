Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2C152166B2C
	for <linux-lvm@redhat.com>; Mon, 23 Nov 2020 12:47:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7369E811E76
	for <linux-lvm@redhat.com>; Mon, 23 Nov 2020 12:47:10 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 23 Nov 2020 13:44:03 +0100
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <CAMaziXsY6vpQdD+QQzW_1Km+Ltf41tz0G1WG5xAUiMARFWHoyw@mail.gmail.com>
References: <CAMaziXsY6vpQdD+QQzW_1Km+Ltf41tz0G1WG5xAUiMARFWHoyw@mail.gmail.com>
Message-ID: <6ea77fe7d910218bb46367f35d1a19a6@assyoma.it>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] What is the use of thin snapshots if the external
 origin cannot be set to writable ?
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Sreyan Chakravarty <sreyan32@gmail.com>

Il 2020-11-21 04:10 Sreyan Chakravarty ha scritto:
> I mean what is the point of creating a snapshot if I can't change my
> original volume ?
> 
> Is there some sort of resolution ?

External thin snapshot are useful to share a common, read-only base (ie: 
a "gold-master" image) with different writable thin lvm overlay volumes. 
They can not be merged into external origin; otherwise, a single merge 
operation would invalidate *all* other thin snapshot relying on the same 
origin.

Classical LVM snapshots are good for temporary, short-lived snapshots - 
basically taken for backup purpose only (and immediately removed after 
the backup completed). You should not use them for long-lived snapshots 
(otherwise you can see much lower performance and delayed boot).

If you want to have long-lived snapshot you should use LVM thin 
snapshots. For root volumes, you have two choices:
- use a thin lvm volume for root, which is a supported use case (but it 
will probably require a system reinstallation);
- continue using your classical LVM as a immutable base and use a thin 
lvm with external snapshot to store all new writes.

Regards.


-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
