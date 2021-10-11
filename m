Return-Path: <SRS0=PlQC=O7=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02C3C433F5
	for <linux-lvm@archiver.kernel.org>; Mon, 11 Oct 2021 12:17:46 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4744A60F5B
	for <linux-lvm@archiver.kernel.org>; Mon, 11 Oct 2021 12:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4744A60F5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-g1D1aUUhP_GUT02J-7hjXQ-1; Mon, 11 Oct 2021 08:17:42 -0400
X-MC-Unique: g1D1aUUhP_GUT02J-7hjXQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F9301006AA4;
	Mon, 11 Oct 2021 12:17:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DAEA5C23A;
	Mon, 11 Oct 2021 12:17:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3297D1801241;
	Mon, 11 Oct 2021 12:17:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19BCHFVW021907 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 11 Oct 2021 08:17:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 007F653B5; Mon, 11 Oct 2021 12:17:15 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEF5053CF
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2021 12:17:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF6DA802E5C
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2021 12:17:06 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-172-tLD7BB9-NaetA0wMgMrDEA-1; Mon, 11 Oct 2021 08:17:05 -0400
X-MC-Unique: tLD7BB9-NaetA0wMgMrDEA-1
Received: by mail-io1-f41.google.com with SMTP id b10so4600960iof.12
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2021 05:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=eieHRKSY2MMD8G5dW+e0iyxn9WGo0Nmy0jurzbc2/m8=;
	b=3qCSwI/IsmfRyInGWyPOKtdkx5cBiYx+msMmYwCY5d/mxXwjWJ4DQ94tXSroruCJRH
	6IQBHfQoy+agmDjx//GFX0T+01sTB+vFoQsFhO2KQKULBIq7sCPKGjtVoQ6gxNBE/AcL
	3MkbtpgZfWSbMRQtO5iGSHBxPp1omnhSwS0Yz85o7goySRI7BEEuD0x+c/Cpw90rnJnJ
	taSaCEVovucxH/ttrpb1mNfz85KuPOc4RM3BFDZS//tOlUSwiek2jltaOTvgraeeLn8c
	8rQiCf1nBNnUksGcULqUmyXfX8u6TrU3yYKeEnKQ1qcCzCLPRPbbjCQsKZLrZkpZSLbq
	m1Ng==
X-Gm-Message-State: AOAM532YSHAZozeDWKQ1vAQCrw5MztNopcanaj9mzrDkfDPdyMQPMSTa
	yH2h61kBADDYYOkbrGcff0+rtbXUUM7NC5gkhGtBtUslkfM=
X-Google-Smtp-Source: ABdhPJzqlCVsDbhX650RMS+MOBDf+F8meAlrUG1nxMByvf7/4uPRLv5L9UACOZqDYt38aSGxgjZXVtaUSp+kMXdewhg=
X-Received: by 2002:a05:6638:1030:: with SMTP id
	n16mr18687920jan.36.1633954624595; 
	Mon, 11 Oct 2021 05:17:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAPWGHt1MCzPbEHrF-5SRDavHqOfhMSqhkfAUQDMYT=HJ7TRfuQ@mail.gmail.com>
	<CAPWGHt3bB4QiM6RZkC_58X8jev+mVwpkuCY==45Gr4j5jOYHBA@mail.gmail.com>
	<b9e10482-e508-63fa-5518-94cccc007e81@redhat.com>
	<CALjSBEsb9gSMt7yNHNdYyFgG-Z_Yd3d0X-er24gvCUF1ZjrWog@mail.gmail.com>
	<CAPWGHt11L-ZGtLbZ08UVga7WP5fq6pY7gUS9HYtnVWvB11zj7Q@mail.gmail.com>
	<CALjSBEt0TdOr4jL4JhCKrRCfO+LiT_0tNaQYfQ9mLgQNjhq8Aw@mail.gmail.com>
In-Reply-To: <CALjSBEt0TdOr4jL4JhCKrRCfO+LiT_0tNaQYfQ9mLgQNjhq8Aw@mail.gmail.com>
From: Krzysztof Chojnowski <frirajder@gmail.com>
Date: Mon, 11 Oct 2021 14:16:53 +0200
Message-ID: <CAPWGHt3vS8L7y_t_QFjmSoM7CTerEOeQ50fevfAOvTU0X3cnZw@mail.gmail.com>
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
Subject: Re: [linux-lvm] LVM cachepool inconsistency after power event
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

On Fri, Oct 8, 2021 at 9:57 AM Ming Hung Tsai <mtsai@redhat.com> wrote:
>
> You could simply detach the cache:
> sudo lvconvert vg0/tpg1-wdata --splitcache

Unfortunately this one didn't work:
$ sudo lvconvert vg0/tpg1-wdata --splitcache
Check of pool vg0/wdata_cachepool_cpool failed (status:1). Manual
repair required!
Failed to activate vg0/tpg1-wdata to flush cache.

> Or alternatively, reinitialize the cache by swapping the metadata with
> a blank one, which bypasses cache_check examination and then steps to
> metadata formatting:
> sudo lvcreate vg0 --size 40m --name cmeta_bak
> sudo lvconvert vg0/wdata_cachepool_cpool --swapmetadata --poolmetadata cmeta_bak

Thanks a lot! This one did work and I was able to activate the volume.
I tried doing something like this earlier but I used wrong syntax (I
missed the --swapmetadata flag).

> BTW, could you help provide the reproducing steps? I guess that you
> performed a power cut soon after creating the cache. Thanks.

Unfortunately, I don't have clear reproducing steps. As you've guessed
correctly - the power event has happened shortly (the same day) after
I created the cached volume. IIRC the volume hasn't even been used at
all so the cache would be empty. If I manage to reproduce it I will
report back here.

Thanks for all your help!
Krzysztof Chojnowski

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

