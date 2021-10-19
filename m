Return-Path: <SRS0=MfZM=PI=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE970C433F5
	for <linux-lvm@archiver.kernel.org>; Wed, 20 Oct 2021 06:53:27 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADEB8610E6
	for <linux-lvm@archiver.kernel.org>; Wed, 20 Oct 2021 06:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADEB8610E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-waniJF8PMvSIQjHEfN7DSg-1; Wed, 20 Oct 2021 02:53:23 -0400
X-MC-Unique: waniJF8PMvSIQjHEfN7DSg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B42A1800D41;
	Wed, 20 Oct 2021 06:53:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0981F78B20;
	Wed, 20 Oct 2021 06:53:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 43E4F4A703;
	Wed, 20 Oct 2021 06:52:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19JA709C003049 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 19 Oct 2021 06:07:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C095A100BCA6; Tue, 19 Oct 2021 10:07:00 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC1AB100B182
	for <linux-lvm@redhat.com>; Tue, 19 Oct 2021 10:06:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D654802A5E
	for <linux-lvm@redhat.com>; Tue, 19 Oct 2021 10:06:55 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
	[209.85.219.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-539-z3_-YCNfPR-GMxp8eaXoeg-1; Tue, 19 Oct 2021 06:06:53 -0400
X-MC-Unique: z3_-YCNfPR-GMxp8eaXoeg-1
Received: by mail-qv1-f49.google.com with SMTP id e13so6543166qvf.5
	for <linux-lvm@redhat.com>; Tue, 19 Oct 2021 03:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=JWpGdLvXV/gHCEfHZDtoV51/9NUgbrO/XWjuQLFTutw=;
	b=ncRm2ydCwc4NsY47n5egh9cdCE0uDiO3+uaxmje3VI/pjnxJOdsciP2LcP0GLf3c8L
	zbZ2YB2FWs/1iN1e097+3jRHreMQ7u/1JW1rsX098+/e4wMPQVTzjteGr5VrC+AliKep
	V5ta9GNP3pt0rdGjixHdY0Cogn04zKo0bCRi6z4dajTqmTiHb7yt2dAtMeHvrxmA6vcT
	nBnscuvMC0ySYCU51wuihxDFDB3UfGbTQl9OtEnU4+IupQpV0ytt+LZx9YgtcLPSBqSb
	VMNkxre+r7MMEPbszp46nGEYjWKH9gn1kAs+Z1PBQYS7SJaYV2qoluS38kvp0xDn2HBk
	T2uw==
X-Gm-Message-State: AOAM533yLqH+j1lc+DGJsDoHJAK//Dgs22pIOM2QGxURk59ac3fMP+7s
	r/UPe1Qt6VZTv4VZ02wtYpIgWIvXKejC2VB/kEQstu+q
X-Google-Smtp-Source: ABdhPJyJo8uOa6VxME8ukpsTRSM6fRkxvgp/8KRcQO9IAOAbSeoNe6Wc5ba+7JQKU8eFPDGb9i/y2VV8H3OgsKsOKlg=
X-Received: by 2002:a05:6214:448:: with SMTP id
	cc8mr30079278qvb.28.1634638012346; 
	Tue, 19 Oct 2021 03:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211018021719.GA16936@bdmcc-us.com>
	<CAAMCDedrphwa+RRr1PHLD0SXi8fEDM87zV82302T=twRa5qBZA@mail.gmail.com>
	<20211018194508.GC28815@bdmcc-us.com>
In-Reply-To: <20211018194508.GC28815@bdmcc-us.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Tue, 19 Oct 2021 05:06:37 -0500
Message-ID: <CAAMCDeeTwESRvs5jPNuTXn-q7Fse1xqAc+yd-0swjc7NrAyqAw@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Wed, 20 Oct 2021 02:52:50 -0400
Subject: Re: [linux-lvm] Recovering "broken" disk ( 17th )
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
Content-Type: multipart/mixed; boundary="===============0812709723002316344=="

--===============0812709723002316344==
Content-Type: multipart/alternative; boundary="0000000000000ff44a05ceb1d245"

--0000000000000ff44a05ceb1d245
Content-Type: text/plain; charset="UTF-8"

I would edit the vgconfig you dd'ed with an editor and make sure it looks
reasonable for what you think you had.

When you do the pvcreate --uuid it won't use anything except the uuid info
so the rest may not need to be exactly right, if you have to do a
vgcfgrestore to get it to read the rest of the info will be used.

I have seen some weird disk controller failures that appeared to zero out
the first bit of the disk (enough to get the partition table, grub, and the
pv header depending on where the first partition starts).

You will need to reinstall grub if this was the bootable disk, since there
were 384 bytes of grub in the sector with the partition table that you know
are missing.

On Tue, Oct 19, 2021 at 1:04 AM Brian McCullough <bdmc@buadh-brath.com>
wrote:

> On Mon, Oct 18, 2021 at 09:49:44AM -0500, Roger Heflin wrote:
> > You will need a lvm backup file for the pvcreate --uuid I believe (there
> > may be some option to get around needing the backup file).
> >
> > That will put the header back on if you either have an lvm backup and/or
> > archive file, you might also need a vgcfgrestore afterwards depending on
> if
> > anything else is missing.
> >
> > I have never done it, but it looks possible to make a lvm backup file by
> > reading it directly off the disk with dd, so that you will have a file
> that
> > pvcreate is ok with, that is if there is no way to force it without a
> > backup file.
> >
> > But, this should get the pv back showing up with whatever sectors that
> you
> > successfully recovered.
>
> Thank you, Roger.
>
> I might be able to do that on the original machine, which won't boot at
> the moment because of this failure, but I have been using a working
> machine so far to use ddrestore etc.
>
> Yes, as you said, I was able to use dd to copy off the vgconfig data
> into a file.  So you think that I might be able to use that as the
> reference in pvcreate?  That makes some sense.
>
> I started this out asking ( but not clearly ) whether the data on the
> disk appeared to be in the correct place and whether what was there was
> correct, but I think that I answered that for myself with the
> comparison to the working PV partition.
>
>
> Thanks again,
> Brian
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>

--0000000000000ff44a05ceb1d245
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I would edit the vgconfig you dd&#39;ed with an edito=
r and make sure it looks reasonable for what you think you had.</div><div><=
br></div><div>When you do the pvcreate --uuid it won&#39;t use anything exc=
ept the uuid info so the rest may not need to be exactly right, if you have=
 to do a vgcfgrestore to get it to read the rest of the info will be used.<=
/div><div><br></div><div>I have seen some weird disk controller failures th=
at appeared to zero out the first bit of the disk (enough to get the partit=
ion table, grub, and the pv header depending on where the first partition s=
tarts).</div><div><br></div><div>You will need to reinstall grub if this wa=
s the bootable disk, since there were 384 bytes of grub in the sector with =
the partition table that you know are missing.<br></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 19, 202=
1 at 1:04 AM Brian McCullough &lt;<a href=3D"mailto:bdmc@buadh-brath.com">b=
dmc@buadh-brath.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Mon, Oct 18, 2021 at 09:49:44AM -0500, Roger Heflin w=
rote:<br>
&gt; You will need a lvm backup file for the pvcreate --uuid I believe (the=
re<br>
&gt; may be some option to get around needing the backup file).<br>
&gt; <br>
&gt; That will put the header back on if you either have an lvm backup and/=
or<br>
&gt; archive file, you might also need a vgcfgrestore afterwards depending =
on if<br>
&gt; anything else is missing.<br>
&gt; <br>
&gt; I have never done it, but it looks possible to make a lvm backup file =
by<br>
&gt; reading it directly off the disk with dd, so that you will have a file=
 that<br>
&gt; pvcreate is ok with, that is if there is no way to force it without a<=
br>
&gt; backup file.<br>
&gt; <br>
&gt; But, this should get the pv back showing up with whatever sectors that=
 you<br>
&gt; successfully recovered.<br>
<br>
Thank you, Roger.<br>
<br>
I might be able to do that on the original machine, which won&#39;t boot at=
<br>
the moment because of this failure, but I have been using a working<br>
machine so far to use ddrestore etc.<br>
<br>
Yes, as you said, I was able to use dd to copy off the vgconfig data<br>
into a file.=C2=A0 So you think that I might be able to use that as the<br>
reference in pvcreate?=C2=A0 That makes some sense.<br>
<br>
I started this out asking ( but not clearly ) whether the data on the<br>
disk appeared to be in the correct place and whether what was there was<br>
correct, but I think that I answered that for myself with the<br>
comparison to the working PV partition.<br>
<br>
<br>
Thanks again,<br>
Brian<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm" rel=3D"no=
referrer" target=3D"_blank">https://listman.redhat.com/mailman/listinfo/lin=
ux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
<br>
</blockquote></div>

--0000000000000ff44a05ceb1d245--

--===============0812709723002316344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============0812709723002316344==--

