Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48250C433FE
	for <linux-lvm@archiver.kernel.org>; Wed, 29 Dec 2021 14:32:31 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-ulUr_NUQPAyvpC1aFXNoFg-1; Wed, 29 Dec 2021 09:32:25 -0500
X-MC-Unique: ulUr_NUQPAyvpC1aFXNoFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC3DD1853026;
	Wed, 29 Dec 2021 14:32:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A4932B45A;
	Wed, 29 Dec 2021 14:32:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B9EC34BB7C;
	Wed, 29 Dec 2021 14:31:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BTEVpwW030606 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 29 Dec 2021 09:31:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 83A5C140241F; Wed, 29 Dec 2021 14:31:51 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EFFB140240A
	for <linux-lvm@redhat.com>; Wed, 29 Dec 2021 14:31:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6582485A5AA
	for <linux-lvm@redhat.com>; Wed, 29 Dec 2021 14:31:51 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-491-Cpc_bA2tM52GENSj9tmllg-1; Wed, 29 Dec 2021 09:31:48 -0500
X-MC-Unique: Cpc_bA2tM52GENSj9tmllg-1
Received: from wiki.gathman.org (mail.gathman.org [IPv6:2001:470:8:809::1010])
	(authenticated bits=0)
	by mail.gathman.org (8.14.7/8.14.7) with ESMTP id 1BTDZF9X024048
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 29 Dec 2021 08:35:19 -0500
Date: Wed, 29 Dec 2021 08:35:15 -0500 (EST)
From: Stuart D Gathman <stuart@gathman.org>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <315E5303-D491-4487-BAD4-958420346163@gmail.com>
Message-ID: <31e6126c-b6ff-42a7-68f5-a3a2782060d4@gathman.org>
References: <1b906296-f66d-e755-9574-f1398bc9564@gathman.org>
	<315E5303-D491-4487-BAD4-958420346163@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: linux-lvm@redhat.com
Cc: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Subject: Re: [linux-lvm] how to convert a disk containing a snapshot to a
 snapshot lv?
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
Content-Type: multipart/mixed;
	boundary="-1203360521-967312667-1640784919=:23858"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1203360521-967312667-1640784919=:23858
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.gathman.org id
	1BTDZF9X024048

On Tue, 28 Dec 2021, Tomas Dalebj=C3=B6rk wrote:

> Yes, it is an incremental backup based of the cow device

I've used such a COW based backup (can't remember the name just now, curren=
tly
using DRBD and rsync for incremental mirrors).  The way it worked was to
read and interpret the raw COW device itself and send blocks over the
wire - writing directly to a volume on the remote end.  It did not try
to patch up metadata and use LVM to merge.  You need an intimate
knowledge of COW internals for either approach - BUT the read-only
approach (with plain writes at the other end) is MUCH safer (not going
to trash metadata at either end) and just as efficient on the wire.

I've also used a block device rsync, that read every block on both
sides and compared hashes - but that is obviously a lot more disk io
that using the COW where LVM is already tracking changed blocks.
---1203360521-967312667-1640784919=:23858
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
---1203360521-967312667-1640784919=:23858--

