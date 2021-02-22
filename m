Return-Path: <SRS0=nYqM=HY=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B17C433DB
	for <linux-lvm@archiver.kernel.org>; Mon, 22 Feb 2021 08:52:28 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3D0164E77
	for <linux-lvm@archiver.kernel.org>; Mon, 22 Feb 2021 08:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3D0164E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=glassboard.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-5vJ60mzoP0qTe6ixH8YgQg-1; Mon, 22 Feb 2021 03:52:22 -0500
X-MC-Unique: 5vJ60mzoP0qTe6ixH8YgQg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58B8F18449E6;
	Mon, 22 Feb 2021 08:52:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAEB860C0F;
	Mon, 22 Feb 2021 08:52:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2194718095CC;
	Mon, 22 Feb 2021 08:52:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11M1PA7S016986 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 21 Feb 2021 20:25:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A4076200BD88; Mon, 22 Feb 2021 01:25:10 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E44B200BFCB
	for <linux-lvm@redhat.com>; Mon, 22 Feb 2021 01:25:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46F741022F0A
	for <linux-lvm@redhat.com>; Mon, 22 Feb 2021 01:25:08 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
	[209.85.221.169]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-340-3Z-SmkLBOxaaqe61C0eNSg-1; Sun, 21 Feb 2021 20:25:04 -0500
X-MC-Unique: 3Z-SmkLBOxaaqe61C0eNSg-1
Received: by mail-vk1-f169.google.com with SMTP id v66so2474758vkd.10
	for <linux-lvm@redhat.com>; Sun, 21 Feb 2021 17:25:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:message-id:from:date:subject:to;
	bh=Lz0pC6eSOnrULvJ5Mq5doJMdjOoEQgSP3TnVWlao9YM=;
	b=p9ztDwHItUWqPRdkOgzXULJohl90YxbsI0rBdA5TyxSgN0/46BFgd1QeWlszVL0Abh
	ZNncKHwCf+aPHORMcaS5vZZFH6oDwDmfz15U5KNiBvzzTDSDUsk8hL2NrGkHJEaBNflE
	m/TZbYlbFkbj2yUrk6H1OHS/gacgywe4e3++9fDib/ACk0IFUPGwY/hpvtK0A/nCrMHu
	tOmAhRGR86hrx1kF2OTYQT1EL2Qbqgy+FRrywUWc+u1seyf88Rrk5espsSCDTt0ObYRN
	8Sy9Hf9QlyXAJiwjfXX9H2qmbTtbfBB7MYqS3v8dx65daL9g0FRQlj8LGJLmoDbMFnVv
	XcKQ==
X-Gm-Message-State: AOAM531Cjkhw4S7ORsQbnGnTf4V9aam4thaF3UrD2XFC3VTO/OwxvcY8
	lYVTu745TBArKLLQ5wNXkxMpI5g1cKy39Q==
X-Google-Smtp-Source: ABdhPJzzvDBSqGk0ETXjz/ysKekh0ZSKj+cekCHwFMvueOgg4pIr639keRCqf1gWtgryyZRFYwct0g==
X-Received: by 2002:a05:6122:842:: with SMTP id 2mr1810267vkk.8.1613957103818; 
	Sun, 21 Feb 2021 17:25:03 -0800 (PST)
Received: from localhost (0.92.231.35.bc.googleusercontent.com. [35.231.92.0])
	by smtp.gmail.com with ESMTPSA id
	y17sm2193001uag.14.2021.02.21.17.25.03 for <linux-lvm@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 21 Feb 2021 17:25:03 -0800 (PST)
Mime-Version: 1.0
X-Superhuman-Draft-ID: draft00b1c5967a28328a
Message-ID: <klfw5jeh.707d078c-fbbf-4456-9f24-61435f1f79d3@we.are.superhuman.com>
X-Superhuman-ID: klfwdiix.18c5779e-c949-4eaf-8698-7988661a2e90
X-Superhuman-Thread-ID: draft003e1cf7486df2df
From: "Drew Westrick" <drewwestrick@glassboard.com>
Date: Mon, 22 Feb 2021 01:25:02 +0000
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Mon, 22 Feb 2021 03:50:14 -0500
Subject: [linux-lvm] Removing bash as a dependency
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============4108209824021431217=="

--===============4108209824021431217==
Content-Type: multipart/alternative;
	boundary=e8ccac55325ecc9e7cf716b32f5ff7d13fb86ac6b330cd37e7d451298ce6

--e8ccac55325ecc9e7cf716b32f5ff7d13fb86ac6b330cd37e7d451298ce6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

All,

I'm working on a project with a fairly strict no GPLv3 policy. While lvm2 i=
s fine since it is GPLv2, the lvm2 dependency on bash,=C2=A0which is GPLv3,=
 is causing a problem. It appears that bash is used mostly for test scripts=
 as well as lvmdump.sh ( http://lvmdump.sh/ ) and fsadm.sh ( http://fsadm.s=
h/ ). If we don't need to use those two utilities, would there be any other=
 major issues with removing bash a a dependency if I were to go down that p=
ath?

Regards,

Drew Westrick
--e8ccac55325ecc9e7cf716b32f5ff7d13fb86ac6b330cd37e7d451298ce6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div><div><div><div><div>All,<br/></div><div><br/>=
</div><div>I&#39;m working on a project with a fairly strict no GPLv3 polic=
y. While lvm2 is fine since it is GPLv2, the lvm2 dependency on bash,=C2=A0=
which is GPLv3, is causing a problem. It appears that bash is used mostly f=
or test scripts as well as <a href=3D"http://lvmdump.sh/">lvmdump.sh</a> an=
d=C2=A0<a href=3D"http://fsadm.sh/">fsadm.sh</a>. If we don&#39;t need to u=
se those two utilities, would there be any other major issues with removing=
 bash a a dependency if I were to go down that path?<br/></div><div><br/></=
div><div>Regards,<br/></div></div><br/><div class=3D"sh-signature"><div cla=
ss=3D"gmail_signature"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><di=
v dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr">=
<div dir=3D"ltr"><div><div>Drew Westrick<br/></div></div></div></div></div>=
</div></div></div></div></div></div></div></div></div></div></div></div><di=
v><br/></div></div><div><div style=3D"display: none; border: 0px; width: 0p=
x; height: 0px; overflow: hidden; visibility: hidden;"><img src=3D"https://=
r.superhuman.com/12nGChCjLNFqw-h9nr8QpGf4L_rwdZ7k4aZDRtF-sBmjJe8mEtCYJ1sN3y=
ia2UDzSoXHXmBecHBEdttshe8BgH-tq61dCp_BTjIyBq1YcfVdDlXhSNOPgSv3CYyrknn7GjMNQ=
TEPPEGQeLsTHYI19mQYAGNW37BaUfJG84YbgprOjvj628RjNQ.gif" alt=3D" " width=3D"1=
" height=3D"0" style=3D"display: none; border: 0px; width: 0px; height: 0px=
; overflow: hidden; visibility: hidden;"/><!--                             =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                     --></div></div></div></body></html>
--e8ccac55325ecc9e7cf716b32f5ff7d13fb86ac6b330cd37e7d451298ce6--

--===============4108209824021431217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============4108209824021431217==--

