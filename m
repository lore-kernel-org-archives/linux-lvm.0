Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5035EC4332F
	for <linux-lvm@archiver.kernel.org>; Tue,  1 Nov 2022 18:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667327836;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=otvsW4dmhc26xEoUo7O7PU5N86FeZ4K6hUUKMkLO0t0=;
	b=SRmdLGHjUKbbq5m/5tgFevkRdiBhOBEHXnXmdudsHZOX8gESOYvNuAS80keOrlU+Dcx9IM
	B35UhbPuRQdrAn8GCZbuVqkN1oQ0DJFCBys3iFeIRmHzG3eyHPW3WKpOE2Y80F5w6l7NUB
	LlTaUpIVAAFtPa/a+FuC7bZiKBs2SXI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-sF5JA8WNOoa6R41UvYhurA-1; Tue, 01 Nov 2022 14:37:10 -0400
X-MC-Unique: sF5JA8WNOoa6R41UvYhurA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55D0F806005;
	Tue,  1 Nov 2022 18:37:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B08482028E94;
	Tue,  1 Nov 2022 18:37:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 49A151946A45;
	Tue,  1 Nov 2022 18:36:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3FA3319465B3
 for <linux-lvm@listman.corp.redhat.com>; Tue,  1 Nov 2022 18:36:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 133D8492B1F; Tue,  1 Nov 2022 18:36:57 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C0C7492B1C
 for <linux-lvm@redhat.com>; Tue,  1 Nov 2022 18:36:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E523C3C02B7F
 for <linux-lvm@redhat.com>; Tue,  1 Nov 2022 18:36:56 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-yQDh6yOkNPyrbHGLByWnRQ-1; Tue, 01 Nov 2022 14:36:54 -0400
X-MC-Unique: yQDh6yOkNPyrbHGLByWnRQ-1
Received: from wiki.gathman.org (mail.gathman.org [IPv6:2001:470:8:809::1010])
 (authenticated bits=0)
 by mail.gathman.org (8.14.7/8.14.7) with ESMTP id 2A1I8LEi015777
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 1 Nov 2022 14:08:25 -0400
Date: Tue, 1 Nov 2022 14:08:21 -0400 (EDT)
From: Stuart D Gathman <stuart@gathman.org>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <20221101144230.GA11193@redhat.com>
Message-ID: <f7403695-5d43-cfea-31b9-70a58b93a0c0@gathman.org>
References: <4b031c4d-b83a-cc92-fabf-cc9cefb4e491@bytedance.com>
 <20221101144230.GA11193@redhat.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [linux-lvm] How to implement live migration of VMs in thinlv
 after using lvmlockd
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
Cc: Zhiyong Ye <yezhiyong@bytedance.com>, damon.devops@gmail.com
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Z> On Tue, Nov 01, 2022 at 01:36:17PM +0800, Zhiyong Ye wrote:
>> I want to implement live migration of VMs in the lvm + lvmlockd + sanlock
>> environment. There are multiple hosts in the cluster using the same iscsi
>> connection, and the VMs are running on this environment using thinlv
>> volumes. But if want to live migrate the vm, it will be difficult since
>> thinlv which from the same thin pool can only be exclusive active on one
>> host.

I just expose the LV (thin or not - I prefer not) as an iSCSI target
that the VM boots from.  There is only one host that manages a thin pool, 
and that is a single point of failure, but no locking issues.  You
issue the LVM commands on the iSCSI server (which I guess they call NAS
these days).

If you need a way for a VM to request enlarging an LV it accesses, or
similar interaction, I would make a simple API where each VM gets a
token that determines what LVs it has access to and how much total
storage it can consume.  Maybe someone has already done that.
I just issue the commands on the LVM/NAS/iSCSI host.

I haven't done this, but there can be more than one thin pool, each on
it's own NAS/iSCSI server.  So if one storage server crashes, then
only the VMs attached to it crash.  You can only (simply) migrate a VM 
to another VM host on the same storage server.

BUT, you can migrate a VM to another host less instantly using DRBD
or other remote mirroring driver.  I have done this.  You get the
remote LV mirror mostly synced, suspend the VM (to a file if you need
to rsync that to the remote), finish the sync of the LV(s), resume the
VM on the new server - in another city.  Handy when you have a few hours
notice of a natural disaster (hurricane/flood).

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

