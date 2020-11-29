Return-Path: <SRS0=nNlY=FE=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381BBC64E8A
	for <linux-lvm@archiver.kernel.org>; Mon, 30 Nov 2020 07:04:05 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 793FE206CA
	for <linux-lvm@archiver.kernel.org>; Mon, 30 Nov 2020 07:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 793FE206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-Sjb2psJaN7uP4TC0Zmu3Qg-1; Mon, 30 Nov 2020 02:03:59 -0500
X-MC-Unique: Sjb2psJaN7uP4TC0Zmu3Qg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B6EF108E1AB;
	Mon, 30 Nov 2020 07:03:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F3225D6A8;
	Mon, 30 Nov 2020 07:03:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ADEA85002D;
	Mon, 30 Nov 2020 07:03:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ATFCZT9003914 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 29 Nov 2020 10:12:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1B63610181; Sun, 29 Nov 2020 15:12:35 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15ADBFFE1
	for <linux-lvm@redhat.com>; Sun, 29 Nov 2020 15:12:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A356D185A794
	for <linux-lvm@redhat.com>; Sun, 29 Nov 2020 15:12:32 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
	[209.85.166.177]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-548-B8MD9VxxNJGN1aJIS9uW6g-1; Sun, 29 Nov 2020 10:12:29 -0500
X-MC-Unique: B8MD9VxxNJGN1aJIS9uW6g-1
Received: by mail-il1-f177.google.com with SMTP id x15so8958654ilq.1
	for <linux-lvm@redhat.com>; Sun, 29 Nov 2020 07:12:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=SiCGvzZQ09MUnOWkUoATr6wDYcXfKE6/3w3J6y+l9MM=;
	b=XeF1EMysD5UZ6ekJfN1CJvS6ZJwjWcGtPjnmHHdZS5+ohM5r1a9AhiAx5rBItfvXHs
	elAGASX6kWAHHdUdQR6IGxhKMGEispnRKHmd0SzGeRjMuYziVGm2cxGDwtyBSJwNmFtM
	xLTK7mdS0AKZvItS0bAZMrXr158u/eYs8yHFOP4R/HISy5cOiktqZoFzVrSj7CKnj6Fc
	xWrqqP/rbCLSS54mVWSS5iOG2d16JfOra15QYvnONtYBfiqpMUZdWOSzKfBWfx9FjWmM
	Gm9SGWnK01qQTIpHpggSD+JhFeBguuncKB6Y1/STLJj0R4U+d1D2khI5ueQF/sKm9S2U
	O4SA==
X-Gm-Message-State: AOAM532tfjlX11xAb50+vU4ZOPb2EwfWUJROt90MqStBY/ucoFHpx3Hx
	6f1c18EAv0Wtoq5z35pxr7ng064ADfQrh/4MaIZr11VXb+w=
X-Google-Smtp-Source: ABdhPJykWu6Nq0bMQEcH4Y6YgXEzq0SEbP3ihF0QUs0eHWxNR4SrKLE4N1rR8PhPWavpXOAyNtUYxXBfOI58wws1HW0=
X-Received: by 2002:a92:d11:: with SMTP id 17mr14939643iln.84.1606662748312;
	Sun, 29 Nov 2020 07:12:28 -0800 (PST)
MIME-Version: 1.0
References: <CAJCQCtS8jzLJrFnG=+dAyimOHZMHka9zyKEeF5JzOjufv3YPqw@mail.gmail.com>
	<608365664c2a18db4e756f524c0e76da@assyoma.it>
In-Reply-To: <608365664c2a18db4e756f524c0e76da@assyoma.it>
From: Sreyan Chakravarty <sreyan32@gmail.com>
Date: Sun, 29 Nov 2020 20:42:16 +0530
Message-ID: <CAMaziXu_=POwe7Q4da4=zxYXzF=2x9y00eJYpUPcoQD=LWB=gA@mail.gmail.com>
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
X-Mailman-Approved-At: Mon, 30 Nov 2020 02:02:55 -0500
Subject: Re: [linux-lvm] swap on thin-provisioning
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============3187376487571784472=="

--===============3187376487571784472==
Content-Type: multipart/alternative; boundary="000000000000631b4505b54052dd"

--000000000000631b4505b54052dd
Content-Type: text/plain; charset="UTF-8"

On Sun, 29 Nov 2020, 6:23 pm Gionatan Danti, <g.danti@assyoma.it> wrote:

> Il 2020-11-29 01:18 Chris Murphy ha scritto:
> > What about a swapfile (on ext4 or XFS) onr a thin volume? In this
> > case, I'd expect fallocate would set the LE to PE mapping, and it
> > should work. But does it work for both paging and hibernation files?
>
> If things did not change, fallocate does *not* allocate PE space (ie:
> they are not passed down to the underlying thin pool).
>
> Moreover, I expect for a memory-starved machine to page out pool
> metadata (right?) so I would not use a thin volume for swap.
>
> Regards.
>


What about a swap file allocated with dd??

>
>

--000000000000631b4505b54052dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, 29 Nov 2020, 6:23 pm Gionatan Danti, &lt;<a hr=
ef=3D"mailto:g.danti@assyoma.it">g.danti@assyoma.it</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">Il 2020-11-29 01:18 Chris Murphy ha scritto=
:<br>
&gt; What about a swapfile (on ext4 or XFS) onr a thin volume? In this<br>
&gt; case, I&#39;d expect fallocate would set the LE to PE mapping, and it<=
br>
&gt; should work. But does it work for both paging and hibernation files?<b=
r>
<br>
If things did not change, fallocate does *not* allocate PE space (ie: <br>
they are not passed down to the underlying thin pool).<br>
<br>
Moreover, I expect for a memory-starved machine to page out pool <br>
metadata (right?) so I would not use a thin volume for swap.<br>
<br>
Regards.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">What about a swap file allocated with=
 dd??</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
</blockquote></div></div></div>

--000000000000631b4505b54052dd--

--===============3187376487571784472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============3187376487571784472==--

