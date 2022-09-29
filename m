Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A34EC433F5
	for <linux-lvm@archiver.kernel.org>; Thu, 29 Sep 2022 11:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664452443;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Qmi2h6beqKvh2Lb+FygcEb+XjA+Ef7jssRC0v4ZH198=;
	b=Sib1o0n5XZXs2/ZYw8k3uRy2ZBckmPwEC5H795xnJadSedmQxf/O1vrVnMqYdQ1rV7aljE
	3Sgix+6YFR6kp9pGY+ErL/5T47Em/xsKwELKt/+Ywllm6TSgZg/uy6zcmqluDH8vBTgRfa
	JtdJk0XKDhOJzSBTM96/GAfvJRk8eyo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-l7SFTsoWMO2Qf8YdkbSZTQ-1; Thu, 29 Sep 2022 07:54:00 -0400
X-MC-Unique: l7SFTsoWMO2Qf8YdkbSZTQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A15C3833286;
	Thu, 29 Sep 2022 11:53:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD576492B05;
	Thu, 29 Sep 2022 11:53:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 862A51946A47;
	Thu, 29 Sep 2022 11:53:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 508D019465B8
 for <linux-lvm@listman.corp.redhat.com>; Thu, 29 Sep 2022 11:53:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2E59A63AEE; Thu, 29 Sep 2022 11:53:52 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24CA123177
 for <linux-lvm@redhat.com>; Thu, 29 Sep 2022 11:53:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D93F13C0F42B
 for <linux-lvm@redhat.com>; Thu, 29 Sep 2022 11:53:51 +0000 (UTC)
Received: from plutone.assyoma.it
 (host195-56-237-212.serverdedicati.aruba.it [212.237.56.195]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-8-YapT-ut2Nt22_QpVWccqsQ-1; Thu,
 29 Sep 2022 07:53:49 -0400
X-MC-Unique: YapT-ut2Nt22_QpVWccqsQ-1
Received: from webmail.assyoma.it (localhost [IPv6:::1])
 by plutone.assyoma.it (Postfix) with ESMTPA id 3203CDE6A0E2;
 Thu, 29 Sep 2022 13:48:25 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 29 Sep 2022 13:48:25 +0200
From: Gionatan Danti <g.danti@assyoma.it>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <CADoUXWv+Po7pdhcAUk=JSwaDYJ2qp6B7aXm_djOuaOB0r9Usrw@mail.gmail.com>
References: <CADoUXWv+Po7pdhcAUk=JSwaDYJ2qp6B7aXm_djOuaOB0r9Usrw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <da0b5d2dedd98c10c5e0048bc2cdc00a@assyoma.it>
X-Sender: g.danti@assyoma.it
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [linux-lvm] LVM2 Metadata structure, extents ordering,
 metadata corruptions
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
Cc: Roberto Fastec <roberto.fastec@gmail.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Il 2022-09-27 12:10 Roberto Fastec ha scritto:
> questions
> 1. Given the premise 3. The corresponding LVM2 metadata/tables are and
> will be just a (allow me the term) "grid" "mapping that space" in an
> ordered sequence to in the subsequent use (and filling) of the RAID
> space "just mark" the used ones and the free ones? Or those grid cells
> will/could be in a messed order ?

Classical linear LVM volume (read: not lvmthin) are mostly concatenated 
4MB-sized chunk of space, but this is not a given (especially if some 
volumes changed in size).

> And explicitly I mean. In case of metadata corruption (always with
> respect of premise 3.) , could we just generate a dummy metadata table
> with all the extents marked as "used" in such a way that we can anyway
> access them

For linear volumes, one can try to setup a dmtable (or dummy metadata) 
to linearly read the data but, as stated above, this is far from 
reliable.

> 2. Does it exist a sort of "fsck" for the LVM2 metadata ? We do
> technical assistance and recently, specifically with those NAS devices
> that make use of LVM2, we have experienced really easy metadata
> corruption in occurence of just nothing or because of a electric power
> interruption (which is really astonishing). We mean no drives failures
> , no bad SMARTs . Just corruption from "nowhere" and "nocause"

For classical LVM, the metadata are actually backed up in ascii format 
unser /etc/lvm. While LVM itself keep a binary metadata representation, 
it also accept/store the textual so you can use the latter to restore 
your volumes.

Do you notice how I explicitly talked about *classical* volumes? This is 
because thin volumes (man lvmthin) use completely different, and much 
more complex, allocation strategies. Losing such metadata would kill the 
entire thin pool, and this is the reason a backup metadata volume is 
required for some operations. thincheck is effectively a sort ot 
"lvmthin fsck", but if you ever need to use it, be prepared to data loss 
(ranging from small to massive).

I saw various NAS that used custom-patched lvmthin volumes, and I 
suppose this is the root of your issues. If it is acceptable for your 
workload, try using classical LVM on these NAS.

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

