Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE243C433F5
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Mar 2022 17:08:38 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-vnKoGfCNM4mKgV3ogEqiuw-1; Wed, 09 Mar 2022 12:08:36 -0500
X-MC-Unique: vnKoGfCNM4mKgV3ogEqiuw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF70C899ED2;
	Wed,  9 Mar 2022 17:08:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 996AAC5094C;
	Wed,  9 Mar 2022 17:07:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 693CC1953544;
	Wed,  9 Mar 2022 17:07:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EA2031953540
 for <linux-lvm@listman.corp.redhat.com>; Wed,  9 Mar 2022 17:07:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C7C4741136F5; Wed,  9 Mar 2022 17:07:38 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C055341136EC
 for <linux-lvm@redhat.com>; Wed,  9 Mar 2022 17:07:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7B282A59562
 for <linux-lvm@redhat.com>; Wed,  9 Mar 2022 17:07:38 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-M5-KAuS7OSC2KN90sG4RWQ-1; Wed, 09 Mar 2022 12:07:36 -0500
X-MC-Unique: M5-KAuS7OSC2KN90sG4RWQ-1
Received: by mail-qk1-f174.google.com with SMTP id c7so2256148qka.7;
 Wed, 09 Mar 2022 09:07:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b4unNWV73LnuccQEs8/902/Nq2dRltKEy1ar/+8k9Uo=;
 b=EuOaAE9IsqLh256NGIQf5rWhzBon/e/f/6+XobdBUIMNGAVA2ma7Oku9zs7eLd2y+f
 JlwJi2ghdB8cnIwE+8DzH0CaNgpnlo1zHxeJcpnHZhyJ5zdkzZAj87Sul5JWbcWyJTqj
 w123EV7z9CAf+If3wJxrqmLP3+ZQtt0psJw7fSi8LjPzDrztrEHT9yewUXjEqdAMm/DH
 DP/uden9GvTjCWtZEOq+artIQ6yxB8rU8AlUpUH5Lo9X9hAEFrmd8urvkVB39N7lvzQI
 f9BaURxtfN9uVkdKk+WFUHa+kIqegy2ag1GYp0CPb1lePBWoYPGIxk9CQswsiFzy/cUa
 DxIw==
X-Gm-Message-State: AOAM532KlJfgo7+UicDk8ST9JCrgzP6iuu/MNhOzlit8scPRtnonRs0K
 PeZGV1nL06dAhZzv+hfqPqI0OHgeOTtegID9T43U7Ft0vF8=
X-Google-Smtp-Source: ABdhPJzfxe1FfZN9ogFpLXk+rpHMajZ9qn7FlupyiwaJWL8lQFdE6Tmz8XbfKKZBwPggJzoxCAvIZduX5wRcvn8abaY=
X-Received: by 2002:a05:620a:4545:b0:67b:14ce:ba7b with SMTP id
 u5-20020a05620a454500b0067b14ceba7bmr424956qkp.200.1646845655193; Wed, 09 Mar
 2022 09:07:35 -0800 (PST)
MIME-Version: 1.0
References: <38c190ac39c244d9442670589b7bfeb4f800383e.camel@suse.com>
 <20220309162711.GA5819@redhat.com>
In-Reply-To: <20220309162711.GA5819@redhat.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Wed, 9 Mar 2022 11:07:13 -0600
Message-ID: <CAAMCDedvvBpq3jt6A=+OruDpnwu5qsgRZbU+JFt3PSPq4L4WnQ@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [linux-lvm] LVM autoactivation and udev
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
Cc: Peter Rajnoha <prajnoha@redhat.com>, Martin Wilck <mwilck@suse.com>,
 Heming Zhao <heming.zhao@suse.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 9, 2022 at 10:35 AM David Teigland <teigland@redhat.com> wrote:
>

>
> - if all three of those don't catch it, then filter-mpath will also
>   check if the component wwid is listed in /etc/multipath/wwids and
>   ignore the device if it is.
>
> If all four of those methods fail to exclude a multipath component, then
> an LV could be activated using the component.  While this isn't good, it
> can be corrected by running lvchange --refresh.  I'd like to get any
> details of that happening to see if we can improve it.
>

I have also had luck with making sure multipath is in the initramfs,
and adding rd.lvm.vg=<rootvgnameneededforboot> on the kernel boot line
so that in the initramfs only the VG needed for boot up is started up
early inside the initramfs.      That has typically let multipathd
inside the initrd grab any other devices and configure them for
multipath before LVM  activates them.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

