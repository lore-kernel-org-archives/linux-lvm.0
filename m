Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D68EC43217
	for <linux-lvm@archiver.kernel.org>; Mon, 17 Oct 2022 07:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665991885;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=KKn3H4IqcvNOKaZEbcyYP3QY5I+VdoBFdrW2ZAeM4NA=;
	b=AT1jT4T7akQM+cJYEACB1S+1yaokm3IiJZrQRRQRP77f7HZoAe4zqpAdSEDwzRS6CpsPsT
	IiY8Dmce6VzNnFGsu0a112re7hn+BZarJEzBym05J43Xd1QS9GYrsAjgl2FArTeMDRxdcT
	E7Bs/dHFuz3p8c3pnioon6lDsgivxp8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-j0b-rK3RN9S1zBQ3Z-gSJg-1; Mon, 17 Oct 2022 03:31:21 -0400
X-MC-Unique: j0b-rK3RN9S1zBQ3Z-gSJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70394823F09;
	Mon, 17 Oct 2022 07:31:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F0081146820E;
	Mon, 17 Oct 2022 07:31:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B73AF1946594;
	Mon, 17 Oct 2022 07:31:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0970E1946586
 for <linux-lvm@listman.corp.redhat.com>; Fri, 14 Oct 2022 20:28:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EBC1740C83EC; Fri, 14 Oct 2022 20:28:39 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E428B40C835A
 for <linux-lvm@redhat.com>; Fri, 14 Oct 2022 20:28:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5482101A56D
 for <linux-lvm@redhat.com>; Fri, 14 Oct 2022 20:28:39 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-69yIH02LNuCdAqpBlZ06_A-1; Fri, 14 Oct 2022 16:28:35 -0400
X-MC-Unique: 69yIH02LNuCdAqpBlZ06_A-1
Received: by mail-ej1-f41.google.com with SMTP id bj12so12781767ejb.13;
 Fri, 14 Oct 2022 13:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:cc:to:date:from:subject:content-transfer-encoding
 :mime-version:user-agent:thread-topic:references:in-reply-to
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C3LV9YW1aHpgxST8RaiOArhc3cFn8mvWSeAQ0mhe3Is=;
 b=ffyuKEVXAKPU4cBC+BXWkZR8DV0DUlWV1T+M/agPMtL2t1K1DXzYBTJ5sR88V15AYg
 SvKuP3sqD9ki1xAw++ZqG5be6G0hQSNBELhLNfO9V9p+e1X21jd5lO4Z4lBrpnlh6MUs
 H/xWk7ENAeFwvz2QiR2n6fjabHSSQfkbWWBKT2AXu3h/rOXXjL/SGQop/1i5vbNoBA+4
 NxzllutJuhjsAZXsW+F3ZU6RaxGzMs57zr6CmRb/k7Ll6Z7zBmsAFcQMNOnjxoige40b
 xqOqWtEBzJu4VCvw85MazDTGhNqNmi+BrmOre72NCaCVfQUwIYK/6XE68vBR7skqHtui
 HZ+Q==
X-Gm-Message-State: ACrzQf01PPDnSV5n+KgNjmTHXC0EHPymYb6GJ5pnxs/jIrvTONhkyKvM
 5C44Rn/ExvKsZNqLGE+ks/yznTTUf3E=
X-Google-Smtp-Source: AMsMyM6C+F89LpSCGlQc75Nq1Ikim7Gz/00ECPo3ROf+ZXgY6ppN/MlodPPYGxaNS+heIUqNd941iA==
X-Received: by 2002:a17:906:4a09:b0:78d:b6bb:ff5f with SMTP id
 w9-20020a1709064a0900b0078db6bbff5fmr4714739eju.538.1665779313438; 
 Fri, 14 Oct 2022 13:28:33 -0700 (PDT)
Received: from [10.7.185.154] ([37.160.52.186])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a170906538700b00782539a02absm2038044ejo.194.2022.10.14.13.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Oct 2022 13:28:32 -0700 (PDT)
In-Reply-To: <CAAMCDefYPozC32AdCqw-c1nOZNiEK0j0pG7n+zcu_bRwTfCagg@mail.gmail.com>
References: <PUZP153MB075126926388815B6F9E1258AC229@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
 <PUZP153MB07512B1B646868F0F8F1D205AC259@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
 <CAAMCDefYPozC32AdCqw-c1nOZNiEK0j0pG7n+zcu_bRwTfCagg@mail.gmail.com>
X-Referenced-Uid: 71205
Thread-Topic: Re: [linux-lvm] LVM2 : performance drop even after deleting the
 snapshot
User-Agent: Android
X-Is-Generated-Message-Id: true
MIME-Version: 1.0
X-Local-Message-Id: <2e6bad30-2ebf-4162-b62d-092c3ad14003@gmail.com>
From: Roberto Fastec <roberto.fastec@gmail.com>
Date: Fri, 14 Oct 2022 22:28:28 +0200
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <2e6bad30-2ebf-4162-b62d-092c3ad14003@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Mon, 17 Oct 2022 07:31:03 +0000
Subject: Re: [linux-lvm] LVM2 : performance drop even after deleting the
 snapshot
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
Cc: Kapil Upadhayay <kupadhayay@microsoft.com>,
 "lvm-devel@redhat.com" <lvm-devel@redhat.com>,
 Mitta Sai Chaithanya <mittas@microsoft.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============3968364722874422570=="

--===============3968364722874422570==
Content-Type: multipart/alternative; boundary="----CF91JKVZ1DVZCB4Q5FIPZ79SHU8Q40"

------CF91JKVZ1DVZCB4Q5FIPZ79SHU8Q40
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
 charset=UTF-8

TIP and HINT
forget SSDs with LVM unless of enterprise level=20
especially if you are going to use/implement the thin provisioning

How to identify an SSD of enterprise level:=20
it costs from 1,00 euro per gigabyte up to 1,50 euro per gigabyte

Kind regards
Roberto Gini
Technical Manager @ www.RecuperoDatiRAIDFAsTec.it=20



=E2=81=A3Ottieni BlueMail per Android =E2=80=8B

Il giorno 14 ott 2022, 21:50, alle ore 21:50, Roger Heflin <rogerheflin@gma=
il.com> ha scritto:
>What is the underlying disk hardware you are running this on?
>virtual, spinning, ssd, nvme?
>
>On Thu, Oct 13, 2022 at 2:01 AM Pawan Sharma
><sharmapawan@microsoft.com> wrote:
>>
>> adding this to lvm-devel mailing list also.
>>
>> Regards,
>> Pawan
>> ________________________________
>> From: Pawan Sharma
>> Sent: Wednesday, October 12, 2022 10:42 PM
>> To: linux-lvm@redhat.com <linux-lvm@redhat.com>
>> Cc: Mitta Sai Chaithanya <mittas@microsoft.com>; Kapil Upadhayay
><kupadhayay@microsoft.com>
>> Subject: LVM2 : performance drop even after deleting the snapshot
>>
>> Hi Everyone,
>>
>>
>> We are evaluating lvm2 snapshots and doing performance testing on it.
>This is what we are doing :
>>
>> dump some data to lvm2 volume (using fio)
>> take the snapshot
>> delete the snapshot (no IOs anywhere after creating the snapshot)
>> run the fio on lvm2 volume
>>
>> Here as you can see, we are just creating the snapshot and
>immediately deleting it. There are no IOs to the main volume or
>anywhere. When we run the fio after this (step 4) and we see around 50%
>drop in performance with reference to the number we get in step 1.
>>
>> It is expected to see a performance drop if there is a snapshot
>because of the COW. But here we deleted the snapshot, and it is not
>referring to any data also. We should not see any performance drop
>here.
>>
>> Could someone please help me understand this behavior. Why are we
>seeing the performance drop in this case? It seems like we deleted the
>snapshot but still it is not deleted, and we are paying the COW
>penalty.
>>
>> System Info:
>>
>> OS : ubuntu 18.04
>> Kernel : 5.4.0
>>
>> # lvm version
>>   LVM version:     2.02.176(2) (2017-11-03)
>>   Library version: 1.02.145 (2017-11-03)
>>   Driver version:  4.41.0
>>
>> We also tried on latest ubuntu with newer version of LVM. We got the
>same behavior.
>>
>> Any help/pointers would be appreciated. Thanks in advance.
>>
>> Regards,
>> Pawan
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://listman.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://listman.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

------CF91JKVZ1DVZCB4Q5FIPZ79SHU8Q40
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body style=3D"zoom: 0%;"><div dir=3D"auto">TIP and HINT=
<br></div>
<div dir=3D"auto">forget SSDs with LVM unless of enterprise level <br></div=
>
<div dir=3D"auto">especially if you are going to use/implement the thin pro=
visioning<br><br></div>
<div dir=3D"auto">How to identify an SSD of enterprise level: <br></div>
<div dir=3D"auto">it costs from 1,00 euro per gigabyte up to 1,50 euro per =
gigabyte<br><br></div>
<div dir=3D"auto">Kind regards<br></div>
<div dir=3D"auto">Roberto Gini<br></div>
<div dir=3D"auto">Technical Manager @ <a href=3D"http://www.RecuperoDatiRAI=
DFAsTec.it">www.RecuperoDatiRAIDFAsTec.it</a> <br><br><br><br></div>
<div dir=3D"auto"><!-- tmjah_g_1299s -->Ottieni <!-- tmjah_g_1299e --><a hr=
ef=3D"https://bluemail.me"><!-- tmjah_g_1299s -->BlueMail per Android<!-- t=
mjah_g_1299e --></a><!-- tmjah_g_1299s --> <!-- tmjah_g_1299e --></div>
<div class=3D"gmail_quote" >Il giorno 14 ott 2022, alle ore 21:50, Roger He=
flin &lt;<a href=3D"mailto:rogerheflin@gmail.com" target=3D"_blank">rogerhe=
flin@gmail.com</a>&gt; ha scritto:<blockquote class=3D"gmail_quote" style=
=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); p=
adding-left: 1ex;">
<pre class=3D"blue">What is the underlying disk hardware you are running th=
is on?<br>virtual, spinning, ssd, nvme?<br><br>On Thu, Oct 13, 2022 at 2:01=
 AM Pawan Sharma &lt;sharmapawan@microsoft.com&gt; wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0.8ex; border-left: 1px so=
lid #729fcf; padding-left: 1ex;"><br> adding this to lvm-devel mailing list=
 also.<br><br> Regards,<br> Pawan<br><hr><br> From: Pawan Sharma<br> Sent: =
Wednesday, October 12, 2022 10:42 PM<br> To: linux-lvm@redhat.com &lt;linux=
-lvm@redhat.com&gt;<br> Cc: Mitta Sai Chaithanya &lt;mittas@microsoft.com&g=
t;; Kapil Upadhayay &lt;kupadhayay@microsoft.com&gt;<br> Subject: LVM2 : pe=
rformance drop even after deleting the snapshot<br><br> Hi Everyone,<br><br=
><br> We are evaluating lvm2 snapshots and doing performance testing on it.=
 This is what we are doing :<br><br> dump some data to lvm2 volume (using f=
io)<br> take the snapshot<br> delete the snapshot (no IOs anywhere after cr=
eating the snapshot)<br> run the fio on lvm2 volume<br><br> Here as you can=
 see, we are just creating the snapshot and immediately deleting it. There =
are no IOs to the main volume or anywhere. When we run the fio after this (=
step 4) and we see around 50% drop in performance with reference to the num=
ber we get in step 1.<br><br> It is expected to see a performance drop if t=
here is a snapshot because of the COW. But here we deleted the snapshot, an=
d it is not referring to any data also. We should not see any performance d=
rop here.<br><br> Could someone please help me understand this behavior. Wh=
y are we seeing the performance drop in this case? It seems like we deleted=
 the snapshot but still it is not deleted, and we are paying the COW penalt=
y.<br><br> System Info:<br><br> OS : ubuntu 18.04<br> Kernel : 5.4.0<br><br=
> # lvm version<br>   LVM version:     2.02.176(2) (2017-11-03)<br>   Libra=
ry version: 1.02.145 (2017-11-03)<br>   Driver version:  4.41.0<br><br> We =
also tried on latest ubuntu with newer version of LVM. We got the same beha=
vior.<br><br> Any help/pointers would be appreciated. Thanks in advance.<br=
><br> Regards,<br> Pawan<br><hr><br> linux-lvm mailing list<br> linux-lvm@r=
edhat.com<br> <a href=3D"https://listman.redhat.com/mailman/listinfo/linux-=
lvm">https://listman.redhat.com/mailman/listinfo/linux-lvm</a><br> read the=
 LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO">http://tldp.org/=
HOWTO/LVM-HOWTO</a>/<br></blockquote><br><hr><br>linux-lvm mailing list<br>=
linux-lvm@redhat.com<br><a href=3D"https://listman.redhat.com/mailman/listi=
nfo/linux-lvm">https://listman.redhat.com/mailman/listinfo/linux-lvm</a><br=
>read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO">http://=
tldp.org/HOWTO/LVM-HOWTO</a>/<br><br></pre></blockquote></div></body></html=
>
------CF91JKVZ1DVZCB4Q5FIPZ79SHU8Q40--

--===============3968364722874422570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============3968364722874422570==--

