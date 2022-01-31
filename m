Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A08C433EF
	for <linux-lvm@archiver.kernel.org>; Mon, 31 Jan 2022 11:03:01 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-pqk_ETKKMg6K2B50abZj7w-1; Mon, 31 Jan 2022 06:02:56 -0500
X-MC-Unique: pqk_ETKKMg6K2B50abZj7w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DAF0814250;
	Mon, 31 Jan 2022 11:02:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB902108F831;
	Mon, 31 Jan 2022 11:02:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 805951809CB9;
	Mon, 31 Jan 2022 11:02:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20VB2VQf018941 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 31 Jan 2022 06:02:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1293240885A2; Mon, 31 Jan 2022 11:02:31 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E28C40885A9
	for <linux-lvm@redhat.com>; Mon, 31 Jan 2022 11:02:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC6A8800B24
	for <linux-lvm@redhat.com>; Mon, 31 Jan 2022 11:02:30 +0000 (UTC)
Received: from plutone.assyoma.it
	(host195-56-237-212.serverdedicati.aruba.it [212.237.56.195]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-203-Iz7DhSlsOx69TFZyNx2cqQ-1; Mon, 31 Jan 2022 06:02:26 -0500
X-MC-Unique: Iz7DhSlsOx69TFZyNx2cqQ-1
Received: from webmail.assyoma.it (localhost [IPv6:::1])
	by plutone.assyoma.it (Postfix) with ESMTPA id CBAF7DEC3E12;
	Mon, 31 Jan 2022 12:02:23 +0100 (CET)
MIME-Version: 1.0
Date: Mon, 31 Jan 2022 12:02:23 +0100
From: Gionatan Danti <g.danti@assyoma.it>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <YfV9SAsGJBGMMv1b@itl-email>
References: <YfV9SAsGJBGMMv1b@itl-email>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <9c35198501aae82e7a911f5418cfd7f6@assyoma.it>
X-Sender: g.danti@assyoma.it
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: linux-lvm@redhat.com
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>
Subject: Re: [linux-lvm] Running thin_trim before activating a thin pool
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Il 2022-01-29 18:45 Demi Marie Obenour ha scritto:
> Is it possible to configure LVM2 so that it runs thin_trim before it
> activates a thin pool?  Qubes OS currently runs blkdiscard on every 
> thin
> volume before deleting it, which is slow and unreliable.  Would running
> thin_trim during system startup provide a better alternative?

I think that, if anything, it would be worse: a long discard during boot 
can be problematic, even leading to timeout on starting other services.
After all, blkdiscard should be faster then something done at higher 
level.

That said, I seem to remember that deleting a fat volume should 
automatically trim/discard it if issue_discard=1. Is this not true for 
thin volumes?
Regards.

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

