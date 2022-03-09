Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0659EC433EF
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Mar 2022 17:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646846825;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XFr4ltFvsip3tKuV77oxjPv67p2LJPR+wy+bOkDhOi0=;
	b=D1/obvmIlEiiwzWUveIjPitiEAR0Vp7+buVvt35E4lfr1qfiohijQIQoKXXFW/R9XeoyGQ
	JDPPOq0aICoapZdeLmnnK+FkLGkmPlMCbki6e8zsiDhYt8WhPC7f3JosbbQcaGS1u5cXvp
	0K1RWt0ZandS6210rsV1U6fXYfsySTc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-G5Wx-jI8OhWBDiChnKEoSQ-1; Wed, 09 Mar 2022 12:26:20 -0500
X-MC-Unique: G5Wx-jI8OhWBDiChnKEoSQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD93C1C068CB;
	Wed,  9 Mar 2022 17:26:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A76532026D60;
	Wed,  9 Mar 2022 17:26:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CEA2A195354C;
	Wed,  9 Mar 2022 17:26:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 769011953540
 for <linux-lvm@listman.corp.redhat.com>; Wed,  9 Mar 2022 17:26:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 03274106A031; Wed,  9 Mar 2022 17:26:09 +0000 (UTC)
Received: from redhat.com (unknown [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B0AF106D5B4;
 Wed,  9 Mar 2022 17:26:08 +0000 (UTC)
Date: Wed, 9 Mar 2022 11:26:06 -0600
From: David Teigland <teigland@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20220309172606.GB5819@redhat.com>
References: <38c190ac39c244d9442670589b7bfeb4f800383e.camel@suse.com>
 <20220309162711.GA5819@redhat.com>
 <06ec8ee06986abfe772485a44d6bb57781cb5718.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <06ec8ee06986abfe772485a44d6bb57781cb5718.camel@suse.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Subject: Re: [linux-lvm] LVM autoactivation and udev
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-lvm/>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=subscribe>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Peter Rajnoha <prajnoha@redhat.com>,
 LVM general discussion and development <linux-lvm@redhat.com>,
 Heming Zhao <heming.zhao@suse.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 09, 2022 at 06:04:07PM +0100, Martin Wilck wrote:
> On Wed, 2022-03-09 at 10:27 -0600, David Teigland wrote:
> >=20
> > Right, this pvscan needs to avoid getting info from udev, regardless
> > of
> > what's set in lvm.conf.=A0 We don't use udev for
> > external_device_info_source
> > here so I missed that and will add a fix.
> >=20
> > > Shouldn't "pvscan" be run in a RUN+=3D statement instead? Obviously
> > > if we
> > > do this, the lvm-activate-$VG unit must be started in some other
> > > way
> > > (e.g. by calling systemd-run directly from pvscan).
> >=20
> > IMPORT is needed to import LVM_VG_NAME_COMPLETE from the pvscan
> > output
> > into the udev rule so we know which VG to activate.
>=20
> I see. That has the (IMO strange) side effect that the "udev property"
> LVM_VG_NAME_COMPLETE is set on just one of multiple PVs, and will
> disappear when that PV receives another uevent.
>=20
> If we started pvscan later, in RUN, and a VG became complete, instead
> of printing the VG name to stdout, it could run the "systemd-run"
> command for lvm-activate-${VG}, which is currently called in 69-dm-
> lvm.rules, directly instead, by fork()ing and exec()ing "systemd-run".
> That was what I meant. Just a thought, not sure if it really works.

Having pvscan fork systemd-run vgchange -aay doesn't sound nice at all.
The point of this new design is clean up and simplify things, separating
the scanning from the activation:  pvscan just scans the device, and
vgchange activates the VG.

> > There are multiple ways that it's avoided, some apply in different
> > situations:
> >=20
> > - 69-dm-lvm.rules will often not even be called on a multipath
> > component device because udev has already figured out it's a component =
(I'd
> > need some reminding about exactly when/how this happens.)
>=20
> Right: the rules are skipped if ENV{DM_MULTIPATH_DEVICE_PATH}=3D=3D"1",
> which is fine.
>=20
> > - if 69-dm-lvm.rules is called on a multipath component, that device
> > will not exist in the lvm devices file, so pvscan will ignore it.
>=20
> I need some reminding about how the devices file works :-)

/etc/lvm/devices/system.devices lists the devices that lvm will use,
and lvm won't look at any other devices.  More details in lvmdevices(8)
https://man7.org/linux/man-pages/man8/lvmdevices.8.html

> In the past (with the previous event activation scheme), we'd see
> effects like this: Suppose we have a dm device dm-1 consisting of 2
> SCSI devices sda, sdb. sda is processed by udev, and multipathd sets up
> the dm device with just that one member. sdb is present in the system,
> but not yet processed by udev and not present in the udev db, thus not
> seen by multipathd either.=A0When pvscan was run on the dm device (dm-1,
> say), it scanned sysfs (where sdb was present) for other devices. sdb
> had no "holders" yet, so pvscan with external_device_info_source=3D"none"
> would consider it, find "duplicate devices" dm-1 and sdb, and fail.
>=20
> Am I understanding correctly that with the new scheme, the devices file
> would prevent this from happening?

Right, lvm will never look at sda or sdb because they won't be listed in
system.devices.

> > - if 69-dm-lvm.rules is called on a multipath component, and there's
> > no devices file, then filter-mpath checking sysfs holder info will
> > often detect and ignore it.
> >=20
> > - if all three of those don't catch it, then filter-mpath will also
> > =A0 check if the component wwid is listed in /etc/multipath/wwids and
> > =A0 ignore the device if it is.
>=20
> Off-topic: I have seen that, and I'm not particularly happy about it,
> because the wwids file doesn't always represent multipathd's view of
> the world. It depends on the find_multipaths setting in multipath.conf.
> Only if it's set to "strict" (the RHEL default) you can be sure that a
> device that isn't in the wwids file will not be grabbed by multipathd
> later.

Yes, it's not perfect, but it may help in some cases, and there are
multiple methods that will usually exclude a component before this.

Dave
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

