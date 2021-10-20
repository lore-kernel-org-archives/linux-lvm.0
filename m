Return-Path: <SRS0=MfZM=PI=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E04A9C433EF
	for <linux-lvm@archiver.kernel.org>; Wed, 20 Oct 2021 15:27:55 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C47A6135F
	for <linux-lvm@archiver.kernel.org>; Wed, 20 Oct 2021 15:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C47A6135F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634743674;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ase96lkODmp3xclhOVLJZAam+l6B6QYHUFjjK7qbhfo=;
	b=L71VVEzkCAyVYkjKvjDKot+9eRlhtqm19XCGVwpuQfx9qDa8DpOKJNlYhg+WzfiwXnlpng
	/tab49wrhS6Cn4yCLM8+VVA4fSrD7yp2iloSMx2onELEHg6aJIPzmxiVGi+wdGHL0EZbQM
	5wkVH7loF+J4bPTCyfJEgag3NcIDQfM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-0A5uY9ucMkqAbnrcWFQg0Q-1; Wed, 20 Oct 2021 11:27:50 -0400
X-MC-Unique: 0A5uY9ucMkqAbnrcWFQg0Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD64A8042F4;
	Wed, 20 Oct 2021 15:27:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB14960CA0;
	Wed, 20 Oct 2021 15:27:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DEB9E1832DDA;
	Wed, 20 Oct 2021 15:27:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19KFDCqP003790 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 20 Oct 2021 11:13:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BC50B5DD68; Wed, 20 Oct 2021 15:13:12 +0000 (UTC)
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA5325DF21;
	Wed, 20 Oct 2021 15:13:00 +0000 (UTC)
Date: Wed, 20 Oct 2021 10:12:58 -0500
From: David Teigland <teigland@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20211020151258.GB22742@redhat.com>
References: <20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<20210929213952.ws2qpmedaajs5wlx@alatyr-rpi.brq.redhat.com>
	<20210930155542.GB32174@redhat.com>
	<418b2bd497a3a4cd76840b3cceb1955ba7e9ba01.camel@suse.com>
	<20211018150418.GA3917@redhat.com>
	<ec784347cc8cf3530533701fd85c0e7825fd8a93.camel@suse.com>
	<20211020145046.GA22742@redhat.com>
	<9ec85bc97fb23a0cf65d5241125ecca54ec47bd7.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <9ec85bc97fb23a0cf65d5241125ecca54ec47bd7.camel@suse.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-lvm@redhat.com
Cc: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>,
	Heming Zhao <heming.zhao@suse.com>
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

On Wed, Oct 20, 2021 at 02:54:54PM +0000, Martin Wilck wrote:
> I see. The problem with IMPORT (like RUN, actually) is that it's
> required to finish quickly, which might not be the case if we encounter
> resource shortage / contention as observed by Heming. If that happens,
> the programs started may be killed by udevd, with unpredictable
> results.

We've been optimizing the pvscan --cache command that gets the VG name
from the disk and checks if the VG is complete.  It's pretty small and
fast at this point.  Also, the lvm-activate-vgs services that we have been
discussing should result in a large number of those pvscans doing nothing
(i.e. those that are triggered prior to lvm-activate-vgs-last.service will
see that event-based activation is not yet enabled and will exit.)

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

