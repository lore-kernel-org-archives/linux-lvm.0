Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C38320292BF
	for <linux-lvm@redhat.com>; Mon, 20 Jan 2020 15:54:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E84A9185A7A2
	for <linux-lvm@redhat.com>; Mon, 20 Jan 2020 15:54:31 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 20 Jan 2020 16:54:27 +0100
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <0d0d022b-93ea-156d-c408-49efbc31bbb2@redhat.com>
References: <cc1e366b92c320a306f5bd0aa2ec04d6@assyoma.it>
	<91c96949-ec5c-04f2-b198-368f1e04e957@redhat.com>
	<88bfd65fc15f59c8781ab3f626811f79@assyoma.it>
	<0d0d022b-93ea-156d-c408-49efbc31bbb2@redhat.com>
Message-ID: <57f24a244dc2fc665f77f8ba9f3cea1e@assyoma.it>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Time needed for take a snapshot
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Il 20-01-2020 15:40 Zdenek Kabelac ha scritto:
> Yep - kernel metadata 'per thin LV' are reasonably small - so even for
> big thin devices it still should fit within your time boundaries.
> (effectively thin snapshot just increases 'mapping' sharing between
> origin and its snapshot - so the time needed depends on how many bTree
> nodes needs to be updated - so if you would manage to create heavily
> fragmented multi TiB thinLV, the time depends on speed of you metadata
> device - as long as device is fast (i.e. >= SSD) - operation should be
> quick.
> But ATM there is no scientific proof for the worst case scenario.

Well, I'll do some tests and update here if finding anything 
interesting.
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
