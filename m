Return-Path: <SRS0=iYY7=ON=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED1BC433EF
	for <linux-lvm@archiver.kernel.org>; Thu, 23 Sep 2021 07:25:22 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05E9B60F70
	for <linux-lvm@archiver.kernel.org>; Thu, 23 Sep 2021 07:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05E9B60F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-BjBDq4CEMdiTunyZ-fJnkw-1; Thu, 23 Sep 2021 03:25:19 -0400
X-MC-Unique: BjBDq4CEMdiTunyZ-fJnkw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BCCC1808310;
	Thu, 23 Sep 2021 07:25:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7B906C8FC;
	Thu, 23 Sep 2021 07:25:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 873FF4EA30;
	Thu, 23 Sep 2021 07:25:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18MGmdoV019666 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 22 Sep 2021 12:48:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F2B9EF884D; Wed, 22 Sep 2021 16:48:38 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED891F807A
	for <linux-lvm@redhat.com>; Wed, 22 Sep 2021 16:48:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5CA31802CE1
	for <linux-lvm@redhat.com>; Wed, 22 Sep 2021 16:48:38 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
	[209.85.217.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-247-w1sTmN5JP5mnQQochEWhfQ-1; Wed, 22 Sep 2021 12:48:36 -0400
X-MC-Unique: w1sTmN5JP5mnQQochEWhfQ-1
Received: by mail-vs1-f52.google.com with SMTP id q66so3665862vsa.4
	for <linux-lvm@redhat.com>; Wed, 22 Sep 2021 09:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=hKEWe7bgPMp0illEEnhWvHUGJVonLXu6WlXhxFokypU=;
	b=4awKAdqxXEC8Cmxsyq8vuKVeXB6GvEeNkSwksF3LtvgFY6wreNDDYQ+ihv6jK/+fi3
	7eIJUarfe4s9ybNAOiMlsm0mevC5YI7QU80n5hox3aBrf/pQmQ9TgD53xxWJbhCtVc9G
	elF2I4prerBDKzq+SvG+8d4sFahPxx79FOCh2ESVVaWusPtAyj/KsxYWP7LIsCDH+lOX
	19XJ95MRq68+lkAs67z0gLsfgT13aT28ZnXIzgl7/ArpXaG1Zx3/iNir5Jeri7H7CXcW
	3PbK+xs6WxTzwY/Os7sYGfR5Y2SS+tvBgQixSV/1fNdx0shjui4sX7SGQWoSmvw9Scfd
	6Myg==
X-Gm-Message-State: AOAM530+ykj/oAXitCIH9uxE6m8+zVVlgUTvp43KRbAjpDDN+S+g84z0
	6coOF+ifyyknYUpNoP/xkBxbuVxoGlDfJWJxWO50HG+cKyPgiw==
X-Google-Smtp-Source: ABdhPJw4It7UVa7ElSaQs1wuBLVYOveEpJ418ELqprao+JJjh2CQ6mru18bEz+MNHuN46v8UclQnIUbV76HJkwf0flQ=
X-Received: by 2002:a67:2f8f:: with SMTP id v137mr250924vsv.13.1632329315979; 
	Wed, 22 Sep 2021 09:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAFrGbuU63mCLDc47aiY6PuEf4C1B=CL3Dh1=GB+p_rRWkV8S4g@mail.gmail.com>
In-Reply-To: <CAFrGbuU63mCLDc47aiY6PuEf4C1B=CL3Dh1=GB+p_rRWkV8S4g@mail.gmail.com>
From: alessandro macuz <alessandro.macuz@gmail.com>
Date: Wed, 22 Sep 2021 18:48:23 +0200
Message-ID: <CAFrGbuWKxbB=2Q6QygfN5mLh1MU7ztwXOouiRF2ynP-BcjhfXA@mail.gmail.com>
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
X-Mailman-Approved-At: Thu, 23 Sep 2021 03:23:38 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============4386411882123414586=="

--===============4386411882123414586==
Content-Type: multipart/alternative; boundary="0000000000000915ae05cc9849d5"

--0000000000000915ae05cc9849d5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fdisk correctly identifies the extended partition as 8e.
I wonder which kind of data lvmdiskscan and pvs use in order to list LVM
physical volumes.
Does PVS check some specific metadata within the partition without just
relying on the type of partition displayed by fdisk?

Alex

Le mer. 22 sept. 2021 =C3=A0 01:36, alessandro macuz <alessandro.macuz@gmai=
l.com>
a =C3=A9crit :

> Hi all,
>
> I sought the web for the error " Failed to find physical volume
> "/dev/zd96p5"." but the closest discussion in the LVM archives I found
> was one of mine back in 2014
>
> https://listman.redhat.com/archives/linux-lvm/2014-June/msg00016.html
>
> This time though it seems pvs fails to find the physical volume when
> lvmdiskscan does recognize it. Do I have to really upgrade lvm2 or is the=
re
> another way to have pvs recognize the volume?
>
> root@server:/etc# lvm version
>   LVM version:     2.02.133(2) (2015-10-30)
>   Library version: 1.02.110 (2015-10-30)
>   Driver version:  4.34.0
> root@ server :/etc# lvmdiskscan -l
>   WARNING: only considering LVM devices
>   /dev/sda5             [      74.05 GiB] LVM physical volume
>   /dev/zd304p3          [      19.00 GiB] LVM physical volume
>   /dev/zd96p5           [    1023.52 GiB] LVM physical volume
> *  /dev/zd112p5          [    1023.52 GiB] LVM physical volume*
>   0 LVM physical volume whole disks
>   4 LVM physical volumes
> root@ server :/etc# pvs -a /dev/zd96p5
>   Failed to find physical volume "/dev/zd96p5".
>
> Thanks, Alex.
>

--0000000000000915ae05cc9849d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>fdisk correctly identifies the extended partition as =
8e.</div><div>I wonder which kind of data lvmdiskscan and pvs use in order =
to list LVM physical volumes.</div><div>Does PVS check some specific metada=
ta within the partition without just relying on the type of partition displ=
ayed by fdisk?</div><div><br></div><div>Alex<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 22 sept=
. 2021 =C3=A0=C2=A001:36, alessandro macuz &lt;<a href=3D"mailto:alessandro=
.macuz@gmail.com">alessandro.macuz@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><=
div><div><span style=3D"font-family:arial,sans-serif">Hi all,</span></div><=
div><span style=3D"font-family:arial,sans-serif"><br></span></div><div><spa=
n style=3D"font-family:arial,sans-serif">I sought the web for the error &qu=
ot; <span style=3D"font-family:monospace">Failed to find physical volume &q=
uot;/dev/zd96p5&quot;.</span>&quot; but the closest discussion in the LVM a=
rchives I found was one of mine back in 2014<br><br><a href=3D"https://list=
man.redhat.com/archives/linux-lvm/2014-June/msg00016.html" target=3D"_blank=
">https://listman.redhat.com/archives/linux-lvm/2014-June/msg00016.html</a>=
<br></span></div><div><br></div><div>This time though it seems pvs fails to=
 find the physical volume when lvmdiskscan does recognize it. Do I have to =
really upgrade lvm2 or is there another way to have pvs recognize the volum=
e?<br></div><div><span style=3D"font-family:arial,sans-serif"></span></div>=
<div><span style=3D"font-family:monospace"><br></span></div><div><span styl=
e=3D"font-family:monospace">root@server:/etc# lvm version<br>=C2=A0 LVM ver=
sion: =C2=A0 =C2=A0 2.02.133(2) (2015-10-30)<br>=C2=A0 Library version: 1.0=
2.110 (2015-10-30)<br>=C2=A0 Driver version: =C2=A04.34.0<br>root@
<span style=3D"font-family:monospace">server</span>

:/etc# lvmdiskscan -l</span></div><div><span style=3D"font-family:monospace=
"></span></div><span style=3D"font-family:monospace">=C2=A0 WARNING: only c=
onsidering LVM devices<br>=C2=A0 /dev/sda5 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 [ =C2=A0 =C2=A0 =C2=A074.05 GiB] LVM physical volume<br>=C2=A0 /=
dev/zd304p3 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ =C2=A0 =C2=A0 =C2=A019.00 G=
iB] LVM physical volume<br>=C2=A0 /dev/zd96p5 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 [ =C2=A0 =C2=A01023.52 GiB] LVM physical volume<br><b>=C2=A0 /dev/zd=
112p5 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ =C2=A0 =C2=A01023.52 GiB] LVM phy=
sical volume</b><br>=C2=A0 0 LVM physical volume whole disks<br>=C2=A0 4 LV=
M physical volumes<br>root@
<span style=3D"font-family:monospace">server</span>

:/etc# pvs -a /dev/zd96p5<br>=C2=A0 Failed to find physical volume &quot;/d=
ev/zd96p5&quot;.</span><br><br></div>Thanks, Alex.<br></div>
</blockquote></div>

--0000000000000915ae05cc9849d5--

--===============4386411882123414586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============4386411882123414586==--

