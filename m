Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCAFC54EBD
	for <linux-lvm@archiver.kernel.org>; Mon,  9 Jan 2023 22:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673302731;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tomsOGYF9wYeM5sWYjmtfIxDx+nDca2PZQAJ+amsbhk=;
	b=ikOmO4EOW+f2KzQhjjf03flWLzcrmXjcjwTeNrSgGZp7nsMgIMvV/nOPIHuM1MHOq54un7
	QLRMlO5ZFua9feUeDiII7pHNjJ/IbHSsU56WfMZIsZ045SnP/aWwNokrzeIoo1vB+cBX/N
	GTLppjkxLgQaygHR7G2KD29wVjr2J4c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-L5cw3-xiNySYLT9AZhS6hw-1; Mon, 09 Jan 2023 17:18:48 -0500
X-MC-Unique: L5cw3-xiNySYLT9AZhS6hw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DF6829AB3F9;
	Mon,  9 Jan 2023 22:18:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 155972166B26;
	Mon,  9 Jan 2023 22:18:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C55D51949751;
	Mon,  9 Jan 2023 22:18:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 523671946587
 for <linux-lvm@listman.corp.redhat.com>; Mon,  9 Jan 2023 22:18:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1062440C1060; Mon,  9 Jan 2023 22:18:38 +0000 (UTC)
Received: from [10.40.195.83] (ovpn-195-83.brq.redhat.com [10.40.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7346740C1141;
 Mon,  9 Jan 2023 22:18:37 +0000 (UTC)
Message-ID: <255eaaae-e30b-2e69-cc03-38ca34902d16@redhat.com>
Date: Mon, 9 Jan 2023 23:18:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Zhiyong Ye <yezhiyong@bytedance.com>
References: <eed877f5-53f5-101b-44ab-a61f1328e62f@bytedance.com>
 <930cea69-8e7a-d0df-a48c-93e7a668be2f@redhat.com>
 <d2c5bef2-a418-049e-1ff8-160375881e90@bytedance.com>
 <2b1466c2-f545-d06a-6ce4-d420ed038ad1@gmail.com>
 <ffd6b6d7-c197-1e3a-4b9b-c6fe8271a82d@bytedance.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
In-Reply-To: <ffd6b6d7-c197-1e3a-4b9b-c6fe8271a82d@bytedance.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [linux-lvm] The feasibility of implementing an alternative
 snapshot approach
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 09. 01. 23 v 7:21 Zhiyong Ye napsal(a):
> Hi Zdenek,
> 
> Thank you for your detailed answer.
> 
> For the thin snapshot I will use the latest version of kernel and lvm for 
> further testing. I want to use both snapshot methods (thin and thick) in the 
> production environment. But if the thick snapshot is only still in the 
> maintenance phase, then for thick lv I have to see if there is any other way 
> to accomplish the snapshot function.

FYI - there are still some delays with up-streaming of the latest improvement 
patches - so stay tuned for further speedup gains & IO throughput with thin 
provisioning)

By the maintenance phase for old thick snapshot I mean - the development of 
the existing thick snapshot target is basically done - the format is very 
ancient and cannot be changed without major rewrite of the whole snapshot 
target as such - and that's what we've made with newly introduced 
thin-provisioning target which addressed many shortcomings of the old 
dm-snapshot target.

> I use lvm mainly for virtualized environments. Each lv acts as a block device 
> of the virtual machine. So I also consider using qemu's own snapshot feature. 
> When qemu creates a snapshot, the original image used by the virtual machine 
> becomes read-only, and all write changes are stored in the new snapshot. But 
> currently qemu's snapshots only support files, not block devices.

Depending on the use-case it might matter to pick the best fitting chunk-size.
i.e. if the changes are 'localized' in the filesystem areas to match thin-pool 
chunks (also selection of the filesystem itself might be part of equation 
here) - even if you use snapshots a lot, you may eventually get better result 
with bigger chunks like 128k or even 256k size instead of default 64K.

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

