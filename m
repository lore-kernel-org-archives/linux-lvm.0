Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E4FC71153
	for <linux-lvm@archiver.kernel.org>; Mon, 28 Aug 2023 06:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693205207;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=L4q6jsQ+TgqTTu92jlvIxaoOUTG0ofwAWKbDfgd8mgU=;
	b=DEVsZI19iBOAf5vFcPWk95Vc2i7c9rdpS6HcUT317z7Q6BeGtbYIWf/i+ScknSRPrNyE7Z
	zeSSMfuedaz50XGIz6APq0EpoIRnP+SjHypD732h1/KeAvrsU27f6vfMctIMAf7nw2HXMT
	lzv3LrXbupx5sPkYvpeJ4DsvUgjl5UQ=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-h4WqmK2UPq2hL3Vwt60_5Q-1; Mon, 28 Aug 2023 02:46:44 -0400
X-MC-Unique: h4WqmK2UPq2hL3Vwt60_5Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E620F2A59558;
	Mon, 28 Aug 2023 06:46:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D2E30401051;
	Mon, 28 Aug 2023 06:46:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7B16A19465B9;
	Mon, 28 Aug 2023 06:46:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B12D519465A8
 for <linux-lvm@listman.corp.redhat.com>; Sun, 27 Aug 2023 10:12:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6C27B401051; Sun, 27 Aug 2023 10:12:14 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 635B3401E63
 for <linux-lvm@redhat.com>; Sun, 27 Aug 2023 10:12:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4355B8D40A3
 for <linux-lvm@redhat.com>; Sun, 27 Aug 2023 10:12:14 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-VwmfT0ZLNFONmbrYbhLcSQ-1; Sun, 27 Aug 2023 06:12:12 -0400
X-MC-Unique: VwmfT0ZLNFONmbrYbhLcSQ-1
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-d77c5414433so2288210276.0
 for <linux-lvm@redhat.com>; Sun, 27 Aug 2023 03:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693131131; x=1693735931;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wVCWs7lz+Xx6w5wB6Ijwuh7TFeGNUGytjMokhbbuOoQ=;
 b=Q2XUqVBieLFX/DDZNwEnwZZ7N01ukaTw73VGkO/gpJ4Rdi7/o874sfscpSNP286Yc5
 J7nTRKS466MD9Tg464P0Exl3g3PvTb4QmF7zqletOFG66H2gBiWx3E/1KtAOfIzutVqQ
 4XNIS7FD5XC3enl1P12NzemkEptkVN9a0DzHExr/a18GYRMXOYZfVRXUkgVvszX+UhM8
 ZeJHF2r+S0YvuR4+3jNCtYyp6yWVyalpc2v63/stBFauNIf244s/G9XTJda5RPcK4cdb
 qq3/7Ci1ReSQpm33tzhb5fYu9V1qYxsYUTzEi7r5X6+co/Sdo0oZ3aszdkvdO7jw32HL
 eKDA==
X-Gm-Message-State: AOJu0Yx04Ax2NGSJ2jSlktW48/EH7Eqma4bTMzDF904+ALv0DU2RMLRU
 lsnofH8yYQL+XlsEM5E9HD0wZF1nCQ/Zc38E4DYC/1KvLsA=
X-Google-Smtp-Source: AGHT+IFaQIhwD0okRupYqACOtAPfgH/lCn4R0o/qH4JxLgVodu8n/sf8tCAVftoJ9ez2P0F5fCb2EMkpQ2eIfIWvqLA=
X-Received: by 2002:a25:b04c:0:b0:d7a:e0f6:54cc with SMTP id
 e12-20020a25b04c000000b00d7ae0f654ccmr2122658ybj.26.1693131131314; Sun, 27
 Aug 2023 03:12:11 -0700 (PDT)
MIME-Version: 1.0
From: Roska Postit <roskapostit99999@gmail.com>
Date: Sun, 27 Aug 2023 13:11:59 +0300
Message-ID: <CABh+8g5708fk_yJ_P-9Ne20ir+qjFV8BHj7tj6_HWamUdi55=Q@mail.gmail.com>
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Mon, 28 Aug 2023 06:46:34 +0000
Subject: [linux-lvm] Swapping LLVM drive
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============7910086293871623085=="

--===============7910086293871623085==
Content-Type: multipart/alternative; boundary="000000000000a3e8600603e4cf5f"

--000000000000a3e8600603e4cf5f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

What is the most proper way to swap my 500GB SSD drive to the bigger 2TB
SSD drive in the following LLVM configuration ?

nvme0n1            259:0    0 465,8G  0 disk
=E2=94=9C=E2=94=80nvme0n1p1        259:1    0   512M  0 part  /boot/efi
=E2=94=9C=E2=94=80nvme0n1p2        259:2    0   488M  0 part  /boot
=E2=94=94=E2=94=80nvme0n1p3        259:3    0 464,8G  0 part
  =E2=94=9C=E2=94=80pc3--vg-root   254:0    0 463,8G  0 lvm   /
  =E2=94=94=E2=94=80pc3--vg-swap_1 254:1    0   980M  0 lvm   [SWAP]

btw. You don't need to give me step by step instructions just some
directions and ideas would be just fine.

--000000000000a3e8600603e4cf5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto">What is the most proper way to swap my 5=
00GB SSD drive to the bigger 2TB SSD drive in the following LLVM configurat=
ion ?</div><div dir=3D"auto"><br></div><div dir=3D"auto">nvme0n1 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0259:0 =C2=A0 =C2=A00 465,8G =C2=A00 disk =C2=
=A0<br>=E2=94=9C=E2=94=80nvme0n1p1 =C2=A0 =C2=A0 =C2=A0 =C2=A0259:1 =C2=A0 =
=C2=A00 =C2=A0 512M =C2=A00 part =C2=A0/boot/efi<br>=E2=94=9C=E2=94=80nvme0=
n1p2 =C2=A0 =C2=A0 =C2=A0 =C2=A0259:2 =C2=A0 =C2=A00 =C2=A0 488M =C2=A00 pa=
rt =C2=A0/boot<br>=E2=94=94=E2=94=80nvme0n1p3 =C2=A0 =C2=A0 =C2=A0 =C2=A025=
9:3 =C2=A0 =C2=A00 464,8G =C2=A00 part =C2=A0<br>=C2=A0 =E2=94=9C=E2=94=80p=
c3--vg-root =C2=A0 254:0 =C2=A0 =C2=A00 463,8G =C2=A00 lvm =C2=A0 /<br>=C2=
=A0 =E2=94=94=E2=94=80pc3--vg-swap_1 254:1 =C2=A0 =C2=A00 =C2=A0 980M =C2=
=A00 lvm =C2=A0 [SWAP]<br></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">btw. You don&#39;t need to give me step by step instructions just some d=
irections and ideas would be just fine.</div></div>

--000000000000a3e8600603e4cf5f--

--===============7910086293871623085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============7910086293871623085==--

