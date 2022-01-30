Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E84C433EF
	for <linux-lvm@archiver.kernel.org>; Sun, 30 Jan 2022 20:30:11 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-zrJBFX-HMQyvhGMjFFsWGg-1; Sun, 30 Jan 2022 15:30:07 -0500
X-MC-Unique: zrJBFX-HMQyvhGMjFFsWGg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72E54654;
	Sun, 30 Jan 2022 20:30:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31206101E592;
	Sun, 30 Jan 2022 20:30:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 46CA61809CB8;
	Sun, 30 Jan 2022 20:29:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20UKTusF031078 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 30 Jan 2022 15:29:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0D8E4112131B; Sun, 30 Jan 2022 20:29:56 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08CF81121314
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 20:29:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5580B811E7A
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 20:29:50 +0000 (UTC)
Received: from plutone.assyoma.it
	(host195-56-237-212.serverdedicati.aruba.it [212.237.56.195]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-500-5PDQd_xsOEyrnxU9qce_HA-1; Sun, 30 Jan 2022 15:29:48 -0500
X-MC-Unique: 5PDQd_xsOEyrnxU9qce_HA-1
Received: from webmail.assyoma.it (localhost [IPv6:::1])
	by plutone.assyoma.it (Postfix) with ESMTPA id 8AA2BDD9A3FA;
	Sun, 30 Jan 2022 21:22:00 +0100 (CET)
MIME-Version: 1.0
Date: Sun, 30 Jan 2022 21:22:00 +0100
From: Gionatan Danti <g.danti@assyoma.it>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <b66e90ec-28ed-3962-ac99-69f8e1b01936@gmail.com>
References: <YfWM+8w1TonBXNsP@itl-email>
	<9156ffae-650d-198d-5c7a-32f84dbcb332@gmail.com>
	<YfWfAAGK8L1iy7LU@itl-email>
	<83468eda-6697-5f15-d949-e23611cded84@gmail.com>
	<YfXoBour6CGZt9NH@itl-email>
	<b66e90ec-28ed-3962-ac99-69f8e1b01936@gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <629a699cb96d9be06152fc7fffac235a@assyoma.it>
X-Sender: g.danti@assyoma.it
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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

Il 2022-01-30 12:18 Zdenek Kabelac ha scritto:
  > Thin is more oriented towards extreme speed.
> VDO is more about 'compression & deduplication' - so space efficiency.
> 
> Combining both together is kind of harming their advantages.

Unfortunately, it is the only (current) solution to have snapshotting 
with data compression/deduplication.
Integrating snapshot capability into VDO would be awesome!
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

