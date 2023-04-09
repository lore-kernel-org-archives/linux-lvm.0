Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86FCC7619A
	for <linux-lvm@archiver.kernel.org>; Tue, 11 Apr 2023 06:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681195479;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:resent-to:resent-from:resent-message-id:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=MEnlHxe1eOPzOaavAuUC4YRKcIomQP7NXIm7+327Su8=;
	b=NXaWRXLuz2hHs+x1NUC0oSfJU/jmIGRLNfhyfRCPxRKUKCuMNHi6h8xHAsoPwzNcs8Q/DC
	tqPwicrvLwOhwQYxL1Nyj2OXm4LKnRTf6cq+mxjtgJLcwQmLO7rP+8KenIVKbWDNr9r0nO
	vK+8s4tFjImbR2nPb79gAUiysMpBaUw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-xHbqJkU3NvyCfBQQWbwLEw-1; Tue, 11 Apr 2023 02:44:35 -0400
X-MC-Unique: xHbqJkU3NvyCfBQQWbwLEw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CE828996E0;
	Tue, 11 Apr 2023 06:44:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A29C202701E;
	Tue, 11 Apr 2023 06:44:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E5F1E1946A67;
	Tue, 11 Apr 2023 06:44:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B679A1946586
 for <linux-lvm@listman.corp.redhat.com>; Sun,  9 Apr 2023 20:40:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 989F814171B7; Sun,  9 Apr 2023 20:40:17 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FD461415308
 for <linux-lvm@redhat.com>; Sun,  9 Apr 2023 20:40:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58E17101A531
 for <linux-lvm@redhat.com>; Sun,  9 Apr 2023 20:40:17 +0000 (UTC)
Received: from havoc.proulx.com (havoc.proulx.com [198.99.81.74]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-133-52KsrKUEOhmWL5KEmgctVg-1; Sun,
 09 Apr 2023 16:40:15 -0400
X-MC-Unique: 52KsrKUEOhmWL5KEmgctVg-1
Received: by havoc.proulx.com (Postfix, from userid 1027)
 id 698EB8DB; Sun,  9 Apr 2023 14:32:18 -0600 (MDT)
Resent-From: Mailing List Manager <mlmgr@proulx.com>
Resent-Date: Sun, 9 Apr 2023 14:32:18 -0600
Resent-Message-ID: <ZDMg0nrD62dEqAIr@havoc.proulx.com>
Resent-To: linux-lvm@redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E4E2C1946586
 for <linux-lvm@listman.corp.redhat.com>; Sun,  9 Apr 2023 20:18:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9E4E51121315; Sun,  9 Apr 2023 20:18:21 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9713F1121314
 for <linux-lvm@redhat.com>; Sun,  9 Apr 2023 20:18:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7906480C8C1
 for <linux-lvm@redhat.com>; Sun,  9 Apr 2023 20:18:21 +0000 (UTC)
Received: from sonic302-3.consmr.mail.bf2.yahoo.com
 (sonic302-3.consmr.mail.bf2.yahoo.com [74.6.135.42]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384)
 id us-mta-665-UUnq_Ns5OmOBV6tcrcZIPQ-1; Sun, 09 Apr 2023 16:18:19 -0400
X-MC-Unique: UUnq_Ns5OmOBV6tcrcZIPQ-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1681071498; bh=zZWf4TU2kIWULMlKKhny2YUfgelJxtKXO+8gZfK294J=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=OlXnSPgvtQzmLZMpWg7DlkgXJuPSbF3tsywt81aftDg+jnG6O1egplha3ysLQ3WwSBn1N5xXK93UwTBxXoDiku8+0qfxhaS8VdPP666su4JlmJlL0BPvzBno1jjzOXgErAix/PCAfsXSMasWGK53d/0qcEuL/cQUut0DNTtIlZ+duAI374seC3EX+uDMY0hwrp23R5ItbmLS5QlEjJJo/MvGGPoh2Hf/U/JMlN3TmoChRDjBv20w8Mq5daY+ovWmV69Wn0eY03zVN0dJ+PHxb24ZUVKW8X9NlorgX+yXLi4CdJ+M4N64IFOa5lMUlgXNcuWHxbsPD19R4jrh9GLUqg==
X-YMail-OSG: ADD_dQwVM1lK6tcBWMXHOS_fOrCl.gqvrnG08XeknAZ3vcRfVBdq32ifGunuOtS
 nqYRZgBzer.au1lzZqdqd82Xmt4wCSXTSk4Gel6huo0NJVJt6yAErGPX2Lx._CDzu3WqyvQ8UVnJ
 DtA7Aq_CTiHGl.DKkbgNp0qYFtzR2lSy751sHgDVnbaCBglPH.hU43UZd3HvGLCOyz8wLnPW_ynL
 pfFxo3dRSr8ImCgHxE.SpCMtkzoudq9QHhB4sSElNmsHmZfPEP40y1FeypsZOf6hi4Bi3hgRKAqa
 hfIi5aFRQW38wrk7EOn0p3euDxK9V9Zk5Tqu8E71vHFC6PXVCZzrDIuhGfUVo.5zX0EGeYXGRi4S
 kfemPDr.ryhsmaEfXlWs4b.YTvHE6BQbpO_NwRBn7wc3hX6DUnroZdwcxPjD_D8Vw1GJSo3rSBpF
 Dij_m7xppvq9ccVOgfQnGnsoHLNj8mTyEYu8gLtj_ZYF_NF.6cpsthYpUt5vOtFpAYTmGCO_Po4Y
 xmut8BlISbdEsHJLdsyE8bsojDJXbp6OF29T85.mhItbbwykaEQMfyPJ6uYYr2gvc5531pH2SfsN
 .FHN1vOGq6dD3ykUz8JpZvbzI9C6dMX1f3aPk.AQ0imXtJb9wct9xl6vwkqavKs8w0D4uZUUVfGQ
 pWM37USUjrPAuSXWPh2Urlt.I1joAyO.IWdqa2u6aNrToCqoUZEeZhI.RcKuxUFKtomjqiu9iEgw
 kXgSVSpOrpRFx4LFABk8INohX1uQ_Q7K3M2eY.G8Np1qjcVeUAbMB7PYdtkRsTNGDxGtN3mdwHec
 oAqORWWx5haTGinH_ejrlkHYuoRARcv5.vpIeDmFSaUr3ub_uCuQNnfOazQ_Ux9tG3wgU.LrjQDo
 FqQ0r38QsaMXBuhPvJoSt_wyO9H8YDxnZq9Vfs7.f.hxwROdhQuDdoEl7tJPoiJHXRbvHqJlqYJp
 wB_wnHJEYEGqXA.vTb2VXKV88yFTxCnf3hg3btK9B7J9R0bfmlCtgHXfgN2imOzq3dJ_iV.3b7zB
 iBLuUAW9WpTmfzRQH9USWCjs.tZqD_fIKBX3X0061KexQNGjXRDuF0iChfVYUPW9Q2tr8H8kDS41
 oneEF9ROVXyg.bVtMgVd0WmRt4vrhubTVjzzRwJZp5Yf8OYCa90lMljFb_znUcWL.M4J46EWsjXN
 0mzD7CQAaUlWTMqLyP.E1MW6aqq2yty_eWIpG.FYnucXn4IV4ldgBQ.N6P2ip1Pqj_aZoRjRQ960
 m.Fu9gD5Lka0JZ6eUEgCRM3v6NhM_eGwFYdviwXgKqApS0yXUrSkksaCbSjyQZjATAE3V4S5PGYi
 6jLgGUiYw1m3cO.wif2yk9eiX9eO73noty7gVdc9DMBKeV7t4oOCRCrz7ZDZgyxvXSOEJHFUyDSU
 5UCqIo.mZUndr.i3dVH1GMTxXo_u8sm_WbnJjJQY5a0MfWWnR7HvZdBEG0gOG5nHCVvTI5ke4N4R
 fTsoFwLCLVNyCsuNFf6y..dkoAxSBxe0zg6rU4BVbDY1g6ouIFg92ClsU19AesCFMNpTSYNfyLQw
 Xp9aGTKS7Hl3Occ7C37R4JC165.mYGb6a7MUbFscTntnx_C.o4kSsXEW9VVBcpCsxTcgfCwckpta
 n3S9eHH76fTtsIN54iERNIR9GZ66yTbSQQAhbLvvvlxgN3iwqKPiNhs9TXXl3X8a.WRgDEYP8b0n
 TcmHuCi5d78LaO1LZhD1Q4kYGeO1NawjROp87ZIoOU_oUwMcF8jllgl1Zx1dgRwQiZCMpegT.yij
 p2xPr1kHIqP6iZZlBlf5eyYwwPyeU4YWaCa53JPMTu7viF39U5jTckdbhPctxTKAySByRLvNFZX7
 QtTJTxKYrI8oshY..dMOMVsoTHEMg7wCZlwI5Gg8S3ezFwO1uR8zc9LMn2Ilt7P7Cq9OcRIm2v2I
 5SR6vO39xGREYBwFrdQLVmiasfqBfsVJPvm1z1zZJazgzMP_5eAH5phFmLBqySvoISk9WxCVwpBk
 ZqpYyf75oVTtDu6o0nfYC8nzojc9fqvzsb6kbE3RKjJQzKgzdADxdj4p8RoXzK1qcL9u84W8cbvl
 gehTJA.h1JP6qd_dI1wwvECFiV5mE5o1rxgD1Qaq0yoOrVZHrY1mipw0d.0rqgiCHOk7KvV8zNiC
 uA_JjK0Liu5LphJPfPEX9RspNjWoP7lmqtViiomrr.WE2wCU0Pw--
X-Sonic-MF: <pattonme@yahoo.com>
X-Sonic-ID: b37c0faf-6431-4c78-ae8e-e50a59ced531
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.bf2.yahoo.com with HTTP; Sun, 9 Apr 2023 20:18:18 +0000
Date: Sun, 9 Apr 2023 20:18:06 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <1043528017.520337.1681071486811@mail.yahoo.com>
MIME-Version: 1.0
References: <1043528017.520337.1681071486811.ref@mail.yahoo.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Listhelper-Id: 20230409142024-3117
X-Bogosity: Spam, tests=bogofilter, spamicity=1.000000, version=1.2.5
X-CRM114-Status: SPAM  (  -7.10  )
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Tue, 11 Apr 2023 06:44:28 +0000
Subject: Re: [linux-lvm] bug? shrink lv by specifying pv extent to be
 removed does not behave as expected
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
X-Mimecast-Originator: yahoo.com
Content-Type: multipart/mixed; boundary="===============7165792169999895701=="

--===============7165792169999895701==
Content-Type: multipart/alternative; 
	boundary="----=_Part_520336_2028564037.1681071486810"

------=_Part_520336_2028564037.1681071486810
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

>=C2=A0my plan is to scan a disk for usable sectors and map the logical vol=
ume>=C2=A0around the broken sectors.
1977 called, they'd like their non-self-correcting HD controller implementa=
tions back.
>From a real-world perspective there is ZERO (more like negative) utility t=
o this exercise. Controllers remap blocks all on their own and the so-calle=
d geometry is entirely fictitious=C2=A0anyway. From a script/program "becau=
se I want to" perspective you could leave LVM entirely out of it and just u=
se a file with arbitrary offsets scribbled with a "bad" signature.
------=_Part_520336_2028564037.1681071486810
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydpd61ea4c3yahoo-style-wrap" style=
=3D"font-family: times new roman, new york, times, serif; font-size: 16px;"=
><div style=3D""><div dir=3D"ltr" data-setdir=3D"false" style=3D"font-size:=
 16px; font-family: times new roman, new york, times, serif;">&gt;&nbsp;<sp=
an style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">my =
plan is to scan a disk for usable sectors and map the logical volume</span>=
</div><div dir=3D"ltr" data-setdir=3D"false" style=3D"font-size: 16px;"><fo=
nt face=3D"Helvetica Neue, Helvetica, Arial, sans-serif">&gt;&nbsp;</font><=
span style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">a=
round the broken sectors.</span></div><div dir=3D"ltr" data-setdir=3D"false=
" style=3D"font-size: 16px;"><span style=3D"font-family: Helvetica Neue, He=
lvetica, Arial, sans-serif;"><br></span></div><div dir=3D"ltr" data-setdir=
=3D"false" style=3D"font-size: 16px;"><span style=3D"font-family: Helvetica=
 Neue, Helvetica, Arial, sans-serif;">1977 called, they'd like their non-se=
lf-correcting HD controller implementations back.</span></div><div dir=3D"l=
tr" data-setdir=3D"false" style=3D"font-size: 16px;"><span style=3D"font-fa=
mily: Helvetica Neue, Helvetica, Arial, sans-serif;"><br></span></div><div =
dir=3D"ltr" data-setdir=3D"false" style=3D""><font face=3D"Helvetica Neue, =
Helvetica, Arial, sans-serif">From a real-world perspective there is ZERO (=
more like negative) utility to this exercise. Controllers remap blocks all =
on their own and the so-called geometry is entirely fictitious&nbsp;anyway.=
 From a script/program "because I want to" perspective you could leave LVM =
entirely out of it and just use a file with arbitrary offsets scribbled wit=
h a "bad" signature.</font></div></div></div></body></html>
------=_Part_520336_2028564037.1681071486810--

--===============7165792169999895701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============7165792169999895701==--


