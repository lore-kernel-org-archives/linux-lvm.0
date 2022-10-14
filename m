Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6161C433FE
	for <linux-lvm@archiver.kernel.org>; Fri, 14 Oct 2022 19:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665777060;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xJfEHmpRWHDHMVI7xrGzh8QydAsdh7rQ1F1Ie1FvY38=;
	b=X93z1s7b2DyHxboof7ZHV0ZlwdSE+YHn/ghcv8HrGqdirXf+Ubd5WsNiDcTkEJw+w1UIaO
	RewqYUCM+I2WDijFu2sy9orkDQT+/w4/W0m2plo2m7RuRqDX3GfnteCUnVwSc4cBoT8BXz
	QB0EThwNsen6BLvjQtJVQyFdzlj15XI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-YqrybkC1MOWYT6Rjty-d-Q-1; Fri, 14 Oct 2022 15:50:58 -0400
X-MC-Unique: YqrybkC1MOWYT6Rjty-d-Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA4EA803D48;
	Fri, 14 Oct 2022 19:50:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D118B4030C4;
	Fri, 14 Oct 2022 19:50:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9766C1946589;
	Fri, 14 Oct 2022 19:50:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 14D111946586
 for <linux-lvm@listman.corp.redhat.com>; Fri, 14 Oct 2022 19:50:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D081940369AA; Fri, 14 Oct 2022 19:50:45 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C90F740369AB
 for <linux-lvm@redhat.com>; Fri, 14 Oct 2022 19:50:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACC56800B30
 for <linux-lvm@redhat.com>; Fri, 14 Oct 2022 19:50:45 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-OtyAjD0VNXe_Cs2ToteJnw-1; Fri, 14 Oct 2022 15:50:43 -0400
X-MC-Unique: OtyAjD0VNXe_Cs2ToteJnw-1
Received: by mail-qt1-f182.google.com with SMTP id h24so4026459qta.7;
 Fri, 14 Oct 2022 12:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WsLT22JtZnB83bj6qG2bO5WlC7KE8V8B8GibGhFE+D0=;
 b=70Hara78nZZTmQMXENfZQZcSFKshH2jAwTx4n2hK2BmQZDhUz68cV1effAE93Vyl9G
 sDuSuq7bqJFSNcegLY88+FZgEl3HddjWWfQoeKLLK8OJc5iiXnrckvggRxbgPMx05z0R
 rXqphH5wx/1PZQGwCwlVEGobsKAh8dB/cG5a6hj1EM7TDPQHm+3kUAf2Y+pF4uNU287R
 lCaiTzj2SIiUvITsHdqV8lKseMdYRhe5oWFr8Fnfr+mdE2qO1OUG2o3VSJkAJxd9P3R+
 3PT/6b9CnEBUDlhmdLArgdb5YgEjr+YTPggpmz5/hlexU5znHCltltpvcw4NduTMTCi5
 wxRQ==
X-Gm-Message-State: ACrzQf2GmAMyHHDQGM7NfSVv86khKxlkOX9GDZRdDZfRQ63rSrw4oR0B
 ECnJw0zZGVHpH38YeAFqalhmaP+6SuNKP6hfzvEUiyDd
X-Google-Smtp-Source: AMsMyM7gbWJNiSJL7cWTmQxC4z6ncCL0jDDLwlIMy+xYAymmuL5P5Gt+H2jEk4AfrHQXXzt8woN5Pt2AgPE3BoC9iWw=
X-Received: by 2002:ac8:5b0d:0:b0:39c:dc69:d200 with SMTP id
 m13-20020ac85b0d000000b0039cdc69d200mr2430052qtw.233.1665777043002; Fri, 14
 Oct 2022 12:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <PUZP153MB075126926388815B6F9E1258AC229@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
 <PUZP153MB07512B1B646868F0F8F1D205AC259@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
In-Reply-To: <PUZP153MB07512B1B646868F0F8F1D205AC259@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Fri, 14 Oct 2022 14:50:31 -0500
Message-ID: <CAAMCDefYPozC32AdCqw-c1nOZNiEK0j0pG7n+zcu_bRwTfCagg@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [linux-lvm] LVM2 : performance drop even after deleting the
 snapshot
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
Cc: Kapil Upadhayay <kupadhayay@microsoft.com>,
 Mitta Sai Chaithanya <mittas@microsoft.com>,
 "lvm-devel@redhat.com" <lvm-devel@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

What is the underlying disk hardware you are running this on?
virtual, spinning, ssd, nvme?

On Thu, Oct 13, 2022 at 2:01 AM Pawan Sharma <sharmapawan@microsoft.com> wrote:
>
> adding this to lvm-devel mailing list also.
>
> Regards,
> Pawan
> ________________________________
> From: Pawan Sharma
> Sent: Wednesday, October 12, 2022 10:42 PM
> To: linux-lvm@redhat.com <linux-lvm@redhat.com>
> Cc: Mitta Sai Chaithanya <mittas@microsoft.com>; Kapil Upadhayay <kupadhayay@microsoft.com>
> Subject: LVM2 : performance drop even after deleting the snapshot
>
> Hi Everyone,
>
>
> We are evaluating lvm2 snapshots and doing performance testing on it. This is what we are doing :
>
> dump some data to lvm2 volume (using fio)
> take the snapshot
> delete the snapshot (no IOs anywhere after creating the snapshot)
> run the fio on lvm2 volume
>
> Here as you can see, we are just creating the snapshot and immediately deleting it. There are no IOs to the main volume or anywhere. When we run the fio after this (step 4) and we see around 50% drop in performance with reference to the number we get in step 1.
>
> It is expected to see a performance drop if there is a snapshot because of the COW. But here we deleted the snapshot, and it is not referring to any data also. We should not see any performance drop here.
>
> Could someone please help me understand this behavior. Why are we seeing the performance drop in this case? It seems like we deleted the snapshot but still it is not deleted, and we are paying the COW penalty.
>
> System Info:
>
> OS : ubuntu 18.04
> Kernel : 5.4.0
>
> # lvm version
>   LVM version:     2.02.176(2) (2017-11-03)
>   Library version: 1.02.145 (2017-11-03)
>   Driver version:  4.41.0
>
> We also tried on latest ubuntu with newer version of LVM. We got the same behavior.
>
> Any help/pointers would be appreciated. Thanks in advance.
>
> Regards,
> Pawan
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

