Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B26C4167B
	for <linux-lvm@archiver.kernel.org>; Mon,  2 Jan 2023 07:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672645447;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=G6BEy8boHG1Kz1VPSPaNgi9EwPLLvymXWU2+ylxpYbo=;
	b=CyI6E6PAs1McZVdyw6oq91Wpk5qyiEY8PdeRXh9BBBhXOAu0TnPhtipWL1TWcgWJGpJajO
	gYVn2qOnBAZnv8GCxOY7t6xKFk5Y2F+32D5TKbCalIapcY/x63gsn5xaLjv4Rb7tuf7/F8
	W3ODZyWTavNm83HWH7tmyAMW5sQL/oM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-bar2wlW1M2av3lvET4CvAQ-1; Mon, 02 Jan 2023 02:44:04 -0500
X-MC-Unique: bar2wlW1M2av3lvET4CvAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 841CE811E6E;
	Mon,  2 Jan 2023 07:44:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 87AAC2166B26;
	Mon,  2 Jan 2023 07:43:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 68CB61946589;
	Mon,  2 Jan 2023 07:43:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EC5B019465A8
 for <linux-lvm@listman.corp.redhat.com>; Thu, 22 Dec 2022 17:01:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 18453492C18; Thu, 22 Dec 2022 17:01:10 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11092492C14
 for <linux-lvm@redhat.com>; Thu, 22 Dec 2022 17:01:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E494D196EF88
 for <linux-lvm@redhat.com>; Thu, 22 Dec 2022 17:01:09 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-445-_vOQh6-COrqjzOseiRFsnQ-1; Thu, 22 Dec 2022 12:01:07 -0500
X-MC-Unique: _vOQh6-COrqjzOseiRFsnQ-1
Received: by mail-lj1-f170.google.com with SMTP id f20so2513742lja.4
 for <linux-lvm@redhat.com>; Thu, 22 Dec 2022 09:01:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h6o1vSNYD+dMQ7ht/2AN3UELtgn37XJEJJiNAP9MNRE=;
 b=pG8sE46mSvwAZcr0aEUigzbzr6ZbXTc/LUxIZZ5NesgSKBraOb9NBS8S/mY78m5Arj
 VYIqirlFADw/78Qxiw5Igv3dWIYDx6myFphhoywgF0uwAg7T+9PszQTEfbQrFNog6i0S
 a0t1QrDaMoTj0h/qAjpx5FpBzS2WAwopZzkQe4by/bdAa5+F8hesIt5+1EgvTeGC60yO
 kjkhKdzljjvemthiyVramhH5vxeQO89nhtqe2sdQdMrk23kd1q49pERt51boMUkH+igS
 0/qzXUTc3G3f84OVbCFwvdCuvSYSQRr0FOLgoJTr4OuHjmOkshxD6pJMEAEW/29JFw/M
 kYPQ==
X-Gm-Message-State: AFqh2krycMDoUUWk2/JowVsaIWtSJdg/GbM12rC65gt/RDNWQ9/1AUax
 J811gHNXBzXydJmo2HCGJEBMpkOZ9+eIcMnBMz11qlM2FMQ=
X-Google-Smtp-Source: AMrXdXvEwhDY8bOzSzjg5b71/orbUek0M3417qU502wnSssRoEeL1Orw9eU+zlkHL5cx6wUi/e9ropOm7UZb675hLYE=
X-Received: by 2002:a05:651c:312:b0:27f:8b85:4aaa with SMTP id
 a18-20020a05651c031200b0027f8b854aaamr303232ljp.284.1671728465374; Thu, 22
 Dec 2022 09:01:05 -0800 (PST)
MIME-Version: 1.0
From: Robert Osowiecki <robert.osowiecki@gmail.com>
Date: Thu, 22 Dec 2022 18:00:53 +0100
Message-ID: <CAPgkq_Xzz9XaburH7EzCmsZDXqdOuEtO-Exs285uSMz4P67eAw@mail.gmail.com>
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Mon, 02 Jan 2023 07:43:55 +0000
Subject: [linux-lvm] Trouble with balancing physical volumes with pvmove
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============8175191597409102032=="

--===============8175191597409102032==
Content-Type: multipart/alternative; boundary="00000000000056f00805f06d9d71"

--00000000000056f00805f06d9d71
Content-Type: text/plain; charset="UTF-8"

Dear LVM list,

I had several PV's with mainly raid10 volumes. When one of them failed, I
was able to recover with lvconvert --repair.

After failed PV was replaced, it left me with a couple of filled up almost
to 100% PV's and one 100% free. I'd like to create more raid10 volumes, but
I'm unable to free any space...

The following command (extents range cover one of rimage_N volumes) was
only successful for one "meta" and one "rimage_0", but in all other cases
fails like:

[root@chimera ~]# pvmove /dev/sdg:0-15359 /dev/sdh
  Insufficient free space: 15360 extents needed, but only 0 available
  Unable to allocate mirror extents for vgkvm/pvmove0.
  Failed to convert pvmove LV to mirrored.

Why? There's certainly lots of free space on /dev/sdh, it's almost free!

I don't want to be forced to use only linear volumes from now... please
help!

--00000000000056f00805f06d9d71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Dear LVM list,<br><br></div>I had several P=
V&#39;s with mainly raid10 volumes. When one of them failed, I was able to =
recover with lvconvert --repair.<br><br></div>After failed PV was replaced,=
 it left me with a couple of filled up almost to 100% PV&#39;s and one 100%=
 free. I&#39;d like to create more raid10 volumes, but I&#39;m unable to fr=
ee any space...<br><br></div>The following command (extents range cover one=
 of rimage_N volumes) was only successful for one &quot;meta&quot; and one =
&quot;rimage_0&quot;, but in all other cases fails like:<br><br>[root@chime=
ra ~]# pvmove /dev/sdg:0-15359 /dev/sdh<br>=C2=A0 Insufficient free space: =
15360 extents needed, but only 0 available<br>=C2=A0 Unable to allocate mir=
ror extents for vgkvm/pvmove0.<br><div>=C2=A0 Failed to convert pvmove LV t=
o mirrored.</div><div><br></div><div>Why? There&#39;s certainly lots of fre=
e space on /dev/sdh, it&#39;s almost free!<br><br></div><div>I don&#39;t wa=
nt to be forced to use only linear volumes from now... please help!<br></di=
v></div>

--00000000000056f00805f06d9d71--

--===============8175191597409102032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============8175191597409102032==--

