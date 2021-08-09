Return-Path: <SRS0=1Tek=NA=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F7DC4338F
	for <linux-lvm@archiver.kernel.org>; Mon,  9 Aug 2021 04:17:28 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8895860F4B
	for <linux-lvm@archiver.kernel.org>; Mon,  9 Aug 2021 04:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8895860F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-R9G1OhwOMqO-snWa9_3ZNQ-1; Mon, 09 Aug 2021 00:17:24 -0400
X-MC-Unique: R9G1OhwOMqO-snWa9_3ZNQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A164802B72;
	Mon,  9 Aug 2021 04:17:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 466E810016FB;
	Mon,  9 Aug 2021 04:17:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E051D180BAB1;
	Mon,  9 Aug 2021 04:17:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1794H7QM022575 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 9 Aug 2021 00:17:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5033521572BD; Mon,  9 Aug 2021 04:17:07 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AD5F21572B6
	for <linux-lvm@redhat.com>; Mon,  9 Aug 2021 04:17:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECEC5800159
	for <linux-lvm@redhat.com>; Mon,  9 Aug 2021 04:17:02 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-251-mtaEJJBMPh-6e5v93BpPWg-1; Mon, 09 Aug 2021 00:17:01 -0400
X-MC-Unique: mtaEJJBMPh-6e5v93BpPWg-1
Received: by mail-pl1-f169.google.com with SMTP id u16so15022836ple.2
	for <linux-lvm@redhat.com>; Sun, 08 Aug 2021 21:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=QkUcJv0VUsTxnAmnmdMmO1e/lS1VqRu/gjSqbrV2qEk=;
	b=hmlwtUH5uFryHOaPgR9Wuhp51k89aMk7a4XddoClQ44mQcmNne2kgBP8W8iUnbAhlA
	g16iVwdNRzJr6OlV/xbFJ1goDQeyfDeMxOj8MN+n08DuP7X9448Hp9StxbCw7lf/oJ2T
	b0D3ffxbzaUV3swDFnQbCpvA5ZYGhtL4Wv9birbXH1dJUMd62r1rxpVl1WU0cmKun9vg
	VJsyez6P/9nK3w2bDNKoEFR4jZ4Kx9QEreMYZ6+jEKCNjN+WxGDs5NypaHKWepcou5xP
	YUvZkkaUqUxKzMLhVlZRWnImVCetiG+acvLbrQAE+q5wOolt+0b0q6LXE5XE52seKSNm
	CXNA==
X-Gm-Message-State: AOAM532Wi01t6NwmocbgEmHaH/4Na4W1BdzMAXJqdLoGdXYaThwgZubG
	ckGsn5EUZovFpzrEOKioRC1GM2gYSQgeLcauz0jSSJksRjY=
X-Google-Smtp-Source: ABdhPJwbOtr3BJmVXJHxNukviAx0IaGe/TX75k98Pw14HShvh20z9G2vilybqd+haVY3ON301P+V9XYOOOd/d1La6ho=
X-Received: by 2002:a65:608f:: with SMTP id t15mr50376pgu.452.1628482619675;
	Sun, 08 Aug 2021 21:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <7956b86706382158e1fddb3c4bfbfde3@assyoma.it>
	<CAAYit8S5RZ8wh0WAxWEyuJJ=ejVd+TOXqUDFLhMLDGNEGhhRjQ@mail.gmail.com>
In-Reply-To: <CAAYit8S5RZ8wh0WAxWEyuJJ=ejVd+TOXqUDFLhMLDGNEGhhRjQ@mail.gmail.com>
From: Ming-Hung Tsai <mingnus@gmail.com>
Date: Mon, 9 Aug 2021 12:16:22 +0800
Message-ID: <CAAYit8QwTiPOnRGmm269zJXe8CqdT2bHXD4fPtbb_EO91DAgtg@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 9, 2021 at 11:53 AM Ming-Hung Tsai <mingnus@gmail.com> wrote:
>
> On Sat, Aug 7, 2021 at 7:43 PM Gionatan Danti <g.danti@assyoma.it> wrote:
> >
> > I wonder: can we detect if a volume/snapshot was *ever* activated? My
> > reasoning is that a never-activated snapshot surely did not receive any
> > application writes, so it can be safely removed (ignoring snapshot
> > retention policy).
>
> It sounds like you intend to keep snapshots that have been updated
> (written) since its creation, right?
> The precise way might be checking the data mappings via thin_dump. An
> updated device has data mappings with timestamps greater than the

                ^^^^^^^^^^^^
> device's creation time.

sorry, I mean "greater than or equal to"

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

