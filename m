Return-Path: <SRS0=qRy5=PX=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCE6C433F5
	for <linux-lvm@archiver.kernel.org>; Thu,  4 Nov 2021 15:27:10 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDBFD604AC
	for <linux-lvm@archiver.kernel.org>; Thu,  4 Nov 2021 15:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDBFD604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636039628;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=koTOt6ddLAKQ0rzZddm7/YbQlAuyisLg+snLnWUUZeg=;
	b=IVGDXGoYYp32R+ZvMUwycrYii05V1tuKxDjPZSe7L8I5tx3Tl3jWDuN/PoQp5tkdwNTNKg
	Ub8NevJrllFFe6UuRCJiLeVBrOU43XiC4TfslSvY8MK4LhBfYAvpmCUE1zPOu2sEEBCd+M
	MAcTjDLOlrgaCLNaCM3DR+DEWMnqEMM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-Fk2_rXK4PcmCVaOS5fnmRg-1; Thu, 04 Nov 2021 11:27:04 -0400
X-MC-Unique: Fk2_rXK4PcmCVaOS5fnmRg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4B3587507E;
	Thu,  4 Nov 2021 15:26:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55D6B60C21;
	Thu,  4 Nov 2021 15:26:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A9AAD1806D03;
	Thu,  4 Nov 2021 15:26:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A4FPdfi021021 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 4 Nov 2021 11:25:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8326E652AC; Thu,  4 Nov 2021 15:25:39 +0000 (UTC)
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ECA8E57CD2;
	Thu,  4 Nov 2021 15:25:23 +0000 (UTC)
Date: Thu, 4 Nov 2021 10:25:21 -0500
From: David Teigland <teigland@redhat.com>
To: Charles Koprowski <charles@koprow.ski>
Message-ID: <20211104152521.GA16100@redhat.com>
References: <CADBR731Q-Jfcj6iFo9Ai8r+PGtqeG473b-RjMj3Oq0ut8hrM-g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADBR731Q-Jfcj6iFo9Ai8r+PGtqeG473b-RjMj3Oq0ut8hrM-g@mail.gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-lvm@redhat.com
Cc: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Changing shared VG lock type
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

On Wed, Nov 03, 2021 at 12:40:24PM +0100, Charles Koprowski wrote:
> Hello,
>=20
> I'm trying to change the lock type of a shared VG from =ABdlm=BB to =ABsa=
nlock=BB.
>=20
> >From the manpage I understand that I should first change it to =ABnone=
=BB and
> then change it to =ABsanlock=BB.
>=20
> So I changed the lock type to =ABnone=BB without problem.
>=20
> I then started lvmlockd + sanlock and tried to change the lock type to
> =ABsanlock=BB but it failed :
>=20
> # vgchange --lock-type sanlock data
>   Global lock failed: check that global lockspace is started
>=20
> What could I have missed ?

Hi, you haven't missing anything, but stumbled across a real issue that we
should improve.  This VG needs to have the global lock enabled within it,
but vgchange --locktype doesn't contain the necessary logic to enable a
new global lock (only vgcreate includes that.)  You can read more about
the special cases surrounding the global lock in the lvmlockd(8) section
"managing the global lock in sanlock VGs".

To work around this, you can force the vgchange by skipping the global
lock, and then start the lockspace:

$ vgchange --locktype sanlock --lockopt skipgl svg
  WARNING: skipping global lock in lvmlockd.
  Logical volume "lvmlock" created.
  Volume group "svg" successfully changed

$ vgchange --lockstart svg

Depending on what other VGs are seen, it's possible you may also need to
run "lvmlockctl --gl-enable svg" at this point to enable the global lock
in that vg.

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

