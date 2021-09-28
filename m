Return-Path: <SRS0=Ecxi=OT=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB3FC433EF
	for <linux-lvm@archiver.kernel.org>; Wed, 29 Sep 2021 06:44:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E460613A7
	for <linux-lvm@archiver.kernel.org>; Wed, 29 Sep 2021 06:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E460613A7
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632897842;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=koHdwcTkK4k9ssdnmSMHkOCCbUvz439tp+kzaoIMXbk=;
	b=QMwyKRYxXyUsmhSPjdgk+CZlNw0xzVkGcxuG+AP1BNnUvz1ukDb/okEMUOPJXYc4qZsqQf
	3X7ju736T7R4GLcY5CBLLZATrlN+SL3zuDTBVRMxeBK9qP8wSCVynS+Y9yrG8OpK+5HSxH
	9p1BXCSNc9xezigDbW9HFMsgVVPZvpQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-Jxxaz35xO6esMTNxi-eWOA-1; Wed, 29 Sep 2021 02:43:25 -0400
X-MC-Unique: Jxxaz35xO6esMTNxi-eWOA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83DD0824FA7;
	Wed, 29 Sep 2021 06:43:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BAD519C79;
	Wed, 29 Sep 2021 06:43:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 08D5D4EA39;
	Wed, 29 Sep 2021 06:43:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18SHgsGG027294 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 28 Sep 2021 13:42:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7ABB75FC13; Tue, 28 Sep 2021 17:42:54 +0000 (UTC)
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D455794A4;
	Tue, 28 Sep 2021 17:42:54 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18SHgk0B001734; 
	Tue, 28 Sep 2021 12:42:47 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18SHgkE5001733;
	Tue, 28 Sep 2021 12:42:46 -0500
Date: Tue, 28 Sep 2021 12:42:46 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20210928174246.GF3087@octiron.msp.redhat.com>
References: <d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<9947152f39a9c5663abdbe3dfee343556e8d53d7.camel@suse.com>
	<20210928144254.GC11549@redhat.com>
	<138b7ddb721b6a58df8f0401b76c7975678f0dda.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <138b7ddb721b6a58df8f0401b76c7975678f0dda.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Wed, 29 Sep 2021 02:42:14 -0400
Cc: "prajnoha@redhat.com" <prajnoha@redhat.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	"teigland@redhat.com" <teigland@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 28, 2021 at 03:16:08PM +0000, Martin Wilck wrote:
> On Tue, 2021-09-28 at 09:42 -0500, David Teigland wrote:
> > On Tue, Sep 28, 2021 at 06:34:06AM +0000, Martin Wilck wrote:
> > > Hello David and Peter,
> > >=20
> > > On Mon, 2021-09-27 at 10:38 -0500, David Teigland wrote:
> > > > On Mon, Sep 27, 2021 at 12:00:32PM +0200, Peter Rajnoha wrote:
> > > > > > - We could use the new lvm-activate-* services to replace the
> > > > > > activation
> > > > > > generator when lvm.conf event_activation=3D0.=A0 This would be
> > > > > > done by
> > > > > > simply
> > > > > > not creating the event-activation-on file when
> > > > > > event_activation=3D0.
> > > > >=20
> > > > > ...the issue I see here is around the systemd-udev-settle:
> > > >=20
> > > > Thanks, I have a couple questions about the udev-settle to
> > > > understand
> > > > that
> > > > better, although it seems we may not need it.
> > > >=20
> > > > > =A0 - the setup where lvm-activate-vgs*.service are always there
> > > > > (not
> > > > > =A0=A0=A0 generated only on event_activation=3D0 as it was before=
 with
> > > > > the
> > > > > =A0=A0=A0 original lvm2-activation-*.service) practically means w=
e
> > > > > always
> > > > > =A0=A0=A0 make a dependency on systemd-udev-settle.service, which=
 we
> > > > > shouldn't
> > > > > =A0=A0=A0 do in case we have event_activation=3D1.
> > > >=20
> > > > Why wouldn't the event_activation=3D1 case want a dependency on
> > > > udev-
> > > > settle?
> > >=20
> > > You said it should wait for multipathd, which in turn waits for
> > > udev
> > > settle. And indeed it makes some sense. After all: the idea was to
> > > avoid locking issues or general resource starvation during uevent
> > > storms, which typically occur in the coldplug phase, and for which
> > > the
> > > completion of "udev settle" is the best available indicator.
> >=20
> > Hi Martin, thanks, you have some interesting details here.
> >=20
> > Right, the idea is for lvm-activate-vgs-last to wait for other
> > services
> > like multipath (or anything else that a PV would typically sit on),
> > so
> > that it will be able to activate as many VGs as it can that are
> > present at
> > startup.=A0 And we avoid responding to individual coldplug events for
> > PVs,
> > saving time/effort/etc.
> >=20
> > > I'm arguing against it (perhaps you want to join in :-), but odds
> > > are
> > > that it'll disappear sooner or later. Fot the time being, I don't
> > > see a
> > > good alternative.
> >=20
> > multipath has more complex udev dependencies, I'll be interested to
> > see
> > how you manage to reduce those, since I've been reducing/isolating
> > our
> > udev usage also.
>=20
> I have pondered this quite a bit, but I can't say I have a concrete
> plan.
>=20
> To avoid depending on "udev settle", multipathd needs to partially
> revert to udev-independent device detection. At least during initial
> startup, we may encounter multipath maps with members that don't exist
> in the udev db, and we need to deal with this situation gracefully. We
> currently don't, and it's a tough problem to solve cleanly. Not relying
> on udev opens up a Pandora's box wrt WWID determination, for example.
> Any such change would without doubt carry a large risk of regressions
> in some scenarios, which we wouldn't want to happen in our large
> customer's data centers.

I'm not actually sure that it's as bad as all that. We just may need a
way for multipathd to detect if the coldplug has happened.  I'm sure if
we say we need it to remove the udev settle, we can get some method to
check this. Perhaps there is one already, that I don't know about. If
multipathd starts up and the coldplug hasn't happened, we can just
assume the existing devices are correct, and set up the paths enough to
check them, until we are notified that the coldplug has finished. Then
we just run reconfigure, and continue along like everything currently
is.  The basic idea it to have multipathd run in mode where its only
concern is monitoring the paths of the existing devices, until we're
notified that the coldplug has completed. The important thing would be
to make sure that we can't accidentally miss the notification that the
coldplug has completed. But we could always time out if it takes too
long, and we haven't gotten any uevents recently.
=20
> I also looked into Lennart's "storage daemon" concept where multipathd
> would continue running over the initramfs/rootfs switch, but that would
> be yet another step with even higher risk.

This is the "set argv[0][0] =3D '@' to disble initramfs daemon killing"
concept, right? We still have the problem where the udev database gets
cleared, so if we ever need to look at that while processing the
coldplug events, we'll have problems.

> >=20
> > > The dependency type you have to use depends on what you need. Do
> > > you
> > > really only depend on udev settle because of multipathd? I don't
> > > think
> > > so; even without multipath, thousands of PVs being probed
> > > simultaneously can bring the performance of parallel pvscans down.
> > > That
> > > was the original motivation for this discussion, after all. If this
> > > is
> > > so, you should use both "Wants" and "After". Otherwise, using only
> > > "After" might be sufficient.
> >=20
> > I don't think we really need the settle.=A0 If device nodes for PVs are
> > present, then vgchange -aay from lvm-activate-vgs* will see them and
> > activate VGs from them, regardless of what udev has or hasn't done
> > with
> > them yet.
>=20
> Hm. This would mean that the switch to event-based PV detection could
> happen before "udev settle" ends. A coldplug storm of uevents could
> create 1000s of PVs in a blink after event-based detection was enabled.
> Wouldn't that resurrect the performance issues that you are trying to
> fix with this patch set?
>=20
> >=20
> > > > - Reading the udev db: with the default
> > > > external_device_info_source=3Dnone
> > > > we no longer ask the udev db for any info about devs.=A0 (We now
> > > > follow that setting strictly, and only ask udev when
> > > > source=3Dudev.)
> > >=20
> > > This is a different discussion, but if you don't ask udev, how do
> > > you
> > > determine (reliably, and consistently with other services) whether
> > > a
> > > given device will be part of a multipath device or a MD Raid
> > > member?
> >=20
> > Firstly, with the new devices file, only the actual md/mpath device
> > will
> > be in the devices file, the components will not be, so lvm will never
> > attempt to look at an md or mpath component device.
>=20
> I have to look more closely into the devices file and how it's created
> and used.=20
>=20
> > Otherwise, when the devices file is not used,
> > md: from reading the md headers from the disk
> > mpath: from reading sysfs links and /etc/multipath/wwids
>=20
> Ugh. Reading sysfs links means that you're indirectly depending on
> udev, because udev creates those. It's *more* fragile than calling into
> libudev directly, IMO. Using /etc/multipath/wwids is plain wrong in
> general. It works only on distros that use "find_multipaths strict",
> like RHEL. Not to mention that the path can be customized in
> multipath.conf.

I admit that a wwid being in the wwids file doesn't mean that it is
definitely a multipath path device (it could always still be blacklisted
for instance). Also, the ability to move the wwids file is unfortunate,
and probably never used. But it is the case that every wwid in the wwids
file has had a multipath device successfully created for it. This is
true regardless of the find_multipaths setting, and seems to me to be a
good hint. Conversely, if a device wwid isn't in the wwids file, then it
very likely has never been multipathed before (assuming that the wwids
file is on a writable filesystem).

So relying on it being correct is wrong, but it certainly provides
useful hints.

> >=20
> > > In the past, there were issues with either pvscan or blkid (or
> > > multipath) failing to open a device while another process had
> > > opened it
> > > exclusively. I've never understood all the subtleties. See systemd
> > > commit 3ebdb81 ("udev: serialize/synchronize block device event
> > > handling with file locks").
> >=20
> > Those locks look like a fine solution if a problem comes up like
> > that.
> > I suspect the old issues may have been caused by a program using an
> > exclusive open when it shouldn't.
>=20
> Possible. I haven't seen many of these issues recently. Very rarely, I
> see reports of a mount command mysteriously, sporadically failing
> during boot. It's very hard to figure out why that happens if it does.
> I suspect some transient effect of this kind.
>=20
> >=20
> > > After=3Dudev-settle will make sure that you're past a coldplug uevent
> > > storm during boot. IMO this is the most important part of the
> > > equation.
> > > I'd be happy to find a solution for this that doesn't rely on udev
> > > settle, but I don't see any.
> >=20
> > I don't think multipathd is listening to uevents directly?
> > =A0 If it were,
> > you might use a heuristic to detect a change in uevents (e.g. the
> > volume)
> > and conclude coldplug is finished.
>=20
> multipathd does listen to uevents (only "udev" events, not "kernel").
> But that doesn't help us on startup. Currently we try hard to start up
> after coldplug is finished. multipathd doesn't have a concurrency issue
> like LVM2 (at least I hope so; it handles events with just two threads,
> a producer and a consumer). The problem is rather that dm devices
> survive the initramfs->rootfs switch, while member devices don't (see
> above).
>=20
> Cheers,
> Martin
>=20
>=20
> >=20
> > Dave
> >=20

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

