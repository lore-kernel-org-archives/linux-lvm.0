Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 442C920316E8
	for <linux-lvm@redhat.com>; Mon, 20 Jan 2020 10:36:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E225185B0A8
	for <linux-lvm@redhat.com>; Mon, 20 Jan 2020 10:36:36 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 20 Jan 2020 11:36:30 +0100
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <91c96949-ec5c-04f2-b198-368f1e04e957@redhat.com>
References: <cc1e366b92c320a306f5bd0aa2ec04d6@assyoma.it>
	<91c96949-ec5c-04f2-b198-368f1e04e957@redhat.com>
Message-ID: <88bfd65fc15f59c8781ab3f626811f79@assyoma.it>
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

Il 20-01-2020 10:22 Zdenek Kabelac ha scritto:
> So having  thousands of LVs in a single VG will become probably your 
> bottleneck.

Hi Zdenek, I was thinking more about having few LVs, but with different 
amount of data/mapping.

For example, is a very fragmented volume (ie: one written randomically) 
significantly slower to snapshot than an almost empty volume? I fully 
expect some small difference; however, if an empty volume take 0.2s and 
a fragmented one 20s, this would surely be significant.

Note that I never had such a slow snapshot, rather, even on aged and big 
volumes, it always take <1s. However, other experiences are welcome.

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
