Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F33C00140
	for <linux-lvm@archiver.kernel.org>; Wed,  3 Aug 2022 01:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659490657;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hR1BjX5R/ETGcSn2pYdZIrxFloBrrRK9CyNYJ5a/GYY=;
	b=dla339fNQxIh7K4apaXAZ4j0UQr3a/fN9lxpKBfYaE4qrNKQK/svUcYj/c8BT7wmdQTOfb
	5XBP02HUFRXdh/yt0RneaOFnkqvwAE2yzmpbhCwNLdfKlPU+NAIuIUn1pdY5aycazbeqY2
	wi3G2Lm3N0DK6rSY+TtnSJOSjhQKWMM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-y4EbzN7hP8yzE-ly6QjonA-1; Tue, 02 Aug 2022 21:37:36 -0400
X-MC-Unique: y4EbzN7hP8yzE-ly6QjonA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2224811E76;
	Wed,  3 Aug 2022 01:37:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A45B3492C3B;
	Wed,  3 Aug 2022 01:37:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6918B1946A53;
	Wed,  3 Aug 2022 01:37:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C79521946A4A
 for <linux-lvm@listman.corp.redhat.com>; Wed,  3 Aug 2022 01:37:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ACFB91121315; Wed,  3 Aug 2022 01:37:27 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A95591121314
 for <linux-lvm@redhat.com>; Wed,  3 Aug 2022 01:37:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D01D85A586
 for <linux-lvm@redhat.com>; Wed,  3 Aug 2022 01:37:27 +0000 (UTC)
Received: from yamato.tf-network.de (yamato.tf-network.de [93.186.202.221])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-oCxhkbukPFy5CjTrQgnbJw-1; Tue, 02 Aug 2022 21:37:25 -0400
X-MC-Unique: oCxhkbukPFy5CjTrQgnbJw-1
Received: from amavis3.tf-network.de ([IPv6:2001:4ba0:ffa0:1b::d1:221])
 by yamato.tf-network.de (Postfix) with ESMTP id 4LyDxb4Ht3z4R4W
 for <linux-lvm@redhat.com>; Wed,  3 Aug 2022 03:37:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at amavis3.tf-network.de
Received: from smtp.tf-network.de ([93.186.202.221])
 by amavis3.tf-network.de ([IPv6:2001:4ba0:ffa0:1b::d1:221]) (amavisd-new,
 port 10024) with LMTP id e-aBO07FTtIw for <linux-lvm@redhat.com>;
 Wed,  3 Aug 2022 03:37:22 +0200 (CEST)
Received: from data (2a0a-a546-da46-0-8d75-b483-dcce-df26.ipv6dyn.netcologne.de
 [IPv6:2a0a:a546:da46:0:8d75:b483:dcce:df26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by securesmtp.tf-network.de (Postfix) with ESMTPSA id 4LyDxZ41djz440K
 for <linux-lvm@redhat.com>; Wed,  3 Aug 2022 03:37:22 +0200 (CEST)
From: "Thomas Deutschmann" <whissi@whissi.de>
To: "LVM general discussion and development" <linux-lvm@redhat.com>
References: <000101d8a432$08688fe0$1939afa0$@whissi.de>
 <d73e7506-a754-55d0-734f-084ffda1d6f2@gmail.com>
 <17c7871a-0849-bd03-40b6-146e338e364e@gmail.com>
 <000601d8a5e6$29a770d0$7cf65270$@whissi.de>
 <000901d8a61c$3adf2fb0$b09d8f10$@whissi.de>
 <63e2968a-cb32-fda5-8810-43f722ae2d28@gmail.com>
In-Reply-To: <63e2968a-cb32-fda5-8810-43f722ae2d28@gmail.com>
Date: Wed, 3 Aug 2022 03:37:16 +0200
Message-ID: <000c01d8a6d9$908f63e0$b1ae2ba0$@whissi.de>
MIME-Version: 1.0
Thread-Index: AQHYpn+NelZod2m62UuK5jG20UbHAK2cXJHw
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: Re: [linux-lvm] lvcreate hangs forever during snapshot creation
 when suspending volume
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
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Zdenek Kabelac wrote:
> So as guessed earlier - unrelated to lvm2.

Yes. And thank you for pointing me to fsfreeze.


> You likely need to discover what is wrong with your 'raid' device ?
> Was your raid array fully synchronized ?
> 
> Do you have only problem with one particular  MD 'raid' on your system - or 
> any other 'raid' you attach/create will suffer the same problem ?
>
> Is it 'nvme' related on your system ?
>
> Are the 'individual' nvme  devices running fine - just when they are mixed 
> together into a single array you get these  'fsfreeze' troubles ?

I think it is unrelated to the mdraid because I was able to reproduce
the problem with a single nvme device which I removed from the raid array.

However, I tried different kernel versions:

- Brand new 5.19 is showing same problem
- 5.16 was the last working kernel

So I run bisect which revealed

> md: add support for REQ_NOWAIT
> 
> commit 021a24460dc2 ("block: add QUEUE_FLAG_NOWAIT") added support
> for checking whether a given bdev supports handling of REQ_NOWAIT or not.
> Since then commit 6abc49468eea ("dm: add support for REQ_NOWAIT and enable
> it for linear target") added support for REQ_NOWAIT for dm. This uses
> a similar approach to incorporate REQ_NOWAIT for md based bios.
> 
> This patch was tested using t/io_uring tool within FIO. A nvme drive
> was partitioned into 2 partitions and a simple raid 0 configuration
> /dev/md0 was created.
> 
> md0 : active raid0 nvme4n1p1[1] nvme4n1p2[0]
>       937423872 blocks super 1.2 512k chunks
> 
> Before patch:
> 
> $ ./t/io_uring /dev/md0 -p 0 -a 0 -d 1 -r 100
> 
> Running top while the above runs:
> 
> $ ps -eL | grep $(pidof io_uring)
> 
>   38396   38396 pts/2    00:00:00 io_uring
>   38396   38397 pts/2    00:00:15 io_uring
>   38396   38398 pts/2    00:00:13 iou-wrk-38397
> 
> We can see iou-wrk-38397 io worker thread created which gets created
> when io_uring sees that the underlying device (/dev/md0 in this case)
> doesn't support nowait.
> 
> After patch:
> 
> $ ./t/io_uring /dev/md0 -p 0 -a 0 -d 1 -r 100
> 
> Running top while the above runs:
> 
> $ ps -eL | grep $(pidof io_uring)
> 
>   38341   38341 pts/2    00:10:22 io_uring
>   38341   38342 pts/2    00:10:37 io_uring
> 
> After running this patch, we don't see any io worker thread
> being created which indicated that io_uring saw that the
> underlying device does support nowait. This is the exact behaviour
> noticed on a dm device which also supports nowait.
> 
> For all the other raid personalities except raid0, we would need
> to train pieces which involves make_request fn in order for them
> to correctly handle REQ_NOWAIT.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f51d46d0e7cb5b8494aa534d276a9d8915a2443d

as bad commit.

Building latest kernel with this commit reverted (and reverting follow up fix
0f9650bd838efe5c52f7e5f40c3204ad59f1964d, too) fixes the problem
for me.

What I do _not_ understand yet: It's a change in md driver -- how could
that change affect the single device I pulled off the array?

However, during bisect I only tested against the mdraid array. Maybe there
is another "nowait" issue or a specific problem with "REQ_NOWAIT" and
the Dell OEM nvme devices...

I'll post to LKML shortly, thanks!


-- 
Regards,
Thomas


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

