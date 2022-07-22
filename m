Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F95C43334
	for <linux-lvm@archiver.kernel.org>; Tue, 26 Jul 2022 08:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658823372;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=7imuN/gNqU8EuO6YQWz51+/R9Nra8KigJ1JbhBngEi0=;
	b=Nh3PltBVWKuAzLW87fZDY7d4IBXns9jdhz0rIZ6Gbgzr3s/lkHkXLaFi5D8M9HErXilyEM
	sfcVcsEFSrxRdcZAJ6daoT0kXQkeGjAIiHnmV5MB2fh/eFBqQy30HOjJ9PvAx4Yao+UYc2
	yQrAz8AkKODGy5bescTcXmzraA9ezfw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-FD5L-elYNH2Tny2QOrf0Rw-1; Tue, 26 Jul 2022 04:16:09 -0400
X-MC-Unique: FD5L-elYNH2Tny2QOrf0Rw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B10E29AB3EC;
	Tue, 26 Jul 2022 08:16:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F39EF2166B26;
	Tue, 26 Jul 2022 08:16:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 020C81945D8F;
	Tue, 26 Jul 2022 08:16:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4AE751947049
 for <linux-lvm@listman.corp.redhat.com>; Fri, 22 Jul 2022 17:31:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 19821492C3B; Fri, 22 Jul 2022 17:31:18 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15B3F492CA5
 for <linux-lvm@redhat.com>; Fri, 22 Jul 2022 17:31:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFD10101A586
 for <linux-lvm@redhat.com>; Fri, 22 Jul 2022 17:31:17 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-yoLZZs_ZOeWQuJKItTMK0Q-1; Fri, 22 Jul 2022 13:31:05 -0400
X-MC-Unique: yoLZZs_ZOeWQuJKItTMK0Q-1
Received: by mail-qv1-f48.google.com with SMTP id y18so3915753qvo.11
 for <linux-lvm@redhat.com>; Fri, 22 Jul 2022 10:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=sOAMOZRzILR93o787Lj24yCD+6ZDMdI01642QY7B9u8=;
 b=3ZoxS27TQGCql8P1+J9TtCgTWYaCKbgAvBOi8NGWznDzZoRRg+Wgv57oPLWlWdbqYn
 S08IkoJpP5ccPw+YrZ2BT+e+GPYF8yj3AhOK917YtC9sW2r28PCso30LnilwuZeSe2Kw
 36guP0WBihwW+o/v/e2MZaQoKUrIrlaW1oeOv42ElURgkSGJM6XN3UFUXRJC6HIu89yO
 hUmK7QgwKEJ86fU1kkihrX641Fj5FDRSbgbWJYbu6snjmXk1gYVL53vDuJwkj8z4+tNC
 hBcvLnjVfnb3qeml6Er8D+XeH+p02dzZm3QmjjrQYZEhwP6erYAAFhYUsS6GsyiCemWq
 UiAw==
X-Gm-Message-State: AJIora/XyTQM9JctVS2YSDqC/s8zXVzteCGgESUKfsPU1B6L8exnm7sg
 5UWk5crfVj9tDE7pMacti47XwRG9W0ZBHdIrvWOAD219SiA=
X-Google-Smtp-Source: AGRyM1uGGx0mOzsuJyQWbYmSNWc7kVOo7kQ/5XR9cVymh6u5NwAs7E+QTzNkRYV5xqGitqD/fs50jQMW60h3pTJwIDw=
X-Received: by 2002:a05:6214:2aaa:b0:473:650f:7c38 with SMTP id
 js10-20020a0562142aaa00b00473650f7c38mr755934qvb.19.1658511064086; Fri, 22
 Jul 2022 10:31:04 -0700 (PDT)
MIME-Version: 1.0
From: Marcin Owsiany <marcin@owsiany.pl>
Date: Fri, 22 Jul 2022 19:30:53 +0200
Message-ID: <CAFsGsxLOyawZH7xxgfLNkh=VftBNAaDStE0XQgQTGf9NmyZ+ZQ@mail.gmail.com>
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mailman-Approved-At: Tue, 26 Jul 2022 08:15:59 +0000
Subject: [linux-lvm] Where are the data blocks of an LV?
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============0312520799226397058=="

--===============0312520799226397058==
Content-Type: multipart/alternative; boundary="000000000000d4d23305e46832bd"

--000000000000d4d23305e46832bd
Content-Type: text/plain; charset="UTF-8"

Hello,

I know that it is possible to find where a given logical volume's extents
start on a PVs thanks to the information printed by lvdisplay --maps.

I was also able to experimentally establish that the actual data of an LV
starts one megabyte after that location. Is that offset documented
anywhere, or can I somehow discover it at runtime for a given LV?

regards,
Marcin

--000000000000d4d23305e46832bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello,<div dir=3D"auto"><br></div><div dir=3D"auto">I kno=
w that it is possible to find where a given logical volume&#39;s extents st=
art on a PVs thanks to the information printed by lvdisplay --maps.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">I was also able to experimental=
ly establish that the actual data of an LV starts one megabyte after that l=
ocation. Is that offset documented anywhere, or can I somehow discover it a=
t runtime for a given LV?</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">regards,</div><div dir=3D"auto">Marcin</div></div>

--000000000000d4d23305e46832bd--

--===============0312520799226397058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============0312520799226397058==--

