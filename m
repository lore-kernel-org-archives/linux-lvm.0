Return-Path: <SRS0=kfxi=LC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07327C47082
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 13:57:08 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A426261351
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 13:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A426261351
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623160626;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hndDOvnA/Kdguo1Z48ChRIM/STugXcAVwIL8ICocn6Q=;
	b=IYHwU/J7E1DoIcZD+2LjLWSSs4MHgqrJ98aJSM0CyRwKCswJb9p7vqx8imEDQvaTXgYJed
	tinUr+sINJrIQxghE5q+6FKPKBvChumaVDna1eXv1uesL6zGyiIF6g1qL+KzpEKd/oltgA
	mhlMrYrV/mjNDWxIjKjFG+ERSE/asGo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-5PtQJZ6kOXCn7EwL1QNvfg-1; Tue, 08 Jun 2021 09:57:05 -0400
X-MC-Unique: 5PtQJZ6kOXCn7EwL1QNvfg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 367828042C5;
	Tue,  8 Jun 2021 13:57:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B276E5D9DE;
	Tue,  8 Jun 2021 13:56:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D10F44A59;
	Tue,  8 Jun 2021 13:56:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 158Durgn005681 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 8 Jun 2021 09:56:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5D205179E6; Tue,  8 Jun 2021 13:56:53 +0000 (UTC)
Received: from alatyr-rpi.brq.redhat.com (unknown [10.43.17.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BA2A18A69;
	Tue,  8 Jun 2021 13:56:52 +0000 (UTC)
Date: Tue, 8 Jun 2021 15:56:49 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
To: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <20210608135648.gr5xfwma2f3jschr@alatyr-rpi.brq.redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210608134139.iocq5if2hbodrns7@alatyr-rpi.brq.redhat.com>
	<fa7d4756-e084-8811-da40-de95e95a1ae1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fa7d4756-e084-8811-da40-de95e95a1ae1@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-lvm@redhat.com
Cc: "linux-lvm@redhat.com" <linux-lvm@redhat.com>, teigland@redhat.com,
	Heming Zhao <heming.zhao@suse.com>, Martin Wilck <martin.wilck@suse.com>
Subject: Re: [linux-lvm] Discussion: performance issue on event activation
 mode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue 08 Jun 2021 15:46, Zdenek Kabelac wrote:
> Dne 08. 06. 21 v 15:41 Peter Rajnoha napsal(a):
> > On Tue 08 Jun 2021 13:23, Martin Wilck wrote:
> > > On Di, 2021-06-08 at 14:29 +0200, Peter Rajnoha wrote:
> > > > On Mon 07 Jun 2021 16:48, David Teigland wrote:
> > > > > If there are say 1000 PVs already present on the system, there
> > > > > could be
> > > > > real savings in having one lvm command process all 1000, and then
> > > > > switch
> > > > > over to processing uevents for any further devices afterward.=A0 =
The
> > > > > switch
> > > > > over would be delicate because of the obvious races involved with
> > > > > new devs
> > > > > appearing, but probably feasible.
> > > > Maybe to avoid the race, we could possibly write the proposed
> > > > "/run/lvm2/boot-finished" right before we initiate scanning in
> > > > "vgchange
> > > > -aay" that is a part of the lvm2-activation-net.service (the last
> > > > service to do the direct activation).
> > > >=20
> > > > A few event-based pvscans could fire during the window between
> > > > "scan initiated phase" in lvm2-activation-net.service's
> > > > "ExecStart=3Dvgchange -aay..."
> > > > and the originally proposed "ExecStartPost=3D/bin/touch /run/lvm2/b=
oot-
> > > > finished",
> > > > but I think still better than missing important uevents completely =
in
> > > > this window.
> > > That sounds reasonable. I was thinking along similar lines. Note that
> > > in the case where we had problems lately, all actual activation (and
> > > slowness) happened in lvm2-activation-early.service.
> > >=20
> > Yes, I think most of the activations are covered with the first service
> > where most of the devices are already present, then the rest is covered
> > by the other two services.
> >=20
> > Anyway, I'd still like to know why exactly
> > obtain_device_list_from_udev=3D1 is so slow. The only thing that it doe=
s
> > is that it calls libudev's enumeration for "block" subsystem devs. We
> > don't even check if the device is intialized in udev in this case if I
> > remember correctly, so if there's any udev processing in parallel hapen=
ning,
> > it shouldn't be slowing down. BUT we're waiting for udev records to
> > get initialized for filtering reasons, like mpath and MD component dete=
ction.
> > We should probably inspect this in detail and see where the time is rea=
lly
> > taken underneath before we do any futher changes...
>=20
>=20
> This remains me - did we already fix the anoying problem of 'repeated' sl=
eep
> for every 'unfinished' udev intialization?
>=20
> I believe there should be exactly one sleep try to wait for udev and if i=
t
> doesn't work - go with out.
>=20
> But I've seen some trace where the sleep was repeatedly for each device w=
ere
> udev was 'uninitiated'.
>=20
> Clearly this doesn't fix the problem of 'unitialized udev' but at least
> avoid extremely lengthy sleeping lvm command.

The sleep + iteration is still there!

The issue is that we're relying now on udev db records that contain
info about mpath and MD components - without this, the detection (and
hence filtering) could fail in certain cases. So if go without checking
udev db, that'll be a step back. As an alternative, we'd need to call
out mpath and MD directly from LVM2 if we really wanted to avoid
checking udev db (but then, we're checking the same thing that is
already checked by udev means).

Peter

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

