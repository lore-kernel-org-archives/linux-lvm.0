Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 969EC60619
	for <linux-lvm@redhat.com>; Wed, 23 Oct 2019 06:58:56 +0000 (UTC)
Received: from mr011msb.fastweb.it (mr011msb.fastweb.it [85.18.95.108])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CBE623082E03
	for <linux-lvm@redhat.com>; Wed, 23 Oct 2019 06:58:52 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 23 Oct 2019 08:58:45 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <alpine.LRH.2.21.1910221846190.5121@fairfax.gathman.org>
References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
	<def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
	<f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
	<alpine.LRH.2.21.1910221142290.1156@fairfax.gathman.org>
	<9e58accdc28692b3c8b2b09f37bce57c@assyoma.it>
	<alpine.LRH.2.21.1910221846190.5121@fairfax.gathman.org>
Message-ID: <df172328d6043d90506718605a4a812e@assyoma.it>
Subject: Re: [linux-lvm] exposing snapshot block device
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
To: "Stuart D. Gathman" <stuart@gathman.org>
Cc: =?UTF-8?Q?Dalebj=C3=B6rk=2C_Tomas?= <tomas.dalebjork@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

Il 23-10-2019 00:53 Stuart D. Gathman ha scritto:
> If you can find all the leaf nodes belonging to the root (in my btree
> database they are marked with the root id and can be found by 
> sequential
> scan of the volume), then reconstructing the btree data is
> straightforward - even in place.
> 
> I remember realizing this was the only way to recover a major 
> customer's
> data - and had the utility written, tested, and applied in a 36 hour
> programming marathon (which I hope to never repeat).  If this hasn't
> occured to thin pool programmers, I am happy to flesh out the 
> procedure.
> Having such a utility available as a last resort would ratchet up the
> reliability of thin pools.

Very interesting. Can I ask you what product/database you recovered?

Anyway, giving similar ability to thin Vols would be awesome.

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
