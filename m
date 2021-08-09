Return-Path: <SRS0=1Tek=NA=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF37C4338F
	for <linux-lvm@archiver.kernel.org>; Mon,  9 Aug 2021 03:55:00 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DAE86101D
	for <linux-lvm@archiver.kernel.org>; Mon,  9 Aug 2021 03:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2DAE86101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-1OJi50oeMv2xlfnYtK7F5g-1; Sun, 08 Aug 2021 23:54:57 -0400
X-MC-Unique: 1OJi50oeMv2xlfnYtK7F5g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CF8B180FCA7;
	Mon,  9 Aug 2021 03:54:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1730E5C1D0;
	Mon,  9 Aug 2021 03:54:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9990E180BAB1;
	Mon,  9 Aug 2021 03:54:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1793sTLo020598 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 8 Aug 2021 23:54:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2CC706218D; Mon,  9 Aug 2021 03:54:29 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27318568EA
	for <linux-lvm@redhat.com>; Mon,  9 Aug 2021 03:54:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC595100B8CA
	for <linux-lvm@redhat.com>; Mon,  9 Aug 2021 03:54:26 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-578-1kYUwf8RMIe7G-Q6uG55kA-1; Sun, 08 Aug 2021 23:54:24 -0400
X-MC-Unique: 1kYUwf8RMIe7G-Q6uG55kA-1
Received: by mail-pl1-f181.google.com with SMTP id t3so14935864plg.9
	for <linux-lvm@redhat.com>; Sun, 08 Aug 2021 20:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=r0vqexmQlmUOZWEYVDGEpJT/5h1skDycfQYotC8ljRM=;
	b=It6Q9+lRIYe884lu1PshfoTEZ7qWjN9BpXzhEalbho1yXkm+tkqnyawjI2g6L0zExv
	pyBuNQWbpbPUtAHIpwCQfLor6j5YLaxOH2jbJbJOkUx8nR+1FtcFxCTARWs/CQ4dS8Q4
	Qhk5KphRuCbx47yYdmP1I6YGmvoN6N7Y04OYqFSx1IE6K6djr1hLgopfcPH8iXU0yVj/
	vLXk8jPod59zE/BIUySwyuaqaLrXQvWSheZoUF/i8fAIU+ICp9mkJcJqdfPb9XVIXfgV
	+H6ZpgiRAw/vBKricByRFCNgfEL0GVOqX9CCtG8mLRXz9LuJOUFjZxLoe5NYN0+41ylL
	yPKg==
X-Gm-Message-State: AOAM531PuXzBKsWXOWx+vEd48KhCOENDwVcD8iWEyUtHyit+YthKE8PP
	2lw+y+SV9CrLT1TbKjc5jdJvS35Sa7b7Jo1ISh9xL5ONfm4=
X-Google-Smtp-Source: ABdhPJyOc2d7ToytS+LsMdWVusblFa4xogHi52W7DppzVp0WfcbN0s0jGE+NJIBf5MI9sOUeSERAdGITxXYBEtrFM4g=
X-Received: by 2002:a17:902:ecc6:b029:12c:44b:40bd with SMTP id
	a6-20020a170902ecc6b029012c044b40bdmr18452841plh.33.1628481263231;
	Sun, 08 Aug 2021 20:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <7956b86706382158e1fddb3c4bfbfde3@assyoma.it>
In-Reply-To: <7956b86706382158e1fddb3c4bfbfde3@assyoma.it>
From: Ming-Hung Tsai <mingnus@gmail.com>
Date: Mon, 9 Aug 2021 11:53:46 +0800
Message-ID: <CAAYit8S5RZ8wh0WAxWEyuJJ=ejVd+TOXqUDFLhMLDGNEGhhRjQ@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] How to check if thin volume or snapshot was ever
	activated
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Aug 7, 2021 at 7:43 PM Gionatan Danti <g.danti@assyoma.it> wrote:
>
> Dear all,
> as you know, a thin snapshot does have the "k" (skip activation) flag
> set, so one has to force activation by ignoring the flag (or removing
> the flag itself).
>
> I wonder: can we detect if a volume/snapshot was *ever* activated? My
> reasoning is that a never-activated snapshot surely did not receive any
> application writes, so it can be safely removed (ignoring snapshot
> retention policy).

It sounds like you intend to keep snapshots that have been updated
(written) since its creation, right?
The precise way might be checking the data mappings via thin_dump. An
updated device has data mappings with timestamps greater than the
device's creation time.

Checking device activation might not meet what you need. An activated
device might or might not receive any write, so you don't know whether
a device has been updated by looking into its activation history.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

