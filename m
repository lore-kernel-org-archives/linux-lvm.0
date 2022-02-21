Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DBBC433F5
	for <linux-lvm@archiver.kernel.org>; Mon, 21 Feb 2022 13:54:17 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-Dr5683TzPpaHbZBmSdMB5w-1; Mon, 21 Feb 2022 08:54:12 -0500
X-MC-Unique: Dr5683TzPpaHbZBmSdMB5w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C58B9814249;
	Mon, 21 Feb 2022 13:54:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7120774E9F;
	Mon, 21 Feb 2022 13:53:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 714894BB7C;
	Mon, 21 Feb 2022 13:53:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21LDqgfN017933 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 21 Feb 2022 08:52:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 18CFBC1D3AE; Mon, 21 Feb 2022 13:52:42 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14B9FC1D3AD
	for <linux-lvm@redhat.com>; Mon, 21 Feb 2022 13:52:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBDD985A5A8
	for <linux-lvm@redhat.com>; Mon, 21 Feb 2022 13:52:41 +0000 (UTC)
Received: from forward107o.mail.yandex.net (forward107o.mail.yandex.net
	[37.140.190.210]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-557-QEeue-IvN3ydrohcmCvLXw-1; Mon, 21 Feb 2022 08:52:40 -0500
X-MC-Unique: QEeue-IvN3ydrohcmCvLXw-1
Received: from iva8-6952089dd50b.qloud-c.yandex.net
	(iva8-6952089dd50b.qloud-c.yandex.net
	[IPv6:2a02:6b8:c0c:6f19:0:640:6952:89d])
	by forward107o.mail.yandex.net (Yandex) with ESMTP id 060776AF893B
	for <linux-lvm@redhat.com>; Mon, 21 Feb 2022 16:47:22 +0300 (MSK)
Received: from iva8-a4a480c9f089.qloud-c.yandex.net
	(iva8-a4a480c9f089.qloud-c.yandex.net
	[2a02:6b8:c0c:da5:0:640:a4a4:80c9])
	by iva8-6952089dd50b.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
	uDrh5gZ7JB-lLc8gtQf; Mon, 21 Feb 2022 16:47:21 +0300
X-Yandex-Fwd: 2
Received: by iva8-a4a480c9f089.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
	id psjYU3u9F5-lLHCWF31; Mon, 21 Feb 2022 16:47:21 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
Message-ID: <3e96860d112e86ee55fba0e5fffbf1ee433905e6.camel@yandex.ru>
From: Konstantin Kharlamov <hi-angel@yandex.ru>
To: linux-lvm@redhat.com
Date: Mon, 21 Feb 2022 16:45:51 +0300
User-Agent: Evolution 3.42.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: linux-lvm@redhat.com
Subject: [linux-lvm] Frequent crashes when accessing dev_name(dev) on an
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello! We encountered quite a few of sporadic crashes, which upon inspection turned out to be caused by dev->aliases list being empty.

One example of a fix (not tested):

--- a/lib/label/hints.c
+++ b/lib/label/hints.c
@@ -471,7 +471,8 @@ int validate_hints(struct cmd_context *cmd, struct dm_list
*hints)
    471         if (!(iter = dev_iter_create(NULL, 0)))
    472                 return 0;
    473         while ((dev = dev_iter_get(cmd, iter))) {
474    -                if (!(hint = _find_hint_name(hints, dev_name(dev))))
    474+                if (dm_list_empty(dev->aliases) ||
    475+                    !(hint = _find_hint_name(hints, dev_name(dev))))
475 476                         continue;
476 477
477 478                 /* The cmd hasn't needed this hint's dev so it's not
been scanned. */

So, what happened was that dev_name(dev) was extracting a `dev->aliases` element
, however `dev->aliases` was empty, thus the extracted element was a junk.

Although we encountered these crashes on an older 2.03.07 version, however the
patch applies to latest master as well, thus the bugs are still relevant, which
is odd. This makes me wondering, is this a known problem, could I possibly
overlooked something, for example that dev->aliases should never be empty, and
thus the fix just works around another problem? Any thoughts?

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

