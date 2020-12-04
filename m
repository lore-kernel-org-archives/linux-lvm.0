Return-Path: <SRS0=CKw4=FI=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7672EC4361A
	for <linux-lvm@archiver.kernel.org>; Fri,  4 Dec 2020 21:27:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 942E322A85
	for <linux-lvm@archiver.kernel.org>; Fri,  4 Dec 2020 21:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 942E322A85
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=stoffel.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-HbIPwgjlNs-foJG3vfVhwg-1; Fri, 04 Dec 2020 16:27:48 -0500
X-MC-Unique: HbIPwgjlNs-foJG3vfVhwg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC1B5803637;
	Fri,  4 Dec 2020 21:27:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D52110016FE;
	Fri,  4 Dec 2020 21:27:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 51CED180954D;
	Fri,  4 Dec 2020 21:27:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B4LRJNk007789 for <linux-lvm@listman.util.phx.redhat.com>;
	Fri, 4 Dec 2020 16:27:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0DE6F2166B31; Fri,  4 Dec 2020 21:27:19 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 048032166B30
	for <linux-lvm@redhat.com>; Fri,  4 Dec 2020 21:27:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B579F858287
	for <linux-lvm@redhat.com>; Fri,  4 Dec 2020 21:27:14 +0000 (UTC)
Received: from mail.stoffel.org (li1843-175.members.linode.com
	[172.104.24.175]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-418-G7G0oW8hNSeTXkxTPKFnQQ-1; Fri, 04 Dec 2020 16:27:12 -0500
X-MC-Unique: G7G0oW8hNSeTXkxTPKFnQQ-1
Received: from quad.stoffel.org (097-095-186-058.res.spectrum.com
	[97.95.186.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
	SHA256) (No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id 37AE427678
	for <linux-lvm@redhat.com>; Fri,  4 Dec 2020 16:27:12 -0500 (EST)
Received: by quad.stoffel.org (Postfix, from userid 1000)
	id 40072A69D2; Fri,  4 Dec 2020 16:27:11 -0500 (EST)
MIME-Version: 1.0
Message-ID: <24522.43439.171672.613858@quad.stoffel.home>
Date: Fri, 4 Dec 2020 16:27:11 -0500
From: "John Stoffel" <john@stoffel.org>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <CAMaziXtWxjq03yzdBWc57rBBj2UnL1KK9avgTbBFnX+PdwWTPQ@mail.gmail.com>
References: <CAMaziXtCk662ZfaG-crzrrKpi_efQqqOLbVCnSvLDsCOpLS0zw@mail.gmail.com>
	<24517.28961.127885.638522@quad.stoffel.home>
	<CAMaziXtWxjq03yzdBWc57rBBj2UnL1KK9avgTbBFnX+PdwWTPQ@mail.gmail.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B4LRJNk007789
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] System completely unstable after migrating to
	thin	pools
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>>>>> "Sreyan" =3D=3D Sreyan Chakravarty <sreyan32@gmail.com> writes:

Sreyan> On Tue, Dec 1, 2020 at 3:55 AM John Stoffel <john@stoffel.org> wrot=
e:
Sreyan>     I suspect you're toast.=A0 What are you trying to accomplish he=
re
Sreyan>     though?=A0 Trying to stuff 10 pounds of data into a 5 pound bag=
?=A0 *grin*

Sreyan> I don't know what you mean by that. Do you mean that thin
Sreyan> pools cannot be migrated to from older LVMs ? =A0

I don't think so.  The two versions of LVM thin pools aren't
compatible.  See the archives of this list for more details.  I also
don't quite trust them either with my data. =20

Sreyan>     Or are you trying to have the ability to take snapshots of your=
 system
Sreyan>     to make rollbacks easier?=A0

Sreyan> Yes.

You might want to think about using 'btrfs' instead, since it supports
filesystem level snapshots, and I think Ubuntu 20.x or newer uses it
for it's default filesystem now.  I'm pretty sure Linux MINT does as
well.

But this will require you to copy the data off the current setup (if
you can get it working again) and onto new disks.  A full re-install
of the OS will be needed.

Not that I truest brtfs either quite yet.  Nor do I like the mashing
of various storage layers into one unified whole (like ZFS does)
though I understand why they feel they need to do it. =20

Sreyan>     You need to post the output of your configuration in more detai=
l, with
Sreyan>     dmesg output, logs, lvs, pvs, vgs output, etc.

Sreyan> $ lvs
Sreyan> =A0 LV =A0 =A0 VG =A0 =A0 =A0 Attr =A0 =A0 =A0 LSize =A0 =A0Pool =
=A0 Origin Data% =A0Meta% =A0Move Log Cpy%Sync Convert
Sreyan> =A0 fedora vgfedora Vwi-aotz-- =A0700.00g pool00 =A0 =A0 =A0 =A016.=
66 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0
Sreyan> =A0 pool00 vgfedora twi-aotz-- <929.76g =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 12.54 =A016.62=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0

So it looks like you're using Fedora, which I honestly don't have alot
of experience with in situations like this.  I'm more of a Debian guy
at home and a CentOS/RHEL guy at work. =20

Sreyan> $ pvs
Sreyan> =A0 PV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0VG =A0 =A0 =A0 Fmt =A0Attr PSize=
 =A0 PFree =A0
Sreyan> =A0 /dev/mapper/luks-2ec7f1ae-6f9b-4896-a7b2-be7809e9d2f4 vgfedora =
lvm2 a-- =A0929.99g 120.00m

Sreyan> $ vgs
Sreyan> =A0 VG =A0 =A0 =A0 #PV #LV #SN Attr =A0 VSize =A0 VFree =A0
Sreyan> =A0 vgfedora =A0 1 =A0 2 =A0 0 wz--n- 929.99g 120.00m

Sreyan> dmesg:

Sreyan> https://pastebin.com/raw/svTX92SJ
Sreyan> =A0

Sreyan>     But really, you do have backups?

Sreyan> No.

You're probably toast.

Can you boot off a rescue disk, or even a recent Fedora bootable ISO
and poke around at your current setup?  That might let your recover
your data.

Of course before you do that, you should copy the original disk onto a
new disk on save the original somewhere offline and unpowered, so you
can run tests on the copy of the data.

Good luck!


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

