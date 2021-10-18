Return-Path: <SRS0=tbfx=PG=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA676C433EF
	for <linux-lvm@archiver.kernel.org>; Mon, 18 Oct 2021 19:10:08 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3223861353
	for <linux-lvm@archiver.kernel.org>; Mon, 18 Oct 2021 19:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3223861353
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-fvtcAknMMGGtn-1YZDEtow-1; Mon, 18 Oct 2021 15:10:05 -0400
X-MC-Unique: fvtcAknMMGGtn-1YZDEtow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E6E710A8E00;
	Mon, 18 Oct 2021 19:09:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DD206FEED;
	Mon, 18 Oct 2021 19:09:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 105291806D03;
	Mon, 18 Oct 2021 19:09:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IEnxdd027310 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 10:49:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3855840CFD12; Mon, 18 Oct 2021 14:49:59 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 330E440CFD11
	for <linux-lvm@redhat.com>; Mon, 18 Oct 2021 14:49:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19BD318A01AB
	for <linux-lvm@redhat.com>; Mon, 18 Oct 2021 14:49:59 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
	[209.85.219.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-263-qB4Na2LHMd2-dUXT5J3pOg-1; Mon, 18 Oct 2021 10:49:56 -0400
X-MC-Unique: qB4Na2LHMd2-dUXT5J3pOg-1
Received: by mail-qv1-f49.google.com with SMTP id k29so10375445qve.6
	for <linux-lvm@redhat.com>; Mon, 18 Oct 2021 07:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=ij/i6iSDi/xdRfEXOUECaW85MLK9mS9b81EUEoHL+uk=;
	b=hqXySu3WRwTEPRcCyDpa/iRbLrDB5xej5ONZwVYwyP3F65Hmm2nOLd5vp6YpBU0ZjZ
	ExYIXokGxmKF2A8l7+Oy3zmqoCwRn252TexlrXuucy756gqh4xbXTJ3Ux0IYNtnqnVNG
	BxXQqmfIQLv7UqyOQ7iZFtbatigHyXLH2re7xToD5fTVURGGb31/tcI12SMGfAgzjn8n
	Ten892VuM/Xa0nO0vHXXntH5eeHrqX6y6yB6kO9R5DGkKa1B2xcFbleKlKKmvbPQ6VEC
	nMKLXP6kd5/c92cfxmlen2h6/oMG4zXZ9Y09ZTYBGGALTZy7vH/IkWdPpQ2X2ojLutBp
	/ADw==
X-Gm-Message-State: AOAM533SlDd/K4sqjPctz/d+HyhEW6sbYO6deF/F/9p/7AcIFX7WY9In
	d/2sWKAZJ246UaNN8BDBFVn47PeMkeuT0St0pHA7qpar
X-Google-Smtp-Source: ABdhPJyqFntbew3GcamFE/zVfJMiridQRX92l09fjbmkYTNtNcbuYaXwtSwIINlgflw5aCfu6+sGXJjyC08XKs+bck4=
X-Received: by 2002:ad4:4bb1:: with SMTP id i17mr25475364qvw.31.1634568596112; 
	Mon, 18 Oct 2021 07:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211018021719.GA16936@bdmcc-us.com>
In-Reply-To: <20211018021719.GA16936@bdmcc-us.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Mon, 18 Oct 2021 09:49:44 -0500
Message-ID: <CAAMCDedrphwa+RRr1PHLD0SXi8fEDM87zV82302T=twRa5qBZA@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Mon, 18 Oct 2021 15:09:44 -0400
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
Content-Type: multipart/mixed; boundary="===============2445957220903999693=="

--===============2445957220903999693==
Content-Type: multipart/alternative; boundary="00000000000088497705cea1a83a"

--00000000000088497705cea1a83a
Content-Type: text/plain; charset="UTF-8"

You will need a lvm backup file for the pvcreate --uuid I believe (there
may be some option to get around needing the backup file).

That will put the header back on if you either have an lvm backup and/or
archive file, you might also need a vgcfgrestore afterwards depending on if
anything else is missing.

I have never done it, but it looks possible to make a lvm backup file by
reading it directly off the disk with dd, so that you will have a file that
pvcreate is ok with, that is if there is no way to force it without a
backup file.

But, this should get the pv back showing up with whatever sectors that you
successfully recovered.

On Sun, Oct 17, 2021 at 10:02 PM Brian McCullough <bdmc@bdmcc-us.com> wrote:

>
> Folks,
>
> I have had a disk go bad on me, causing me to lose one PV.
>
>
> I seem to have retrieved the partition using ddrescue, but it also seems
> to be missing some label information, because pvscan doesn't see it.
>
> Using hexdump, I see the string " LVM2 " at 0x1004, but nothing before
> that.  The whole phrase is:
>
> 0x01000  16 d6 8e db 20 4c 56 4d  32 20 78 5b 35 41 25 72
>
>
> I find what appears to be an LVM2 configuration section at 0x1200, and
> so I was able to read the UUID that this PV should have.
>
>
> On another machine, I dumped a PV partition, and find "LABLEONE" at
> 0x200, with the same " LVM2 " at 0x01000.
>
> I was concerned that my dump was offset, but the comparison to the
> "good" one suggests that that isn't the problem, but just the missing
> "LABLEONE" and related information at 0x0200.
>
> If I do a "pvcreate --uuid xxxx" would this fix that recovered partition
> so that pvscan and friends can work properly, and I can finally boot
> that machine?
>
>
> Thank you,
> Brian
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>

--00000000000088497705cea1a83a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You will need a lvm backup file for the pvcreate --uu=
id I believe (there may be some option to get around needing the backup fil=
e).</div><div><br></div><div>That will put the header back on if you either=
 have an lvm backup and/or archive file, you might also need a vgcfgrestore=
 afterwards depending on if anything else is missing.</div><div><br></div><=
div>I have never done it, but it looks possible to make a lvm backup file b=
y reading it directly off the disk with dd, so that you will have a file th=
at pvcreate is ok with, that is if there is no way to force it without a ba=
ckup file.</div><div><br></div><div>But, this should get the pv back showin=
g up with whatever sectors that you successfully recovered.<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun=
, Oct 17, 2021 at 10:02 PM Brian McCullough &lt;<a href=3D"mailto:bdmc@bdmc=
c-us.com">bdmc@bdmcc-us.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><br>
Folks,<br>
<br>
I have had a disk go bad on me, causing me to lose one PV.<br>
<br>
<br>
I seem to have retrieved the partition using ddrescue, but it also seems<br=
>
to be missing some label information, because pvscan doesn&#39;t see it.<br=
>
<br>
Using hexdump, I see the string &quot; LVM2 &quot; at 0x1004, but nothing b=
efore<br>
that.=C2=A0 The whole phrase is: <br>
<br>
0x01000=C2=A0 16 d6 8e db 20 4c 56 4d=C2=A0 32 20 78 5b 35 41 25 72<br>
<br>
<br>
I find what appears to be an LVM2 configuration section at 0x1200, and<br>
so I was able to read the UUID that this PV should have.<br>
<br>
<br>
On another machine, I dumped a PV partition, and find &quot;LABLEONE&quot; =
at<br>
0x200, with the same &quot; LVM2 &quot; at 0x01000.<br>
<br>
I was concerned that my dump was offset, but the comparison to the<br>
&quot;good&quot; one suggests that that isn&#39;t the problem, but just the=
 missing<br>
&quot;LABLEONE&quot; and related information at 0x0200.<br>
<br>
If I do a &quot;pvcreate --uuid xxxx&quot; would this fix that recovered pa=
rtition<br>
so that pvscan and friends can work properly, and I can finally boot<br>
that machine?<br>
<br>
<br>
Thank you,<br>
Brian<br>
<br>
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

--00000000000088497705cea1a83a--

--===============2445957220903999693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============2445957220903999693==--

