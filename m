Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EAFC6FA8E
	for <linux-lvm@archiver.kernel.org>; Thu,  2 Mar 2023 17:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677779056;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dU7S1Bvpbcm3MZ6diOXCBznBhTVXrYkI7nQVL1Cf6h0=;
	b=fo3S15nM2PrbXbmY+cDMJwBtPTCvhEGo+qRf1L+14LI26x7mxCgUkQhqAYab4BMEQVMZ7b
	Z9hZ5SGfM10w1agMTgX/ASjn4jvkv7hUoAyfrue5kqKhmq5AHg3EYe6HHEifjYSjAvk04X
	0hDyRWmVLvPgmfEiDiA/3WAy/aVughc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-72igKF5GO76p9Vr6KNwDIQ-1; Thu, 02 Mar 2023 12:44:15 -0500
X-MC-Unique: 72igKF5GO76p9Vr6KNwDIQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A8BB811E9C;
	Thu,  2 Mar 2023 17:44:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D5B30C16027;
	Thu,  2 Mar 2023 17:44:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B32C419452D0;
	Thu,  2 Mar 2023 17:44:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2FDD419452CD
 for <linux-lvm@listman.corp.redhat.com>; Thu,  2 Mar 2023 17:44:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0E15B1410DDA; Thu,  2 Mar 2023 17:44:09 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06577140EBF6
 for <linux-lvm@redhat.com>; Thu,  2 Mar 2023 17:44:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C48829AB402
 for <linux-lvm@redhat.com>; Thu,  2 Mar 2023 17:44:08 +0000 (UTC)
Received: from plutone.assyoma.it
 (host195-56-237-212.serverdedicati.aruba.it [212.237.56.195]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-354-l5-WLAqrP-eHF3j1o7yv0A-1; Thu,
 02 Mar 2023 12:44:05 -0500
X-MC-Unique: l5-WLAqrP-eHF3j1o7yv0A-1
Received: from webmail.assyoma.it (localhost [IPv6:::1])
 by plutone.assyoma.it (Postfix) with ESMTPA id 3CBD9C0E187F;
 Thu,  2 Mar 2023 18:34:04 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 02 Mar 2023 18:34:04 +0100
From: Gionatan Danti <g.danti@assyoma.it>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <CAAMCDeftn7gLN8s3EMFer+jJ95dRkdpR4007hDMqNNhjrbGDJA@mail.gmail.com>
References: <2023967259.761825.1677710640334.JavaMail.zimbra@karlsbakk.net>
 <CAAMCDeftn7gLN8s3EMFer+jJ95dRkdpR4007hDMqNNhjrbGDJA@mail.gmail.com>
Message-ID: <17a0cca9c38c6eb8384275f68a2b465f@assyoma.it>
X-Sender: g.danti@assyoma.it
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [linux-lvm] lvconvert --uncache takes hours
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
Cc: Roger Heflin <rogerheflin@gmail.com>, Malin Bruland <malin.bruland@pm.me>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Il 2023-03-02 01:51 Roger Heflin ha scritto:
> A spinning raid6 array is slow on writes (see raid6  write penalty).
> Because of that the array can only do about 100 write operattions/sec.

True. But does flushing cached data really proceed in random LBA order 
(as seen by HDDs), rather than trying to coalesce writes in linear 
fashion?

> If the disk is doing other work then it only has the extra capacity so
> it could destage slower.
> 
> A lot depends on how big each chunk is.     The lvmcache indicates the
> smallest chunksize is 32k.
> 
> 100G / 32k = 3 million, and at 100seeks/sec that comes to at least an 
> hour.

You are off an order of magnitude: 3 millions IOP at 100 IOPs means 
~30000s, so about 9 hours.

> Lvm bookkeeping has to also be written to the spinning disks I would
> think, so 2 hours if the array were idle.
> 
> Throw in a 50% baseload on the disks and you get 4 hours.
> 
> Hours is reasonable.

If flushing happens in random disk order, than yes, you are bound to 
wait several hours indeed.

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

