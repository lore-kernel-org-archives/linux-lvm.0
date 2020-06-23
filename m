Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC0BBC6122
	for <linux-lvm@redhat.com>; Tue, 23 Jun 2020 21:34:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA62E185A78B
	for <linux-lvm@redhat.com>; Tue, 23 Jun 2020 21:34:16 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 23 Jun 2020 23:34:09 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <c175cc56-252b-d349-ebec-85e3683a7773@redhat.com>
References: <1643811.X513TT2pbd@localhost.localdomain>
	<dff2c51f-70a9-3339-6fe8-06091608b572@redhat.com>
	<bdaefe2a481fb2f830153dbef1496f16@assyoma.it>
	<c175cc56-252b-d349-ebec-85e3683a7773@redhat.com>
Message-ID: <d3cc86165ae3e27950b359dbf4eae1fe@assyoma.it>
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: nsoffer@redhat.com, Vojtech Juranek <vjuranek@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

Il 2020-06-23 23:02 Zdenek Kabelac ha scritto:
> Hi
> 
> ATM skilled admin can always easily enforce:
> 
> 'dmsetup remove --force   vg-lv'

Hi Zdenek,
sure, but I find messing with dmsetup more error prone than using an LVM 
command.

> for i.e. linear devices to achieve this goal - however resolving this
> at lvm2 is actually way more complex task when you start to consider
> the situation
> should be at least 'somehow' recoverable - it's quite complicated and
> not really highly demanded functionality.
> It's more simple if you have constrained world of known types of 
> devices
> and known use-case you are targeting to solve.

Would be an initial minimal support userful? For example, something as 
"lvchange --error vg/lvm" which will only work on simple setup, while on 
more complex ones would simply print a warning and return with exit code 
1.

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it [1]
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
