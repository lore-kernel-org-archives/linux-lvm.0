Return-Path: <SRS0=j0V8=OV=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD88C433EF
	for <linux-lvm@archiver.kernel.org>; Fri,  1 Oct 2021 08:08:49 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB15161A57
	for <linux-lvm@archiver.kernel.org>; Fri,  1 Oct 2021 08:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB15161A57
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633075727;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kVt3nqf2KuWhpHHQBkKi0TlQ68cE3731jScezcv8fHk=;
	b=iE/sohWlfjbVzGkSRDojY0huXQCj7x1LTFNhIOxisqXr8cP/E5setnGAkHuLLBsmulKYhN
	xDGZjCN54kx+MO8VYPZV1B5CFU1YmMKDxdms3SqZqxT6kj9QXEG9NRO4/DCSMwp09RdZqy
	0BJbxubjj+ZK7OyY8cQ2srVATuqU8bE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-lMC2-juQNACDrnS6j8F9Uw-1; Fri, 01 Oct 2021 04:08:46 -0400
X-MC-Unique: lMC2-juQNACDrnS6j8F9Uw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDF45362FB;
	Fri,  1 Oct 2021 08:08:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D002F60C5F;
	Fri,  1 Oct 2021 08:08:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EFFF21809C81;
	Fri,  1 Oct 2021 08:08:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19188XEL014928 for <linux-lvm@listman.util.phx.redhat.com>;
	Fri, 1 Oct 2021 04:08:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B4BE22167811; Fri,  1 Oct 2021 08:08:33 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFC11216780F
	for <linux-lvm@redhat.com>; Fri,  1 Oct 2021 08:08:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97B09800B24
	for <linux-lvm@redhat.com>; Fri,  1 Oct 2021 08:08:33 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
	[209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-355-PLBawfQ2OlWo2K2MVOVZCQ-1; Fri, 01 Oct 2021 04:08:30 -0400
X-MC-Unique: PLBawfQ2OlWo2K2MVOVZCQ-1
Received: by mail-ed1-f69.google.com with SMTP id
	z6-20020a50cd06000000b003d2c2e38f1fso9550683edi.1
	for <linux-lvm@redhat.com>; Fri, 01 Oct 2021 01:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=w8joySE1uG1XoEEl07b61dEx58S2sXtRlfSd/UvAzsE=;
	b=xtR7acbKVLttQ2v2yu0p99KfvlTALjfuUzItlLBtdsIZj/Bae9DQFp0YOOg2cc/Hus
	KkN533+IOMALsS18DprQON5EbFx5WDb98V8q6kvzL97VBb1AFPEAQYwKcvRKwZGiQxab
	6Pgx520L69jgh4e7tn2Db+kxOdANOBtHCYGb4LNvhW+CPuMegfxmmJp1uiZGRjJnpDLP
	oh6ALanF2hCYv9UOGKImhLKnHp4t/Wt58DAKjq957T7KlyT7q7t6Ci9TLB8iuwAxGVk5
	x0aywJLR2VKV03gqTjQDl7Zr3FgQ3R0xqLW/kQJYu3UAVpg0KrZ3U8Dhtzf4O7KPGWeI
	YmLQ==
X-Gm-Message-State: AOAM533hReiOxpXOToaqIcpEklS0EPCCY2mWTcmexcueZjc2cTKmjmYm
	gbgWCGJrluRDw6I6wbplOg6aBv6u0jSR8S55RfAR8NiWa63oJAr+VkDUX7c2jSzx9SzRB5xF91k
	MlejzRnhhmHjR5k5x
X-Received: by 2002:a17:906:c18c:: with SMTP id
	g12mr4596826ejz.458.1633075709322; 
	Fri, 01 Oct 2021 01:08:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzG2P2pEPgf9U78IcIUfiyoC75wfnb9bjFwfuw2LSOji92qJNZRFrJp3nBSIT/FC67aVCtOA==
X-Received: by 2002:a17:906:c18c:: with SMTP id
	g12mr4596803ejz.458.1633075709124; 
	Fri, 01 Oct 2021 01:08:29 -0700 (PDT)
Received: from alatyr-rpi.brq.redhat.com (nat-pool-brq-t.redhat.com.
	[213.175.37.10]) by smtp.gmail.com with ESMTPSA id
	q17sm2858776edd.57.2021.10.01.01.08.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 01 Oct 2021 01:08:28 -0700 (PDT)
Date: Fri, 1 Oct 2021 10:08:25 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20211001080825.s6scrvujgbufhaiu@alatyr-rpi.brq.redhat.com>
References: <9947152f39a9c5663abdbe3dfee343556e8d53d7.camel@suse.com>
	<20210928144254.GC11549@redhat.com>
	<138b7ddb721b6a58df8f0401b76c7975678f0dda.camel@suse.com>
	<20210928174246.GF3087@octiron.msp.redhat.com>
	<20210929220653.p45cvgzdhlbnp4gy@alatyr-rpi.brq.redhat.com>
	<e8459ca73b148e9ba20cbde0041f6e5f4093699d.camel@suse.com>
	<a3ef9433-ccab-68ea-de00-caebd74e81dc@suse.com>
	<d7248c67-afdf-9f27-bf41-13b74346f0c1@redhat.com>
	<7e91a1e8-2379-a33c-1482-b31adaa7bc8b@suse.com>
	<074e7d61fac100ef3bdb49edb2a29b4b6a666ef3.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <074e7d61fac100ef3bdb49edb2a29b4b6a666ef3.camel@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-lvm@redhat.com
Cc: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	"teigland@redhat.com" <teigland@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] Discussion: performance issue on event activation
 mode
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri 01 Oct 2021 07:41, Martin Wilck wrote:
> On Thu, 2021-09-30 at 23:32 +0800, heming.zhao@suse.com wrote:
> > > I just want to say that some of the issues might simply be
> > > regressions/issues with systemd/udev that could be fixed. We as
> > > providers of block device abstractions where we need to handle,
> > > sometimes, thousands of devices, might be the first ones to hit these
> > > issues.
> > > 
> > 
> > The rhel8 callgrind picture
> > (https://prajnoha.fedorapeople.org/bz1986158/rhel8_libudev_critical_cost.png
> > )
> > responds to my analysis:
> > https://listman.redhat.com/archives/linux-lvm/2021-June/msg00022.html
> > handle_db_line took too much time and become the hotspot.
> 
> I missed that post. You wrote
> 
> > the dev_cache_scan doesn't have direct disk IOs, but libudev will
> scan/read
> > udev db which issue real disk IOs (location is /run/udev/data).
> > ...
> > 2. scans/reads udev db (/run/udev/data). may O(n)
> >  udev will call device_read_db => handle_db_line to handle every
> >    line of a db file.
> > ...
> > I didn't test the related udev code, and guess the <2> takes too much
> time.
> 
> ... but note that /run/udev is on tmpfs, not on a real disk. So  the
> accesses should be very fast unless there's some locking happening.

Yes, indeed! I think this is a regression.

The results/graphs show that lots of time is spent on some internal
hashmap handling. I don't see this in older versions of udev like the
one bundled with systemd v219 (I compared RHEL7 and 8, haven't done
detailed bisection yet). My suspicion is that some of the code in udev
got more shared with native systemd code, like that hash usage, so this
might be the clue, but someone from systemd/udev should look more closer
into this.

-- 
Peter

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

