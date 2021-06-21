Return-Path: <SRS0=0Xx+=LP=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4442DC4743C
	for <linux-lvm@archiver.kernel.org>; Mon, 21 Jun 2021 19:48:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D50BD610EA
	for <linux-lvm@archiver.kernel.org>; Mon, 21 Jun 2021 19:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D50BD610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624304929;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Pc8kGNLmDAM+XwXBXUnHiKc5o965P4eDfEMvosX5IBI=;
	b=EhphN9W8jksBrsXo7o3D/5DZqvoq9kfUBgQtwZAgdGVQnkjRcoZ0CA0+VVLCwoCsml8fJX
	CQKwJShTRzK2ZxSTtRQNoaFE6PFpLZqYpPBlwnzTwQPM5gKrb5qkwpsDbbav7pMGHRWS16
	NtPslGNNtaFP6RHdrfVosxM2W8uBC40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-oNUSv30POHuJaqbgBZrAuA-1; Mon, 21 Jun 2021 15:48:46 -0400
X-MC-Unique: oNUSv30POHuJaqbgBZrAuA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD1D3100C619;
	Mon, 21 Jun 2021 19:48:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DA355D740;
	Mon, 21 Jun 2021 19:48:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E9B7E1809C99;
	Mon, 21 Jun 2021 19:48:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15LJmSgf020707 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 21 Jun 2021 15:48:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 78B2B60916; Mon, 21 Jun 2021 19:48:28 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12C4560871;
	Mon, 21 Jun 2021 19:48:25 +0000 (UTC)
Date: Mon, 21 Jun 2021 14:48:23 -0500
From: David Teigland <teigland@redhat.com>
To: N <dundir@gmail.com>
Message-ID: <20210621194823.GA32112@redhat.com>
References: <917d8044-4e7b-e54e-fe69-f60c6703a00f@gmail.com>
MIME-Version: 1.0
In-Reply-To: <917d8044-4e7b-e54e-fe69-f60c6703a00f@gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-lvm@redhat.com
Cc: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Possible Bug vgrename
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 21, 2021 at 11:32:12AM -0700, N wrote:
> Is there a way to temporarily rename (without actually renaming) the volume
> groups (i.e. like setting a mask for the volume group names), or is there a
> way to force vgrename to actually make the change even if there is an
> existing conflict (preferably without a reboot)?

You can set a device filter the vgrename command so it only sees the
devices with the VG you want to change, and won't see devices with the
duplicate name.

vgrename --config 'devices/filter=["a|/dev/...|", "r|.|"]' vg1 vg2

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

