Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF829C433F5
	for <linux-lvm@archiver.kernel.org>; Mon, 21 Feb 2022 16:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645462550;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Uf2XPA+p6aeof0HGpJ2dGZ2iuJ9zOLf8PU2jlSbiItw=;
	b=iRGarnLSJBhfKIemNbbSBehzsH2wW21Bv1SAnLTc5au/j4EsczzWkNJNoMewSU2KDPnFRK
	j/pq1e9MUB8CDvNWKiZfcvbOzKtTlHfxB++tCnWYwTEubImmbh/FNYx0mP7tzT28nN6brz
	W0bCXq/qMde0VSov9KtRU9Nq84YJzRQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-TGK5PPlCMkeXaXCeRAEXQQ-1; Mon, 21 Feb 2022 11:55:47 -0500
X-MC-Unique: TGK5PPlCMkeXaXCeRAEXQQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC27218460E5;
	Mon, 21 Feb 2022 16:55:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 852D4753E7;
	Mon, 21 Feb 2022 16:55:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D3A54BB7C;
	Mon, 21 Feb 2022 16:55:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21LGnroM001942 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 21 Feb 2022 11:49:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4AB90838D4; Mon, 21 Feb 2022 16:49:53 +0000 (UTC)
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 022FC82764;
	Mon, 21 Feb 2022 16:49:49 +0000 (UTC)
Date: Mon, 21 Feb 2022 10:49:47 -0600
From: David Teigland <teigland@redhat.com>
To: Konstantin Kharlamov <hi-angel@yandex.ru>
Message-ID: <20220221164947.GA18428@redhat.com>
References: <3e96860d112e86ee55fba0e5fffbf1ee433905e6.camel@yandex.ru>
MIME-Version: 1.0
In-Reply-To: <3e96860d112e86ee55fba0e5fffbf1ee433905e6.camel@yandex.ru>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-lvm@redhat.com
Cc: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Frequent crashes when accessing dev_name(dev) on an
 empty list
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

On Mon, Feb 21, 2022 at 04:45:51PM +0300, Konstantin Kharlamov wrote:
> So, what happened was that dev_name(dev) was extracting a `dev->aliases` element
> , however `dev->aliases` was empty, thus the extracted element was a junk.
> 
> Although we encountered these crashes on an older 2.03.07 version, however the
> patch applies to latest master as well, thus the bugs are still relevant, which
> is odd. This makes me wondering, is this a known problem, could I possibly
> overlooked something, for example that dev->aliases should never be empty, and
> thus the fix just works around another problem? Any thoughts?

It's familiar, but I thought it was fixed.  I don't remember the details,
so we'll have to look at it again.  It's related to a device being removed
from the system while the command is running, which we need to add tests
for.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

