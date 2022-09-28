Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0E1C04A95
	for <linux-lvm@archiver.kernel.org>; Thu, 29 Sep 2022 07:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664435242;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=+yxw3QpX++OfyxDpvxDTtGtPxMEXpidgfhYu5nV0+A0=;
	b=LX98JCiprko6eC+xib9nGRk4wjP230w3ddRBC45ugsyaaPkSccc1BustW6VQSvVqBN2UvW
	oYtvyaOAYt7kXxXMd4ujYDynyBc2Q295Tfa735nYJZHQIao8pTa/e/+lL8gJpJgS3ZQf0Y
	kLrVyt5dRDj965FVpOM0n5Xz9NCUTu0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-jr2qmVX4OHSGRlZc6__TIg-1; Thu, 29 Sep 2022 03:07:19 -0400
X-MC-Unique: jr2qmVX4OHSGRlZc6__TIg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70FDA811E81;
	Thu, 29 Sep 2022 07:07:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 086CBC15BA8;
	Thu, 29 Sep 2022 07:07:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 72EAA1946A6C;
	Thu, 29 Sep 2022 07:07:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4260319465B5
 for <linux-lvm@listman.corp.redhat.com>; Wed, 28 Sep 2022 15:16:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2F96A40C6E16; Wed, 28 Sep 2022 15:16:57 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27EFD40C6E15
 for <linux-lvm@redhat.com>; Wed, 28 Sep 2022 15:16:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C7573817961
 for <linux-lvm@redhat.com>; Wed, 28 Sep 2022 15:16:57 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-28-0utaK0fMMEmMe6Q7N7_7sQ-1; Wed, 28 Sep 2022 11:16:54 -0400
X-MC-Unique: 0utaK0fMMEmMe6Q7N7_7sQ-1
Received: by mail-ej1-f42.google.com with SMTP id dv25so27762094ejb.12;
 Wed, 28 Sep 2022 08:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=DZmdHmiQ6nYBMNBfkKetVH4S0b4wzzQnkc1mHuxlmCw=;
 b=VbAEL9wB3dScg0XVw9XGG64ypzTO/ZwmzG01lxNIgtJzGlP6WpGe+ctJiVKEU/1hWa
 V3ez9dOkDEVXtB4LJuSnAsVJSVduX8b1SfcUQPXNttdC3I62O4gRQ4hprL8Tprv4ku3/
 gB9IicDsY4T6q7hADvK3XbuR39+wpkKRMdhSfDcKbw6L950uC9C3sg+qinJw9YinvRJz
 isACmouC3yeoolw87EuxKHbcJ5bAYx40STAOc1VndfNjbhL3L4KWBngThGVwa7HCSqJ4
 MTCiIBKbCRUqU/O0foHQGlf2cD7y1PuhH+xvn9sFnQzyfxZR4FkOTCIZee9aaYDjIWw/
 lxmA==
X-Gm-Message-State: ACrzQf3R+Om78zoPIcOqRnJ5Mu8JZ2TUqPu1cnqq7cAfjT/RkDOr2+QZ
 /yA9F8q1iZ28ylHy4jBV8u0pY3Torhy9zl1sZaB0LArIM5Y=
X-Google-Smtp-Source: AMsMyM4pH6qfHiL7wcrZOrc0vhLzh7RVAxhCz89NBJc5GusAIJ6KIa+0cdaqrAWWH4xmO4W+ZOIy7k7wrpQPu8RIq5c=
X-Received: by 2002:a17:907:701:b0:780:2c44:e4dd with SMTP id
 xb1-20020a170907070100b007802c44e4ddmr28201987ejb.589.1664378212993; Wed, 28
 Sep 2022 08:16:52 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?QmFydMWCb21pZWogQsWCYWNodXQ=?= <bartlomiejblachut@gmail.com>
Date: Wed, 28 Sep 2022 17:16:41 +0200
Message-ID: <CAPA01J3mh6G22h1938GYvPAZunah2Nv+HGikjBef05RBNHBj3w@mail.gmail.com>
To: linux-lvm@redhat.com, lvm-devel@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Thu, 29 Sep 2022 07:07:12 +0000
Subject: [linux-lvm] How to change default system dir
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============0124349720481681412=="

--===============0124349720481681412==
Content-Type: multipart/alternative; boundary="000000000000284ec205e9be40ef"

--000000000000284ec205e9be40ef
Content-Type: text/plain; charset="UTF-8"

Hi,
I have a question for you, because what I need is to change in my
ubuntu(22.04) the localisation of default-system-dir from /etc/lvm to a
place where I have write access e.g. /home/my_user/new_lvm_dir. I've tried
so far to provide to ./configure option
--with-default-system-dir=/home/my_user/new_lvm_dir or later I replace
everywhere in code pattern /etc/lvm to /home/my_user/new_lvm_dir but
without any success. Are you able to give me any idea how I can do it ?

I tried it on main/stable branches git://sourceware.org/git/lvm2.git

Cheers,
Bartek

--000000000000284ec205e9be40ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><span style=3D"caret-color: rgb(34, 34, 34); text-size=
-adjust: auto;">Hi,</span><div style=3D"caret-color: rgb(34, 34, 34); text-=
size-adjust: auto;">I have a question=C2=A0for you, because what I need is =
to change in my ubuntu(22.04) the localisation of default-system-dir from /=
etc/lvm to a place where I have write access e.g. /home/my_user/new_lvm_dir=
. I&#39;ve tried so far to provide to ./configure option --with-default-sys=
tem-dir=3D/home/my_user/new_lvm_dir or later I replace everywhere in code p=
attern /etc/lvm to /home/my_user/new_lvm_dir but without any success. Are y=
ou able to give me any idea how I can do it ?</div><div style=3D"caret-colo=
r: rgb(34, 34, 34); text-size-adjust: auto;"><br></div><div style=3D"caret-=
color: rgb(34, 34, 34); text-size-adjust: auto;">I tried it on main/stable =
branches<span style=3D"color:rgb(0,0,0);font-family:-webkit-standard;font-s=
ize:medium">=C2=A0git://<a href=3D"http://sourceware.org/git/lvm2.git">sour=
ceware.org/git/lvm2.git</a></span></div><div style=3D"caret-color: rgb(34, =
34, 34); text-size-adjust: auto;"><br></div><div style=3D"caret-color: rgb(=
34, 34, 34); text-size-adjust: auto;">Cheers,</div><div style=3D"caret-colo=
r: rgb(34, 34, 34); text-size-adjust: auto;">Bartek</div></div></div>

--000000000000284ec205e9be40ef--

--===============0124349720481681412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============0124349720481681412==--

