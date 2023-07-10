Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320FEEB64DD
	for <linux-lvm@archiver.kernel.org>; Tue, 11 Jul 2023 06:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689057160;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=pOnhvE2zXzSB77ZiEb/1eWmSr44cJZA/rw0lonW3278=;
	b=GVukdtapnOuIAwePHXDaEAuCzhplhpB3NjC0GiDUimu2OpJA89ioKosX1GQb8qh1cfx1R7
	HIoJ71CwX33y+Vypa+cqDUXKRpDQh72P8LBAqXdavdL3rF04GD+DCLLvwYUBa0d67x9LJi
	gbBghWwbj2K/jaBZR9o6oz+Rf6Yr8EY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-jG6EeVsLPUut1bEypZ9vTQ-1; Tue, 11 Jul 2023 02:32:38 -0400
X-MC-Unique: jG6EeVsLPUut1bEypZ9vTQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CC5538008B4;
	Tue, 11 Jul 2023 06:32:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E6D0200AD6E;
	Tue, 11 Jul 2023 06:32:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0628419451E4;
	Tue, 11 Jul 2023 06:32:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6EA6F1946586
 for <linux-lvm@listman.corp.redhat.com>; Mon, 10 Jul 2023 08:23:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7C19D4CD0C6; Mon, 10 Jul 2023 08:23:01 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 742C9492C13
 for <linux-lvm@redhat.com>; Mon, 10 Jul 2023 08:23:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5974780006E
 for <linux-lvm@redhat.com>; Mon, 10 Jul 2023 08:23:01 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-PZeypx8zMP-ffPL1jC5WUw-1; Mon, 10 Jul 2023 04:22:59 -0400
X-MC-Unique: PZeypx8zMP-ffPL1jC5WUw-1
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-314313f127fso4273128f8f.1
 for <linux-lvm@redhat.com>; Mon, 10 Jul 2023 01:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688977378; x=1691569378;
 h=message-id:to:date:from:subject:content-transfer-encoding
 :mime-version:user-agent:thread-topic:references:in-reply-to
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+vb+ykJybdbRwJ7SZ6aE3E07NlkzK+DjMxnmFXZhFVs=;
 b=O3xNk5PW5+7T2DrPorYxUUHe7hdUctx2avuwgwu/AQnBV5Io/FexAjmUeewIfM3Ke3
 iV/d3j1zVJRxM/n1Usy5uGXvyhIVar7rQ4PV6A7hI3vr9C3BRdVjpIfWK5wS4UMf4BnA
 OgDt2tU+gdD21i1BOrrowCppEIwYca+S39NHKim88GIMZqa0Q/hFegzkpqwnvR8yNFQx
 /VRHAbciHdKyMpAeZDhRlp0hfOG/eaQOVuDLzMur3seAUIojaS8SYYwSlTwv8aA/un66
 ayAPFZqt3A9jNNWm8m3kVtzhF6PL+RlXuJb6YDPF5fEn3lR04bwoJz/JUTQKSU+gg3ia
 JMug==
X-Gm-Message-State: ABy/qLYIKPR6ZB214ToEXrLeL+83g1a1yu7yx4k11qV3f79Iv5SeyEeD
 DmbTWF5eTRQEY2GT7CnvjWNcW1RP1k20Hg==
X-Google-Smtp-Source: APBJJlHl0UORQp4oAN3S/KYMu1CW5lUczC6fL1m9i7noHEl85nQv/JkI6sDb+ypyUrSVWy0ZNGxzOQ==
X-Received: by 2002:a5d:4052:0:b0:314:1e86:e75d with SMTP id
 w18-20020a5d4052000000b003141e86e75dmr9728912wrp.34.1688977377486; 
 Mon, 10 Jul 2023 01:22:57 -0700 (PDT)
Received: from [192.168.250.214] (mob-5-90-149-163.net.vodafone.it.
 [5.90.149.163]) by smtp.gmail.com with ESMTPSA id
 k8-20020a5d5248000000b00313f9a0c521sm11035799wrc.107.2023.07.10.01.22.56
 for <linux-lvm@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 01:22:56 -0700 (PDT)
In-Reply-To: <CAHLUNMxrWdjgsL-mT=sWxvoAEHUP=4dqmSXt6+ZppdnwSyykSg@mail.gmail.com>
References: <CAHLUNMxrWdjgsL-mT=sWxvoAEHUP=4dqmSXt6+ZppdnwSyykSg@mail.gmail.com>
X-Referenced-Uid: 73051
Thread-Topic: [linux-lvm] Documentation about allowing >2 disk failures?
X-Is-Generated-Message-Id: true
X-Blue-Identity: !l=251&o=43&fo=1625&pl=138&po=0&qs=PREFIX&f=HTML&n=Roberto%20Fastec&e=roberto.fastec%40gmail.com&m=!%3ANjc1YWQ4YzEtOTRkNS00ZmZmLWE0YjEtYTEzYWRhYTNmYmVi%3ASU5CT1g%3D%3ANzMwNTE%3D%3AANSWERED&p=105&q=SHOW
User-Agent: Android
MIME-Version: 1.0
X-Local-Message-Id: <0d6ce898-371d-4dba-b07e-09ca5a101752@gmail.com>
From: Roberto Fastec <roberto.fastec@gmail.com>
Date: Mon, 10 Jul 2023 10:22:56 +0200
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <0d6ce898-371d-4dba-b07e-09ca5a101752@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Tue, 11 Jul 2023 06:32:29 +0000
Subject: Re: [linux-lvm] Documentation about allowing >2 disk failures?
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
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============3588157545266290745=="

--===============3588157545266290745==
Content-Type: multipart/alternative; boundary="----Y9FYIY5QCBN53AQX6ETASQVLJCFK6Q"

------Y9FYIY5QCBN53AQX6ETASQVLJCFK6Q
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
 charset=UTF-8

Hello Tim

LVM is a sort of layer and it can reside on any substrate

So go for raid 60 and avoid using too many drives for each RAID 6=20
Ideally I would use maximum=C2=A0 6x drives for each RAID 6 to next be stac=
k on RAID 10 with the others

bear in=C2=A0 mind that there is a calculation about guaranteed failure of =
given RAID rebuild process when you exceed a certain amount of terabytes ca=
pacity to rebuild

That is why enterprise storages with lot of terabytes are always subdivided=
 in the needed amount of RAID 5 or RAID 6 blocks to be next stack on RAID 5=
0 or RAID 60

At recuperodatiraidfastec.it we have seen so many cases of failed rebuilds =
due to leak of calculation before implementation

Kind regards

Roberto Gini
CTO @ https://www
RecuperoDatiRAIDFAsTec.it

=E2=81=A3Ottieni BlueMail per Android =E2=80=8B

Il giorno 10 lug 2023, 08:47, alle ore 08:47, Tim 'mithro' Ansell <me@mith.=
ro> ha scritto:
>Hello!
>
>RAID5 survives 1 disk failure and RAID6 survives 2 disk failures. What
>about going beyond 2 disk failures? Does anyone know where I can find
>information on what good options might be?
>
>I was looking at RAID10, but every extra mirror added only increases
>failure tolerance by 1 disk. I am also not seeing any inbuilt support
>in
>LVM for RAID50 or RAID60 but it seems like if I manually build the
>sub-volumes, things should still be fine?
>
>My system has 25 disks and I'd like to tolerate up to ~1/3rd of the
>disks
>failing so I was thinking that a RAID1 with 3 mirrors built out of
>RAID6
>with 8 disks each (and 1 hot spare) would be a potentially good option?
>
>Thank you for your help!
>
>Tim 'mithro' Ansell
>
>
>------------------------------------------------------------------------
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://listman.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

------Y9FYIY5QCBN53AQX6ETASQVLJCFK6Q
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body style=3D"zoom: 0%;"><div dir=3D"auto">Hello Tim<br=
><br></div>
<div dir=3D"auto">LVM is a sort of layer and it can reside on any substrate=
<br><br></div>
<div dir=3D"auto">So go for raid 60 and avoid using too many drives for eac=
h RAID 6 <br></div>
<div dir=3D"auto">Ideally I would use maximum=C2=A0 6x drives for each RAID=
 6 to next be stack on RAID 10 with the others<br><br></div>
<div dir=3D"auto">bear in=C2=A0 mind that there is a calculation about guar=
anteed failure of given RAID rebuild process when you exceed a certain amou=
nt of terabytes capacity to rebuild<br><br></div>
<div dir=3D"auto">That is why enterprise storages with lot of terabytes are=
 always subdivided in the needed amount of RAID 5 or RAID 6 blocks to be ne=
xt stack on RAID 50 or RAID 60<br><br></div>
<div dir=3D"auto">At <a href=3D"http://recuperodatiraidfastec.it">recuperod=
atiraidfastec.it</a> we have seen so many cases of failed rebuilds due to l=
eak of calculation before implementation<br><br></div>
<div dir=3D"auto">Kind regards<br><br></div>
<div dir=3D"auto">Roberto Gini<br></div>
<div dir=3D"auto">CTO @ https://www<br></div>
<div dir=3D"auto"><a href=3D"http://RecuperoDatiRAIDFAsTec.it">RecuperoDati=
RAIDFAsTec.it</a><br><br></div>
<div dir=3D"auto"><!-- tmjah_g_1299s -->Ottieni <!-- tmjah_g_1299e --><a hr=
ef=3D"https://bluemail.me"><!-- tmjah_g_1299s -->BlueMail per Android<!-- t=
mjah_g_1299e --></a><!-- tmjah_g_1299s --> <!-- tmjah_g_1299e --></div>
<div class=3D"gmail_quote" >Il giorno 10 lug 2023, alle ore 08:47, Tim 'mit=
hro' Ansell &lt;<a href=3D"mailto:me@mith.ro" target=3D"_blank">me@mith.ro<=
/a>&gt; ha scritto:<blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0=
pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;=
">
<div dir=3D"ltr">Hello!<div><br></div><div>RAID5 survives 1 disk failure an=
d RAID6 survives 2 disk failures. What about going beyond 2 disk failures? =
Does anyone know where I can find information on what good options might be=
?</div><div><br></div><div>I was looking at RAID10, but every extra mirror =
added only increases failure tolerance by 1 disk. I am also not seeing any =
inbuilt support in LVM for RAID50 or RAID60 but it seems like if I manually=
 build the sub-volumes, things should still be fine?</div><div><br></div><d=
iv>My system has 25 disks and I'd like to tolerate up to ~1/3rd of the disk=
s failing so I was thinking that a RAID1 with 3 mirrors built out of RAID6 =
with 8 disks each (and 1 hot spare) would be a potentially good option?</di=
v><div><br></div><div>Thank you for your help!</div><div><br></div><div>Tim=
 'mithro' Ansell</div><div><br></div><div><br></div><div><br></div></div>
<pre class=3D"blue"><hr><br>linux-lvm mailing list<br>linux-lvm@redhat.com<=
br><a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm">https:=
//listman.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO =
at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO">http://tldp.org/HOWTO/LVM-HO=
WTO</a>/<br></pre></blockquote></div></body></html>
------Y9FYIY5QCBN53AQX6ETASQVLJCFK6Q--

--===============3588157545266290745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============3588157545266290745==--

