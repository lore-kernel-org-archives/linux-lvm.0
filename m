Return-Path: <SRS0=gv72=OO=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA29C433EF
	for <linux-lvm@archiver.kernel.org>; Fri, 24 Sep 2021 06:38:36 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3D3160F48
	for <linux-lvm@archiver.kernel.org>; Fri, 24 Sep 2021 06:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3D3160F48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-ghNYozgEPrKPt7ja6eTrTA-1; Fri, 24 Sep 2021 02:38:32 -0400
X-MC-Unique: ghNYozgEPrKPt7ja6eTrTA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63E4F10168C8;
	Fri, 24 Sep 2021 06:38:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C41FA1A7E9;
	Fri, 24 Sep 2021 06:38:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 56B564E58F;
	Fri, 24 Sep 2021 06:37:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18NI3kLo017439 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 23 Sep 2021 14:03:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 46446202A947; Thu, 23 Sep 2021 18:03:46 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 414A6207AD0D
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2021 18:03:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15DA6811E8E
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2021 18:03:33 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
	[209.85.217.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-571-mYa9Jrg8PuG1Gf8joPK0Tw-1; Thu, 23 Sep 2021 14:03:30 -0400
X-MC-Unique: mYa9Jrg8PuG1Gf8joPK0Tw-1
Received: by mail-vs1-f48.google.com with SMTP id x74so7390775vsx.13;
	Thu, 23 Sep 2021 11:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MWuF/+8+83+nMI0d6aoeycS8ihpp61uFjVgMLYpDlLc=;
	b=Q+qoz3Wgmv3wIUu+a5LIMy1MVaoaLwT7ruJNRPx+g3obM/6KkI/grXLqv8QlCkogVW
	V/nLmC2LuYUE1V1bCQ1rW8+ShcR9e+hpV69lgsCCGiw4ix+d+CFrABc9SQo1QG6JFgDc
	j8XIsia+J2L+YGmaa9Tu4P22pqTNxiZjLNMLnlkW1Ejzu5g+xJfmPd1aIp9L0eRoUUQh
	kt9ptuni74fduX8n9FaaymF+7JmrXjwq+kQD2zI6Lfhkb2cms/9GUp3WHw+sTLxD4Paf
	ty4P1yzn2ZROzJokkhiPBie1Fs0QJ6KKq3YM+AmgMj1j/afthUHcU0Bb6uY2nWtfaweq
	wi9w==
X-Gm-Message-State: AOAM5306gjEs6hbESiSaGJZILTjGeDbslrcxWN/HHAQhlXtlEQoL/O4f
	iM7GI45iCOy/Knwdg5zxSEYcg+yz/uawy9lj938rLF0doFY=
X-Google-Smtp-Source: ABdhPJx6yFf5DqCf+v7KRqNAKJkkk3KP6ykiQAaX39r9aA+EeW8vwmKevxU4yX2YzptCOxwP+x5KXiBjSz2TGtxMg8o=
X-Received: by 2002:a67:b304:: with SMTP id a4mr5886094vsm.49.1632420210103;
	Thu, 23 Sep 2021 11:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAFrGbuU63mCLDc47aiY6PuEf4C1B=CL3Dh1=GB+p_rRWkV8S4g@mail.gmail.com>
	<CAFrGbuWKxbB=2Q6QygfN5mLh1MU7ztwXOouiRF2ynP-BcjhfXA@mail.gmail.com>
	<bd2ffcd6-e067-8152-fd2f-6d5036cb2ec6@redhat.com>
In-Reply-To: <bd2ffcd6-e067-8152-fd2f-6d5036cb2ec6@redhat.com>
From: alessandro macuz <alessandro.macuz@gmail.com>
Date: Thu, 23 Sep 2021 20:03:17 +0200
Message-ID: <CAFrGbuUDO-RwHwOKvMjU5ni7_jjS2BpACPMsWFQgKpW5=Fz9mw@mail.gmail.com>
To: Zdenek Kabelac <zkabelac@redhat.com>
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
X-Mailman-Approved-At: Fri, 24 Sep 2021 02:37:52 -0400
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] " Failed to find physical volume <ZFS block device"
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
Content-Type: multipart/mixed; boundary="===============0289918512700762512=="

--===============0289918512700762512==
Content-Type: multipart/alternative; boundary="000000000000bf593205ccad72a1"

--000000000000bf593205ccad72a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Zdenek,

so it might be that metadata is corrupted somehow and hence the pvs program
doesn't recognize that partition as physical volume?
That may explain why lvmdiskscan reports physical disks (by just looking at
the partition type 8e) and pvs completely ignores it.
Am I correct?

Alex


Le jeu. 23 sept. 2021 =C3=A0 15:52, Zdenek Kabelac <zkabelac@redhat.com> a
=C3=A9crit :

> Dne 22. 09. 21 v 18:48 alessandro macuz napsal(a):
> > fdisk correctly identifies the extended partition as 8e.
> > I wonder which kind of data lvmdiskscan and pvs use in order to list LV=
M
> > physical volumes.
> > Does PVS check some specific metadata within the partition without just
> > relying on the type of partition displayed by fdisk?
> >
> >
>
> Hi
>
> Yes - PVs do have header signature keeping information about PV attribute=
s
> and also has the storage area to keep lvm2 metadata.
>
> Partition flags known to fdisk are irrelevant.
>
>
> Regards
>
> Zdenek
>
>

--000000000000bf593205ccad72a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Zdenek,</div><div><br></div><div>so it might b=
e that metadata is corrupted somehow and hence the pvs program doesn&#39;t =
recognize that partition as physical volume?</div><div>That may explain why=
 lvmdiskscan reports physical disks (by just looking at the partition type =
8e) and pvs completely ignores it.</div><div>Am I correct?</div><div><br></=
div><div>Alex<br></div><div><br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 23 sept. 2021 =C3=A0=C2=
=A015:52, Zdenek Kabelac &lt;<a href=3D"mailto:zkabelac@redhat.com">zkabela=
c@redhat.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Dne 22. 09. 21 v 18:48 alessandro macuz napsal(a):=
<br>
&gt; fdisk correctly identifies the extended partition as 8e.<br>
&gt; I wonder which kind of data lvmdiskscan and pvs use in order to list L=
VM <br>
&gt; physical volumes.<br>
&gt; Does PVS check some specific metadata within the partition without jus=
t <br>
&gt; relying on the type of partition displayed by fdisk?<br>
&gt; <br>
&gt;<br>
<br>
Hi<br>
<br>
Yes - PVs do have header signature keeping information about PV attributes<=
br>
and also has the storage area to keep lvm2 metadata.<br>
<br>
Partition flags known to fdisk are irrelevant.<br>
<br>
<br>
Regards<br>
<br>
Zdenek<br>
<br>
</blockquote></div>

--000000000000bf593205ccad72a1--

--===============0289918512700762512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============0289918512700762512==--

