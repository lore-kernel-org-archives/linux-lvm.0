Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E11C74A5B
	for <linux-lvm@archiver.kernel.org>; Tue, 21 Mar 2023 07:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679385281;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=FTSWp0nporA0/ndztIWwkoHr3CIRVt8gRvz0lv7dfeI=;
	b=TKOjqMwon4AhQhOI19mKDWLUXMWYMGRahYOTxuqRuGeIWVdDj2EjLUoljt9Jk8SPJbbX3K
	RHWKvXoEId5Pbuk8wPGi2IqP6Q2lEhwhoFNDZiTcMkaG1sFYrmCv6poNDOsd2o20fRiIwb
	kEa/1UwhsktyLStmCBvWmW0ge2XMBbg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-JAtppsegPPSkVVHz2qCkqg-1; Tue, 21 Mar 2023 03:54:38 -0400
X-MC-Unique: JAtppsegPPSkVVHz2qCkqg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 872141C0512E;
	Tue, 21 Mar 2023 07:54:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2FF1CC15BA0;
	Tue, 21 Mar 2023 07:54:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F122419465B8;
	Tue, 21 Mar 2023 07:54:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C24511946594
 for <linux-lvm@listman.corp.redhat.com>; Mon, 20 Mar 2023 14:15:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 96B96C15BAD; Mon, 20 Mar 2023 14:15:59 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F944C15BA0
 for <linux-lvm@redhat.com>; Mon, 20 Mar 2023 14:15:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7441F2A59570
 for <linux-lvm@redhat.com>; Mon, 20 Mar 2023 14:15:59 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-QMyxSRqEOquZzDjocMA-Aw-1; Mon, 20 Mar 2023 10:15:57 -0400
X-MC-Unique: QMyxSRqEOquZzDjocMA-Aw-1
Received: by mail-ed1-f53.google.com with SMTP id o12so47312898edb.9
 for <linux-lvm@redhat.com>; Mon, 20 Mar 2023 07:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679321756;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pO2Vv5nD4hjhqnBPh3stJ/HVxC4w2UX33sVoiEnVjZM=;
 b=KGp09jjm3+J9HBZR3IPJESm8TMyo+qdkpsPKEMcZy0jEbppPfALh9FdH/2PrdslAjI
 1wAVR3IUGKKcKB8fcm+C9KgRZHLA8Pdj45ZxEG6PeZ86GUOhGOafQ35dfSyUjPPCM6w3
 kCxWUdJs18UcFMSn6i8pLEb1+cbVF1k5QagQwaP9AGMrAilxmnT8jxKhKwGsGmgSlfiE
 aknIyxKU9JhPSm0BOX/RBvUJfp/hm85kpqWrYLkqjuWYIpRnhFeGOT7Y6XTb7wktR3Lt
 hcPs2G5Hq4xmdMtfZvIspa8JCZYJ9TWj8bdjsvcniHAxBWgd2c+oWH5H0iCzhK5BooaZ
 K6ZQ==
X-Gm-Message-State: AO0yUKUvy/JxAmBQq8sdky7NUnjrnGg55PtPjwU8Y3NUzLZnrp5SQJWe
 E8E1jmbCYhgA9kktfOlen80/rf/GCKDV4AkJ1+Q4QW/Jqa5qIQf9
X-Google-Smtp-Source: AK7set+qhE+8MlP2Thev7q5+9vtAF+dy/hLzDTjNW0xQgdSgfce6f44wSETrSRVHgwYrwHwbU9j3HcwU99mp7e4McDA=
X-Received: by 2002:a50:baab:0:b0:4fa:5b7d:ebb4 with SMTP id
 x40-20020a50baab000000b004fa5b7debb4mr6522407ede.7.1679321755999; Mon, 20 Mar
 2023 07:15:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAGhAaddYD7Y8ObY6Q3Yprhruzb8s6-q0t+GJUv5oYGLR3LCpRg@mail.gmail.com>
 <5b9e31d6-2675-8903-619c-cf33c48f1ba8@gmail.com>
In-Reply-To: <5b9e31d6-2675-8903-619c-cf33c48f1ba8@gmail.com>
From: lacsaP Patatetom <patatetom@gmail.com>
Date: Mon, 20 Mar 2023 15:15:28 +0100
Message-ID: <CAGhAade3Uzobn5amNYVB489NJ-OOj2MFW591eHVaK3ZoEKr15Q@mail.gmail.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Tue, 21 Mar 2023 07:54:18 +0000
Subject: Re: [linux-lvm] LVM and RO device/partition(s)
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-lvm/>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=subscribe>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============6279835046201821301=="

--===============6279835046201821301==
Content-Type: multipart/alternative; boundary="000000000000bae0ea05f7559074"

--000000000000bae0ea05f7559074
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

thank you for this first feedback.

I am writing a memo on github and will communicate the url soon.

my question is in the context of digital investigation which does not admit
the alteration of the medium.
of course, there are combinations (/etc/lvm.conf + snap@nbd for example)
which allow in fine not to alter the media but I don't understand why a
media set in read-only mode - eg. chmod 444 + blockdev --setro set before
LVM process - is not protected against LVM modifications...

regards, lacsaP.

Le lun. 20 mars 2023 =C3=A0 15:00, Zdenek Kabelac <zdenek.kabelac@gmail.com=
> a
=C3=A9crit :

> Dne 19. 03. 23 v 11:27 Pascal napsal(a):
> > hi,
> >
> > the bio_check_ro function of the blk-core.c source file of the Linux
> kernel
> > refers to LVM :
> >
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/blo=
ck/blk-core.c?h=3Dv6.2.7#n500
> <
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/blo=
ck/blk-core.c?h=3Dv6.2.7#n500
> >
> >
> > how does LVM currently behave when faced with a device marked as
> readonly ?
> > does it automatically switch itself in readonly mode?
> >
> > according to some tests carried out in a virtual machine, it seems that
> it
> > doesn't and that LVM modifies the disk/partition(s) even though they ar=
e
> all
> > readonly (chmod 444 && blockdev --setro).
>
>
> Hi
>
> There is no extra logic around RO devices in lvm2.  When lvm2 succeeds
> opening
> device in write mode, it'll use it for writing.
>
> Also note - when you 'activate' a LV in read-write mode - someone opens
> such
> LV/device and you later on 'lvchange' such active LV to read-only mode -
> all
> writers will keep writing to such device.
>
> It's not quite clear which kind of problem you are actually hitting - so
> maybe
> adding some more descriptive  environment +  logs  might give more info
> about
> your individual case.
>
> Note: root admin typically can overwrite any 'mild' protections...
>
> Regards
>
> Zdenek
>
>

--000000000000bae0ea05f7559074
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>thank you for this first feedback.</div><div><br></di=
v><div>I am writing a memo on github and will communicate the url soon.</di=
v><div><br></div>my question is in the context of digital investigation whi=
ch does not admit the alteration of the medium.<br><div>of course, there ar=
e combinations (/etc/lvm.conf + snap@nbd for example) which allow in fine n=
ot to alter the media but I don&#39;t understand why a media set in read-on=
ly mode - eg. chmod 444 + blockdev --setro set before LVM process - is not =
protected against LVM modifications...</div><div><br></div><div>regards, la=
csaP.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Le=C2=A0lun. 20 mars 2023 =C3=A0=C2=A015:00, Zdenek Kabelac=
 &lt;<a href=3D"mailto:zdenek.kabelac@gmail.com">zdenek.kabelac@gmail.com</=
a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Dne 19. 03. 23 v 11:27 Pascal napsal(a):<br>
&gt; hi,<br>
&gt; <br>
&gt; the bio_check_ro function of the blk-core.c source file of the Linux k=
ernel <br>
&gt; refers to LVM :<br>
&gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/stable/linu=
x.git/tree/block/blk-core.c?h=3Dv6.2.7#n500" rel=3D"noreferrer" target=3D"_=
blank">https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tre=
e/block/blk-core.c?h=3Dv6.2.7#n500</a> &lt;<a href=3D"https://git.kernel.or=
g/pub/scm/linux/kernel/git/stable/linux.git/tree/block/blk-core.c?h=3Dv6.2.=
7#n500" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm=
/linux/kernel/git/stable/linux.git/tree/block/blk-core.c?h=3Dv6.2.7#n500</a=
>&gt;<br>
&gt; <br>
&gt; how does LVM currently behave when faced with a device marked as reado=
nly ?<br>
&gt; does it automatically switch itself in readonly mode?<br>
&gt; <br>
&gt; according to some tests carried out in a virtual machine, it seems tha=
t it <br>
&gt; doesn&#39;t and that LVM modifies the disk/partition(s) even though th=
ey are all <br>
&gt; readonly (chmod 444 &amp;&amp; blockdev --setro).<br>
<br>
<br>
Hi<br>
<br>
There is no extra logic around RO devices in lvm2.=C2=A0 When lvm2 succeeds=
 opening <br>
device in write mode, it&#39;ll use it for writing.<br>
<br>
Also note - when you &#39;activate&#39; a LV in read-write mode - someone o=
pens such <br>
LV/device and you later on &#39;lvchange&#39; such active LV to read-only m=
ode - all <br>
writers will keep writing to such device.<br>
<br>
It&#39;s not quite clear which kind of problem you are actually hitting - s=
o maybe <br>
adding some more descriptive=C2=A0 environment +=C2=A0 logs=C2=A0 might giv=
e more info about <br>
your individual case.<br>
<br>
Note: root admin typically can overwrite any &#39;mild&#39; protections...<=
br>
<br>
Regards<br>
<br>
Zdenek<br>
<br>
</blockquote></div>

--000000000000bae0ea05f7559074--

--===============6279835046201821301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============6279835046201821301==--

