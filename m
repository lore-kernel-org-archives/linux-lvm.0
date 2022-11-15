Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3BDC433FE
	for <linux-lvm@archiver.kernel.org>; Tue, 15 Nov 2022 22:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668552118;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EM6j9ykwKg1p543D4eTxwIJyH/LskGeKcqq2ivr2xPw=;
	b=Jry2tln+bRPVlWXbg5qcqbmSUbhY9IYD5G9VGR+1SlTMMBkW/6fJO8zHDoM9LJe5sCnTAQ
	XS+kROqWW8WCnst7Qxm1BHEAp9sPjLP39YB98Ir/2X5GN4zYJNmY0IUwR2QRKqk4Sv9nsB
	pAv8ppEdmIwun2uzyYeJWyXKgHPGsp4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-d20GEoMXMeWDpmRSarTK5Q-1; Tue, 15 Nov 2022 17:41:56 -0500
X-MC-Unique: d20GEoMXMeWDpmRSarTK5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B915929AB40F;
	Tue, 15 Nov 2022 22:41:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 20475112131E;
	Tue, 15 Nov 2022 22:41:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D211819465A2;
	Tue, 15 Nov 2022 22:41:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4E8F91946597
 for <linux-lvm@listman.corp.redhat.com>; Tue, 15 Nov 2022 22:41:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3B65049BB66; Tue, 15 Nov 2022 22:41:50 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 339A149BB60
 for <linux-lvm@redhat.com>; Tue, 15 Nov 2022 22:41:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CB9985A583
 for <linux-lvm@redhat.com>; Tue, 15 Nov 2022 22:41:49 +0000 (UTC)
Received: from plutone.assyoma.it
 (host195-56-237-212.serverdedicati.aruba.it [212.237.56.195]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-212-abFtEO3uNQ6GcRuwpQeTaQ-1; Tue,
 15 Nov 2022 17:41:47 -0500
X-MC-Unique: abFtEO3uNQ6GcRuwpQeTaQ-1
Received: from webmail.assyoma.it (localhost [IPv6:::1])
 by plutone.assyoma.it (Postfix) with ESMTPA id D195B190BA9A;
 Tue, 15 Nov 2022 23:41:44 +0100 (CET)
MIME-Version: 1.0
Date: Tue, 15 Nov 2022 23:41:44 +0100
From: Gionatan Danti <g.danti@assyoma.it>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <0c1d5e76-085c-cb46-c477-3bcd70a8acb2@gmail.com>
References: <8404c979411230748aa52deacca89cd8@assyoma.it>
 <0c1d5e76-085c-cb46-c477-3bcd70a8acb2@gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <df0c4d08b1973c2b506323003f201796@assyoma.it>
X-Sender: g.danti@assyoma.it
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [linux-lvm] lvm-vdo, snapshots and cache
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Il 2022-11-15 22:56 Zdenek Kabelac ha scritto:
> You could try  'vg' on top of another 'vg' - however I'd not recommend
> to use it this way (and it's unssuported (&unsupportable) by lvm2 in
> general)

Hi Zdenek,
yeah, I would strongly avoid that outside lab testing.

> IMHO I'd not recommend to combine 2 provisioning technologies - it's
> already hard to resolve 'out-of-space' troubles with just one
> technology...

The issue is that fast snapshots are only provided by dm-thin, meaning 
that lvmthin is almost mandatory for implementing a rolling/continuous 
snapshot scheme. And, on a more basic level, if we can not stack LVM on 
top of a VDO LV (in a supported manner), how can we take a snapshot of 
user data residing on that specific volume?

This seems a clear regression vs a separate VDO device. Am I missing 
something?

> Caching should be already support - on VDO LV as well as on VDOPOOL LV
> (both work somewhat differently).

Good, thanks for confirming. I will do some tests...
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

