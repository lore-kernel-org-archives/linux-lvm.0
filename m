Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C88C433F5
	for <linux-lvm@archiver.kernel.org>; Tue, 18 Jan 2022 18:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642528805;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vzcUuqnthrskl7B++4zC9XbEfnExOoYL0tQa2ZSdPJA=;
	b=EmPyhYSuO/HGuD9f3MXq6myh7afARHSruK2HUmg4jjXPCouCftyy0z+F5wXU9A3ZN6dIae
	YiFZM6yq35xrSDpcRIjsdJ+CccqnyaPheVNkdYB+exoWHhSLDzICEyd4IAxE4lwxt5Amws
	naGnVpRSm80RGfF8IF7mVOQRDRsZBnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-Fj7_qcKoNbqpCyE-ZZIHzQ-1; Tue, 18 Jan 2022 13:00:01 -0500
X-MC-Unique: Fj7_qcKoNbqpCyE-ZZIHzQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4662118C89CC;
	Tue, 18 Jan 2022 17:59:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21C0738E12;
	Tue, 18 Jan 2022 17:59:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A8A584BB7C;
	Tue, 18 Jan 2022 17:59:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20IHHjTS006318 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 18 Jan 2022 12:17:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B9A8C4D700; Tue, 18 Jan 2022 17:17:45 +0000 (UTC)
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7C5584A30;
	Tue, 18 Jan 2022 17:17:40 +0000 (UTC)
Date: Tue, 18 Jan 2022 11:17:38 -0600
From: David Teigland <teigland@redhat.com>
To: Wayne Workman <wayne@theworkmans.us>
Message-ID: <20220118171738.GA22338@redhat.com>
References: <bccb5451-65b9-5530-0c5d-97be83f2b133@theworkmans.us>
MIME-Version: 1.0
In-Reply-To: <bccb5451-65b9-5530-0c5d-97be83f2b133@theworkmans.us>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-lvm@redhat.com
Cc: linux-lvm@redhat.com
Subject: Re: [linux-lvm] LVM pull requests?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 17, 2022 at 12:09:08PM -0600, Wayne Workman wrote:
> Hello,
> 
> Looking to confirm that the below repository is the place to submit pull
> requests for the lvm2 tool:
> 
> https://github.com/lvmteam/lvm2

Hi, that might work but it looks unmaintained, the upstream is
https://sourceware.org/git/lvm2.git with email for requests.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

