Return-Path: <SRS0=t7BR=GO=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C10DFC433DB
	for <linux-lvm@archiver.kernel.org>; Mon, 11 Jan 2021 09:12:36 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16F2722B2C
	for <linux-lvm@archiver.kernel.org>; Mon, 11 Jan 2021 09:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16F2722B2C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-aWc5SwT3P2CdZjYFS876Pg-1; Mon, 11 Jan 2021 04:12:31 -0500
X-MC-Unique: aWc5SwT3P2CdZjYFS876Pg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9ED31005E42;
	Mon, 11 Jan 2021 09:12:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2848519813;
	Mon, 11 Jan 2021 09:12:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2796F1809C9F;
	Mon, 11 Jan 2021 09:12:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10B4wBrp018841 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 10 Jan 2021 23:58:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3A9D344061; Mon, 11 Jan 2021 04:58:11 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33BDE440C4
	for <linux-lvm@redhat.com>; Mon, 11 Jan 2021 04:58:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF70D858EEC
	for <linux-lvm@redhat.com>; Mon, 11 Jan 2021 04:58:08 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
	[209.85.167.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-279-9Idenv1YN0OfGh9dtDKEng-1; Sun, 10 Jan 2021 23:58:04 -0500
X-MC-Unique: 9Idenv1YN0OfGh9dtDKEng-1
Received: by mail-lf1-f53.google.com with SMTP id s26so35901756lfc.8;
	Sun, 10 Jan 2021 20:58:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=c4JOMVqEc4jHrzjUsNQyvr1s+bwuxEtfHWzDA+WHvRU=;
	b=bpbLiEqD3ixJa1gR5dt2wd/TrC53F85E+85bgQK4lNd1a8hu1qwQeyjCWk0dcZc2A4
	C3RuKR9W6MACvAVyi7sqfIAh2pSXLii9Ds6roKVTxwFsRFx11BeOXEoOPix4T/Lo1+39
	yaIr5sOlMz1i3ZrZk1QBscPBsnNnvnDI/SfexG228uyN4FkcCINiEnF0ih+ngJNlGLK1
	bIUF0pXPFRP0Zq9ToLNJSn1Cnv7s6x24dCSmfxRCsGQCqNvzctAFFSFyDStO7DhVrsrR
	jdQPowU/iRREHZNwCPhc9ZLnW9de1FLRMOK7VauaBjWo9BVlFdj5GMdWeYSWu8hJK+Hb
	ehww==
X-Gm-Message-State: AOAM532Fadx10qoxl4LST9/EYtTEIkCvCmAy/jtvGGNXLNeVEPPxGRVa
	y17OpalrSltKgKW1G2firYxSuq8LWEIF/bFYESyeGZP+s1k=
X-Google-Smtp-Source: ABdhPJyyPN4Uj7izLPXJU3/FSKNOnnuBaadFc8tibR7CIvJEMXa/XZxe2ib+j0ZYFesTWjNeDnYa5HyEdc+y7Jd43cw=
X-Received: by 2002:a19:5218:: with SMTP id m24mr100069lfb.232.1610341082406; 
	Sun, 10 Jan 2021 20:58:02 -0800 (PST)
MIME-Version: 1.0
References: <CACOXiSRtQDy5gBKveWdUrA+qV7bm_U20TnKqupWhuCHbMm4sOA@mail.gmail.com>
	<20210105162233.GC26820@redhat.com>
In-Reply-To: <20210105162233.GC26820@redhat.com>
From: Songmin Li <lisongmin9@gmail.com>
Date: Mon, 11 Jan 2021 12:57:52 +0800
Message-ID: <CACOXiSRwpnU9K=BAL_XDeRzGAmYW0H1TJiq8h+duM5shQ6nxrA@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
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
X-Mailman-Approved-At: Mon, 11 Jan 2021 04:12:05 -0500
Cc: linux-lvm@redhat.com
Subject: Re: [linux-lvm] there is a vgextend sagfault with missing pv which
 is resolved on master, can we backport it to 2.02 branch
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============2006495368291588468=="

--===============2006495368291588468==
Content-Type: multipart/alternative; boundary="0000000000002f213605b898c068"

--0000000000002f213605b898c068
Content-Type: text/plain; charset="UTF-8"

Awesome, thanks!

On Wed, Jan 6, 2021, 00:22 David Teigland <teigland@redhat.com> wrote:

> On Fri, Jan 01, 2021 at 05:49:49PM +0800, Songmin Li wrote:
> > Can we backport this commit to 2.02 branch so we can repair lvm on disk
> > fault?
>
> Hi, pushed that here
>
> https://sourceware.org/git/?p=lvm2.git;a=commit;h=b98c3346350b7c270140c1f21fda0436876e16e8
>
> Dave
>
>

--0000000000002f213605b898c068
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Awesome, thanks!=C2=A0</div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 6, 2021, 00:22 David Te=
igland &lt;<a href=3D"mailto:teigland@redhat.com">teigland@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, Jan 01, 2021 at 0=
5:49:49PM +0800, Songmin Li wrote:<br>
&gt; Can we backport this commit to 2.02 branch so we can repair lvm on dis=
k<br>
&gt; fault?<br>
<br>
Hi, pushed that here<br>
<a href=3D"https://sourceware.org/git/?p=3Dlvm2.git;a=3Dcommit;h=3Db98c3346=
350b7c270140c1f21fda0436876e16e8" rel=3D"noreferrer noreferrer" target=3D"_=
blank">https://sourceware.org/git/?p=3Dlvm2.git;a=3Dcommit;h=3Db98c3346350b=
7c270140c1f21fda0436876e16e8</a><br>
<br>
Dave<br>
<br>
</blockquote></div>

--0000000000002f213605b898c068--

--===============2006495368291588468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============2006495368291588468==--

