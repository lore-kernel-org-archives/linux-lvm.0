Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F018FA37A5
	for <linux-lvm@redhat.com>; Tue,  1 Sep 2020 13:21:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1342C811E7A
	for <linux-lvm@redhat.com>; Tue,  1 Sep 2020 13:21:42 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 01 Sep 2020 15:21:34 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <bf377813-8600-865a-71b7-dd6873113f46@redhat.com>
References: <83DAD1FF-6CE0-4725-A24D-2AE529433AEE@gmail.com>
	<8f19f639-107d-610d-0083-596d0c21a081@redhat.com>
	<29c466317b90d36bff995b3f3d0f4cf2@assyoma.it>
	<bf377813-8600-865a-71b7-dd6873113f46@redhat.com>
Message-ID: <8a3a46b57b9264039885e8e7401e9dbd@assyoma.it>
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
Cc: =?UTF-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

Il 2020-08-30 21:30 Zdenek Kabelac ha scritto:
> Hi
> 
> Lvm2 has only ascii metadata (so basically what is stored in
> /etc/lvm/archive is the same as in PV header metadata area -
> just without spaces and some comments)
> 
> And while this is great for manual recovery, it's not
> very efficient in storing larger number of LVs - there basically
> some sort of DB attemp would likely be needed.
> 
> So far however there was no real worthy use case - so safety
> for recovery scenarios wins ATM.

Yes, I agree.

> Thin - just like any other LV takes some 'space' - so if you want
> to go with higher amount - you need to specify bigger metadata areas
> to be able to store such large lvm2 metadata.
> 
> There is probably not a big issue with lots of thin LVs in thin-pool as 
> long
> as user doesn't need to have them active at the same time. Due to a 
> nature of
> kernel metadata handling, the larger amount of active thin LVs from
> the same thin-pool v1 may start to compete for the locking when
> allocating thin pool chunks thus killing performance - so here is
> rather better to stay in some 'tens' of actively provisioning thin
> volumes when the 'performance' is factor.

Interesting.

> Worth to note there is fixed strict limit of the ~16GiB maximum
> thin-pool kernel metadata size - which surely can be exhausted -
> mapping holds info about bTree mappings and sharing chunks between
> devices....

Yes, I know about this specific limitation.

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
