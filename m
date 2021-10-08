Return-Path: <SRS0=ZmUv=O4=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91E7C433F5
	for <linux-lvm@archiver.kernel.org>; Fri,  8 Oct 2021 07:57:43 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 668D660235
	for <linux-lvm@archiver.kernel.org>; Fri,  8 Oct 2021 07:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 668D660235
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633679862;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Xm4IPKtd2mcxcac6rxLP3sq8C9/vIdUekISgViJ6u8k=;
	b=FRm5U5bPxBF/2+YdzJTWjbbsvHqK/2UiGQbqqGiAN3SoBasmKMSJ7TphhcHVTUClEj+V1O
	APsDKFpDNgtPKgdmYa9448hmHkY6IPGB/Gz6/EvDHgrSpJ2/T12Mbi1r6Ab8X4BvqU2eE0
	Rrtlbfq33BZ8fPG6CX9ah9i2tsRN7uo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-e8gDW12SPDWvbf12hTn4JQ-1; Fri, 08 Oct 2021 03:57:38 -0400
X-MC-Unique: e8gDW12SPDWvbf12hTn4JQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCD69801AC5;
	Fri,  8 Oct 2021 07:57:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7A8A60936;
	Fri,  8 Oct 2021 07:57:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 018B01801241;
	Fri,  8 Oct 2021 07:57:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1987vBwn028984 for <linux-lvm@listman.util.phx.redhat.com>;
	Fri, 8 Oct 2021 03:57:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 29EF92026D46; Fri,  8 Oct 2021 07:57:11 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25D322026D07
	for <linux-lvm@redhat.com>; Fri,  8 Oct 2021 07:57:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FCD78032EB
	for <linux-lvm@redhat.com>; Fri,  8 Oct 2021 07:57:08 +0000 (UTC)
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
	[209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-81-JTJPqi_GNiGOByLdiWaSwg-1; Fri, 08 Oct 2021 03:57:00 -0400
X-MC-Unique: JTJPqi_GNiGOByLdiWaSwg-1
Received: by mail-oo1-f70.google.com with SMTP id
	b3-20020a4a9bc3000000b002b66bb6c794so5096668ook.20
	for <linux-lvm@redhat.com>; Fri, 08 Oct 2021 00:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=/+6keYWwZj4VuQJM8+wAvT0fvYMCUogpVyBYPJA1ClE=;
	b=I0tpo+//XG7pwOYhzqj9ty4N3I2PPEUOLdv/JXKlsfl2+jG/tqPS/SVq04Obfiw3UY
	SOZheecy0RUL9Ad++Z3C/pmODP6cYvTrS3nHaUgtRjU6EHjdZcFnS4nj8ghCsQKDZB4A
	TkxX54FzCCmDVFIgWVOLsx9jvY7GRpxcsadSK1tX2sa07dipH/qvYDmc8i2+dzEsa4dk
	e3BGP9pKlUGO3qYtoAUXdNl8pmpE5ad+SVXlOUtGutSH/BCfyzE+m2hqyB36F2JDtwyn
	koDzyzGjlF0pmnnxM7PcWdWniIWuCS8DhbtYWl/WhB7Dq2p92VG1UgY2lo5gAJ/YZ/ql
	00SA==
X-Gm-Message-State: AOAM531w7yx9PGuxLQRpnkr33VDAKTEmrGnlslZkDFATLJy+OMxt58DR
	EXxmU2OJFLuiXqgQlO+hu4guRycyPQ2L7KXDpCZHL6NK8ZnjchaM4XiiGbugMJX2SvzQfBEUjiv
	LMEmVezw93rZK65+K20BtMUeu0N4IPZ0=
X-Received: by 2002:a54:438c:: with SMTP id u12mr6473830oiv.68.1633679819279; 
	Fri, 08 Oct 2021 00:56:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymmPOAp6gfSw0RDynof5XEi7nxMX3CVFfNmXUPw6Ykdsu05Aa99zGKCTXP62nm7AvjhB7xBWKVK59IjbL9kXQ=
X-Received: by 2002:a54:438c:: with SMTP id u12mr6473815oiv.68.1633679819032; 
	Fri, 08 Oct 2021 00:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAPWGHt1MCzPbEHrF-5SRDavHqOfhMSqhkfAUQDMYT=HJ7TRfuQ@mail.gmail.com>
	<CAPWGHt3bB4QiM6RZkC_58X8jev+mVwpkuCY==45Gr4j5jOYHBA@mail.gmail.com>
	<b9e10482-e508-63fa-5518-94cccc007e81@redhat.com>
	<CALjSBEsb9gSMt7yNHNdYyFgG-Z_Yd3d0X-er24gvCUF1ZjrWog@mail.gmail.com>
	<CAPWGHt11L-ZGtLbZ08UVga7WP5fq6pY7gUS9HYtnVWvB11zj7Q@mail.gmail.com>
In-Reply-To: <CAPWGHt11L-ZGtLbZ08UVga7WP5fq6pY7gUS9HYtnVWvB11zj7Q@mail.gmail.com>
From: Ming Hung Tsai <mtsai@redhat.com>
Date: Fri, 8 Oct 2021 15:56:48 +0800
Message-ID: <CALjSBEt0TdOr4jL4JhCKrRCfO+LiT_0tNaQYfQ9mLgQNjhq8Aw@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 7, 2021 at 3:57 PM Krzysztof Chojnowski <frirajder@gmail.com> wrote:
>
> On Tue, Oct 5, 2021 at 6:57 PM Ming Hung Tsai <mtsai@redhat.com> wrote:
>>
>> On Tue, Oct 5, 2021 at 11:54 PM Zdenek Kabelac <zkabelac@redhat.com> wrote:
>>
>> > lvconvert --repair should be able to handle this case - although likely
>> > without 'smart' placement' of fixed metadata (pvmove needed after metadata fix)
>
> I tried running lvconvert --repair earlier (please see the 1st of my mails) and even trough the operation finished successfully (as in the $? == 0) I couldn't activate the volume afterwards.
>
>>
>> cache_repair might not handle this case perfectly. If possible, you
>> could upload the "original" metadata somewhere for me to take a look,
>> by dd it into a binary file.
>
> Unfortunately I deleted the original metadata volume when I was trying to remove the cached volume.
> So right now, I guess, the question is how do I remove the cached volume, as the repair doesn't seem to be possible.

Hi,

You could simply detach the cache:
sudo lvconvert vg0/tpg1-wdata --splitcache

Or alternatively, reinitialize the cache by swapping the metadata with
a blank one, which bypasses cache_check examination and then steps to
metadata formatting:
sudo lvcreate vg0 --size 40m --name cmeta_bak
sudo lvconvert vg0/wdata_cachepool_cpool --swapmetadata --poolmetadata cmeta_bak

then you should be able to activate the tpg1-wdata.

BTW, could you help provide the reproducing steps? I guess that you
performed a power cut soon after creating the cache. Thanks.


Ming-Hung Tsai

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

