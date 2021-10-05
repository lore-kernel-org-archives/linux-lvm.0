Return-Path: <SRS0=CtEK=OZ=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1ACEC433EF
	for <linux-lvm@archiver.kernel.org>; Tue,  5 Oct 2021 16:57:40 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35CC9611C1
	for <linux-lvm@archiver.kernel.org>; Tue,  5 Oct 2021 16:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35CC9611C1
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633453059;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Lxx9L6DPMiMRq/7xzMaTee1fM+ZC72yveE9l94CBFiw=;
	b=EHpTLq50pSK8JG6s6SnEIzMtrzYiHXcBf7/9v8MrAw4yXDyJvEWa8Rt8cqj0g5Uh2gm4oU
	e6G2AbgIdhmV4QoZejwSkeL20+mmx6akrhttahntWeR/mICbEdG2s9YmQUmyqJ4yAgsPqw
	Z0rPCddynb2YcgxLvvLmHuiqB04wZdo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-51mdTqzeNhiTUbne6ZtZWg-1; Tue, 05 Oct 2021 12:57:36 -0400
X-MC-Unique: 51mdTqzeNhiTUbne6ZtZWg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9CA9802B9E;
	Tue,  5 Oct 2021 16:57:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC18C5D9D5;
	Tue,  5 Oct 2021 16:57:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E9E21800B9C;
	Tue,  5 Oct 2021 16:57:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 195GvEfB025589 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 5 Oct 2021 12:57:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 28A7F2166B47; Tue,  5 Oct 2021 16:57:14 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E9812166B4D
	for <linux-lvm@redhat.com>; Tue,  5 Oct 2021 16:57:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B2A618A6537
	for <linux-lvm@redhat.com>; Tue,  5 Oct 2021 16:57:06 +0000 (UTC)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
	[209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-587-VGAPBqqAMNWdO1wz8gFdRg-1; Tue, 05 Oct 2021 12:57:05 -0400
X-MC-Unique: VGAPBqqAMNWdO1wz8gFdRg-1
Received: by mail-oi1-f199.google.com with SMTP id
	n25-20020a05680803b900b00276671ea7d6so17728oie.19
	for <linux-lvm@redhat.com>; Tue, 05 Oct 2021 09:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=U7BzjtjGTmcw9KrDT9s9uIBIiD9zfhC0HGGM6dX5+jA=;
	b=bbq7CVX3sryTvTf6NQxERhvJCe/vANIZbRXvHM9Vzuci8wAoSjBOYaPea3AQP/1+px
	t75RpnQYae9CL2+Q7uQj+KAz4F5bdoGl4yuEgPYELZ4UjBMAB5wd9dUv6o6OPVKYFxFb
	SYsAg8MHCFgYVA7cEWg59e9RTwmOfyINYJVThhXNo1ezgvm4h8xs2kGXYv81jkzP71v1
	Fzi7JPNFskdzYVrDUZv0O4Ds3wz0l/PJCnZNpmEtE+B3rCEKRremk1ite2p+adY1D0FT
	p9jUebkF/trePuupvyqnV6FgEW1tt4e2ZeSt8lcyfC531M6a9kFitVnSVsp5mqWlgmJQ
	zVmg==
X-Gm-Message-State: AOAM530WioJWo0ENK3RBNISjSXH5Yf9dYf6kyah5/TR9s5RL0Tyn+aHA
	8edVfCmjC05UQG4frYD80k3w6cJccR3Uq+NOLF0P/SND4uMeGZHCte91G4Hrw5QIcmlJF/tbhr6
	chiqPJm3zjO3Yji31BAXZj4f6iFKhODw=
X-Received: by 2002:a9d:135:: with SMTP id 50mr15304977otu.295.1633453024236; 
	Tue, 05 Oct 2021 09:57:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIGhVuzqKEpGvyAJgGGJgjzseJAOWanU8+ZlC77E0HH1YBpaj4l2vNMT5m9F0kIJCejZKmzi4/p6ptzCKPJks=
X-Received: by 2002:a9d:135:: with SMTP id 50mr15304962otu.295.1633453024001; 
	Tue, 05 Oct 2021 09:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAPWGHt1MCzPbEHrF-5SRDavHqOfhMSqhkfAUQDMYT=HJ7TRfuQ@mail.gmail.com>
	<CAPWGHt3bB4QiM6RZkC_58X8jev+mVwpkuCY==45Gr4j5jOYHBA@mail.gmail.com>
	<b9e10482-e508-63fa-5518-94cccc007e81@redhat.com>
In-Reply-To: <b9e10482-e508-63fa-5518-94cccc007e81@redhat.com>
From: Ming Hung Tsai <mtsai@redhat.com>
Date: Wed, 6 Oct 2021 00:56:52 +0800
Message-ID: <CALjSBEsb9gSMt7yNHNdYyFgG-Z_Yd3d0X-er24gvCUF1ZjrWog@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 5, 2021 at 11:54 PM Zdenek Kabelac <zkabelac@redhat.com> wrote:
>
> Dne 05. 10. 21 v 13:34 Krzysztof Chojnowski napsal(a):
> > $ sudo cache_check /dev/mapper/vg0-wdata_cachepool_cpool_cmeta
> > examining superblock
> > examining mapping array
> >    missing mappings [1, 0]:
> >      missing blocks
> > examining hint array
> >    missing mappings [1, 0]:
> >      missing blocks
> > examining discard bitset
>
> Hello Krzystof
>
> You need to repair your cache-pool metadata.
>
> But before continuing with advices - what is the version of kernel lvm2 & your
> device-mapper-persistent-data package (aka  'cache_check -V)
>
> Component activation allows activation of your _cmeta LV - but only in
> read-only mode - so repair must go into a new LV.
>
> Since cache_check reported  '1' exist code (as an error) - your metadata do
> require a fix.
>
> lvconvert --repair should be able to handle this case - although likely
> without 'smart' placement' of fixed metadata (pvmove needed after metadata fix)
>
> You can allocated your new metadata and easily cache_repair them.
>
>
> Regards
>
> Zdenek


I think it's a case that the superblock was not committed before the
power outage, that's why the error message shows zero in the third
line. Some fields or unwritten blocks might be lost.

cache_repair might not handle this case perfectly. If possible, you
could upload the "original" metadata somewhere for me to take a look,
by dd it into a binary file.

The "original" metadata should be named vg0/tpg1-wdata_meta0 or
something suffixed with "_meta0" since you've run lvconvert.

Also, as Zdenek mentioned, please help provide the LVM, dmpd, and
kernel versions.


Ming-Hung Tsai

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

