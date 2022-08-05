Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E210C00140
	for <linux-lvm@archiver.kernel.org>; Mon,  8 Aug 2022 07:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659943806;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=YITgvxn2AsnvNRNbIaKadutMHrDZAryW+zp1oevvUZI=;
	b=fMuCCZboJL0IGLVB/9rRaUTP3G4/MVopBCyu+eGQMs29ZgbZ/W61JUzUf/lv1nurLdTU+0
	tE2rlZaRghoUNBBW8XFel5FFywkNC6+IEoQGZNvgYZSp2nXav40uz+PoSNClEY7aKr/Wxy
	3fEAu4Sqx26gK5sd8y7nAarAX2d9PQ8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-0BQxdKuzOCuYk_uv5pVW7g-1; Mon, 08 Aug 2022 03:30:04 -0400
X-MC-Unique: 0BQxdKuzOCuYk_uv5pVW7g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B1131C06EC6;
	Mon,  8 Aug 2022 07:30:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B70C01415125;
	Mon,  8 Aug 2022 07:29:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8F78F1946A59;
	Mon,  8 Aug 2022 07:29:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2B8441946A5F
 for <linux-lvm@listman.corp.redhat.com>; Fri,  5 Aug 2022 12:42:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 203404010E37; Fri,  5 Aug 2022 12:42:46 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BE5E404E4C8
 for <linux-lvm@redhat.com>; Fri,  5 Aug 2022 12:42:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04E2785A581
 for <linux-lvm@redhat.com>; Fri,  5 Aug 2022 12:42:46 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-yDwpwqEHPGieTszc30Bm8A-1; Fri, 05 Aug 2022 08:42:43 -0400
X-MC-Unique: yDwpwqEHPGieTszc30Bm8A-1
Received: by mail-oi1-f174.google.com with SMTP id v203so2528640oie.10
 for <linux-lvm@redhat.com>; Fri, 05 Aug 2022 05:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:cc:to:date:from:subject:content-transfer-encoding
 :mime-version:return-receipt-to:disposition-notification-to
 :user-agent:thread-topic:references:in-reply-to:x-gm-message-state
 :from:to:cc;
 bh=XDyOSUbCvDUOf8QqWVWbQnYW8AK7yvaeaA2kF3DM4Ek=;
 b=KdBlssxHw+HJiumh03J+8F15WEAGDJ+4++USFhk0VDh4BGkNNoM0yd6Pk8ZnnyLvWS
 rWcjXEgghdcUsRrtUuB/PewoQFEao4hBES1i+N+c/hfo8IG+EbLPGXAgaTWmquLIpB9x
 DpXRxs05i5sUBbMiSkkwLSFuF/ixb1Zp6GhWzu2cq+ULOt2NOLu8KaGY8iICoIYWHhL3
 xUJj7sixKmF2TkLKIaQVGjHFwYON9+kQNJOx/sS2Jbdr1aq8rPfSciJGmK2STcEmji3z
 2rtp3uu0unI0mmDZA+iBEZjsx7+pmBrIghAFGtnkMnnsga2FZpR80syD2S9LShQZ1YXl
 /spw==
X-Gm-Message-State: ACgBeo2Xkcvj7aDnG37xUvMAla2Wi4sZb1D/A4b4Ue5NjoIOtCRvjGeU
 Bc6zYjjoytukIPoWJXI7oOOr1nTCc1E=
X-Google-Smtp-Source: AA6agR4FDEJkbeW4OyfXoWzd/coopTaQ6S+nsxiaZcZ7h6kaW/63AWpMo/4PYA/bVOLrRzgXtab7xQ==
X-Received: by 2002:a05:6808:1447:b0:33d:e19e:f6eb with SMTP id
 x7-20020a056808144700b0033de19ef6ebmr2904067oiv.234.1659703363205; 
 Fri, 05 Aug 2022 05:42:43 -0700 (PDT)
Received: from ?IPV6:2607:fb90:4750:c13e:d598:8e52:1d7:be87?
 ([2607:fb90:4750:c13e:d598:8e52:1d7:be87])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a9d6a07000000b00616dfd2c859sm672284otn.59.2022.08.05.05.42.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 05:42:42 -0700 (PDT)
In-Reply-To: <f70a967b-81f8-d9bd-6873-7f96830bf4eb@gmail.com>
References: <CAH5g025eDd60jvU+_d7DLaPdsmK0TsNjB-jkewKg5FSNJMEmJw@mail.gmail.com>
 <18239b39270.27a5.d4b3b9aee17a85f6bc878c68b3925db6@beardandsandals.co.uk>
 <CAAMCDecDyj_JLQvnxhsECng_t-x=Lxeta5WgrCLUGGqxHQvuiQ@mail.gmail.com>
 <1823f6818f8.27a5.d4b3b9aee17a85f6bc878c68b3925db6@beardandsandals.co.uk>
 <CAH5g027PhrTHgoNbgMP1bf=BbnwV+oSP7phJULWDzG-kVpwBGw@mail.gmail.com>
 <f70a967b-81f8-d9bd-6873-7f96830bf4eb@gmail.com>
X-Referenced-Uid: 15195
Thread-Topic: Re: Problem with partially activate logical volume
User-Agent: Android
X-Is-Generated-Message-Id: true
MIME-Version: 1.0
X-Local-Message-Id: <d3ad6585-7daa-4055-a7c4-9e045c5b0c55@gmail.com>
From: Ken Bass <daytooner@gmail.com>
Date: Fri, 05 Aug 2022 07:42:40 -0500
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <d3ad6585-7daa-4055-a7c4-9e045c5b0c55@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mailman-Approved-At: Mon, 08 Aug 2022 07:29:43 +0000
Subject: Re: [linux-lvm] Problem with partially activate logical volume
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============5166058860985526789=="

--===============5166058860985526789==
Content-Type: multipart/alternative; boundary="----41UQFLYLWLAXX5ZLKYHOXIG1GXKOEP"

------41UQFLYLWLAXX5ZLKYHOXIG1GXKOEP
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
 charset=UTF-8

Zdenek: thanks. That makes more sense. I will try after (re-)cloning. Give =
it=C2=A0 a day or so.=20

Ken=20


On Aug 5, 2022, 7:03 AM, at 7:03 AM, Zdenek Kabelac <zdenek.kabelac@gmail.c=
om> wrote:
>Dne 03. 08. 22 v 23:31 Ken Bass napsal(a):
>>=20
>> That's pretty much it. Whenever any app attempts to read a block from
>the=20
>> missing drive, I get the "Buffer I/O error" message. So, even though
>my=20
>> recovery apps can scan the LV, marking blocks on the last drive as=20
>> missing/unknown/etc., they can't display any recovered data - which I
>know=20
>> does exist. Looking at raw data from the apps' scans, I can see
>directory=20
>> entries, as well as files. I'm sure the inodes and bitmaps are still
>there for=20
>> some of these, I just can't really reverse engineer and follow them
>through.=20
>> But isn't that what the apps are supposed to do?
>
>As mentioned by my previous email you shall *NOT* fix the partially
>activated=20
>device in-place - this will not lead to good result.
>
>User should copy the content to some valid storage device with the same
>size=20
>as he tries to recover.
>
>You can 'partially' activate device with  "zero"  filler instead of
>"error"=20
>(see the  lvm.conf setting:     missing_stripe_filler=3D"...") - this way
>you=20
>will just 'read' zero for missing parts.
>
>Your another 2nd. option is to 'correct' the VG by filling  missing PV
>with a=20
>new one with preferable zeroed content - so you will not read 'random'
>garbage=20
>in places this new PV will fill the space after your missing PV.
>Although even in this case - I'd still run  'fsck' on the snapshot
>created on=20
>top of such LV to give you another chance of recovery if you will pick
>a wrong=20
>answer  (since fsck might be 'quite' interactive when doing such
>large-scale=20
>repair)
>
>
>> Sorry I haven't replied sooner, but it takes a long time (days) to
>clone, then=20
>> scan 16Tb...
>>=20
>> So, please any suggestions are greatly appreciated, as well as
>needed.
>>=20
>> ken
>>=20
>> (I know: No backup; got burned; it hurts; and I will now always have
>backups.=20
>> 'Nuf said.)
>
>Before you run your 'fsck' create a snapshot of your newly created
>'backup'=20
>and make all the repair actions in the snapshots.
>
>Once you are 'satisfied' with 'repaired'  filesystem you can then
>'merge'=20
>snapshot back to your origin and use it.
>
>Regards
>
>Zdenek

------41UQFLYLWLAXX5ZLKYHOXIG1GXKOEP
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body style=3D"zoom: 0%;"><div dir=3D"auto">Zdenek: than=
ks. That makes more sense. I will try after (re-)cloning. Give it=C2=A0 a d=
ay or so. <br><br></div>
<div dir=3D"auto">Ken <br></div>
<div class=3D"gmail_quote" >On Aug 5, 2022, at 7:03 AM, Zdenek Kabelac &lt;=
<a href=3D"mailto:zdenek.kabelac@gmail.com" target=3D"_blank">zdenek.kabela=
c@gmail.com</a>&gt; wrote:<blockquote class=3D"gmail_quote" style=3D"margin=
: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-lef=
t: 1ex;">
<pre class=3D"blue">Dne 03. 08. 22 v 23:31 Ken Bass napsal(a):<br><blockquo=
te class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0.8ex; border-left: 1=
px solid #729fcf; padding-left: 1ex;"> <br> That's pretty much it. Whenever=
 any app attempts to read a block from the <br> missing drive, I get the "B=
uffer I/O error" message. So, even though my <br> recovery apps can scan th=
e LV, marking blocks on the last drive as <br> missing/unknown/etc., they c=
an't display any recovered data - which I know <br> does exist. Looking at =
raw data from the apps' scans, I can see directory <br> entries, as well as=
 files. I'm sure the inodes and bitmaps are still there for <br> some of th=
ese, I just can't really reverse engineer and follow them through. <br> But=
 isn't that what the apps are supposed to do?<br></blockquote><br>As mentio=
ned by my previous email you shall *NOT* fix the partially activated <br>de=
vice in-place - this will not lead to good result.<br><br>User should copy =
the content to some valid storage device with the same size <br>as he tries=
 to recover.<br><br>You can 'partially' activate device with  "zero"  fille=
r instead of "error" <br>(see the  lvm.conf setting:     missing_stripe_fil=
ler=3D"...") - this way you <br>will just 'read' zero for missing parts.<br=
><br>Your another 2nd. option is to 'correct' the VG by filling  missing PV=
 with a <br>new one with preferable zeroed content - so you will not read '=
random' garbage <br>in places this new PV will fill the space after your mi=
ssing PV.<br>Although even in this case - I'd still run  'fsck' on the snap=
shot created on <br>top of such LV to give you another chance of recovery i=
f you will pick a wrong <br>answer  (since fsck might be 'quite' interactiv=
e when doing such large-scale <br>repair)<br><br><br><blockquote class=3D"g=
mail_quote" style=3D"margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #729=
fcf; padding-left: 1ex;"> Sorry I haven't replied sooner, but it takes a lo=
ng time (days) to clone, then <br> scan 16Tb...<br> <br> So, please any sug=
gestions are greatly appreciated, as well as needed.<br> <br> ken<br> <br> =
(I know: No backup; got burned; it hurts; and I will now always have backup=
s. <br> 'Nuf said.)<br></blockquote><br>Before you run your 'fsck' create a=
 snapshot of your newly created 'backup' <br>and make all the repair action=
s in the snapshots.<br><br>Once you are 'satisfied' with 'repaired'  filesy=
stem you can then 'merge' <br>snapshot back to your origin and use it.<br><=
br>Regards<br><br>Zdenek<br><br></pre></blockquote></div></body></html>
------41UQFLYLWLAXX5ZLKYHOXIG1GXKOEP--

--===============5166058860985526789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============5166058860985526789==--

