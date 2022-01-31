Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C27C433F5
	for <linux-lvm@archiver.kernel.org>; Mon, 31 Jan 2022 07:53:00 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-TXkNIveWMZmfNyl3Nvs73Q-1; Mon, 31 Jan 2022 02:52:58 -0500
X-MC-Unique: TXkNIveWMZmfNyl3Nvs73Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51C2D1006AA6;
	Mon, 31 Jan 2022 07:52:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D32826E4B1;
	Mon, 31 Jan 2022 07:52:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DAD034BB7C;
	Mon, 31 Jan 2022 07:52:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20V7qlT1006224 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 31 Jan 2022 02:52:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D44062026D4D; Mon, 31 Jan 2022 07:52:47 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D001F2026D46
	for <linux-lvm@redhat.com>; Mon, 31 Jan 2022 07:52:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A77B485A5B5
	for <linux-lvm@redhat.com>; Mon, 31 Jan 2022 07:52:44 +0000 (UTC)
Received: from plutone.assyoma.it
	(host195-56-237-212.serverdedicati.aruba.it [212.237.56.195]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-222-Xd1or3CCPPyaeyb4d03NoA-1; Mon, 31 Jan 2022 02:52:42 -0500
X-MC-Unique: Xd1or3CCPPyaeyb4d03NoA-1
Received: from webmail.assyoma.it (localhost [IPv6:::1])
	by plutone.assyoma.it (Postfix) with ESMTPA id 6A760C01A508;
	Mon, 31 Jan 2022 08:52:39 +0100 (CET)
MIME-Version: 1.0
Date: Mon, 31 Jan 2022 08:52:39 +0100
From: Gionatan Danti <g.danti@assyoma.it>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
In-Reply-To: <YfcAucYQ+GIMpW6t@itl-email>
References: <YfWkwtOTFYxDyYrW@itl-email>
	<6da8a7fc-4ca4-9c1d-c547-dcba827c5c99@gmail.com>
	<YfXcxHenCZw4+EFX@itl-email>
	<4bb347f0-b63b-d6f6-d501-1318053d0e56@gmail.com>
	<YfbApm+9ac6iBbbg@itl-email>
	<849ab633-ec3d-a0a5-38bf-72b87bbba2c5@gmail.com>
	<d6edb2859c355a842a87b897106832a0@assyoma.it>
	<YfcAucYQ+GIMpW6t@itl-email>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <5ee795126229835d2ce14c2c9619b73f@assyoma.it>
X-Sender: g.danti@assyoma.it
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-lvm@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] LVM performance vs direct dm-thin
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Il 2022-01-30 22:17 Demi Marie Obenour ha scritto:
> On Xen, the paravirtualised block backend driver (blkback) requires a
> block device, so file-based virtual disks are implemented with a loop
> device managed by the toolstack.  Suggestions for improving this
> less-than-satisfactory situation are welcome.

Ah - I expected that with something as

disk = [ 'file:mydisk.img,hda,w' ]

Xen would have directly used "mydisk.img" as the backend disk file. Does 
it instead automatically create a loopback overlay?

I mainly use KVM, and maybe I am spoiled by its capability to use 
basically any datastore as backing disk.
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

