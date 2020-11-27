Return-Path: <SRS0=nNlY=FE=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128C5C5519F
	for <linux-lvm@archiver.kernel.org>; Mon, 30 Nov 2020 07:03:24 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75922206CA
	for <linux-lvm@archiver.kernel.org>; Mon, 30 Nov 2020 07:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75922206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-i52rbzv5MQSsQfcq_IL1yQ-1; Mon, 30 Nov 2020 02:03:19 -0500
X-MC-Unique: i52rbzv5MQSsQfcq_IL1yQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2D1D9A223;
	Mon, 30 Nov 2020 07:03:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2FAD10013BD;
	Mon, 30 Nov 2020 07:03:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 945A51809CA0;
	Mon, 30 Nov 2020 07:02:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ARGTZpM008156 for <linux-lvm@listman.util.phx.redhat.com>;
	Fri, 27 Nov 2020 11:29:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8A6E52026D5D; Fri, 27 Nov 2020 16:29:35 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 858602026D47
	for <linux-lvm@redhat.com>; Fri, 27 Nov 2020 16:29:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80698186E121
	for <linux-lvm@redhat.com>; Fri, 27 Nov 2020 16:29:32 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
	[209.85.167.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-61-z9BNzd06PxywnpqSFqMmtQ-1; Fri, 27 Nov 2020 11:29:29 -0500
X-MC-Unique: z9BNzd06PxywnpqSFqMmtQ-1
Received: by mail-lf1-f48.google.com with SMTP id s30so7812419lfc.4
	for <linux-lvm@redhat.com>; Fri, 27 Nov 2020 08:29:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=pfH6cB+9YwH+8Kf/tC6p0P+gVFkNW3mnPuIYks13VLs=;
	b=VqCkL6BPFuYtcSJe+J8+4pvhGFc/uivZHDzzX7iyMPjOY4b1KBkiS+y8yOx1ooKEjD
	MbWP67oEQqVWUCqCit8q3ZLoZYFkcVaAb8xw3HtKL1ZDFcOWg+9dBP+23LZCW+nz2WvV
	WERjYJE6Flmq4z9n0b+OTvgnwZJNZJA6ANdmLWYjjO7kHng2yIgh6RDj6uhVN7Wy7Y/D
	tdD/ojLX9zvqyxlOqDaWXVYlP2PQz3Xoga9UQT08mDPnFbQouoV3ojlOW8NJBnYwU/tK
	lRiuZ2gK/jQOVp6lEMUFOmZpuzGeHO5RfbK0rYSwhf0+4uX/x5An8EP9OhjDnJ2fpvww
	CIcg==
X-Gm-Message-State: AOAM531ftjEKCGtnpESVWpGiguFUTigBxbqw8IHLD1dQz3QD12XYNgCJ
	mfH9bxP/un+nV3mOPLXJkEHYjXnOkYvR4ct35TYUApB+dQg=
X-Google-Smtp-Source: ABdhPJykGTx2CVJSncj6Nd6c63YrQHWqhzgSz5dkTFQKZMD+8tZMjwy2/0bn/FGlUNYEBkitp+79OnIEVH7nxwN2OR4=
X-Received: by 2002:a19:c6cf:: with SMTP id w198mr3983470lff.197.1606494567402;
	Fri, 27 Nov 2020 08:29:27 -0800 (PST)
MIME-Version: 1.0
References: <c2a0606a-6e76-816b-e76f-165a1c1aac91@service4.ru>
	<49f2e53b-6f89-d4dd-4bee-290a26a8e208@izyk.ru>
	<20201127162203.ckpi3y2bhoffdwef@chatter.i7.local>
In-Reply-To: <20201127162203.ckpi3y2bhoffdwef@chatter.i7.local>
From: Sreyan Chakravarty <sreyan32@gmail.com>
Date: Fri, 27 Nov 2020 21:59:16 +0530
Message-ID: <CAMaziXtqs5gmcfNQ352XcQQJRzVdLhy7JErhHEb35fTqJq9MnA@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============3020954686023333475=="

--===============3020954686023333475==
Content-Type: multipart/alternative; boundary="00000000000006142305b5192ae9"

--00000000000006142305b5192ae9
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Nov 2020, 9:52 pm Konstantin Ryabitsev, <
konstantin@linuxfoundation.org> wrote:

> On Fri, Nov 27, 2020 at 12:40:40PM +0300, Ilia Zykov wrote:
> > Hello.
> > Please, tell me if there is a way to search the archive of this list?
> > https://www.redhat.com/archives/linux-lvm/index.html
>
> I realized that we don't have it on lore yet, so I imported mailman
> archives and it should now be available here:
> https://lore.kernel.org/linux-lvm/
>
> Regards,
> -K
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/




This mail list is already on mailman. I just checked.

>
>
>

--00000000000006142305b5192ae9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 27 Nov 2020, 9:52 pm Konstantin Ryabitsev, &lt=
;<a href=3D"mailto:konstantin@linuxfoundation.org">konstantin@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, Nov 2=
7, 2020 at 12:40:40PM +0300, Ilia Zykov wrote:<br>
&gt; Hello.<br>
&gt; Please, tell me if there is a way to search the archive of this list?<=
br>
&gt; <a href=3D"https://www.redhat.com/archives/linux-lvm/index.html" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://www.redhat.com/archive=
s/linux-lvm/index.html</a><br>
<br>
I realized that we don&#39;t have it on lore yet, so I imported mailman <br=
>
archives and it should now be available here: <br>
<a href=3D"https://lore.kernel.org/linux-lvm/" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://lore.kernel.org/linux-lvm/</a><br>
<br>
Regards,<br>
-K<br>
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
a></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto"><br></div><div dir=3D"auto">This mail list is alr=
eady on mailman. I just checked.=C2=A0</div><div dir=3D"auto"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
</blockquote></div></div></div>

--00000000000006142305b5192ae9--

--===============3020954686023333475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============3020954686023333475==--

