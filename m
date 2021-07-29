Return-Path: <SRS0=UyFc=MV=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2DAC4338F
	for <linux-lvm@archiver.kernel.org>; Thu, 29 Jul 2021 15:00:28 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A63360EC0
	for <linux-lvm@archiver.kernel.org>; Thu, 29 Jul 2021 15:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A63360EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627570826;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iqLsbMNc0YWuk57brR63yKfw4b7XhKZNRpLDB9E7S+8=;
	b=ZZqfAFhpLPnuwnfOLSvauqI2P0Of+6pFcQexfHYmkgjxgke4zaHNLm6ZC0vIr91irQ5SKk
	+H5Md4XtRR9DFZPJjfQxCkY1CBbbEJhP0nihDFtRqlJHvDVfxJk6ixEoYAvxSs6vXIWeKq
	7k8Qtx+M+sbTf1+a0S9w1LTdCzR9ZAI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-IWLZb3UoOY2ClzI8knevnQ-1; Thu, 29 Jul 2021 11:00:24 -0400
X-MC-Unique: IWLZb3UoOY2ClzI8knevnQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40E52101F018;
	Thu, 29 Jul 2021 15:00:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA74126E60;
	Thu, 29 Jul 2021 15:00:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A203F4BB7C;
	Thu, 29 Jul 2021 15:00:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16TExvGd001640 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 29 Jul 2021 10:59:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6A8D167899; Thu, 29 Jul 2021 14:59:57 +0000 (UTC)
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34AAA5F705;
	Thu, 29 Jul 2021 14:59:48 +0000 (UTC)
Date: Thu, 29 Jul 2021 09:59:46 -0500
From: David Teigland <teigland@redhat.com>
To: Martin =?iso-8859-1?Q?D=FCnkelmann?= <nc-duenkekl3@netcologne.de>
Message-ID: <20210729145946.GA22305@redhat.com>
References: <630e7a16-5305-9319-52e2-8c45da6e9e27@netcologne.de>
MIME-Version: 1.0
In-Reply-To: <630e7a16-5305-9319-52e2-8c45da6e9e27@netcologne.de>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-lvm@redhat.com
Cc: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Questions about monitoring,
 scrubbing & checking a LVM RAID5
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 28, 2021 at 11:50:56PM +0200, Martin D=FCnkelmann wrote:
> Dear LVM2-People,
>=20
> I made a native RAID5 via LVM on 3 SSDs without mdadm, since LVM2 can do =
it
> natively.
>=20
> But I got confused about how to easily monitor it (send emails about erro=
rs,
> since it's a remove server) and how to check, repair and scrub the RAID5.
>=20
> Using:
> "sudo lvchange --syncaction check cryptdata_raid5/home" (same for repair)
> results in
>=20
> Command on LV cryptdata_raid5/home does not accept LV type linear.
> Command not permitted on LV cryptdata_raid5/home.

It works for me, so it could be a fixed bug.  Check that the LV is really
raid5: lvs -o segtype cryptdata_raid5/home

> Does that mean LVM2 doesn't fully support native RAID5 and I should forma=
t
> everything and set up a mdadm raid5?
> Because mdadm has scrubbing and email reports according to the mdadm.conf=
.

Right, mdadm does much more.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

