Return-Path: <SRS0=CtEK=OZ=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B24BC433F5
	for <linux-lvm@archiver.kernel.org>; Tue,  5 Oct 2021 11:35:20 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6DE86126A
	for <linux-lvm@archiver.kernel.org>; Tue,  5 Oct 2021 11:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E6DE86126A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-sVGjQY4PMG2PBgACEr91wQ-1; Tue, 05 Oct 2021 07:35:16 -0400
X-MC-Unique: sVGjQY4PMG2PBgACEr91wQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09653100CCC0;
	Tue,  5 Oct 2021 11:35:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 991CA1037EB7;
	Tue,  5 Oct 2021 11:35:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E51011800B9C;
	Tue,  5 Oct 2021 11:35:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 195BZ4nH029531 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 5 Oct 2021 07:35:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 46E5D2028121; Tue,  5 Oct 2021 11:35:04 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42FAF2028117
	for <linux-lvm@redhat.com>; Tue,  5 Oct 2021 11:35:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A7AC102CDC0
	for <linux-lvm@redhat.com>; Tue,  5 Oct 2021 11:35:04 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-199-xRhUeh0lP1WQ6qBKkSWyZA-1; Tue, 05 Oct 2021 07:35:02 -0400
X-MC-Unique: xRhUeh0lP1WQ6qBKkSWyZA-1
Received: by mail-io1-f53.google.com with SMTP id z184so10740375iof.5
	for <linux-lvm@redhat.com>; Tue, 05 Oct 2021 04:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=THhrAW0+T6+m+hyFZk7FXFPI3iFLX0UUC1Xusj0EKfE=;
	b=IMge/yb6D1gLvKiEBZb26Sdyv7VC0yhAl9cULxylzm1o2Ged5K8NeFGEqSrPu8Nu23
	Vs+7mOhz4p4FbmEI4WfojiLHV6ahy+070PqzJ3cXr942Q17NJAG6wHlQaz/d/QA9BPJI
	8iQcaKDJG04OTJSHab09op/4VY6khzvq09DouTMOeo2/5cv/crSm2o17oBrvm56HRhiQ
	+RwjYPnTyLsR+SdyPnV1vVBLlivX8cDULgv7pGC260rUcQwvnaI7oKMrPwQMti3CK+GB
	l14jvEs4k8HqGfF6uyvU5fQHpBp1vv2PZRREXE33TMkUS7uVci4Dn9zPhQbu3qnxKGQO
	sObg==
X-Gm-Message-State: AOAM530KzJ34KSpHSGs15HzkvRt+buIWx7eVckM0Wh6UeGOq4goNQnJ/
	bcZpI6RNnjxPeeGLaR8leygCVKElu1qBgf/okFc6wdf0gPI=
X-Google-Smtp-Source: ABdhPJwavJYu5O4I7QKtUyv+lohFlLcCX6XaQbs4wr+cORpT4m4ceEcTaYBffsZ9Dj+A2eTypNPKYH4HyiLfo7iLEfk=
X-Received: by 2002:a05:6602:20d0:: with SMTP id
	16mr1942960ioz.118.1633433702106; 
	Tue, 05 Oct 2021 04:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAPWGHt1MCzPbEHrF-5SRDavHqOfhMSqhkfAUQDMYT=HJ7TRfuQ@mail.gmail.com>
In-Reply-To: <CAPWGHt1MCzPbEHrF-5SRDavHqOfhMSqhkfAUQDMYT=HJ7TRfuQ@mail.gmail.com>
From: Krzysztof Chojnowski <frirajder@gmail.com>
Date: Tue, 5 Oct 2021 13:34:15 +0200
Message-ID: <CAPWGHt3bB4QiM6RZkC_58X8jev+mVwpkuCY==45Gr4j5jOYHBA@mail.gmail.com>
To: linux-lvm@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 5, 2021 at 06:35 AM Ming-Hung Tsai <mingnus@gmail.com> wrote:
>Could you help run cache_check independently, to see the error messages? Thanks.
>
># sudo lvchange -ay -f vg0/wdata_cachepool_cpool_cmeta
># sudo cache_check /dev/mapper/vg0-wdata_cachepool_cpool_cmeta
># sudo lvchange -an -f vg0/wdata_cachepool_cpool_cmeta

Thanks for your help, this is what I get:
$ sudo lvchange -ay -f vg0/wdata_cachepool_cpool_cmeta
Do you want to activate component LV in read-only mode? [y/n]: y
  Allowing activation of component LV.
$ sudo cache_check /dev/mapper/vg0-wdata_cachepool_cpool_cmeta
examining superblock
examining mapping array
  missing mappings [1, 0]:
    missing blocks
examining hint array
  missing mappings [1, 0]:
    missing blocks
examining discard bitset
$ echo $?
1
$ sudo lvchange -an -f vg0/wdata_cachepool_cpool_cmeta
$ sudo lvchange -ay   vg0/tpg1-wdata
  Check of pool vg0/wdata_cachepool_cpool failed (status:1). Manual
repair required!

Regards,
Krzysztof Chojnowski

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

