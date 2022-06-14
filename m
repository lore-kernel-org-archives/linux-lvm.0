Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D067C43334
	for <linux-lvm@archiver.kernel.org>; Tue, 14 Jun 2022 14:54:48 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-DQ9Xo27PMCypFnHQOntKbw-1; Tue, 14 Jun 2022 10:54:44 -0400
X-MC-Unique: DQ9Xo27PMCypFnHQOntKbw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6400A38173C0;
	Tue, 14 Jun 2022 14:54:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 101AD9D7F;
	Tue, 14 Jun 2022 14:54:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B27A11947070;
	Tue, 14 Jun 2022 14:54:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E41ED1947067
 for <linux-lvm@listman.corp.redhat.com>; Tue, 14 Jun 2022 14:54:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D13D8492CA4; Tue, 14 Jun 2022 14:54:33 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD3C3492C3B
 for <linux-lvm@redhat.com>; Tue, 14 Jun 2022 14:54:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9BCF801756
 for <linux-lvm@redhat.com>; Tue, 14 Jun 2022 14:54:33 +0000 (UTC)
Received: from plutone.assyoma.it
 (host195-56-237-212.serverdedicati.aruba.it [212.237.56.195]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-0qHBzE7SNbCJhx_VtD-kKw-1; Tue, 14 Jun 2022 10:54:31 -0400
X-MC-Unique: 0qHBzE7SNbCJhx_VtD-kKw-1
Received: from webmail.assyoma.it (localhost [IPv6:::1])
 by plutone.assyoma.it (Postfix) with ESMTPA id 508C71C9FD71;
 Tue, 14 Jun 2022 16:54:28 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 14 Jun 2022 16:54:28 +0200
From: Gionatan Danti <g.danti@assyoma.it>
To: Zhiyong Ye <yezhiyong@bytedance.com>
In-Reply-To: <5970db8d-462f-0e35-741c-fa0fdc188fa2@bytedance.com>
References: <9c22b11a-b539-1974-7994-6835eea82bfd@bytedance.com>
 <e779f9dc7139963adfa64b03eca170f3@assyoma.it>
 <8baee796-9bfb-47a8-1661-7e94437826c9@bytedance.com>
 <daaa5fa473c1ce56f9d9d4e149047fe6@assyoma.it>
 <5970db8d-462f-0e35-741c-fa0fdc188fa2@bytedance.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <d927c03eef10c508161ad52daa7e908e@assyoma.it>
X-Sender: g.danti@assyoma.it
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Il 2022-06-14 15:29 Zhiyong Ye ha scritto:
> The reason for this may be that when the volume creates a snapshot,
> each write to an existing block will cause a COW (Copy-on-write), and
> the COW is a copy of the entire data block in chunksize, for example,
> when the chunksize is 64k, even if only 4k of data is written, the
> entire 64k data block will be copied. I'm not sure if I understand
> this correctly.

Yes, in your case, the added copies are lowering total available IOPs. 
But note how the decrease is sub-linear (from 64K to 1M you have a 16x 
increase in chunk size but "only" a 10x hit in IOPs): this is due to the 
lowered metadata overhead.

A last try: if you can, please regenerate your thin volume with 64K 
chunks and set fio to execute 64K requests. Lets see if LVM is at least 
smart enough to avoid coping a to-be-completely-overwritten chunks.

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

