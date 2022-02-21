Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D76C433F5
	for <linux-lvm@archiver.kernel.org>; Tue, 22 Feb 2022 09:35:56 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-knxJJ9I1N3CuNmkMbQ6bag-1; Tue, 22 Feb 2022 04:35:51 -0500
X-MC-Unique: knxJJ9I1N3CuNmkMbQ6bag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E6131800D50;
	Tue, 22 Feb 2022 09:35:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 29FBB67663;
	Tue, 22 Feb 2022 09:35:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 110F946F9A;
	Tue, 22 Feb 2022 09:35:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21LB0V2B001261 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 21 Feb 2022 06:00:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 07BB35361C4; Mon, 21 Feb 2022 11:00:31 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03AAF5361C0
	for <linux-lvm@redhat.com>; Mon, 21 Feb 2022 11:00:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEDB2185A7B2
	for <linux-lvm@redhat.com>; Mon, 21 Feb 2022 11:00:30 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
	[209.85.167.177]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-423-Hbd6ZOCTMPO_M4aF2sd2zA-1; Mon, 21 Feb 2022 06:00:28 -0500
X-MC-Unique: Hbd6ZOCTMPO_M4aF2sd2zA-1
Received: by mail-oi1-f177.google.com with SMTP id s5so10352605oic.10
	for <linux-lvm@redhat.com>; Mon, 21 Feb 2022 03:00:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=jgz5G+tC+mZjML8x3noZ1r8xXEwcPJ1ufteK1ak60s4=;
	b=662/LigaIWDK4Umr0sSoZQvLd45C18WdV2HUQ6TPiLGaNEZZ5W2B9aATkY1goo1c5P
	pCK9jPtoHQG5nL49prGhDIboc0bpk9zu41TpnClFSLqRBoHbo8093gkr6Sr6G6eHow3B
	B3p2/g5CZYlNdw4xlLdTuEWyCsJyF4MKRVNQSce411oMuqSk8ZI8COjrmRmYIdXg7j/5
	5m24fYIeApA+3JIlfUHXEu5Q77NPTK4oUgZNP+cxZpuk2g1tVm4VNB96FYVWvm4LK7a+
	qQ3qhhYE3u7KMEQBAA6t/jc9bvCai3KZTccfiIdDYClyWPkoB2bMQnxz12K7lW43QarP
	0DqQ==
X-Gm-Message-State: AOAM531WuoyVCUXnlW4WGGo+rjQkaylE9ugi3v7n+GOQ/0BHpBmQFeZc
	JFAFiGpP3yjIouvZC3BBaCSKQxRuYnu+a9Sc6o7QnKwbuA5r8VCBntY=
X-Google-Smtp-Source: ABdhPJwmB7Lf9Uxryb6ZZuGZz9+EE0D27g66zD6LQEkAd+fKwRUJD5aITDTOAPqTxWZ+gAhueJsOoRNH3hCA3DNJ1Rw=
X-Received: by 2002:a05:6808:2110:b0:2d4:4137:b4fc with SMTP id
	r16-20020a056808211000b002d44137b4fcmr10735150oiw.111.1645441227797;
	Mon, 21 Feb 2022 03:00:27 -0800 (PST)
MIME-Version: 1.0
From: Gk Gk <ygk.kmr@gmail.com>
Date: Mon, 21 Feb 2022 16:30:14 +0530
Message-ID: <CAJreVFzLbOzu2Qx=0kecE+y0TU7jdvxKXXRwC3J4EAFYOYJkZA@mail.gmail.com>
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Tue, 22 Feb 2022 04:35:22 -0500
Subject: [linux-lvm] Need information
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
Content-Type: multipart/mixed; boundary="===============2964737706811405064=="

--===============2964737706811405064==
Content-Type: multipart/alternative; boundary="000000000000e1b95505d8852348"

--000000000000e1b95505d8852348
Content-Type: text/plain; charset="UTF-8"

Hi,

I work on cloud platforms and linux. I need some guidance with an issue
observed with LVM.

How to forcefully kill a running lvm command like lvcreate ? I tried using
kill -9 but it is not killing it. Only a reboot seems to does the trick.
How to forcefully kill the lvcreate process or for that matter any running
lvm commands ?

Also how to check the progress of an lvm command like lvcreate or lvremove ?

Thanks
Kumar

--000000000000e1b95505d8852348
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div>Hi,</div><div><br></div><div>I work on cloud platforms and linux. I need some guidance with an issue observed with LVM.</div><div><br></div><div>How to forcefully kill a running lvm command like lvcreate ? I tried 
using kill -9  but it is not killing it. Only a reboot seems to does the 
trick. How to forcefully kill the
lvcreate process or for that matter any running lvm commands ? <br></div><div><br></div><div>Also how 
to check the progress of an lvm command like lvcreate or lvremove ?</div><div><br></div><div>Thanks</div><div>Kumar<br></div></div>

--000000000000e1b95505d8852348--

--===============2964737706811405064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============2964737706811405064==--

