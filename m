Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87CFD30001EA
	for <linux-lvm@redhat.com>; Sun, 15 Jul 2018 21:10:22 +0000 (UTC)
Received: from mr013msb.fastweb.it (mr013msb.fastweb.it [85.18.95.104])
	by mx1.redhat.com (Postfix) with ESMTP id 8A6B1914FB
	for <linux-lvm@redhat.com>; Sun, 15 Jul 2018 21:10:18 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sun, 15 Jul 2018 23:10:05 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <6c386d31-af38-93e7-dd29-14ebfb9eb0a9@gmail.com>
References: <6f854f20-3e62-0536-40ea-9ec21e112a6d@bytefoundry.com.au>
	<6c386d31-af38-93e7-dd29-14ebfb9eb0a9@gmail.com>
Message-ID: <24ea4a51c91f16d55c56cea1cc622db8@assyoma.it>
Subject: Re: [linux-lvm] Recovering from lvm thin metadata exhaustion
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
Cc: Dean Hamstead <dean@bytefoundry.com.au>

Il 15-07-2018 21:47 Zdenek Kabelac ha scritto:
Hi Zdenek,

> Hi
> 
> Try to open BZ like i.e. this one:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1532071

this is quite scary, especially considering no updates on the ticket in 
recent months. How did the OP solve the issue?

> Add all possible details (lvm2 version, kernel version, lvm2 
> metadata,...)
> and xz compressed dump  of _meta0  device.
> There is small hope that some metadata can be possibly restored with
> 'hand-extension' of thin_repair tool.

Any insight on what went wrong (yes, I know, metadata space was exausted 
- but it should not result in total volume loss, right)?

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
