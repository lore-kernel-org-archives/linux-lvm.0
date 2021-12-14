Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585EEC433F5
	for <linux-lvm@archiver.kernel.org>; Tue, 14 Dec 2021 15:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639496143;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NgRxnzf263zhPmKn5+jVoGv0xemK7mIgFYjTK4JMAn0=;
	b=Vd1UnTGSYnzQp4/vh6b4B/eNvGkOsmDxP10yD+ku9ZKybqwrsiVERntgiUdpo6/R0FF5RO
	SD+GJqGenXpT44RxQ7UPEZilxpAZ/FL6d3fXws0fjpaTMdU7ZGcVx4OHT70bKYkr5MAFxe
	u4swTKCg7qJBOt5cyhwKnt9yK8yeEMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-nRSgZxG7NgeIwxAiuQBvPA-1; Tue, 14 Dec 2021 10:35:41 -0500
X-MC-Unique: nRSgZxG7NgeIwxAiuQBvPA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CCDC8042A2;
	Tue, 14 Dec 2021 15:35:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 779437B023;
	Tue, 14 Dec 2021 15:35:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E1DFD1809CB8;
	Tue, 14 Dec 2021 15:35:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BEFZHBP014020 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 14 Dec 2021 10:35:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EEF521057F55; Tue, 14 Dec 2021 15:35:17 +0000 (UTC)
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22A221057059;
	Tue, 14 Dec 2021 15:34:42 +0000 (UTC)
Date: Tue, 14 Dec 2021 09:34:40 -0600
From: David Teigland <teigland@redhat.com>
To: Tom Yan <tom.ty89@gmail.com>
Message-ID: <20211214153440.GA12773@redhat.com>
References: <CAGnHSEkb59u8LLWks03q=hh3rxcNJQqNLNkjBqc33-Osq=ZZMQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGnHSEkb59u8LLWks03q=hh3rxcNJQqNLNkjBqc33-Osq=ZZMQ@mail.gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-lvm@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] Reason to use -r when systemd-run vgchange -aay
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

On Tue, Dec 14, 2021 at 01:45:57PM +0800, Tom Yan wrote:
> Hi David,
> 
> I notice that in the "new" 69-dm-lvm.rules, vgchange -aay is run with
> systemd-run, which is not a problem.
> 
> However, the fact that the --remain-after-exit (i.e. -r) switch is
> used is, because the service is not stopped when e.g. one deactivates
> a VG with vgchange -an, which will prevent the VG from being
> auto-activated again if e.g. the PV is removed and inserted again.
> 
> I'm not sure if that was a desired behaviour / one of the intended
> purposes. Regardless, I'm not exactly seeing the sense of that either.
> 
> Besides, I don't suppose it would work very well for multi-PV VGs
> anyway. I mean, most likely similar errors (albeit probably harmless)
> would be spammed because of the repeated attempt to *create* a
> transient unit of the same name. (Repeated systemd-run is NOT the same
> as repeated systemctl start; it's also the reason that triggering
> `systemctl stop` with remove event is not a perfect idea either, since
> transient unit created would be gone once it is stopped, so repeated
> systemctl stop will cause more errors to be spammed; Yet we need the
> unit to be gone when it is stopped for the current approach, even if
> it's possible to prevent it from going away.)
> 
> So are there any reasons that we actually need -r? If so, I think we
> need to deal with them with another approach (maybe unit template?).

I added -r to make it easier to see the status/output of the transient
service.  The problem of rerunning the same transient service crossed my
mind at one point, but I never went back to check that.  With your
confirmation, it sounds like -r should be removed.  I want to check if
we can see everything we need to without -r.  I think that service
templates only work with device names, where we need a VG name.

The behavior of repeated VG autoactivation is not entirely well defined,
but we've made some attempt to maintain the status quo.  We may add an
lvm.conf setting at some point to control that behavior if issues appear.

> I also saw this PR on github. I'm not sure if what it stated makes any
> sense though: https://github.com/lvmteam/lvm2/pull/37

I'm not sure about that, those generated services don't get much attention
and we've begun asking around to see if they could be removed.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

