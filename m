Return-Path: <SRS0=XKGo=OU=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D06B2C433EF
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Sep 2021 19:36:48 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D1B160FF2
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Sep 2021 19:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D1B160FF2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633030607;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GjEZghyJZ4S2AAv25yfoZw7bdtU4ZeCHSL04di6qjcc=;
	b=eOLOKZazwyyCG2WGCBo+tVgsks6fjVZiaCFuNcdosVP75IpIDLnszkQUHC3OCs/jKj+6WX
	upkxNgbhsxP4MHoZF212zZSmhrnzNM8ZDYpdXBfAbOBi8r8in/u11Pdzk2XMobqb7/Vabq
	8zxNE/2EGDIsjYloi07GVrgsJK4TKkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-XB0K8ZO0Mnqe6Q8TVdeqoA-1; Thu, 30 Sep 2021 15:36:45 -0400
X-MC-Unique: XB0K8ZO0Mnqe6Q8TVdeqoA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 035F5101796A;
	Thu, 30 Sep 2021 19:36:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBF4C100E107;
	Thu, 30 Sep 2021 19:36:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D328457DC4;
	Thu, 30 Sep 2021 19:36:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18UEfqBf009013 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 30 Sep 2021 10:41:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0AB791017E27; Thu, 30 Sep 2021 14:41:52 +0000 (UTC)
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B4B6100760B;
	Thu, 30 Sep 2021 14:41:37 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18UEfZ6v015211; 
	Thu, 30 Sep 2021 09:41:35 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18UEfZn2015210;
	Thu, 30 Sep 2021 09:41:35 -0500
Date: Thu, 30 Sep 2021 09:41:34 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20210930144134.GH3087@octiron.msp.redhat.com>
References: <f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<9947152f39a9c5663abdbe3dfee343556e8d53d7.camel@suse.com>
	<20210928144254.GC11549@redhat.com>
	<138b7ddb721b6a58df8f0401b76c7975678f0dda.camel@suse.com>
	<20210928174246.GF3087@octiron.msp.redhat.com>
	<20210929220653.p45cvgzdhlbnp4gy@alatyr-rpi.brq.redhat.com>
	<e8459ca73b148e9ba20cbde0041f6e5f4093699d.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <e8459ca73b148e9ba20cbde0041f6e5f4093699d.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Thu, 30 Sep 2021 15:03:51 -0400
Cc: "zkabelac@redhat.com" <zkabelac@redhat.com>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 07:51:08AM +0000, Martin Wilck wrote:
> On Thu, 2021-09-30 at 00:06 +0200, Peter Rajnoha wrote:
> > On Tue 28 Sep 2021 12:42, Benjamin Marzinski wrote:
> > > On Tue, Sep 28, 2021 at 03:16:08PM +0000, Martin Wilck wrote:
> > > > I have pondered this quite a bit, but I can't say I have a
> > > > concrete
> > > > plan.
> > > >=20
> > > > To avoid depending on "udev settle", multipathd needs to
> > > > partially
> > > > revert to udev-independent device detection. At least during
> > > > initial
> > > > startup, we may encounter multipath maps with members that don't
> > > > exist
> > > > in the udev db, and we need to deal with this situation
> > > > gracefully. We
> > > > currently don't, and it's a tough problem to solve cleanly. Not
> > > > relying
> > > > on udev opens up a Pandora's box wrt WWID determination, for
> > > > example.
> > > > Any such change would without doubt carry a large risk of
> > > > regressions
> > > > in some scenarios, which we wouldn't want to happen in our large
> > > > customer's data centers.
> > >=20
> > > I'm not actually sure that it's as bad as all that. We just may
> > > need a
> > > way for multipathd to detect if the coldplug has happened.=A0 I'm
> > > sure if
> > > we say we need it to remove the udev settle, we can get some method
> > > to
> > > check this. Perhaps there is one already, that I don't know about.
> > > If
> >=20
> > The coldplug events are synthesized and as such, they all now contain
> > SYNTH_UUID=3D<UUID> key-value pair with kernel>=3D4.13:
> >=20
> > =A0
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/ABI/testing/sysfs-uevent
> >=20
> > I've already tried to proposee a patch for systemd/udev that would
> > mark
> > all uevents coming from the trigger (including the one used at boot
> > for
> > coldplug) with an extra key-value pair that we could easily match in
> > rules,
> > but that was not accepted. So right now, we could detect that
> > synthesized uevent happened, though we can't be sure it was the
> > actual
> > udev trigger at boot. For that, we'd need the extra marks. I can give
> > it
> > another try though, maybe if there are more people asking for this
> > functionality, we'll be at better position for this to be accepted.
>=20
> That would allow us to discern synthetic events, but I'm unsure how
> this what help us. Here, what matters is to figure out when we don't
> expect any more of them to arrive.
>=20
> I guess it would be possible to compare the list of (interesting)
> devices in sysfs with the list of devices in the udev db. For
> multipathd, we could
>=20
>  - scan set U of udev devices on startup
>  - scan set S of sysfs devices on startup
>  - listen for uevents for updating both S and U
>  - after each uevent, check if the difference set of S and U is emtpy
>  - if yes, coldplug has finished

For multipathd, we don't even need to care when all the block devices
have been processed.  We only need to care about devices that are
currently multipathed. If multipathd starts up and notices devices that
are in S and not in U, but those devices aren't currently part of a
multipath device, it can ignore them.=20

>  - otherwise, continue waiting, possibly until some timeout expires.
>=20
> It's more difficult for LVM because you have no daemon maintaining
> state.
>=20
> Martin
>=20
>=20
>=20
>=20
>=20
> >=20

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

