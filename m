Return-Path: <SRS0=iYY7=ON=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AB2C433EF
	for <linux-lvm@archiver.kernel.org>; Thu, 23 Sep 2021 13:52:10 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC1EB61090
	for <linux-lvm@archiver.kernel.org>; Thu, 23 Sep 2021 13:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC1EB61090
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632405128;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=W5HH3A/v1vL+QY37LnRbUN/knUQki66nBTHpRRtGU6s=;
	b=KWrkOZUoMqMiZgJFVqQagKrlL02b58yM0RmvVd2us0NrbtMNs9k/Q3yrNzeG4/gtIOTV/g
	i89QGCKffNpZRijzaHLGBliwIreq27H6RSAVZGMzb4U8kYJ7rI25eD2dU+h3RV82mwUGoE
	aXcLPDH0O29CEtWp99Od8ThFAjF5Re4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-B6OD2YC9OICHLzgrark58A-1; Thu, 23 Sep 2021 09:52:06 -0400
X-MC-Unique: B6OD2YC9OICHLzgrark58A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 735091006AA3;
	Thu, 23 Sep 2021 13:52:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D37CC4180;
	Thu, 23 Sep 2021 13:52:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A3A444E58F;
	Thu, 23 Sep 2021 13:51:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18NDpv94022857 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 23 Sep 2021 09:51:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1E59A19730; Thu, 23 Sep 2021 13:51:57 +0000 (UTC)
Received: from [10.40.193.20] (unknown [10.40.193.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6DFD719724;
	Thu, 23 Sep 2021 13:51:56 +0000 (UTC)
Message-ID: <bd2ffcd6-e067-8152-fd2f-6d5036cb2ec6@redhat.com>
Date: Thu, 23 Sep 2021 15:51:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Firefox/91.0 Thunderbird/91.1.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
	alessandro macuz <alessandro.macuz@gmail.com>
References: <CAFrGbuU63mCLDc47aiY6PuEf4C1B=CL3Dh1=GB+p_rRWkV8S4g@mail.gmail.com>
	<CAFrGbuWKxbB=2Q6QygfN5mLh1MU7ztwXOouiRF2ynP-BcjhfXA@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
In-Reply-To: <CAFrGbuWKxbB=2Q6QygfN5mLh1MU7ztwXOouiRF2ynP-BcjhfXA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] " Failed to find physical volume <ZFS block device"
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 22. 09. 21 v 18:48 alessandro macuz napsal(a):
> fdisk correctly identifies the extended partition as 8e.
> I wonder which kind of data lvmdiskscan and pvs use in order to list LVM 
> physical volumes.
> Does PVS check some specific metadata within the partition without just 
> relying on the type of partition displayed by fdisk?
> 
>

Hi

Yes - PVs do have header signature keeping information about PV attributes
and also has the storage area to keep lvm2 metadata.

Partition flags known to fdisk are irrelevant.


Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

