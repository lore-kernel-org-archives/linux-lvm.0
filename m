Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73446C19F2C
	for <linux-lvm@archiver.kernel.org>; Mon,  1 Aug 2022 20:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659386117;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QEl5gZPkA7Hk6wbuuVNZ7y0qhHD8EORCA+vAjzid9FQ=;
	b=KvdEM1cimhFww5YkojDvtTesqVWCD02KEcT3PPa68kb9OsvZbUllArpvkqS0cXS2fTjpYU
	Z0buXyrtSlEqVFOAxoxNEVge/GdlJrWwoscPnz1t1UOd6qhR3MxFSq9GK43tHKJvuarknJ
	V6lC4s6/j+3FeOnwuPMt8TPTdJ2AiW8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-vFZsAHRXPiGbmKH2xKvUwQ-1; Mon, 01 Aug 2022 16:35:14 -0400
X-MC-Unique: vFZsAHRXPiGbmKH2xKvUwQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33EDA101A588;
	Mon,  1 Aug 2022 20:35:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6FEFB2026D64;
	Mon,  1 Aug 2022 20:35:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4EC7E1946A47;
	Mon,  1 Aug 2022 20:35:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7C4A51946A41
 for <linux-lvm@listman.corp.redhat.com>; Mon,  1 Aug 2022 20:35:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6464D492CA2; Mon,  1 Aug 2022 20:35:03 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 608A2492C3B
 for <linux-lvm@redhat.com>; Mon,  1 Aug 2022 20:35:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49F753833281
 for <linux-lvm@redhat.com>; Mon,  1 Aug 2022 20:35:03 +0000 (UTC)
Received: from yamato.tf-network.de (yamato.tf-network.de [93.186.202.221])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-1qq9VjvAODqIWrgjjiPZzA-1; Mon, 01 Aug 2022 16:35:01 -0400
X-MC-Unique: 1qq9VjvAODqIWrgjjiPZzA-1
Received: from amavis3.tf-network.de ([IPv6:2001:4ba0:ffa0:1b::d1:221])
 by yamato.tf-network.de (Postfix) with ESMTP id 4LxVH65WgGz4Rg7
 for <linux-lvm@redhat.com>; Mon,  1 Aug 2022 22:34:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at amavis3.tf-network.de
Received: from smtp.tf-network.de ([93.186.202.221])
 by amavis3.tf-network.de ([IPv6:2001:4ba0:ffa0:1b::d1:221]) (amavisd-new,
 port 10024) with LMTP id 1B9bY4aifubM for <linux-lvm@redhat.com>;
 Mon,  1 Aug 2022 22:34:58 +0200 (CEST)
Received: from data (2a0a-a546-4e33-0-8d75-b483-dcce-df26.ipv6dyn.netcologne.de
 [IPv6:2a0a:a546:4e33:0:8d75:b483:dcce:df26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by securesmtp.tf-network.de (Postfix) with ESMTPSA id 4LxVH61drHz4R4W
 for <linux-lvm@redhat.com>; Mon,  1 Aug 2022 22:34:58 +0200 (CEST)
From: "Thomas Deutschmann" <whissi@whissi.de>
To: "LVM general discussion and development" <linux-lvm@redhat.com>
References: <000101d8a432$08688fe0$1939afa0$@whissi.de>
 <d73e7506-a754-55d0-734f-084ffda1d6f2@gmail.com>
 <17c7871a-0849-bd03-40b6-146e338e364e@gmail.com>
In-Reply-To: <17c7871a-0849-bd03-40b6-146e338e364e@gmail.com>
Date: Mon, 1 Aug 2022 22:34:56 +0200
Message-ID: <000601d8a5e6$29a770d0$7cf65270$@whissi.de>
MIME-Version: 1.0
Thread-Index: AQHYpcxN9zKqPKFYKkmeF5SvHEfebK2aLKiAgABTfpA=
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I think there is a misunderstanding.

I am not calling LVM from any container.

I am calling LVM from the host system.

Also, please don't get confused that I mentioned systemd-nspawn. I am able to reproduce this problem without any container running on the host system.

Any other idea?

Thanks!

-- 
Regards,
Thomas


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

