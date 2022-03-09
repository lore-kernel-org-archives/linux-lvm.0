Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE6EC433EF
	for <linux-lvm@archiver.kernel.org>; Thu, 10 Mar 2022 07:46:09 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-tFlFe6HbPhG64fZUyIS5-w-1; Thu, 10 Mar 2022 02:46:04 -0500
X-MC-Unique: tFlFe6HbPhG64fZUyIS5-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7B2E3802ACE;
	Thu, 10 Mar 2022 07:46:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF9C276EE;
	Thu, 10 Mar 2022 07:45:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5BBDE195FD4E;
	Thu, 10 Mar 2022 07:45:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7C93E1953540
 for <linux-lvm@listman.corp.redhat.com>; Wed,  9 Mar 2022 17:04:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6752C41136E7; Wed,  9 Mar 2022 17:04:13 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6306B41136E0
 for <linux-lvm@redhat.com>; Wed,  9 Mar 2022 17:04:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A4FD803DDA
 for <linux-lvm@redhat.com>; Wed,  9 Mar 2022 17:04:13 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-hrV1mhYHNp-qFkJYuOYMeg-1; Wed, 09 Mar 2022 12:04:09 -0500
X-MC-Unique: hrV1mhYHNp-qFkJYuOYMeg-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0C9421F382;
 Wed,  9 Mar 2022 17:04:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BF2AC13D7C;
 Wed,  9 Mar 2022 17:04:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NwirLAfeKGL/DgAAMHmgww
 (envelope-from <mwilck@suse.com>); Wed, 09 Mar 2022 17:04:07 +0000
Message-ID: <06ec8ee06986abfe772485a44d6bb57781cb5718.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: David Teigland <teigland@redhat.com>
Date: Wed, 09 Mar 2022 18:04:07 +0100
In-Reply-To: <20220309162711.GA5819@redhat.com>
References: <38c190ac39c244d9442670589b7bfeb4f800383e.camel@suse.com>
 <20220309162711.GA5819@redhat.com>
User-Agent: Evolution 3.42.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mailman-Approved-At: Thu, 10 Mar 2022 07:45:56 +0000
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-03-09 at 10:27 -0600, David Teigland wrote:
>=20
> Right, this pvscan needs to avoid getting info from udev, regardless
> of
> what's set in lvm.conf.=A0 We don't use udev for
> external_device_info_source
> here so I missed that and will add a fix.
>=20
> > Shouldn't "pvscan" be run in a RUN+=3D statement instead? Obviously
> > if we
> > do this, the lvm-activate-$VG unit must be started in some other
> > way
> > (e.g. by calling systemd-run directly from pvscan).
>=20
> IMPORT is needed to import LVM_VG_NAME_COMPLETE from the pvscan
> output
> into the udev rule so we know which VG to activate.

I see. That has the (IMO strange) side effect that the "udev property"
LVM_VG_NAME_COMPLETE is set on just one of multiple PVs, and will
disappear when that PV receives another uevent.

If we started pvscan later, in RUN, and a VG became complete, instead
of printing the VG name to stdout, it could run the "systemd-run"
command for lvm-activate-${VG}, which is currently called in 69-dm-
lvm.rules, directly instead, by fork()ing and exec()ing "systemd-run".
That was what I meant. Just a thought, not sure if it really works.

> > In the cases we have observed so far, the VGs were assembled
> > correctly
> > despite these warnings. We aren't certain if this was by luck only.
> > In
> > any case, the messages irritate users.
> >=20
> > Or are we getting this completely wrong, and the new autoactivation
> > feature should not be used with external_device_info_source=3D"udev"
> > at
> > all?=20
>=20
> right
>=20
> > If that's the case, how is multipath component detection supposed
> > to work?
>=20
> There are multiple ways that it's avoided, some apply in different
> situations:
>=20
> - 69-dm-lvm.rules will often not even be called on a multipath
> component
> =A0 device because udev has already figured out it's a component (I'd
> need
> =A0 some reminding about exactly when/how this happens.)

Right: the rules are skipped if ENV{DM_MULTIPATH_DEVICE_PATH}=3D=3D"1",
which is fine.

> - if 69-dm-lvm.rules is called on a multipath component, that device
> will
> =A0 not exist in the lvm devices file, so pvscan will ignore it.

I need some reminding about how the devices file works :-)


In the past (with the previous event activation scheme), we'd see
effects like this: Suppose we have a dm device dm-1 consisting of 2
SCSI devices sda, sdb. sda is processed by udev, and multipathd sets up
the dm device with just that one member. sdb is present in the system,
but not yet processed by udev and not present in the udev db, thus not
seen by multipathd either.=A0When pvscan was run on the dm device (dm-1,
say), it scanned sysfs (where sdb was present) for other devices. sdb
had no "holders" yet, so pvscan with external_device_info_source=3D"none"
would consider it, find "duplicate devices" dm-1 and sdb, and fail.

Am I understanding correctly that with the new scheme, the devices file
would prevent this from happening?

> - if 69-dm-lvm.rules is called on a multipath component, and there's
> no
> =A0 devices file, then filter-mpath checking sysfs holder info will
> =A0 often detect and ignore it.
>=20
> - if all three of those don't catch it, then filter-mpath will also
> =A0 check if the component wwid is listed in /etc/multipath/wwids and
> =A0 ignore the device if it is.

Off-topic: I have seen that, and I'm not particularly happy about it,
because the wwids file doesn't always represent multipathd's view of
the world. It depends on the find_multipaths setting in multipath.conf.
Only if it's set to "strict" (the RHEL default) you can be sure that a
device that isn't in the wwids file will not be grabbed by multipathd
later.

Regards
Martin

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

