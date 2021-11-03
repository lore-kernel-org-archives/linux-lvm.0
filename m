Return-Path: <SRS0=MvFQ=PW=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3EDC433EF
	for <linux-lvm@archiver.kernel.org>; Wed,  3 Nov 2021 20:16:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DE8660551
	for <linux-lvm@archiver.kernel.org>; Wed,  3 Nov 2021 20:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DE8660551
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635970562;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MrQbNY1oF1niay59GZFXy2wFxGgd01lJYEsbSzqxYF4=;
	b=Mm5DeKKPhGUhM4tkF4Bx+63ccoQ2coPa8nG9v23s/5sau1u6OPmZeC/5mxWnARV/M3sKzS
	/SvVG+8Spzdq7C5F8kpCvViz9xj1oRA/tnBOF2GyijfQ+eEluuWKHyvUAFr9rE1hHWbnk/
	maIIl543d2yQtUtPeoJawda8D0mPVMA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-zApOvBp0OGGrjdt_vvBisg-1; Wed, 03 Nov 2021 16:16:00 -0400
X-MC-Unique: zApOvBp0OGGrjdt_vvBisg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE232806689;
	Wed,  3 Nov 2021 20:15:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C9BE67840;
	Wed,  3 Nov 2021 20:15:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9EAF71800B9E;
	Wed,  3 Nov 2021 20:15:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A3KFdLK016343 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 3 Nov 2021 16:15:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4E9AC57CB9; Wed,  3 Nov 2021 20:15:39 +0000 (UTC)
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43B29652AC;
	Wed,  3 Nov 2021 20:15:35 +0000 (UTC)
Date: Wed, 3 Nov 2021 15:15:32 -0500
From: David Teigland <teigland@redhat.com>
To: Chris Murphy <lists@colorremedies.com>
Message-ID: <20211103201532.GB5773@redhat.com>
References: <CAJCQCtRCEtGmsVQt0ug4c6PxGXkwhHjtrppNPSxa0StYs08mQA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJCQCtRCEtGmsVQt0ug4c6PxGXkwhHjtrppNPSxa0StYs08mQA@mail.gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-lvm@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] logical volume usage type code,
 equivalent to GPT partition type GUID
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 03, 2021 at 01:44:33PM -0400, Chris Murphy wrote:
> Hi,
> 
> I'm wondering to what degree the current LVM metadata format(s) can
> support additional or even arbitrary metadata.
> 
> The UEFI spec defines the GPT, and GPT defines a "partition type GUID"
> for each partition to define it's usage/purpose, in rather open ended
> fashion. I'm wondering about an equivalent for this with LVM, whether
> it's useful and how difficult it would be to implement. This is all
> very hypothetical right now, so a high level discussion is preferred.
> 
> The starting point is the Discoverable Partitions Spec:
> http://systemd.io/DISCOVERABLE_PARTITIONS/
> 
> Where GPT partition type codes are used to discover file systems, and
> their intended use without having to explicitly place them into
> /etc/fstab for startup time discovery and mounting. But LVM doesn't
> have an equivalent for exposing such a capability, because it implies
> many volumes within the larger pool and also the pool might comprise
> many devices.

I'd been curious about this since reading that page.  It would be nice if
it provided a way to better integrate lvm activation with the broader
system.

It seems like adding GPT info to disks, plus using predefined LV names, is
an alternative to setting rd.lvm.lv on the command line.  i.e. the OS will
activate a predefined root LV name from disks that are flagged (using GPT)
to be used for the purpose of the root LV.  Is that the idea?

In terms of lvm metadata, the set of disks used by the root LV is kept in
the lvm metadata, and that info would need to be kept in sync with the GPT
info on those same disks.  e.g. the lvm metadata says LV /dev/rootvg/root
uses sda and sdb, so the GPT info on sda and sdb also needs to reflect
that they are used for a root LV.  When the disks in the root LV change,
e.g. lvextend, then GPT info would also need updating.  I suppose this
just requires some integration between tools (unless the user is supposed
to be responsible for keeping things in sync.)

A similar kind of integration between lvm and dracut would let us improve
lvm activation in the initramfs.  There's not an obviously clean way to
update the initramfs from lvextend, so it's not been done.

I'll wait with other questions until I know if I've understood the basic
idea.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

