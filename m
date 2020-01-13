Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6D971005E2F
	for <linux-lvm@redhat.com>; Mon, 13 Jan 2020 15:25:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 849DE1019812
	for <linux-lvm@redhat.com>; Mon, 13 Jan 2020 15:25:17 +0000 (UTC)
References: <8788b5db-6667-6060-e66a-beab7d3a56fc@nebelschwaden.de>
	<1c4af753-8f20-c50d-37a4-a3d8d8f979f9@redhat.com>
	<fa490a40-1c58-f905-b5bb-93df3c9f22a2@assyoma.it>
	<ba1b5f76-88eb-67df-29bd-029813303200@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <6adaf224-ad46-1904-9fd3-f5b4527f3432@assyoma.it>
Date: Mon, 13 Jan 2020 16:25:10 +0100
MIME-Version: 1.0
In-Reply-To: <ba1b5f76-88eb-67df-29bd-029813303200@redhat.com>
Content-Language: it
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] metadata device too small
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>, listac@nebelschwaden.de

On 13/01/20 15:49, Zdenek Kabelac wrote:
> Hi
> 
> Well the size is 'almost' 16GiB - and when the size of thin-pools 
> metadata is always maintained by lvm2 - it's OK -  the size is 
> internally 'clamped' correctly - the problem is when you use this size 
> 'externally' - so you make 16GiB regular LV used for thin-repair - and 
> then you swap-in such LV into thin-pool.
> 
> So to make it clear - when you 'lvcreate' thin-pool with 16GiB of 
> metadata - it will work - but then when you will try to fix such 
> thin-pool - it will fail.  So it's always better to create thin-pool 
> with  -L15.812G then using  16G.

Understood, thank you so much.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
