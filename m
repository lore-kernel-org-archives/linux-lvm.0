Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C19AC43334
	for <linux-lvm@archiver.kernel.org>; Thu, 16 Jun 2022 19:51:12 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-BmoGyVdbMWibujqAwFIRUw-1; Thu, 16 Jun 2022 15:51:07 -0400
X-MC-Unique: BmoGyVdbMWibujqAwFIRUw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34E981C13947;
	Thu, 16 Jun 2022 19:51:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DF9342026D2D;
	Thu, 16 Jun 2022 19:51:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7AFCB1947066;
	Thu, 16 Jun 2022 19:51:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 79ADB194705F
 for <linux-lvm@listman.corp.redhat.com>; Thu, 16 Jun 2022 19:50:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6DC102026987; Thu, 16 Jun 2022 19:50:58 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6983C2026985
 for <linux-lvm@redhat.com>; Thu, 16 Jun 2022 19:50:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EDD7185A7A4
 for <linux-lvm@redhat.com>; Thu, 16 Jun 2022 19:50:58 +0000 (UTC)
Received: from plutone.assyoma.it
 (host195-56-237-212.serverdedicati.aruba.it [212.237.56.195]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-rYwEyORMN76AYhy3peOOHg-1; Thu, 16 Jun 2022 15:50:55 -0400
X-MC-Unique: rYwEyORMN76AYhy3peOOHg-1
Received: from webmail.assyoma.it (localhost [IPv6:::1])
 by plutone.assyoma.it (Postfix) with ESMTPA id D849AFD860E;
 Thu, 16 Jun 2022 21:50:52 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 16 Jun 2022 21:50:52 +0200
From: Gionatan Danti <g.danti@assyoma.it>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <YqtYDgld/PAOLhpr@itl-email>
References: <9c22b11a-b539-1974-7994-6835eea82bfd@bytedance.com>
 <e779f9dc7139963adfa64b03eca170f3@assyoma.it>
 <8baee796-9bfb-47a8-1661-7e94437826c9@bytedance.com>
 <daaa5fa473c1ce56f9d9d4e149047fe6@assyoma.it>
 <5970db8d-462f-0e35-741c-fa0fdc188fa2@bytedance.com>
 <d927c03eef10c508161ad52daa7e908e@assyoma.it>
 <d354dfb0-c37e-8a85-6cf6-d4b3a7e9257d@bytedance.com>
 <Yqrhmwwbp5KfiEWb@itl-email> <7caac0c00c5c7cd93fdf50b62e2e7907@assyoma.it>
 <YqtYDgld/PAOLhpr@itl-email>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <171cb55d2d18b73cbbd3d264877a39d6@assyoma.it>
X-Sender: g.danti@assyoma.it
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [linux-lvm] Why is the performance of my lvmthin snapshot so
 poor
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-lvm/>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=subscribe>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Il 2022-06-16 18:19 Demi Marie Obenour ha scritto:
> Also heavy fragmentation can make journal replay very slow, to the 
> point
> of taking days on spinning hard drives.  Dave Chinner explains this 
> here:
> https://lore.kernel.org/linux-xfs/20220509230918.GP1098723@dread.disaster.area/.

Thanks, the linked thread was very interesting.

> Also poor out-of-space handling and unbounded worst-case latency.

Very true.

> Is this still a problem on NVMe storage?  HDDs will not really be fast
> no matter what one does, at least unless there is a write-back cache
> that can convert random I/O to sequential I/O.  Even that only helps
> much if your working set fits in cache, or if your workload is
> write-mostly.

One of the key features of ZFS is to transform random writes into 
sequential ones. With the right recordsize, and coupled with prefetch, 
compressed ARC and L2ARC, even HDD pool can be surprisingly usable.

For NVMe pools you should use a much lower recordsize to avoid 
read/write amplification, but not lower than 16K to not impair 
compression efficiency (unless you are storing mostly uncompressible 
stuff). That said, for pure NVMe storage (no compression or other data 
transformations) I think XFS, possibly with direct IO, is the fastest 
choice by a factor of 2x.

> It does not exist yet.  Joe Thornber would be the person to ask
> regarding any plans to create it.

Ok - I was hoping to miss something, but it is not the case.
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

