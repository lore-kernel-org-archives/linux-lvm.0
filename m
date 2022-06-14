Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE0BC43334
	for <linux-lvm@archiver.kernel.org>; Tue, 14 Jun 2022 07:11:20 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-SL5eUUXmNDGM9CQ8_rdvOQ-1; Tue, 14 Jun 2022 03:11:16 -0400
X-MC-Unique: SL5eUUXmNDGM9CQ8_rdvOQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44BA6101E985;
	Tue, 14 Jun 2022 07:11:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2E1BE2166B26;
	Tue, 14 Jun 2022 07:11:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AE055194706F;
	Tue, 14 Jun 2022 07:11:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 265361947067
 for <linux-lvm@listman.corp.redhat.com>; Tue, 14 Jun 2022 07:11:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 135C11121319; Tue, 14 Jun 2022 07:11:10 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F7F51121314
 for <linux-lvm@redhat.com>; Tue, 14 Jun 2022 07:11:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED6BE185A7BA
 for <linux-lvm@redhat.com>; Tue, 14 Jun 2022 07:11:09 +0000 (UTC)
Received: from plutone.assyoma.it
 (host195-56-237-212.serverdedicati.aruba.it [212.237.56.195]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-5rWfLX8uNYW7bto7nIAFuw-1; Tue, 14 Jun 2022 03:11:07 -0400
X-MC-Unique: 5rWfLX8uNYW7bto7nIAFuw-1
Received: from webmail.assyoma.it (localhost [IPv6:::1])
 by plutone.assyoma.it (Postfix) with ESMTPA id D91BB1D59AA6;
 Tue, 14 Jun 2022 09:04:02 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 14 Jun 2022 09:04:02 +0200
From: Gionatan Danti <g.danti@assyoma.it>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <9c22b11a-b539-1974-7994-6835eea82bfd@bytedance.com>
References: <9c22b11a-b539-1974-7994-6835eea82bfd@bytedance.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <e779f9dc7139963adfa64b03eca170f3@assyoma.it>
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
Cc: Zhiyong Ye <yezhiyong@bytedance.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Il 2022-06-13 10:49 Zhiyong Ye ha scritto:
> The performance degradation after snapshotting is expected as writing
> to a snapshotted lv involving reading the original data, writing it
> elsewhere and then writing new data into the original chunk. But the
> performance loss was so much more than I expected. Is there any way to
> improve performance after creating a snapshot? Can I ask for your
> help?

This is the key point: when first writing to a new chunk, not only it 
needs to be allocated, but old data must be copied. This r/m/w operation 
transform an async operation (write) on a sync one (read), ruining 
performance. Subsequent writes to the same chunk does have the same 
issue.

The magnitute of the slowdown seems somewhat excessive, though. When 
dealing with HDD pools, I remember a 3-5x impact on IOPs. Can you show 
the exact fio command and the parameters of your thin pool (ie: chunk 
size) and storage subsystem (HDD vs SSD, SATA vs SAS vs NVME)?

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

