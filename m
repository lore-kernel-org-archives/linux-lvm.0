Return-Path: <SRS0=nNlY=FE=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E6BC5519F
	for <linux-lvm@archiver.kernel.org>; Mon, 30 Nov 2020 07:04:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B06F3206CA
	for <linux-lvm@archiver.kernel.org>; Mon, 30 Nov 2020 07:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B06F3206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-hACRSlJqPWeEy4REYh8rXw-1; Mon, 30 Nov 2020 02:03:58 -0500
X-MC-Unique: hACRSlJqPWeEy4REYh8rXw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47A7018C8C04;
	Mon, 30 Nov 2020 07:03:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2217D60C64;
	Mon, 30 Nov 2020 07:03:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B3505002C;
	Mon, 30 Nov 2020 07:03:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ARA9Ipj032335 for <linux-lvm@listman.util.phx.redhat.com>;
	Fri, 27 Nov 2020 05:09:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5C0A610F26EE; Fri, 27 Nov 2020 10:09:18 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55F9D10F26ED
	for <linux-lvm@redhat.com>; Fri, 27 Nov 2020 10:09:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F0DC811E84
	for <linux-lvm@redhat.com>; Fri, 27 Nov 2020 10:09:16 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
	[209.85.167.43]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-411-aBkNDEWaPLmmml-iQ7SklQ-1; Fri, 27 Nov 2020 05:09:12 -0500
X-MC-Unique: aBkNDEWaPLmmml-iQ7SklQ-1
Received: by mail-lf1-f43.google.com with SMTP id d20so6241389lfe.11
	for <linux-lvm@redhat.com>; Fri, 27 Nov 2020 02:09:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=gaWWEfv+ZHqqY9ig+qoOJNMDB7Eskw08rLzBto/Ur6s=;
	b=gKfTQoqdMfo38WGfvVZW9OhT/dTwzujypuds/xlsniLLWv1XSn9baomEnp8z94vikS
	joQcmcJ2Ig6rvUDOv/bAQewrzvB+/OhNR7/GV/m1QNmlWpH1nUw9DR/lxj9OEAPlJhI/
	TrsHQfWqN7H1/w83D7SPOe67SjBMXoZ9/KkQw4jkzQZUDv58UbegksIdjGTf8wnkGL7t
	KaP+oGBVuSjLnkr/+7BdFm91WJbV4+iFXojbP1oyLc2W9re12C9vHc/sbFOMwlpAPhV7
	HlpU5zXPy7uyVDI5fMnNmLITVflOqmKls8uJunTbVKyHp+QVRip9s96LcUVKrCDs0cHW
	BCdA==
X-Gm-Message-State: AOAM532w5N1yY9kOHEoxX5geA//ZRcv++pXuPG9cboCYRuf6tF9nJzL0
	whezEKV6AB+eB2iBzJPZ6sDFyK13jN1PRKTL84vXfV1+Fog=
X-Google-Smtp-Source: ABdhPJw0rT3ppW4/0WD6xiFLnElXCiDODY5NVOWZSEFG3gQp9sBApfURq209rXCjXT3Uh8+WRXUW1R9fUN6j2LO512M=
X-Received: by 2002:ac2:5632:: with SMTP id b18mr3252878lff.253.1606471750666; 
	Fri, 27 Nov 2020 02:09:10 -0800 (PST)
MIME-Version: 1.0
References: <c2a0606a-6e76-816b-e76f-165a1c1aac91@service4.ru>
	<49f2e53b-6f89-d4dd-4bee-290a26a8e208@izyk.ru>
In-Reply-To: <49f2e53b-6f89-d4dd-4bee-290a26a8e208@izyk.ru>
From: Sreyan Chakravarty <sreyan32@gmail.com>
Date: Fri, 27 Nov 2020 10:08:59 +0000
Message-ID: <CAMaziXtw_EaXKEBZrjVtYt1EsEsybQGMYfu0CC=045KaXea8qA@mail.gmail.com>
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
X-Mailman-Approved-At: Mon, 30 Nov 2020 02:02:55 -0500
Subject: Re: [linux-lvm] Search in the list
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============8579373218111128026=="

--===============8579373218111128026==
Content-Type: multipart/alternative; boundary="0000000000000a4d2305b513da19"

--0000000000000a4d2305b513da19
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 27, 2020 at 9:48 AM Ilia Zykov <mail@izyk.ru> wrote:

> Hello.
> Please, tell me if there is a way to search the archive of this list?
> https://www.redhat.com/archives/linux-lvm/index.html
> Thanks.
>

I don't think there is any way.


-- 
Regards,
Sreyan Chakravarty

--0000000000000a4d2305b513da19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 27, 2020 at 9:48 AM Ilia =
Zykov &lt;<a href=3D"mailto:mail@izyk.ru">mail@izyk.ru</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Hello.<br>
Please, tell me if there is a way to search the archive of this list?<br>
<a href=3D"https://www.redhat.com/archives/linux-lvm/index.html" rel=3D"nor=
eferrer" target=3D"_blank">https://www.redhat.com/archives/linux-lvm/index.=
html</a><br>
Thanks.<br></blockquote><div><br></div><div>I don&#39;t think there is any =
way. <br></div></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D=
"gmail_signature"><div dir=3D"ltr">Regards,<div>Sreyan Chakravarty</div></d=
iv></div></div>

--0000000000000a4d2305b513da19--

--===============8579373218111128026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============8579373218111128026==--

