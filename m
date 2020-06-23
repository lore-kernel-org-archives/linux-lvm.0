Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43ACD2029F6F
	for <linux-lvm@redhat.com>; Tue, 23 Jun 2020 20:40:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49760856A50
	for <linux-lvm@redhat.com>; Tue, 23 Jun 2020 20:40:46 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 23 Jun 2020 22:37:55 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <dff2c51f-70a9-3339-6fe8-06091608b572@redhat.com>
References: <1643811.X513TT2pbd@localhost.localdomain>
	<dff2c51f-70a9-3339-6fe8-06091608b572@redhat.com>
Message-ID: <bdaefe2a481fb2f830153dbef1496f16@assyoma.it>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Removing VG mappings using dmsetup tool
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
Cc: nsoffer@redhat.com, Vojtech Juranek <vjuranek@redhat.com>

Il 2020-06-23 22:28 Zdenek Kabelac ha scritto:
> Note - you cannot 'remove' mappings 'in-use'  (aka open count of a 
> device
> is higher then 0  - see 'dmsetup info -c' output for this).
> However you can replace such mapping with 'error' target - so the
> underlaying device is relaxed - although we do not support this
> in lvm2 - you would need to use 'dmsetup' for this (and open lvm2 RFE
> if there would be some serious justifaction).

Not related to oVirt, but I would find a means to set an error target 
with LVM quite useful - think about immediately stopping IO to/from 
device in case some serious error happended. Using lvm rather than 
dmsetup would be easier and less error prone.

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it [1]
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
