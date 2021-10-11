Return-Path: <SRS0=PlQC=O7=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CEDC433F5
	for <linux-lvm@archiver.kernel.org>; Mon, 11 Oct 2021 18:57:54 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5FF360F23
	for <linux-lvm@archiver.kernel.org>; Mon, 11 Oct 2021 18:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B5FF360F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-hc6krkHdMcmOykgKN2wqgg-1; Mon, 11 Oct 2021 14:57:51 -0400
X-MC-Unique: hc6krkHdMcmOykgKN2wqgg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADFB184A5F3;
	Mon, 11 Oct 2021 18:57:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1122760938;
	Mon, 11 Oct 2021 18:57:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF77A1801241;
	Mon, 11 Oct 2021 18:57:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19BIvTnT024755 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 11 Oct 2021 14:57:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DE0E440CFD10; Mon, 11 Oct 2021 18:57:29 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D997F40CFD0F
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2021 18:57:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7112A185A794
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2021 18:57:29 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
	[209.85.166.51]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-288-9fiPXAHnNPqixzJqGgeiFA-1; Mon, 11 Oct 2021 14:57:28 -0400
X-MC-Unique: 9fiPXAHnNPqixzJqGgeiFA-1
Received: by mail-io1-f51.google.com with SMTP id i189so13261508ioa.1
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2021 11:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=2tLd1Evrch+Pru3yziv8TCchdHSqJnkSBxaqSsOO1RY=;
	b=cGZjCciG8NTgs7do5sW9XqyhZy9ZTmiwl9dYqCDswLjbVFT3pD8QazHjVXcpBGgKm4
	EwCfYDw2rxl7a7/9GnONnQtnqElz/Vxwa8PGeK9YvaVaCFWwRLSgEVdD4SJaKtFyZef0
	q8V9sUImHzsqYHBU9SCcE4a4rbitYnrDTrc3/vKpvGaRbMN65+ZL7mjSQE3oTuPwKj6p
	7x8q0bfMpaaZXjDEB6s7DJY4vgJ/g1Ad9AaQZ8N9IpAq0D29WaSwEbdaRXgOjxoNEWP6
	6Zo/+K2VdHqECMWOdJ4xlPUrfIZBdaK1P4u56dc4NYKJrJRDplhhXLV+INc8ycCqxQhx
	YGpQ==
X-Gm-Message-State: AOAM530mVvotyyGVPuWnbWTdP/FgCJ1W6N9SUxwKigBgCaunu9zYQ8JJ
	Yy0ncVd2PXo98cTRL5wtVfyNyNPwAdS3aHqj/Lco2SUxncc=
X-Google-Smtp-Source: ABdhPJyHF7d6F6ThHwWwNRcDnkBM0ZkQOlQ67CisDJoK1gl+mZlSkXMlwfxlHk8wfJKfrRR6EZvtLQaSj18NliS0Q1k=
X-Received: by 2002:a6b:cd87:: with SMTP id d129mr19892497iog.28.1633978647156;
	Mon, 11 Oct 2021 11:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAPWGHt1MCzPbEHrF-5SRDavHqOfhMSqhkfAUQDMYT=HJ7TRfuQ@mail.gmail.com>
	<CAPWGHt3bB4QiM6RZkC_58X8jev+mVwpkuCY==45Gr4j5jOYHBA@mail.gmail.com>
	<b9e10482-e508-63fa-5518-94cccc007e81@redhat.com>
	<CALjSBEsb9gSMt7yNHNdYyFgG-Z_Yd3d0X-er24gvCUF1ZjrWog@mail.gmail.com>
	<CAPWGHt11L-ZGtLbZ08UVga7WP5fq6pY7gUS9HYtnVWvB11zj7Q@mail.gmail.com>
	<CALjSBEt0TdOr4jL4JhCKrRCfO+LiT_0tNaQYfQ9mLgQNjhq8Aw@mail.gmail.com>
	<CAPWGHt3vS8L7y_t_QFjmSoM7CTerEOeQ50fevfAOvTU0X3cnZw@mail.gmail.com>
	<CALjSBEuNvVdnFuRATStE8jLMgq2c=Tt2e-qn8QQ-WTfrmXPrxw@mail.gmail.com>
In-Reply-To: <CALjSBEuNvVdnFuRATStE8jLMgq2c=Tt2e-qn8QQ-WTfrmXPrxw@mail.gmail.com>
From: Krzysztof Chojnowski <frirajder@gmail.com>
Date: Mon, 11 Oct 2021 20:57:16 +0200
Message-ID: <CAPWGHt2mex=maufprPnq=vqLMMZ6zvFmo7=vSQa=YgPi6ptdUg@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

On Mon, Oct 11, 2021 at 6:30 PM Ming Hung Tsai <mtsai@redhat.com> wrote:
>
> On Mon, Oct 11, 2021 at 8:18 PM Krzysztof Chojnowski
> <frirajder@gmail.com> wrote:
> > Unfortunately, I don't have clear reproducing steps. As you've guessed
> > correctly - the power event has happened shortly (the same day) after
> > I created the cached volume. IIRC the volume hasn't even been used at
> > all so the cache would be empty.
>
> So the cache is clean without any data written? I thought that there
> was dirty data since you mentioned you've copied data from _corig in
> the first post, so now I just want to confirm my understanding.

The _corig volume has been used without caching for long time.
Recently I started experiment with the caching capability and I used
command similar to following to set it up:
https://wiki.archlinux.org/title/LVM#Create_cache

Regards,
Krzysztof Chojnowski

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

