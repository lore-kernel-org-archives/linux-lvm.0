Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306A5C43334
	for <linux-lvm@archiver.kernel.org>; Wed, 15 Jun 2022 13:00:01 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-GsbfNJt9M1KDCt4LjEFnVA-1; Wed, 15 Jun 2022 08:59:58 -0400
X-MC-Unique: GsbfNJt9M1KDCt4LjEFnVA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2331B800971;
	Wed, 15 Jun 2022 12:59:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A7C802166B26;
	Wed, 15 Jun 2022 12:59:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1335D1947041;
	Wed, 15 Jun 2022 12:59:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8BF2019466DF
 for <linux-lvm@listman.corp.redhat.com>; Wed, 15 Jun 2022 12:40:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6AFC22026D64; Wed, 15 Jun 2022 12:40:49 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 670F42026D07
 for <linux-lvm@redhat.com>; Wed, 15 Jun 2022 12:40:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DCEA1C06EC7
 for <linux-lvm@redhat.com>; Wed, 15 Jun 2022 12:40:49 +0000 (UTC)
Received: from plutone.assyoma.it
 (host195-56-237-212.serverdedicati.aruba.it [212.237.56.195]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-kFyjHmswPMaVeoQZjqICSA-1; Wed, 15 Jun 2022 08:40:44 -0400
X-MC-Unique: kFyjHmswPMaVeoQZjqICSA-1
Received: from webmail.assyoma.it (localhost [IPv6:::1])
 by plutone.assyoma.it (Postfix) with ESMTPA id EBB381DDAED2;
 Wed, 15 Jun 2022 14:40:29 +0200 (CEST)
MIME-Version: 1.0
Date: Wed, 15 Jun 2022 14:40:29 +0200
From: Gionatan Danti <g.danti@assyoma.it>
To: Zhiyong Ye <yezhiyong@bytedance.com>
In-Reply-To: <ad5c7a16-1a66-488a-46c8-10bb3fdd6e60@bytedance.com>
References: <9c22b11a-b539-1974-7994-6835eea82bfd@bytedance.com>
 <e779f9dc7139963adfa64b03eca170f3@assyoma.it>
 <8baee796-9bfb-47a8-1661-7e94437826c9@bytedance.com>
 <daaa5fa473c1ce56f9d9d4e149047fe6@assyoma.it>
 <5970db8d-462f-0e35-741c-fa0fdc188fa2@bytedance.com>
 <d927c03eef10c508161ad52daa7e908e@assyoma.it>
 <d354dfb0-c37e-8a85-6cf6-d4b3a7e9257d@bytedance.com>
 <31a7b7e9ea9e60fe42d93f6f113fcaf0@assyoma.it>
 <ad5c7a16-1a66-488a-46c8-10bb3fdd6e60@bytedance.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <fd171a18d82d6f496d9d75c966278b88@assyoma.it>
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Il 2022-06-15 11:46 Zhiyong Ye ha scritto:
> I also think it meets expectations. But is there any other way to
> optimize snapshot performance at the code level? Does it help to
> reduce the chunksize size in the code, I see in the help documentation
> that the chunksize can only be 64k minimum.

I don't think forcing the code to use smaller recordsize is a good idea. 
Considering the hard limit on metadata size (16 GB max), 64K chunks are 
good for ~16 TB thin pool - already relatively small.

A, say, 16K recordsize would be good for a 4 TB pool only, an so on. 
Moreover, sequential performance will significantly suffer.

I think you have to accept the performance hit on first chunck 
allocation & rewrite.
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

