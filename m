Return-Path: <SRS0=If04=H2=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_IMAGE_ONLY_32,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9427C433DB
	for <linux-lvm@archiver.kernel.org>; Wed, 24 Feb 2021 06:59:37 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AF7A64EC3
	for <linux-lvm@archiver.kernel.org>; Wed, 24 Feb 2021 06:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AF7A64EC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-mpXvLGVTN-O991AQ0J7rxg-1; Wed, 24 Feb 2021 01:59:33 -0500
X-MC-Unique: mpXvLGVTN-O991AQ0J7rxg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 667D018B62A3;
	Wed, 24 Feb 2021 06:59:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EBFE5D9D7;
	Wed, 24 Feb 2021 06:59:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 98CA81809C8F;
	Wed, 24 Feb 2021 06:59:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11NEjdcx020680 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 23 Feb 2021 09:45:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 47D53114B308; Tue, 23 Feb 2021 14:45:39 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 435C9114B307
	for <linux-lvm@redhat.com>; Tue, 23 Feb 2021 14:45:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DE3C967F4F
	for <linux-lvm@redhat.com>; Tue, 23 Feb 2021 14:45:36 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
	[209.85.218.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-440-dsijvLmrPpeOKb0YwOmOtg-1; Tue, 23 Feb 2021 09:45:28 -0500
X-MC-Unique: dsijvLmrPpeOKb0YwOmOtg-1
Received: by mail-ej1-f45.google.com with SMTP id jt13so35016833ejb.0
	for <linux-lvm@redhat.com>; Tue, 23 Feb 2021 06:45:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=/jatgicdc5d5tN/FzMz3JzDNIOHsdQ9ZyNqb8rCbXto=;
	b=mssndblEjYB5d9LgtBaHb9a7SIA7K0hoKOqXbNIHFGYyGWEDGlhhtmPZ6WsHAEw9c0
	VKkxE85M0itvX59qH0mns7ZxiJtUlt54G1YY/bQrLjlyKIlxBaUuY3j8Jc0q9TystgfY
	sM4/yw99Sa1mWq1WQjFerQkAEBaN6GAYoQB33O4jzyQ7QsxWjf0/VQ3cKA6rLmUJ0tA2
	tjy+BkpJ5EoNDNoZBt/3qpXFaq2mmam96lA6ewnwzl8Hn1+16zALFzRuJkG9xcccLtpv
	+DzQFHHGc/gasl8p3h9+Of4oOqNWf1g38OhunJzB3pbKFtN3SGhGJZsQQFzZWA5Hp5qx
	4cBg==
X-Gm-Message-State: AOAM530e0Ec/42kCh6UxlfNus4cztHSl9gEPxWywBR3Hzw2F85+cO5FE
	Izkc5yDjmxxMzG0qzepJlQbVEBvVUDolR6ZG9dgGkgP3
X-Google-Smtp-Source: ABdhPJy28ZueyaWTAT6b7CLAMOSjz7q9bK81rfJ36UGvqHHSUX+xn4O5u3quRw4GZCse5urgaOJOAvrhhcmlWtYwLhA=
X-Received: by 2002:a17:906:5043:: with SMTP id
	e3mr26360223ejk.260.1614091526747; 
	Tue, 23 Feb 2021 06:45:26 -0800 (PST)
MIME-Version: 1.0
References: <klfw5jeh.707d078c-fbbf-4456-9f24-61435f1f79d3@we.are.superhuman.com>
In-Reply-To: <klfw5jeh.707d078c-fbbf-4456-9f24-61435f1f79d3@we.are.superhuman.com>
From: Nicholas Geovanis <nickgeovanis@gmail.com>
Date: Tue, 23 Feb 2021 08:45:14 -0600
Message-ID: <CAJmb-YmrGRs95a=5TRxMCWH8GfHgKUmU3FAzpO5m5eQU=XHA3g@mail.gmail.com>
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
X-Mailman-Approved-At: Wed, 24 Feb 2021 01:58:59 -0500
Subject: Re: [linux-lvm] Removing bash as a dependency
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
Content-Type: multipart/mixed; boundary="===============1546363031091499024=="

--===============1546363031091499024==
Content-Type: multipart/alternative; boundary="00000000000016391005bc01f817"

--00000000000016391005bc01f817
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 22, 2021, 2:52 AM Drew Westrick <drewwestrick@glassboard.com>
wrote:

> All,
>
> I'm working on a project with a fairly strict no GPLv3 policy. While lvm2
> is fine since it is GPLv2, the lvm2 dependency on bash, which is GPLv3, is
> causing a problem. It appears that bash is used mostly for test scripts as
> well as lvmdump.sh and fsadm.sh. If we don't need to use those two
> utilities, would there be any other major issues with removing bash a a
> dependency if I were to go down that path?
>

Drew when you say "without bash as a dependency", do you mean....
A) Getting lvm3 installed without the presence of the prereq bash package?
... or do you mean...
B) Removing the bash package and the shell executable after lvm3 is up and
running?

Thanks.... Nick Geovanis

Regards,
>
> Drew Westrick
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--00000000000016391005bc01f817
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Mon, Feb 22, 2021, 2:52 AM Drew Westrick &lt;<a href=3D"mai=
lto:drewwestrick@glassboard.com">drewwestrick@glassboard.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div><div><div><div><div><div>All,=
<br></div><div><br></div><div>I&#39;m working on a project with a fairly st=
rict no GPLv3 policy. While lvm2 is fine since it is GPLv2, the lvm2 depend=
ency on bash,=C2=A0which is GPLv3, is causing a problem. It appears that ba=
sh is used mostly for test scripts as well as <a href=3D"http://lvmdump.sh/=
" target=3D"_blank" rel=3D"noreferrer">lvmdump.sh</a> and=C2=A0<a href=3D"h=
ttp://fsadm.sh/" target=3D"_blank" rel=3D"noreferrer">fsadm.sh</a>. If we d=
on&#39;t need to use those two utilities, would there be any other major is=
sues with removing bash a a dependency if I were to go down that path?</div=
></div></div></div></div></div></blockquote></div></div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Drew when you say &quot;without bash as a depend=
ency&quot;, do you mean....</div><div dir=3D"auto">A) Getting lvm3 installe=
d without the presence of the prereq bash package?</div><div dir=3D"auto">.=
.. or do you mean...</div><div dir=3D"auto">B) Removing the bash package an=
d the shell executable after lvm3 is up and running?</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Thanks.... Nick Geovanis=C2=A0</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div><div><div><div><div><div>Regards,<br></div></div>=
<br><div><div><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"=
ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><div dir=
=3D"ltr"><div><div>Drew Westrick<br></div></div></div></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div></div><div><br></d=
iv></div><div><div style=3D"display:none;border:0px;width:0px;height:0px;ov=
erflow:hidden"><img src=3D"https://r.superhuman.com/12nGChCjLNFqw-h9nr8QpGf=
4L_rwdZ7k4aZDRtF-sBmjJe8mEtCYJ1sN3yia2UDzSoXHXmBecHBEdttshe8BgH-tq61dCp_BTj=
IyBq1YcfVdDlXhSNOPgSv3CYyrknn7GjMNQTEPPEGQeLsTHYI19mQYAGNW37BaUfJG84YbgprOj=
vj628RjNQ.gif" alt=3D" " width=3D"1" height=3D"0" style=3D"display:none;bor=
der:0px;width:0px;height:0px;overflow:hidden"></div></div></div></div>_____=
__________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank" rel=3D"noreferrer=
">linux-lvm@redhat.com</a><br>
<a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm" rel=3D"no=
referrer noreferrer" target=3D"_blank">https://listman.redhat.com/mailman/l=
istinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</=
a></blockquote></div></div></div>

--00000000000016391005bc01f817--

--===============1546363031091499024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============1546363031091499024==--

