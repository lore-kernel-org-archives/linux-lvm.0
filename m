Return-Path: <SRS0=Fuv7=L2=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBCF6C07E95
	for <linux-lvm@archiver.kernel.org>; Fri,  2 Jul 2021 21:31:48 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 882F561364
	for <linux-lvm@archiver.kernel.org>; Fri,  2 Jul 2021 21:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 882F561364
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-KmwrvYlMOSSbg6PLH5rIHA-1; Fri, 02 Jul 2021 17:31:45 -0400
X-MC-Unique: KmwrvYlMOSSbg6PLH5rIHA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A661800D55;
	Fri,  2 Jul 2021 21:31:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1524C60853;
	Fri,  2 Jul 2021 21:31:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C02D04A712;
	Fri,  2 Jul 2021 21:31:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 162LVUVp006865 for <linux-lvm@listman.util.phx.redhat.com>;
	Fri, 2 Jul 2021 17:31:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B440911E1ED; Fri,  2 Jul 2021 21:31:30 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF1FD11E1F2
	for <linux-lvm@redhat.com>; Fri,  2 Jul 2021 21:31:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CC3B1064FAF
	for <linux-lvm@redhat.com>; Fri,  2 Jul 2021 21:31:27 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-467-0fj9NVr8PHme-rbDlXT14A-1; Fri, 02 Jul 2021 17:31:23 -0400
X-MC-Unique: 0fj9NVr8PHme-rbDlXT14A-1
Received: by mail-lf1-f49.google.com with SMTP id w19so20480838lfk.5;
	Fri, 02 Jul 2021 14:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3csYjqTcR5P7ssjrfkI5reJAIn/kzrhuPongzaJpg8I=;
	b=sc2ngXUbzTkwOm+dXdbRTZx2LaMWKs1DhygBKWw4rr0Naub5OuS/DFXMm64admYb20
	Q7ULAtMATJTuhFsiX9E/4vTLatpiBVbZhO/haxhc/BXXOt3/MzrCshbLSooJ7iDtbibR
	MAQAaATyGCU6n0VQeyEXwaXzqiwXqdSKiEVYHgqNPMczHEhh3FKliXYKnYNrwZOUqnUZ
	NQgHQI5mfJeQzeBRoUeY5QOVYIJe3YDSmxGRBRGLUVfqaQg0AgqKryoTXqrTb7QzeTYX
	vFNiB+vibhmmWKoRysQZvwsQaLxmfpXpuXF2z4jgpLYQz4OgmfI3mtBnANaB/riTLbEb
	ExFQ==
X-Gm-Message-State: AOAM5312ds2ShWWGQDgeBDyf9sUT4M92+jn+0XDvgROpjBVK3usj5kTm
	LPmheSZfKsykOHei7iXVzb53Hi9ebZrxRc8gEjjtVAnMqbU=
X-Google-Smtp-Source: ABdhPJy74t+X+j8uayC3rvMqmlVz5NqN35TaqSfwdYvs5uwHaC4B32VG3u+Scu9xlUHIYM/uOj6Iq+Ek8h0FkMHbdaQ=
X-Received: by 2002:a05:6512:1327:: with SMTP id
	x39mr1235695lfu.37.1625261481140; 
	Fri, 02 Jul 2021 14:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<20210702210903.GA15057@redhat.com>
In-Reply-To: <20210702210903.GA15057@redhat.com>
From: Tom Yan <tom.ty89@gmail.com>
Date: Sat, 3 Jul 2021 05:31:09 +0800
Message-ID: <CAGnHSE=GJ7UFMDPFqkrp4Y6604BccRQn-a_KA4iTeuOe0_hwUQ@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-lvm@redhat.com
Cc: Zdenek Kabelac <zkabelac@redhat.com>, Martin Wilck <martin.wilck@suse.com>,
	"heming.zhao@suse.com" <heming.zhao@suse.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 3 Jul 2021 at 05:17, David Teigland <teigland@redhat.com> wrote:
>
> On Sun, Jun 06, 2021 at 02:15:23PM +0800, heming.zhao@suse.com wrote:
> > dev_cache_scan //order: O(n^2)
> >  + _insert_dirs //O(n)
> >  | if obtain_device_list_from_udev() true
> >  |   _insert_udev_dir //O(n)
> >  |
> >  + dev_cache_index_devs //O(n)
>
> I've been running some experiments and trying some patches to improve
> this.  By setting obtain_device_list_from_udev=0, and using the attached
> patch to disable dev_cache_index_devs, the pvscan is much better.
>
> systemctl status lvm2-pvscan appears to show that the pvscan command
> itself runs for only 2-4 seconds, while the service as a whole takes
> around 15 seconds.  See the 16 sec gap below from the end of pvscan
> to the systemd Started message.  If that's accurate, the remaining delay
> would lie outside lvm.

Not necessarily. It could be pvscan stalling for 16s after printing
the "now active" message for some reason before exiting (with 0).

>
> Jul 02 15:27:57 localhost.localdomain systemd[1]: Starting LVM event activation on device 253:1710...
> Jul 02 15:28:00 localhost.localdomain lvm[65620]:   pvscan[65620] PV /dev/mapper/mpathalz online, VG 1ed02c7d-0019-43c4-91b5-f220f3521ba9 is complete.
> Jul 02 15:28:00 localhost.localdomain lvm[65620]:   pvscan[65620] VG 1ed02c7d-0019-43c4-91b5-f220f3521ba9 run autoactivation.
> Jul 02 15:28:00 localhost.localdomain lvm[65620]:   1 logical volume(s) in volume group "1ed02c7d-0019-43c4-91b5-f220f3521ba9" now active
> Jul 02 15:28:16 localhost.localdomain systemd[1]: Started LVM event activation on device 253:1710.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

