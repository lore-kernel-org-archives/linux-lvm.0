Return-Path: <SRS0=pEn1=OS=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AEFCC433F5
	for <linux-lvm@archiver.kernel.org>; Tue, 28 Sep 2021 14:43:37 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C3B0611C3
	for <linux-lvm@archiver.kernel.org>; Tue, 28 Sep 2021 14:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C3B0611C3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632840216;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wivxndahrXwkChjmKhgTkcylgrk9DWdCWodUhS6zGCY=;
	b=iDHDA7dHW1F27ob6awNhiDCbDWSlmALdVkQW5tbf5qkqXWFXCS0SZoexAfBc3ZhhIqNl+R
	Nrkk7HvtwH6MzRiBnXg1FAZhEvg+5uutoOGLnwvky8qMkM2uUdWvVhlXqqAaER0ng34AaM
	LbFkOZ1mxIaDfQQs2CkGNRhpaIAYCtU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-3bUkKtDQNvmFw7IJ6vOc_Q-1; Tue, 28 Sep 2021 10:43:32 -0400
X-MC-Unique: 3bUkKtDQNvmFw7IJ6vOc_Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DF581808308;
	Tue, 28 Sep 2021 14:43:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BB0917B4F;
	Tue, 28 Sep 2021 14:43:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 08A254EA2A;
	Tue, 28 Sep 2021 14:43:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18SEh2BC011246 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 28 Sep 2021 10:43:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E88E45E7AD; Tue, 28 Sep 2021 14:43:02 +0000 (UTC)
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ADAD5E267;
	Tue, 28 Sep 2021 14:43:02 +0000 (UTC)
Date: Tue, 28 Sep 2021 09:42:54 -0500
From: David Teigland <teigland@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20210928144254.GC11549@redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<9947152f39a9c5663abdbe3dfee343556e8d53d7.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <9947152f39a9c5663abdbe3dfee343556e8d53d7.camel@suse.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-lvm@redhat.com
Cc: "zkabelac@redhat.com" <zkabelac@redhat.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>,
	Heming Zhao <heming.zhao@suse.com>
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

On Tue, Sep 28, 2021 at 06:34:06AM +0000, Martin Wilck wrote:
> Hello David and Peter,
>=20
> On Mon, 2021-09-27 at 10:38 -0500, David Teigland wrote:
> > On Mon, Sep 27, 2021 at 12:00:32PM +0200, Peter Rajnoha wrote:
> > > > - We could use the new lvm-activate-* services to replace the
> > > > activation
> > > > generator when lvm.conf event_activation=3D0.=A0 This would be done=
 by
> > > > simply
> > > > not creating the event-activation-on file when event_activation=3D0=
.
> > >=20
> > > ...the issue I see here is around the systemd-udev-settle:
> >=20
> > Thanks, I have a couple questions about the udev-settle to understand
> > that
> > better, although it seems we may not need it.
> >=20
> > > =A0 - the setup where lvm-activate-vgs*.service are always there (not
> > > =A0=A0=A0 generated only on event_activation=3D0 as it was before wit=
h the
> > > =A0=A0=A0 original lvm2-activation-*.service) practically means we al=
ways
> > > =A0=A0=A0 make a dependency on systemd-udev-settle.service, which we
> > > shouldn't
> > > =A0=A0=A0 do in case we have event_activation=3D1.
> >=20
> > Why wouldn't the event_activation=3D1 case want a dependency on udev-
> > settle?
>=20
> You said it should wait for multipathd, which in turn waits for udev
> settle. And indeed it makes some sense. After all: the idea was to
> avoid locking issues or general resource starvation during uevent
> storms, which typically occur in the coldplug phase, and for which the
> completion of "udev settle" is the best available indicator.

Hi Martin, thanks, you have some interesting details here.

Right, the idea is for lvm-activate-vgs-last to wait for other services
like multipath (or anything else that a PV would typically sit on), so
that it will be able to activate as many VGs as it can that are present at
startup.  And we avoid responding to individual coldplug events for PVs,
saving time/effort/etc.

> I'm arguing against it (perhaps you want to join in :-), but odds are
> that it'll disappear sooner or later. Fot the time being, I don't see a
> good alternative.

multipath has more complex udev dependencies, I'll be interested to see
how you manage to reduce those, since I've been reducing/isolating our
udev usage also.

> The dependency type you have to use depends on what you need. Do you
> really only depend on udev settle because of multipathd? I don't think
> so; even without multipath, thousands of PVs being probed
> simultaneously can bring the performance of parallel pvscans down. That
> was the original motivation for this discussion, after all. If this is
> so, you should use both "Wants" and "After". Otherwise, using only
> "After" might be sufficient.

I don't think we really need the settle.  If device nodes for PVs are
present, then vgchange -aay from lvm-activate-vgs* will see them and
activate VGs from them, regardless of what udev has or hasn't done with
them yet.

> > - Reading the udev db: with the default
> > external_device_info_source=3Dnone
> > we no longer ask the udev db for any info about devs.=A0 (We now
> > follow that setting strictly, and only ask udev when source=3Dudev.)
>=20
> This is a different discussion, but if you don't ask udev, how do you
> determine (reliably, and consistently with other services) whether a
> given device will be part of a multipath device or a MD Raid member?

Firstly, with the new devices file, only the actual md/mpath device will
be in the devices file, the components will not be, so lvm will never
attempt to look at an md or mpath component device.

Otherwise, when the devices file is not used,
md: from reading the md headers from the disk
mpath: from reading sysfs links and /etc/multipath/wwids

> In the past, there were issues with either pvscan or blkid (or
> multipath) failing to open a device while another process had opened it
> exclusively. I've never understood all the subtleties. See systemd
> commit 3ebdb81 ("udev: serialize/synchronize block device event
> handling with file locks").

Those locks look like a fine solution if a problem comes up like that.
I suspect the old issues may have been caused by a program using an
exclusive open when it shouldn't.

> After=3Dudev-settle will make sure that you're past a coldplug uevent
> storm during boot. IMO this is the most important part of the equation.
> I'd be happy to find a solution for this that doesn't rely on udev
> settle, but I don't see any.

I don't think multipathd is listening to uevents directly?  If it were,
you might use a heuristic to detect a change in uevents (e.g. the volume)
and conclude coldplug is finished.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

