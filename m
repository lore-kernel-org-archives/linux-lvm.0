Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21D5ECAAD5
	for <linux-lvm@archiver.kernel.org>; Sun, 28 Aug 2022 22:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661726334;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TjsmR+1D+97+Il7DGJ4ZL9rK7pTwiJFmi7YZFHO7OvY=;
	b=ckECeaUk1uT+oj2Hv4YB1nz08Uhcfxyktr293Fhj+zfV+JGh4UMAc5v0uWIzuaPdNYDvpE
	9RjgHAU8rYXhZyNhaOm3OXGpDpgnAlycdYIV41OjAgSznJx86zXdyZlUt7S1V+6xbS3qw2
	dTGrqV9kpEDj7yjCGs8Z9vgZNggGSrM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-82fQ-TEaPvevshaF7pZAow-1; Sun, 28 Aug 2022 18:38:51 -0400
X-MC-Unique: 82fQ-TEaPvevshaF7pZAow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24BD229AA3B3;
	Sun, 28 Aug 2022 22:38:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC4AB40C141D;
	Sun, 28 Aug 2022 22:38:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 83B5A1946A49;
	Sun, 28 Aug 2022 22:38:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 935CF1946A45
 for <linux-lvm@listman.corp.redhat.com>; Sun, 28 Aug 2022 22:38:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 72B4D2026D64; Sun, 28 Aug 2022 22:38:41 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F49A2026D4C
 for <linux-lvm@redhat.com>; Sun, 28 Aug 2022 22:38:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DC9D380670E
 for <linux-lvm@redhat.com>; Sun, 28 Aug 2022 22:38:41 +0000 (UTC)
Received: from yamato.tf-network.de (yamato.tf-network.de [93.186.202.221])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-jPHEAmbvPbetS_mjp9alSQ-1; Sun, 28 Aug 2022 18:38:38 -0400
X-MC-Unique: jPHEAmbvPbetS_mjp9alSQ-1
Received: from amavis3.tf-network.de ([IPv6:2001:4ba0:ffa0:1b::d1:221])
 by yamato.tf-network.de (Postfix) with ESMTP id 4MG7lJ3WyTz4CQr
 for <linux-lvm@redhat.com>; Mon, 29 Aug 2022 00:38:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at amavis3.tf-network.de
Received: from smtp.tf-network.de ([93.186.202.221])
 by amavis3.tf-network.de ([IPv6:2001:4ba0:ffa0:1b::d1:221]) (amavisd-new,
 port 10024) with LMTP id HRWRLLyzvqHB for <linux-lvm@redhat.com>;
 Mon, 29 Aug 2022 00:38:33 +0200 (CEST)
Received: from [10.1.0.10] (xdsl-89-0-82-26.nc.de [89.0.82.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.tf-network.de (Postfix) with ESMTPSA id 4MG7lF2N6Sz3wff
 for <linux-lvm@redhat.com>; Mon, 29 Aug 2022 00:38:33 +0200 (CEST)
Message-ID: <6123ac3e-9571-afc3-149a-71b412db2405@whissi.de>
Date: Mon, 29 Aug 2022 00:38:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
To: linux-lvm@redhat.com
References: <000101d8a432$08688fe0$1939afa0$@whissi.de>
 <d73e7506-a754-55d0-734f-084ffda1d6f2@gmail.com>
 <17c7871a-0849-bd03-40b6-146e338e364e@gmail.com>
 <000601d8a5e6$29a770d0$7cf65270$@whissi.de>
 <000901d8a61c$3adf2fb0$b09d8f10$@whissi.de>
 <63e2968a-cb32-fda5-8810-43f722ae2d28@gmail.com>
 <000c01d8a6d9$908f63e0$b1ae2ba0$@whissi.de>
From: Thomas Deutschmann <whissi@whissi.de>
In-Reply-To: <000c01d8a6d9$908f63e0$b1ae2ba0$@whissi.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Hi,

just for the records: My problem is now resolved.

As expected, my problem was caused by a bug in kernel. A patch was 
already merged into mainline: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e053aaf4da56cbf0afb33a0fda4a62188e2c0637

Backport for 5.15 and 5.19 is available but pending, 
https://www.spinics.net/lists/stable/msg588671.html.

Read 
https://lore.kernel.org/all/000401d8a746$3eaca200$bc05e600$@whissi.de/ 
for all details.

Thank you all for your help!


-- 
Regards,
Thomas

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

