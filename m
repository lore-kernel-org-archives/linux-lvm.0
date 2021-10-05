Return-Path: <SRS0=CtEK=OZ=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D18C433EF
	for <linux-lvm@archiver.kernel.org>; Tue,  5 Oct 2021 10:36:13 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C44161251
	for <linux-lvm@archiver.kernel.org>; Tue,  5 Oct 2021 10:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C44161251
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-Ma26UxsHNgui1YgEYFJzRw-1; Tue, 05 Oct 2021 06:36:09 -0400
X-MC-Unique: Ma26UxsHNgui1YgEYFJzRw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C2761084688;
	Tue,  5 Oct 2021 10:36:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DC8E60C13;
	Tue,  5 Oct 2021 10:35:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE5381806D01;
	Tue,  5 Oct 2021 10:35:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 195AZNgx024537 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 5 Oct 2021 06:35:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BD2B2201AC49; Tue,  5 Oct 2021 10:35:23 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B92A3201AC5A
	for <linux-lvm@redhat.com>; Tue,  5 Oct 2021 10:35:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2F2810665AC
	for <linux-lvm@redhat.com>; Tue,  5 Oct 2021 10:35:23 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-298-61k3r6JrPde2LgOMvgJcRg-1; Tue, 05 Oct 2021 06:35:22 -0400
X-MC-Unique: 61k3r6JrPde2LgOMvgJcRg-1
Received: by mail-pg1-f169.google.com with SMTP id a73so16428214pge.0
	for <linux-lvm@redhat.com>; Tue, 05 Oct 2021 03:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=h1THfuQtWB4QHLYqRgT078pRzZG1yYmmqlO9SXQ5O1s=;
	b=Os3mHNFHbi0f1qaVnNlXoK6vP0G3VRR7/DsCpnZW4LRnpIdUCPEl6MGd071QSYXnYO
	or21X9H/HOh6FhSwfjUX+D13x7+9BgnWoyL6W/vgdvTocME4M6Ph/Ck831zgaksLFR+/
	pUEKPpLcEI0W0695eRjsZ0kJ1mcdu/SXO8c5rVPZ8lKA6VoSffbEX0Pd6MF8/MyaC0CE
	9kv+iaIIBES0MjVHRei+KAYz1W6LaAXGBs9wfgzP+CYqGg/gGxb1pxaJe9n7RwchC4zl
	2ER7ar8IErQi1dyRI3+Esptlx3YQlVxXiqypdhny6s7qiy1k8LahPVNRA6KI+EzMD5AL
	8s/w==
X-Gm-Message-State: AOAM532Dh7cZ9h9N4B/FyD7d1bQYu6DH1K6ULHwN0dCbsoiKAIRzHlDb
	MqC3vrVz6oUKCsj01cYSLDwnY27iBuNW+9GgDMLHpYNq
X-Google-Smtp-Source: ABdhPJyOKQH/vyLB+MpzuaEInHOv0O5vG+6LSW412Bm0tP5fR0tmmPaaixZ+RQA6z9sOdsbrx+KoWZZXgQLLWeBbtxQ=
X-Received: by 2002:a62:5a07:0:b0:44b:ec1f:3907 with SMTP id
	o7-20020a625a07000000b0044bec1f3907mr30079460pfb.78.1633430120673;
	Tue, 05 Oct 2021 03:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAPWGHt1MCzPbEHrF-5SRDavHqOfhMSqhkfAUQDMYT=HJ7TRfuQ@mail.gmail.com>
In-Reply-To: <CAPWGHt1MCzPbEHrF-5SRDavHqOfhMSqhkfAUQDMYT=HJ7TRfuQ@mail.gmail.com>
From: Ming-Hung Tsai <mingnus@gmail.com>
Date: Tue, 5 Oct 2021 18:34:44 +0800
Message-ID: <CAAYit8SbdPNOt9HOgSxZCwwT=F1S=OKFR-S9+NMqoBWrww-HQg@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Could you help run cache_check independently, to see the error messages? Thanks.

# sudo lvchange -ay -f vg0/wdata_cachepool_cpool_cmeta
# sudo cache_check /dev/mapper/vg0-wdata_cachepool_cpool_cmeta
# sudo lvchange -an -f vg0/wdata_cachepool_cpool_cmeta


Ming-Hung Tsai

On Tue, Oct 5, 2021 at 1:26 PM Krzysztof Chojnowski <frirajder@gmail.com> wrote:
> Trying to activate the tpg1-wdata LV results in an error:
> sudo lvchange -ay -v vg0/tpg1-wdata
>   Executing: /usr/sbin/cache_check -q
> /dev/mapper/vg0-wdata_cachepool_cpool_cmeta
>   /usr/sbin/cache_check failed: 1
>   Piping: /usr/sbin/cache_check -V
>   Found version of /usr/sbin/cache_check 0.9.0 is better then requested 0.7.0.
>   Check of pool vg0/wdata_cachepool_cpool failed (status:1). Manual
> repair required!

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

