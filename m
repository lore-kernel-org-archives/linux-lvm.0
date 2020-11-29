Return-Path: <SRS0=nNlY=FE=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA2A6C63777
	for <linux-lvm@archiver.kernel.org>; Mon, 30 Nov 2020 07:04:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 362FE206CA
	for <linux-lvm@archiver.kernel.org>; Mon, 30 Nov 2020 07:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 362FE206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-lYdEx1YuPLuWKgJU3m6V3w-1; Mon, 30 Nov 2020 02:04:03 -0500
X-MC-Unique: lYdEx1YuPLuWKgJU3m6V3w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0712F100C600;
	Mon, 30 Nov 2020 07:03:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D78F75D9D5;
	Mon, 30 Nov 2020 07:03:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 838F950030;
	Mon, 30 Nov 2020 07:03:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ATGK7nb012024 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 29 Nov 2020 11:20:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7ADD9200E1F6; Sun, 29 Nov 2020 16:20:07 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 759662029282
	for <linux-lvm@redhat.com>; Sun, 29 Nov 2020 16:20:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB2A9800B3A
	for <linux-lvm@redhat.com>; Sun, 29 Nov 2020 16:20:04 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-472--0F9uqIgOvKwLWt7i35KKg-1; Sun, 29 Nov 2020 11:19:53 -0500
X-MC-Unique: -0F9uqIgOvKwLWt7i35KKg-1
Received: by mail-ed1-f41.google.com with SMTP id q3so11844869edr.12
	for <linux-lvm@redhat.com>; Sun, 29 Nov 2020 08:19:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=HPvqFjHfOUDY/eLeCZc4zdb9Yj9ohv3d/hgMrkrfzMI=;
	b=BCvAJ9VEbqt02UO2G2vN/5Jj0Ca1PT7TPB4fT+Whnq/xfqeWi3Ns7FO9IE7LyO072I
	10U/iTukFjJNUpM3Xmw8wvCtzKwHS7mhR1sYEE5lDoMDxVwtxRVPregS4pDhKK70vgXS
	4vn/TyKT57EQuknsCGS4OXCPhlK5Cp11DJs8moKA2fH1i+WaF/G2C9VLw314dhgnDT9p
	kilNEPxwboJxJ/lgaE+PkzofwJHUvWO3jil9S6S2925xqdJb7xcV618HiEdSDzQLjiAO
	3zqjKEDT6GzFSXFLSIQO+5nFQtS2SBPqKu8s6wodYOMexqG7iniHDmkb8/LUnLiu/J1F
	6i6A==
X-Gm-Message-State: AOAM532WGjuAaZzjGdlYopJwEidmIICdz/CyGz4kNYsNNPdzyiQGY5iM
	2+5HXb2CQ0SyVL2bxQkXczrBgS5VVWoSZ7Sjd8MkiOl+
X-Google-Smtp-Source: ABdhPJz4fV/tJW7J+WEfQVJKeH3VTV2qrg6+ONEroaErnJv4PlsF0PrM9PHOJDA6B35tYGsQgmFhz6u6OXdko04c5gA=
X-Received: by 2002:a05:6402:1713:: with SMTP id
	y19mr1356008edu.122.1606666791728; 
	Sun, 29 Nov 2020 08:19:51 -0800 (PST)
MIME-Version: 1.0
References: <CAJCQCtS8jzLJrFnG=+dAyimOHZMHka9zyKEeF5JzOjufv3YPqw@mail.gmail.com>
	<608365664c2a18db4e756f524c0e76da@assyoma.it>
In-Reply-To: <608365664c2a18db4e756f524c0e76da@assyoma.it>
From: Nicholas Geovanis <nickgeovanis@gmail.com>
Date: Sun, 29 Nov 2020 10:19:40 -0600
Message-ID: <CAJmb-Y=7djEwLUHO--ecLi0wenE9TznM4g+201XaOuH=g9tWrQ@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============7767077456608421107=="

--===============7767077456608421107==
Content-Type: multipart/alternative; boundary="00000000000064ba9505b54143ad"

--00000000000064ba9505b54143ad
Content-Type: text/plain; charset="UTF-8"

IIRC at VMWare vSphere 5 and before, swap could not be located on their
type of thin logical volume. Nor could it swap to a linux LVM volume on top
of that.
It just couldnt perform well. That later changed.

On Sun, Nov 29, 2020, 6:53 AM Gionatan Danti <g.danti@assyoma.it> wrote:

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
> --
> Danti Gionatan
> Supporto Tecnico
> Assyoma S.r.l. - www.assyoma.it
> email: g.danti@assyoma.it - info@assyoma.it
> GPG public key ID: FF5F32A8
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>

--00000000000064ba9505b54143ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">IIRC at VMWare vSphere 5 and before, swap could not be lo=
cated on their type of thin logical volume. Nor could it swap to a linux LV=
M volume on top of that.=C2=A0<div dir=3D"auto">It just couldnt perform wel=
l. That later changed.</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, Nov 29, 2020, 6:53 AM Gionatan Danti =
&lt;<a href=3D"mailto:g.danti@assyoma.it">g.danti@assyoma.it</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Il 2020-11-29 01:18 Chris Murphy h=
a scritto:<br>
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
Regards.<br>
<br>
-- <br>
Danti Gionatan<br>
Supporto Tecnico<br>
Assyoma S.r.l. - <a href=3D"http://www.assyoma.it" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">www.assyoma.it</a><br>
email: <a href=3D"mailto:g.danti@assyoma.it" target=3D"_blank" rel=3D"noref=
errer">g.danti@assyoma.it</a> - <a href=3D"mailto:info@assyoma.it" target=
=3D"_blank" rel=3D"noreferrer">info@assyoma.it</a><br>
GPG public key ID: FF5F32A8<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank" rel=3D"noreferrer=
">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/=
linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</=
a><br>
<br>
</blockquote></div>

--00000000000064ba9505b54143ad--

--===============7767077456608421107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============7767077456608421107==--

