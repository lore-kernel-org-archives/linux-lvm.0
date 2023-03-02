Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33871C7EE30
	for <linux-lvm@archiver.kernel.org>; Thu,  2 Mar 2023 11:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677756488;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3+PHK7HSn/ox16eCHlsYVOJThfqXSAe7qTjd2U4FPdg=;
	b=aeMslIcfrnD9z8IljOwD4uvxKLF3+iAaoI1ITu6kYELSniFfhYje0i3eS0QH4r4N43Lz0R
	hlO/TlQntNPK/XR9fqFFiOnuRlpFlrOFo8kSKOT09NY7FuXji4NBTltQ1A4bF4bncTRMKC
	S/XUVSdl8VCKFn85ryRWaZ+nH1hqN3I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-HGlU-hBIOR-68lMFgSXcdQ-1; Thu, 02 Mar 2023 06:28:05 -0500
X-MC-Unique: HGlU-hBIOR-68lMFgSXcdQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 108B73C0DDC6;
	Thu,  2 Mar 2023 11:28:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D43C492C1B;
	Thu,  2 Mar 2023 11:27:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 89DE219452D0;
	Thu,  2 Mar 2023 11:27:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1FB9119452CD
 for <linux-lvm@listman.corp.redhat.com>; Thu,  2 Mar 2023 11:27:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0CE1B492B00; Thu,  2 Mar 2023 11:27:46 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05E86492C3E
 for <linux-lvm@redhat.com>; Thu,  2 Mar 2023 11:27:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB360811E9C
 for <linux-lvm@redhat.com>; Thu,  2 Mar 2023 11:27:45 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-646-vJ6Z6lAaPOad2N21IDdbEA-1; Thu, 02 Mar 2023 06:27:44 -0500
X-MC-Unique: vJ6Z6lAaPOad2N21IDdbEA-1
Received: by mail-vs1-f41.google.com with SMTP id f31so22153099vsv.1
 for <linux-lvm@redhat.com>; Thu, 02 Mar 2023 03:27:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t2Uy1ts69eaYNxTZRe0ws4urWBOzMcr3RE+ymGj6EZg=;
 b=L9PAzVodyuGq9k4v1Ze/ZMr3xR1+GHmLmByCYq8VEOXTjr/1ocq1W4Iw8M2qf+IhgR
 xjYA/KpenKTrY3V4x9ePo8JHNwVuEIjCA8UZlZb84hD6Qg2bBn5v1SB6nEtk23UusXLC
 n11VgO7jCE/FWm0xxuUvvgcNdp0+JyKpy41tkChvwSXVw/VUjgLjheh9KnWLFarY0ssm
 C5bPAe1S1vVZn5iHRIMqaxqoKtp2Q9UPx6bYEOlwCpC0PRsjc4EgYt62AIXtbYQPAAAe
 W0yLBGZJAGGXj2ERU8dVyvcsXshpGGP8CTv0OOkgte2i2AXuRCgbT/qggGrlejD0iZc/
 9wpw==
X-Gm-Message-State: AO0yUKWWRhCF12b32XINNA7bewGBOnoZ6OT9vMRbS/ddjjH8xmJpjEUl
 CBg8xZ+scb/1x+6ZxZFB1k31m9J4ajaK8DFlgrvGVbi7
X-Google-Smtp-Source: AK7set85DTO6wnaqEBwRUL0Z4TZ4PG5fZqE2nRSWRUj/dhaOAvd0dy6mt8GRW2dISqOOt7jmHSXOBBpjY+aLTumoW9k=
X-Received: by 2002:a67:b910:0:b0:412:364c:68be with SMTP id
 q16-20020a67b910000000b00412364c68bemr6265969vsn.7.1677756463737; Thu, 02 Mar
 2023 03:27:43 -0800 (PST)
MIME-Version: 1.0
References: <2023967259.761825.1677710640334.JavaMail.zimbra@karlsbakk.net>
 <CAAMCDeftn7gLN8s3EMFer+jJ95dRkdpR4007hDMqNNhjrbGDJA@mail.gmail.com>
 <885248342.299.1677746026822.JavaMail.zimbra@karlsbakk.net>
In-Reply-To: <885248342.299.1677746026822.JavaMail.zimbra@karlsbakk.net>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Thu, 2 Mar 2023 05:27:32 -0600
Message-ID: <CAAMCDefBDeAhG016VeJ_7HkZFQMmmCoDX=9jhxwkBJs+uOULfw@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [linux-lvm] lvconvert --uncache takes hours
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
Cc: Malin Bruland <malin.bruland@pm.me>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 2, 2023 at 2:34 AM Roy Sigurd Karlsbakk <roy@karlsbakk.net> wrote:
>
>
> ----- Original Message -----
> > From: "Roger Heflin" <rogerheflin@gmail.com>
> > To: "linux-lvm" <linux-lvm@redhat.com>
> > Cc: "Malin Bruland" <malin.bruland@pm.me>
> > Sent: Thursday, 2 March, 2023 01:51:08
> > Subject: Re: [linux-lvm] lvconvert --uncache takes hours
>
> > On Wed, Mar 1, 2023 at 4:50 PM Roy Sigurd Karlsbakk <roy@karlsbakk.net> wrote:
> >>
> >> Hi all
> >>
> >> Working with a friend's machine, it has lvmcache turned on with writeback. This
> >> has worked well, but now it's uncaching and it takes *hours*. The amount of
> >> cache was chosen to 100GB on an SSD not used for much else and the dataset that
> >> is being cached, is a RAID-6 set of 10x2TB with XFS on top. The system mainly
> >> works with file serving, but also has some VMs that benefit from the caching
> >> quite a bit. But then - I wonder - how can it spend hours emptying the cache
> >> like this? Most write caching I know of last only seconds or perhaps in really
> >> worst case scenarios, minutes. Since this is taking hours, it looks to me
> >> something should have been flushed ages ago.
> >>
> >> Have I (or we) done something very stupid here or is this really how it's
> >> supposed to work?
> >>
> >> Vennlig hilsen
> >>
> >> roy
> >
> > A spinning raid6 array is slow on writes (see raid6  write penalty).
> > Because of that the array can only do about 100 write operattions/sec.
>
> About 100 writes/second per data drive, that is. md parallilses I/O well.
>

No.  On writes you get 100 writes to the raid6 total.  With reads you
get 100 iops/disk.  The writes by their very raid6 nature cannot be
parallalized.

Each write to md requires a lot of work.   At min, you have to re-read
the sector you are writing, read the parity you need to update,
calculate the parity changes, and , adjust the parity and re-write any
parities that you need to change.    Your other option is you might be
able to write an entire stripe, but that requires writes to all disks
+ parity calc + writes to parity.    All options of writing data to
raid5/6 breakdown to iops/disk == total write iops.
The raid5/6 format requires the multiple reads and writes, and  really
makes it slow on writes.

> > If the disk is doing other work then it only has the extra capacity so
> > it could destage slower.
>
> The system was mostly idle.
>
> > A lot depends on how big each chunk is.     The lvmcache indicates the
> > smallest chunksize is 32k.
> >
> > 100G / 32k = 3 million, and at 100seeks/sec that comes to at least an hour.
>
> Those 100GB was on SSD, not spinning rust. Last I checked, that was the whole point with caching.

You are de-staging the SSD cache to spinning disks. correct?  The
writes to spinning disks are slow.

>
> > Lvm bookkeeping has to also be written to the spinning disks I would
> > think, so 2 hours if the array were idle.
>
> erm - why on earth would you do writes to hdd if you're caching it?

Once the cache is gone all LVM should be on the spinning disks.

>
> > Throw in a 50% baseload on the disks and you get 4 hours.
> >
> > Hours is reasonable.
>
> As I said, the system was idle.
>
> Vennlig hilsen
>

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

