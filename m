Return-Path: <SRS0=nYqM=HY=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9AAAC433DB
	for <linux-lvm@archiver.kernel.org>; Mon, 22 Feb 2021 08:52:17 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1885264E77
	for <linux-lvm@archiver.kernel.org>; Mon, 22 Feb 2021 08:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1885264E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-Aqndt4j8NAu1_778V3q9PQ-1; Mon, 22 Feb 2021 03:52:13 -0500
X-MC-Unique: Aqndt4j8NAu1_778V3q9PQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 200371020C22;
	Mon, 22 Feb 2021 08:52:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1F007095B;
	Mon, 22 Feb 2021 08:52:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C6C757DFC;
	Mon, 22 Feb 2021 08:52:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11LKR79E024381 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 21 Feb 2021 15:27:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 267CF20CA48C; Sun, 21 Feb 2021 20:27:07 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20BC320CA48A
	for <linux-lvm@redhat.com>; Sun, 21 Feb 2021 20:27:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BED6B186E123
	for <linux-lvm@redhat.com>; Sun, 21 Feb 2021 20:27:04 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-30-2pZ0Rr5VNVOgpF4dMUZuUg-1;
	Sun, 21 Feb 2021 15:27:00 -0500
X-MC-Unique: 2pZ0Rr5VNVOgpF4dMUZuUg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 85C37AD87;
	Sun, 21 Feb 2021 20:26:58 +0000 (UTC)
Message-ID: <0619b194d69a90fcfadb4572c42402d3204f5f0e.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: David Teigland <teigland@redhat.com>
Date: Sun, 21 Feb 2021 21:26:57 +0100
In-Reply-To: <20210219163722.GA13644@redhat.com>
References: <20210211111623.34968-1-list@eworm.de>
	<f18dff7a-050a-d41d-c643-4616522ba4a0@suse.com>
	<ae893a3606dd32b07cab16bd538c132af555c956.camel@suse.com>
	<20210217130329.7de41147@leda>
	<20210217133826.u4gglfsowqfvxdff@spock.localdomain>
	<ea269d6255c4cd48bb60771aa7e4204e4f70db8a.camel@suse.com>
	<20210219163722.GA13644@redhat.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11LKR79E024381
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Mon, 22 Feb 2021 03:50:14 -0500
Cc: Natalenko <oleksandr@redhat.com>, linux-lvm@e1890.dsca.akamaiedge.net,
	Christian Hesse <list@eworm.de>, Oleksandr, linux-lvm@redhat.com,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-02-19 at 10:37 -0600, David Teigland wrote:
> On Thu, Feb 18, 2021 at 04:19:01PM +0100, Martin Wilck wrote:
> > > Feb 10 17:24:26 archlinux lvm[643]:=A0=A0 pvscan[643] VG sys run
> > > autoactivation.
> > > Feb 10 17:24:26 archlinux lvm[643]:=A0=A0 /usr/bin/dmeventd: stat
> > > failed:
> > > No such file or directory
> >=20
> > What's going on here? pvscan trying to start dmeventd ? Why ?
> > There's a
> > dedicated service for starting dmeventd (lvm2-monitor.service). I
> > can
> > see that running dmeventd makes sense as you have thin pools, but
> > I'm
> > at a loss why it has to be started at that early stage during boot
> > already.
> >=20
> > This is a curious message, it looks as if pvscan was running from
> > an
> > environment (initramfs??) where dmeventd wasn't available. The
> > message
> > is repeated, and after that, pvscan appears to hang...
>=20
> I've found that when pvscan activates a VG, there's a bit of code
> that
> attempts to monitor any LVs that are already active in the VG.=A0
> Monitoring
> means interacting with dmeventd.=A0 I don't know why it's doing that,
> it
> seems strange, but the logic around monitoring in lvm seems ad hoc
> and in
> need of serious reworking.=A0 In this case I'm guessing there's already
> an
> LV active in "sys", perhaps from direct activation in initrd, and
> when
> pvscan activates that VG it attempts to monitor the already active
> LV.
>=20
> Another missing piece in lvm monitoring is that we don't have a way
> to
> start lvm2-monitor/dmeventd at the right time (I'm not sure anyone
> even
> knows when the right time is), so we get random behavior depending on
> if
> it's running or not at a given point.=A0 In this case, it looks like it
> happens to not be running yet.=A0 I sometimes suggest disabling lvm2-
> monitor
> and starting it manually once the system is up, to avoid having it
> interfere during startup.

That sounds familiar.

>=20
> > > Feb 10 17:24:26 archlinux lvm[643]:=A0=A0 /usr/bin/dmeventd: stat
> > > failed:
> > > No such file or directory
> > > Feb 10 17:24:26 archlinux lvm[643]:=A0=A0 WARNING: Failed to monitor
> > > sys/pool.
> > > Feb 10 17:24:26 archlinux systemd[1]: Stopping LVM event
> > > activation
> > > on device 9:0...
>=20
> The unwanted failed monitoring seems to have caused the pvscan
> command to
> exit with an error, which then leads to further mess and confusion
> where
> systemd then thinks it should stop or kill the pvscan service,
> whatever
> that means.

The way I read Oleksandr's logs, systemd is killing all processes
because it wants to switch root, not because of errors in the pvscan
service. The weird thing is that that fails for one of the pvscan tasks
(253:2), and that that service continues to "run" (rather, "hang") long
after the root switch has happened.

Thanks,
Martin



_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

