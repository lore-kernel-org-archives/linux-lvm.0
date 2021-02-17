Return-Path: <SRS0=sZ9l=HT=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BEDC433DB
	for <linux-lvm@archiver.kernel.org>; Wed, 17 Feb 2021 15:39:13 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E060864D9F
	for <linux-lvm@archiver.kernel.org>; Wed, 17 Feb 2021 15:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E060864D9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-DMUVSIxCM5Ohl2kvas8gjw-1; Wed, 17 Feb 2021 10:39:08 -0500
X-MC-Unique: DMUVSIxCM5Ohl2kvas8gjw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82DA7801976;
	Wed, 17 Feb 2021 15:38:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D18906F7EC;
	Wed, 17 Feb 2021 15:38:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EAEED58076;
	Wed, 17 Feb 2021 15:38:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11H8Mwma016579 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 17 Feb 2021 03:22:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 706461031F3A; Wed, 17 Feb 2021 08:22:58 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BD4F10EB2AD
	for <linux-lvm@redhat.com>; Wed, 17 Feb 2021 08:22:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F4BA100AFE2
	for <linux-lvm@redhat.com>; Wed, 17 Feb 2021 08:22:56 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-444-EzYaA6o7Ot2Yumu_sb4aMg-1;
	Wed, 17 Feb 2021 03:22:53 -0500
X-MC-Unique: EzYaA6o7Ot2Yumu_sb4aMg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B936AB923;
	Wed, 17 Feb 2021 08:22:52 +0000 (UTC)
Message-ID: <ae893a3606dd32b07cab16bd538c132af555c956.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: LVM general discussion and development
	<linux-lvm@e1890.dsca.akamaiedge.net>, 
	LVM general discussion and development <linux-lvm@redhat.com>,
	Christian Hesse <list@eworm.de>
Date: Wed, 17 Feb 2021 09:22:52 +0100
In-Reply-To: <f18dff7a-050a-d41d-c643-4616522ba4a0@suse.com>
References: <20210211111623.34968-1-list@eworm.de>
	<f18dff7a-050a-d41d-c643-4616522ba4a0@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11H8Mwma016579
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Wed, 17 Feb 2021 10:30:32 -0500
Cc: Heming Zhao <heming.zhao@suse.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-02-17 at 09:49 +0800, heming.zhao@suse.com wrote:
> On 2/11/21 7:16 PM, Christian Hesse wrote:
> > From: Christian Hesse <mail@eworm.de>
> >=20
> > Running the scan before udevd finished startup may result in
> > failure.
> > This has been reported for Arch Linux [0] and proper ordering fixes
> > the issue.
> >=20
> > [0] https://bugs.archlinux.org/task/69611
> >=20
> > Signed-off-by: Christian Hesse <mail@eworm.de>
> > ---
> > =A0 scripts/lvm2-pvscan.service.in | 1 +
> > =A0 1 file changed, 1 insertion(+)
> >=20
> > diff --git a/scripts/lvm2-pvscan.service.in b/scripts/lvm2-
> > pvscan.service.in
> > index 09753e8c9..7b4ace551 100644
> > --- a/scripts/lvm2-pvscan.service.in
> > +++ b/scripts/lvm2-pvscan.service.in
> > @@ -4,6 +4,7 @@ Documentation=3Dman:pvscan(8)
> > =A0 DefaultDependencies=3Dno
> > =A0 StartLimitIntervalSec=3D0
> > =A0 BindsTo=3Ddev-block-%i.device
> > +After=3Dsystemd-udevd.service
> > =A0 Before=3Dshutdown.target
> > =A0 Conflicts=3Dshutdown.target
> > =A0=20
> >=20
>=20
> I watched a similar issue with lvm2-monitor.service.
> In a very old machine (i586), udevd cost too much time to finish, it
> triggered
> lvm2-monitor timeout then reported:
> > WARNING: Device /dev/sda not initialized in udev database even
> > after waiting 10000000 microseconds.
>=20
> One workable solution is to add "systemd-udev-settle.service"
> (obsoleted) or
> "local-fs.target" in "After" of lvm2-monitor.service.

We have to differentiate here. In our case we had to wait for "systemd-
udev-settle.service". In the arch case, it was only necessary to wait
for systemd-udevd.service itself. "After=3Dsystemd-udevd.service" just
means that the daemon is up, it says nothing about any device
initialization being completed.

But in general, I think this needs deeper analysis. Looking at
https://bugs.archlinux.org/task/69611, the workaround appears to have
been found simply by drawing an analogy to a previous similar case.
I'd like to understand what happened on the arch system when the error
occured, and why this simple ordering directive avoided it.

1. How had the offending pvscan process been started? I'd expect that
"pvscan" (unlike "lvm monitor" in our case) was started by an udev
rule. If udevd hadn't started yet, how would that udev rule have be
executed? OTOH, if pvscan had not been started by udev but by another
systemd service, than *that* service would probably need to get the
After=3Dsystemd-udevd.service directive.

2. Even without the "After=3D" directive, I'd assume that pvscan wasn't
started "before" systemd-udevd, but rather "simultaneously" (i.e. in
the same systemd transaction). Thus systemd-udevd should have started
up while pvscan was running, and pvscan should have noticed that udevd
eventually became available. Why did pvscan time out? What was it
waiting for? We know that lvm checks for the existence of
"/run/udev/control", but that should have become avaiable after some
fractions of a second of waiting.

Regards,
Martin



_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

