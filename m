Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F62C433EF
	for <linux-lvm@archiver.kernel.org>; Wed, 23 Feb 2022 07:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645600271;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=hJtT4MvYddW3NO53iDCU4+Twj1U8qGjAe9B4tSrlfkU=;
	b=dCgkl34JDfPlBXe9X/cLwqW4/21JfQN/gRFADeO0lKC6uK4jvb8HX0dV21amV5R8RBQ/sA
	6HLciG8Q0qPQ3qz7VF7I4upTZbJEDnZEpMJrgkZb2a5x+u1IWPxsDCOGevvCDxP5UC+pT5
	cCMtHNspRUxH3ZaCR1+fyITrvPZd+iw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-dEz12HM_OA-UfkNkI7Gsuw-1; Wed, 23 Feb 2022 02:11:09 -0500
X-MC-Unique: dEz12HM_OA-UfkNkI7Gsuw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EDD81091DA1;
	Wed, 23 Feb 2022 07:11:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B49BA23091;
	Wed, 23 Feb 2022 07:10:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3AAAA1809C98;
	Wed, 23 Feb 2022 07:10:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21MAma40018569 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 22 Feb 2022 05:48:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C91D52026D4C; Tue, 22 Feb 2022 10:48:36 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C40EC2026D60
	for <linux-lvm@redhat.com>; Tue, 22 Feb 2022 10:48:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 265831C05AE4
	for <linux-lvm@redhat.com>; Tue, 22 Feb 2022 10:48:31 +0000 (UTC)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
	[209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-549-eN4kJ74lOOmExp1maoW_ag-1; Tue, 22 Feb 2022 05:48:29 -0500
X-MC-Unique: eN4kJ74lOOmExp1maoW_ag-1
Received: by mail-lj1-f198.google.com with SMTP id
	x7-20020a2e9c87000000b002463977afe4so3534821lji.21
	for <linux-lvm@redhat.com>; Tue, 22 Feb 2022 02:48:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=E/5qZ3pi+12UlztOoF1+o1GvASleklSm1mcjvFVbmxM=;
	b=ItvRqx86HGqiXquJmIrhdDDrxWn5YQhKhRO017SCGkvPKiTqlzXKidUe5ESHLss+J/
	E5Qz24RtC62WEDwKWfuOufZpdOIsg2hvzUTxnIYQXH1UcHbAb0mrqAC0P78pplK5/bAc
	D3dZ/sybVhMU43+1nu/UXJGWFV0mkxzye5YLyANiPpcAAoRaTLbLJYRbCLPGuMXibrng
	r3cLYr0IIkLT88UehHaF96/vNOxYdSfmlq8fdBy89cnxu1Noykig9ha9dAADPs7+5tLS
	+HRbiiHrEsQEOOWa5aV8igl6MM3KNmWUB92FYzcPiypk7wfj8gYwgYPFDevLPwQ09TZt
	hrXw==
X-Gm-Message-State: AOAM532do3LXcK9oPAevGzRgRoqCfUIpZt8Po1jY2pmW/c8Y6uW50bwk
	3i2q7LiUcbGF8k7STAleSyF+AApJjguOlCLhkgKmiRm4CS9+tyOr9QwKsgrj57GfDjdc78QWdtN
	2vtXnr1SopTt0X+Gxls/BHa0fMUvnCjuP
X-Received: by 2002:a05:6512:481:b0:43d:f703:721e with SMTP id
	v1-20020a056512048100b0043df703721emr17047511lfq.55.1645526907491;
	Tue, 22 Feb 2022 02:48:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjdKdbMNqQQ/nwoXQEk5OnsKlt5PO+zPgkWRWj4MWD3ltMkaaZL1+gOrWuM0V35KQN4nRmiEI/w3cwXgnC/Tk=
X-Received: by 2002:a05:6512:481:b0:43d:f703:721e with SMTP id
	v1-20020a056512048100b0043df703721emr17047501lfq.55.1645526907251;
	Tue, 22 Feb 2022 02:48:27 -0800 (PST)
MIME-Version: 1.0
References: <CAJreVFzLbOzu2Qx=0kecE+y0TU7jdvxKXXRwC3J4EAFYOYJkZA@mail.gmail.com>
	<7034cec6-0b44-b34e-8e91-3f0ec3e50d9c@gmail.com>
In-Reply-To: <7034cec6-0b44-b34e-8e91-3f0ec3e50d9c@gmail.com>
From: Marian Csontos <mcsontos@redhat.com>
Date: Tue, 22 Feb 2022 11:48:16 +0100
Message-ID: <CAJNi=XoHny8m_k9F-eRaJn7cQBtzraOgQycjU9JDdqLe2BcNNg@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Wed, 23 Feb 2022 02:08:12 -0500
Subject: Re: [linux-lvm] Need information
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
Content-Type: multipart/mixed; boundary="===============2655891608868651325=="

--===============2655891608868651325==
Content-Type: multipart/alternative; boundary="000000000000c684a205d899160e"

--000000000000c684a205d899160e
Content-Type: text/plain; charset="UTF-8"

Check `dmsetup udevcookies` output. lvcreate may be waiting for udev
process which timed out - check the syslog. You can forcefully complete a
transaction by `dmsetup udevcomplete <cookie>`

On Tue, Feb 22, 2022 at 11:06 AM Zdenek Kabelac <zdenek.kabelac@gmail.com>
wrote:

> Dne 21. 02. 22 v 12:00 Gk Gk napsal(a):
> > Hi,
> >
> > I work on cloud platforms and linux. I need some guidance with an issue
> > observed with LVM.
> >
> > How to forcefully kill a running lvm command like lvcreate ? I tried
> using
> > kill -9 but it is not killing it. Only a reboot seems to does the trick.
> How
> > to forcefully kill the lvcreate process or for that matter any running
> lvm
> > commands ?
> >
> > Also how to check the progress of an lvm command like lvcreate or
> lvremove ?
>
> Hi
>
> 1. lvm2 should not freeze - it would be some horrible bug.
>
> 2. You can't kill any userspace app which is blocked in an uninterruptible
> kernel function - kill always wait till it gets to signal handler  (i.e.
> you
> are opening&reading suspended device might be one such operation)
>
> 3. You need to tell us more about what you are doing - as without this
> there
> is no way to give meaningful help.
>
>
> Regards
>
> Zdenek
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>

--000000000000c684a205d899160e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Check `dmsetup udevcookies` output. lvcreate may be waitin=
g for udev process which timed out - check the syslog. You can forcefully c=
omplete a transaction by `dmsetup udevcomplete &lt;cookie&gt;`</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 2=
2, 2022 at 11:06 AM Zdenek Kabelac &lt;<a href=3D"mailto:zdenek.kabelac@gma=
il.com">zdenek.kabelac@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Dne 21. 02. 22 v 12:00 Gk Gk napsal(a):<br=
>
&gt; Hi,<br>
&gt; <br>
&gt; I work on cloud platforms and linux. I need some guidance with an issu=
e <br>
&gt; observed with LVM.<br>
&gt; <br>
&gt; How to forcefully kill a running lvm command like lvcreate ? I tried u=
sing <br>
&gt; kill -9 but it is not killing it. Only a reboot seems to does the tric=
k. How <br>
&gt; to forcefully kill the lvcreate process or for that matter any running=
 lvm <br>
&gt; commands ?<br>
&gt; <br>
&gt; Also how to check the progress of an lvm command like lvcreate or lvre=
move ?<br>
<br>
Hi<br>
<br>
1. lvm2 should not freeze - it would be some horrible bug.<br>
<br>
2. You can&#39;t kill any userspace app which is blocked in an uninterrupti=
ble <br>
kernel function - kill always wait till it gets to signal handler=C2=A0 (i.=
e. you <br>
are opening&amp;reading suspended device might be one such operation)<br>
<br>
3. You need to tell us more about what you are doing - as without this ther=
e <br>
is no way to give meaningful help.<br>
<br>
<br>
Regards<br>
<br>
Zdenek<br>
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

--000000000000c684a205d899160e--

--===============2655891608868651325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============2655891608868651325==--

