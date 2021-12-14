Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19090C433F5
	for <linux-lvm@archiver.kernel.org>; Tue, 14 Dec 2021 05:46:54 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-kpRTzcz1NlGKBRj82kXwLA-1; Tue, 14 Dec 2021 00:46:47 -0500
X-MC-Unique: kpRTzcz1NlGKBRj82kXwLA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6A91102CB77;
	Tue, 14 Dec 2021 05:46:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD8171972E;
	Tue, 14 Dec 2021 05:46:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 316A14BB7C;
	Tue, 14 Dec 2021 05:46:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BE5kEbW028573 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 14 Dec 2021 00:46:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BA1571400E73; Tue, 14 Dec 2021 05:46:14 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4F841402400
	for <linux-lvm@redhat.com>; Tue, 14 Dec 2021 05:46:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B8B4101A52D
	for <linux-lvm@redhat.com>; Tue, 14 Dec 2021 05:46:14 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-468-CBbstdYFMUK3q-4oduH64A-1; Tue, 14 Dec 2021 00:46:10 -0500
X-MC-Unique: CBbstdYFMUK3q-4oduH64A-1
Received: by mail-lj1-f173.google.com with SMTP id a37so25686088ljq.13;
	Mon, 13 Dec 2021 21:46:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=7dVFKcEAjR7/qrQlvIrzfsOBDCWpqX9ewVXgG/O6dv8=;
	b=WrNuL9Z/lXC8mjIkmqmEn1JHeyZeEH3O28zQD4n/u+gRiEgYzwze4jRtCLa1gUUNwL
	oAaZFYuxANVY5xi9aBhwsLPy4B/lIGtDvY4GMWSiP4oE7CvhJzMO6Tp9CIf5VUCZzEoz
	9WXHJusFD7mvo77i7GkH/AgGtukkBh4GYkc3ZCaOvq2Z2gew4PZxXOCDro61cu8C2EWk
	H3U/r917sW/dyLf8AhqxMeZcHt/O9bpNAQKqH6sbjeSydnoYDZjPix05m1UY7bdUArW1
	KKs0utWpNfwBDCVJDUlla4z/aBjgirdYZkkMYezxYQfPiCdWO1IQ0Pe3IvMi4svjNRVk
	hO6A==
X-Gm-Message-State: AOAM532WBOEobOsDPkf+gyoD4qoLppK1JyTWNgYx7JFr+fCXRwu9IHBd
	jTXsNAA2h/nYQK9gRKpPtcsNmneqMkw9QzNsjIxK5zNJDmE=
X-Google-Smtp-Source: ABdhPJwN77B2ffUxBKoa81/X0ixtLRG88YBhP+duZ7uMpiSFF3wG8DogfEACt0r+0Bmz8PMAdbm2aDSmKNfSqPpxoA4=
X-Received: by 2002:a2e:b541:: with SMTP id a1mr2957297ljn.289.1639460768675; 
	Mon, 13 Dec 2021 21:46:08 -0800 (PST)
MIME-Version: 1.0
From: Tom Yan <tom.ty89@gmail.com>
Date: Tue, 14 Dec 2021 13:45:57 +0800
Message-ID: <CAGnHSEkb59u8LLWks03q=hh3rxcNJQqNLNkjBqc33-Osq=ZZMQ@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>,
	David Teigland <teigland@redhat.com>
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
Subject: [linux-lvm] Reason to use -r when systemd-run vgchange -aay
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David,

I notice that in the "new" 69-dm-lvm.rules, vgchange -aay is run with
systemd-run, which is not a problem.

However, the fact that the --remain-after-exit (i.e. -r) switch is
used is, because the service is not stopped when e.g. one deactivates
a VG with vgchange -an, which will prevent the VG from being
auto-activated again if e.g. the PV is removed and inserted again.

I'm not sure if that was a desired behaviour / one of the intended
purposes. Regardless, I'm not exactly seeing the sense of that either.

Besides, I don't suppose it would work very well for multi-PV VGs
anyway. I mean, most likely similar errors (albeit probably harmless)
would be spammed because of the repeated attempt to *create* a
transient unit of the same name. (Repeated systemd-run is NOT the same
as repeated systemctl start; it's also the reason that triggering
`systemctl stop` with remove event is not a perfect idea either, since
transient unit created would be gone once it is stopped, so repeated
systemctl stop will cause more errors to be spammed; Yet we need the
unit to be gone when it is stopped for the current approach, even if
it's possible to prevent it from going away.)

So are there any reasons that we actually need -r? If so, I think we
need to deal with them with another approach (maybe unit template?).

I also saw this PR on github. I'm not sure if what it stated makes any
sense though: https://github.com/lvmteam/lvm2/pull/37

All the best,
Tom

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

