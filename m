Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F347C433F5
	for <linux-lvm@archiver.kernel.org>; Mon, 31 Jan 2022 17:55:26 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-6A9j6w7COzmdgSxlpI7C7w-1; Mon, 31 Jan 2022 12:55:24 -0500
X-MC-Unique: 6A9j6w7COzmdgSxlpI7C7w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F43381F035;
	Mon, 31 Jan 2022 17:55:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 880C934D3C;
	Mon, 31 Jan 2022 17:55:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6B3EE1809CB8;
	Mon, 31 Jan 2022 17:55:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20VHsv0U018889 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 31 Jan 2022 12:54:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 738DC2166B4E; Mon, 31 Jan 2022 17:54:57 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F28D2166B13
	for <linux-lvm@redhat.com>; Mon, 31 Jan 2022 17:54:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5237A1044560
	for <linux-lvm@redhat.com>; Mon, 31 Jan 2022 17:54:54 +0000 (UTC)
Received: from plutone.assyoma.it
	(host195-56-237-212.serverdedicati.aruba.it [212.237.56.195]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-674-N72YXae_PSWjTtvIxu0ETw-1; Mon, 31 Jan 2022 12:54:51 -0500
X-MC-Unique: N72YXae_PSWjTtvIxu0ETw-1
Received: from webmail.assyoma.it (localhost [IPv6:::1])
	by plutone.assyoma.it (Postfix) with ESMTPA id CA132DDA1520;
	Mon, 31 Jan 2022 18:54:48 +0100 (CET)
MIME-Version: 1.0
Date: Mon, 31 Jan 2022 18:54:48 +0100
From: Gionatan Danti <g.danti@assyoma.it>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
In-Reply-To: <YfgAOeqHtutU91rI@itl-email>
References: <YfV9SAsGJBGMMv1b@itl-email>
	<9c35198501aae82e7a911f5418cfd7f6@assyoma.it>
	<YfgAOeqHtutU91rI@itl-email>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <b3127b95f8c2e687b4358ec0558cdd6a@assyoma.it>
X-Sender: g.danti@assyoma.it
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-lvm@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Il 2022-01-31 16:28 Demi Marie Obenour ha scritto:
> thin_trim is a userspace tool that works on an entire thin pool, and I
> suspect it may be significantly faster than blkdiscard of an individual
> thin volume.  That said, what I would *really* like is something
> equivalent to fstrim for thin volumes: a tool that works 
> asynchronously,
> in the background, without disrupting concurrent I/O.

Are you sure that fstrim works asynchronously?
I remember "fstrim -v /mybigdevice" tacking some time (~30s).

> FYI, you might want to specify a full fingerprint here; short key IDs
> are highly vulnerable to collision and preimage attacks.

Yeah, it is a 15 years old signature I must decide to update ;)
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

