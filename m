Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C3CC2BB41
	for <linux-lvm@archiver.kernel.org>; Wed, 17 Aug 2022 19:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660763891;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TfLK+3p4VJm0L5E/x8/UFyz1g8Tr9Wt7+CoCrlWqbrk=;
	b=d8zeUfrnNePq1nTHljilXBmg9MfveOgrnazT6Ecc8y6r31Sj5dZs9BbBQp+EAUhxUcL/Ua
	RE+8SjIoyvX3++no5mPJ+73Py3ly8iT6wDp2LAa2bcDdi87wBgC4hJSsaIfKQuDFPrX3Gq
	7n5FMlpJl8ytBI808XU+FNW7iqLrljU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-6sTO6Y2cO9KroC1KxQb2uA-1; Wed, 17 Aug 2022 15:18:09 -0400
X-MC-Unique: 6sTO6Y2cO9KroC1KxQb2uA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B31A3C0D870;
	Wed, 17 Aug 2022 19:18:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B48D492CA5;
	Wed, 17 Aug 2022 19:18:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 11A56194E00A;
	Wed, 17 Aug 2022 19:18:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8EB92193F6F6
 for <linux-lvm@listman.corp.redhat.com>; Wed, 17 Aug 2022 19:13:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6B07C2026D07; Wed, 17 Aug 2022 19:13:56 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 675772026D4C
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 19:13:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51F7E101A586
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 19:13:56 +0000 (UTC)
Received: from plutone.assyoma.it
 (host195-56-237-212.serverdedicati.aruba.it [212.237.56.195]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-150-f_VsG4PPOECFaruBSDuD1g-1; Wed,
 17 Aug 2022 15:13:54 -0400
X-MC-Unique: f_VsG4PPOECFaruBSDuD1g-1
Received: from webmail.assyoma.it (localhost [IPv6:::1])
 by plutone.assyoma.it (Postfix) with ESMTPA id 7544BD5BD07;
 Wed, 17 Aug 2022 21:13:52 +0200 (CEST)
MIME-Version: 1.0
Date: Wed, 17 Aug 2022 21:13:52 +0200
From: Gionatan Danti <g.danti@assyoma.it>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <007c8163-7480-951c-c8b6-78fe47b3a874@gmail.com>
References: <20220816092820.6xbab36dcmxq5hfm@c73>
 <be332c6b-4b65-6462-c570-ee6d0e81b985@gmail.com>
 <20220816100802.yy3xqvynil4pcspb@c73>
 <204c332e-2a30-b17a-ecc1-58025454eb00@gmail.com>
 <20220817020225.gf6ooxobdf5xhpxe@c73>
 <6fa27852-e898-659f-76a5-52f50f0de898@gmail.com>
 <20220817084343.33la7o6fdh5txul4@c73>
 <27cd8fd6-1058-fe18-dab6-847d41bf894d@gmail.com>
 <20220817104732.jhu3ug6ahep3rnpq@c73>
 <b36cd2879a9ccaf25d0bb0389291e331adcc68c6.camel@suse.com>
 <727dcd28-99a2-739b-debd-a921e477e0d3@gmail.com>
 <4e0551e18a28ff602fae6e419dc746145e5962d3.camel@suse.com>
 <6be41a4e-9764-03ba-7231-911c733ffecd@gmail.com>
 <6a1d353d97a6dcdb658affe54b04c1be@assyoma.it>
 <007c8163-7480-951c-c8b6-78fe47b3a874@gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <2ae6f76fef28c1a4c96ddca7dc341949@assyoma.it>
X-Sender: g.danti@assyoma.it
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [linux-lvm] lvmpolld causes high cpu load issue
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
Cc: Heming Zhao <heming.zhao@suse.com>, teigland@redhat.com,
 Martin Wilck <martin.wilck@suse.com>,
 LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Il 2022-08-17 20:54 Zdenek Kabelac ha scritto:
> https://github.com/prajnoha/sid

Thanks for sharing. From the linked page:

"SID positions itself on top of udev, reacting to uevents. It is closely 
interlinked and cooperating with udev daemon. The udev daemon is 
enhanced with specialized sid udev builtin command that is used to 
communicate with SID. SID also listens to udev uevents issued by udev 
daemon which in turn triggers further processing."

For my untrained eyes, it seems an *additional* component relying on 
udev itself, so I am not sure on how it should solve the issue at hand.

But hey - anything that improve current sore spots is more than 
welcomed!

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

