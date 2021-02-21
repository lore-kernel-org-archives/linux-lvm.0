Return-Path: <SRS0=nYqM=HY=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A61C433E0
	for <linux-lvm@archiver.kernel.org>; Mon, 22 Feb 2021 08:54:29 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0059264E61
	for <linux-lvm@archiver.kernel.org>; Mon, 22 Feb 2021 08:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0059264E61
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-wcb61lGBOSy5i6AbUvJRYQ-1; Mon, 22 Feb 2021 03:54:25 -0500
X-MC-Unique: wcb61lGBOSy5i6AbUvJRYQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9695F106BC69;
	Mon, 22 Feb 2021 08:54:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4198A1001281;
	Mon, 22 Feb 2021 08:54:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CAC3518095CB;
	Mon, 22 Feb 2021 08:54:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11LKO2Te024099 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 21 Feb 2021 15:24:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5067E202E942; Sun, 21 Feb 2021 20:24:02 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B73B2026D48
	for <linux-lvm@redhat.com>; Sun, 21 Feb 2021 20:23:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D003785A59D
	for <linux-lvm@redhat.com>; Sun, 21 Feb 2021 20:23:59 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-328-kx8pRyJ0MmW1TTQ8TL0i9A-1;
	Sun, 21 Feb 2021 15:23:57 -0500
X-MC-Unique: kx8pRyJ0MmW1TTQ8TL0i9A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 609D5AC6E;
	Sun, 21 Feb 2021 20:23:55 +0000 (UTC)
Message-ID: <f627b3e7a0d16f31ec68cb07b3454e977e8fe1d0.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and
	development <linux-lvm@redhat.com>, David Teigland <teigland@redhat.com>
Date: Sun, 21 Feb 2021 21:23:53 +0100
In-Reply-To: <22b3cc5b-24fb-a684-be90-1f767d5ac678@redhat.com>
References: <20210211111623.34968-1-list@eworm.de>
	<f18dff7a-050a-d41d-c643-4616522ba4a0@suse.com>
	<ae893a3606dd32b07cab16bd538c132af555c956.camel@suse.com>
	<20210217130329.7de41147@leda>
	<20210217133826.u4gglfsowqfvxdff@spock.localdomain>
	<ea269d6255c4cd48bb60771aa7e4204e4f70db8a.camel@suse.com>
	<20210219163722.GA13644@redhat.com>
	<22b3cc5b-24fb-a684-be90-1f767d5ac678@redhat.com>
User-Agent: Evolution 3.38.2
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11LKO2Te024099
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Mon, 22 Feb 2021 03:50:14 -0500
Cc: Oleksandr Natalenko <oleksandr@redhat.com>,
	linux-lvm@e1890.dsca.akamaiedge.net, Christian Hesse <list@eworm.de>,
	Heming Zhao <heming.zhao@suse.com>
Subject: Re: [linux-lvm] [PATCH 1/1] pvscan: wait for udevd
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-02-19 at 23:47 +0100, Zdenek Kabelac wrote:
>=20
> Right time is when switch is finished and we have rootfs with /usr
> available - should be ensured by=A0 lvm2-monitor.service and it
> dependencies.

While we're at it - I'm wondering why dmeventd is started so early. dm-
event.service on recent installments has only "Requires=3Ddm-
event.socket", so it'll be started almost immediately after switching
root. In particular, it doesn't wait for any sort of device
initialization or udev initialization.

I've gone through the various tasks that dmeventd is responsible for,
and I couldn't see anything that'd be strictly necessary during early
boot. I may be overlooking something of course. Couldn't the monitoring
be delayed to after local-fs.target, for example?

(This is also related to our previous discussion about
external_device_info_source=3Dudev; we found that dmeventd was one of the
primary sources of strange errors with that setting).

Regards
Martin



_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

