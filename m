Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F88CC433EF
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Mar 2022 20:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646856487;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jE0la+7WZSTS7JkpaNBwyR0Qs49YOKCSz18Upshv/cQ=;
	b=BEyFF1BmM1A2Di34lrCIlfBHlJM+VhgMctWXQuwZyxiU6HX1aZpTQTY1bP7iI2qTisHc2d
	5avyu+N5CAGKSxf/W/Qh2bRmv/qN9+Wxu01veM0KBaTdm0GgaNcJ7M6vZ89nrf6Z2NlF0h
	u8dM5Txiu4m0e1LTM9jqSyfhaeF9+CU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-7oojtDLZN_e9ubQM-8rqzQ-1; Wed, 09 Mar 2022 15:07:56 -0500
X-MC-Unique: 7oojtDLZN_e9ubQM-8rqzQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 801711C05B1B;
	Wed,  9 Mar 2022 20:07:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B2BAD140EBFE;
	Wed,  9 Mar 2022 20:07:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7AA661953560;
	Wed,  9 Mar 2022 20:07:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 968AF1953560
 for <linux-lvm@listman.corp.redhat.com>; Wed,  9 Mar 2022 20:07:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5043B12E1B; Wed,  9 Mar 2022 20:07:45 +0000 (UTC)
Received: from redhat.com (unknown [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC8ED12E1A;
 Wed,  9 Mar 2022 20:07:38 +0000 (UTC)
Date: Wed, 9 Mar 2022 14:07:37 -0600
From: David Teigland <teigland@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20220309200737.GC5819@redhat.com>
References: <166d9e5658f38f384a9938973a81c00c7abd75c9.camel@suse.com>
 <1f49866ba907896dc3678b47c5bb68d87e28b3c1.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <1f49866ba907896dc3678b47c5bb68d87e28b3c1.camel@suse.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Subject: Re: [linux-lvm] LVM autoactivation and udev
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
Cc: prajnoha@redhat.com, heming.zhao@suse.com, linux-lvm@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> I'll wait for the fix for the external_device_info_source=udev case,
> which you mentioned in your previous post.

I only ran a few tests with this but it's pretty straight forward
https://sourceware.org/git/?p=lvm2.git;a=commit;h=c7a5b5cca067496f5912bf992dcfedb6771dd083

Dave
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

