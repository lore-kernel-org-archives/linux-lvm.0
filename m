Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30009C433F5
	for <linux-lvm@archiver.kernel.org>; Mon,  4 Apr 2022 08:14:25 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-LHinYXRMP6mtsyO-uuB_Ng-1; Mon, 04 Apr 2022 04:14:23 -0400
X-MC-Unique: LHinYXRMP6mtsyO-uuB_Ng-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8CCF3800E82;
	Mon,  4 Apr 2022 08:14:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2C8DA4428E5;
	Mon,  4 Apr 2022 08:13:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AE9DA1940363;
	Mon,  4 Apr 2022 08:13:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4396B19451EC
 for <linux-lvm@listman.corp.redhat.com>; Mon,  4 Apr 2022 08:13:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F0B904428E7; Mon,  4 Apr 2022 08:13:45 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECF8C4428E5
 for <linux-lvm@redhat.com>; Mon,  4 Apr 2022 08:13:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5C788002BF
 for <linux-lvm@redhat.com>; Mon,  4 Apr 2022 08:13:45 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-PdrEuZxvOoegooMFZjw0mQ-1; Mon, 04 Apr 2022 04:13:36 -0400
X-MC-Unique: PdrEuZxvOoegooMFZjw0mQ-1
Received: by mail-ej1-f52.google.com with SMTP id bg10so18211502ejb.4
 for <linux-lvm@redhat.com>; Mon, 04 Apr 2022 01:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xLkGnMCwZd9prdPdh3fos9j1zK8fNW66ITVEJh+xXhY=;
 b=NYxbhAV1YQheMewNwGWX2dnbyZqLmgD+HSnGaMviN+C1VOT+Pwj5MaG1ZI2BOvTD8L
 3YsSKSprNJq9jEt5X9vkYh9HopfM7KJ4yfHVKEpPHN8eh2VT2TW8oz1U+YvrjZUlLx0r
 grI0PC8N/i923sglL6mtW9C+868rXVcyhcACPtYR91nqUpl4QPhgThFkRP7TldIzP7IL
 l5g+nX+fWaSBPqb/XTklIBvYxVdydUVosXj0WnpqWkozD5/FSgEeVV0uJx34lb4ND5Uo
 M0oRmhmHd17FX4TaMZPQwxrF9nSHGSkWskBZfesnz16aA7dYMseTGUHIVveMjyBP8b7U
 i+fw==
X-Gm-Message-State: AOAM531re8EAep9XctDUXq7eCKyhEO9m/BYJk0nUugYBLuX4uqyMy1vO
 +60dJFZTn1Mo2y6teX9JkHbCWEeVMAP/UQ==
X-Google-Smtp-Source: ABdhPJx8WfFBnz6gGb7H9I8/G90qAq1hbFzH6BcwMsClPLT8tferfc6Vo+yImnCg3XE+W1JahgCkow==
X-Received: by 2002:a17:906:a2d9:b0:6df:b8c9:e694 with SMTP id
 by25-20020a170906a2d900b006dfb8c9e694mr9884349ejb.448.1649060015149; 
 Mon, 04 Apr 2022 01:13:35 -0700 (PDT)
Received: from [192.168.0.99] ([83.148.32.207])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a170906648700b006e7f08fe590sm983083ejm.198.2022.04.04.01.13.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 01:13:34 -0700 (PDT)
Message-ID: <f4280579-eba9-ece2-4f5d-af0bf32fce8d@gmail.com>
Date: Mon, 4 Apr 2022 10:13:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>
References: <YkeIb0Lq37D+OtQL@itl-email>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <YkeIb0Lq37D+OtQL@itl-email>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [linux-lvm] Safety of DM_DISABLE_UDEV=1 and --noudevsync
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 02. 04. 22 v 1:19 Demi Marie Obenour napsal(a):
> Under what circumstances are DM_DISABLE_UDEV=1 and --noudevsync safe?
> In Qubes OS, for example, I am considering using one or both of these,
> but only for operations performed by qubesd.  systemd-udevd will still
> be running, but it will be told to create no symlinks for the devices
> these commands create or destroy.  systemd-udevd will still be in charge
> of other devices, however, and other lvm2 commands may run that use
> neither of these.

This env variable is not meant to be use on system with running udev.

So it's never safe - and it's only purpose is to be able to make some progress 
in some critical system condition.

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

