Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49695C43334
	for <linux-lvm@archiver.kernel.org>; Thu, 16 Jun 2022 13:22:29 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-ao4Et6lfM6uR9kp4d0VstA-1; Thu, 16 Jun 2022 09:22:25 -0400
X-MC-Unique: ao4Et6lfM6uR9kp4d0VstA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE8563C0E216;
	Thu, 16 Jun 2022 13:22:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4894140334E;
	Thu, 16 Jun 2022 13:22:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1670B194705F;
	Thu, 16 Jun 2022 13:22:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5829B194705A
 for <linux-lvm@listman.corp.redhat.com>; Thu, 16 Jun 2022 13:22:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 452A61121319; Thu, 16 Jun 2022 13:22:14 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40A541121314
 for <linux-lvm@redhat.com>; Thu, 16 Jun 2022 13:22:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BB2C3C0E20D
 for <linux-lvm@redhat.com>; Thu, 16 Jun 2022 13:22:14 +0000 (UTC)
Received: from plutone.assyoma.it
 (host195-56-237-212.serverdedicati.aruba.it [212.237.56.195]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-jgI3DJ7gPnq31iNhRIpQhA-1; Thu, 16 Jun 2022 09:22:11 -0400
X-MC-Unique: jgI3DJ7gPnq31iNhRIpQhA-1
Received: from webmail.assyoma.it (localhost [IPv6:::1])
 by plutone.assyoma.it (Postfix) with ESMTPA id 188EBDF4F6CC;
 Thu, 16 Jun 2022 15:22:09 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 16 Jun 2022 15:22:09 +0200
From: Gionatan Danti <g.danti@assyoma.it>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
In-Reply-To: <Yqrhmwwbp5KfiEWb@itl-email>
References: <9c22b11a-b539-1974-7994-6835eea82bfd@bytedance.com>
 <e779f9dc7139963adfa64b03eca170f3@assyoma.it>
 <8baee796-9bfb-47a8-1661-7e94437826c9@bytedance.com>
 <daaa5fa473c1ce56f9d9d4e149047fe6@assyoma.it>
 <5970db8d-462f-0e35-741c-fa0fdc188fa2@bytedance.com>
 <d927c03eef10c508161ad52daa7e908e@assyoma.it>
 <d354dfb0-c37e-8a85-6cf6-d4b3a7e9257d@bytedance.com>
 <Yqrhmwwbp5KfiEWb@itl-email>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <7caac0c00c5c7cd93fdf50b62e2e7907@assyoma.it>
X-Sender: g.danti@assyoma.it
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Il 2022-06-16 09:53 Demi Marie Obenour ha scritto:
> That seems reasonable.  My conclusion is that dm-thin (which is what 
> LVM
> uses) is not a good fit for workloads with a lot of small random writes
> and frequent snapshots, due to the 64k minimum chunk size.  This also
> explains why dm-thin does not allow smaller blocks: not only would it
> only support very small thin pools, it would also have massive metadata
> write overhead.  Hopefully dm-thin v2 will improve the situation.

I think that, in this case, no free lunch really exists. I tried the 
following thin provisioning methods, each with its strong & weak points:

lvmthin: probably the more flexible of the mainline kernel options. You 
pay for r/m/w only when allocating a small block (say 4K) the first time 
after taking a snapshot. It is fast and well integrated with lvm command 
line. Con: bad behavior on out-of-space condition

xfs + reflink: a great, simple to use tool when applicable. It has a 
very small granularity (4K) with no r/m/w. Cons: requires fine tuning 
for good performance when reflinking big files; IO freezes during 
metadata copy for reflink; a very small granularity means sequential IO 
is going to suffer heavily (see here for more details: 
https://marc.info/?l=linux-xfs&m=157891132109888&w=2)

btrfs: very small granularity (4K) and many integrated features. Cons: 
bad performance overall, especially when using mechanical HDD

vdo: is provides small granularity (4K) thin provisioning, compression 
and deduplication. Cons: (still) out-of-tree; requires a powerloss 
protected writeback cache to maintain good performance; no snapshot 
capability

zfs: designed for the ground up for pervasive CoW, with many features 
and ARC/L2ARC. Cons: out-of-tree; using small granularity (4K) means bad 
overall performance; using big granularity (128K by default) is a 
necessary compromise for most HDD pools.

For what it is worth, I settled on ZFS when using out-of-tree modules is 
not an issue and lvmthin otherwise (but I plan to use xfs + reflink more 
in the future).

Do you have any information to share about dm-thin v2? I heard about it 
some years ago, but I found no recent info.

Regards.

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

