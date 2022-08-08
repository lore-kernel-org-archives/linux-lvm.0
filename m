Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3880DC00140
	for <linux-lvm@archiver.kernel.org>; Mon,  8 Aug 2022 19:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659986282;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rt5TT8tNt3SWzomMuyqW1ubCKD0+/CZNEWc7w1bCfL0=;
	b=jG3Jqv9zo6cehRszsJeX8PcWUTwarBkN65iIcvRKmGE3qHDRw6dQCpduPidh2PxIOyv7Y6
	J7FXfsJLT8l9luTdK/xPaK02aW8MCyLcFYQnRc/ivN0OJUDE4TUvsyOSPD3TaWK+QcwgYH
	JZM5cWEXwLfvvUyYBbbTkJL31Si7G4M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-wgu4EjYoM0C5TcxHnW8OLQ-1; Mon, 08 Aug 2022 15:17:58 -0400
X-MC-Unique: wgu4EjYoM0C5TcxHnW8OLQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D00B31019C93;
	Mon,  8 Aug 2022 19:17:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9F311400E403;
	Mon,  8 Aug 2022 19:17:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 666B21946A55;
	Mon,  8 Aug 2022 19:17:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9B25F1946A49
 for <linux-lvm@listman.corp.redhat.com>; Mon,  8 Aug 2022 19:17:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7E4FF492CA2; Mon,  8 Aug 2022 19:17:52 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AC57492C3B
 for <linux-lvm@redhat.com>; Mon,  8 Aug 2022 19:17:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62509801585
 for <linux-lvm@redhat.com>; Mon,  8 Aug 2022 19:17:52 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-u29m2v9bPeGEVMqKxcPTHw-1; Mon, 08 Aug 2022 15:17:50 -0400
X-MC-Unique: u29m2v9bPeGEVMqKxcPTHw-1
Received: by mail-ed1-f43.google.com with SMTP id z2so12594582edc.1
 for <linux-lvm@redhat.com>; Mon, 08 Aug 2022 12:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Ja0oA1YwvZEZ8APt+7iTce7a/MxkjYZ8STPQFsNNKJQ=;
 b=AKJ2plAYUSce++FwkaR7EqZbJofKkoTYGFxkfF95drwm8T/WlMQAalyCthEybGRPgs
 HnC7pFGjUHuMHQfP5kKgLC3N5zgLl/6E0fmWfWssWZUQA/pAwmQ6viRObMrWSWErw2j1
 uFLv+1JnYVBsBnG9K6Atc8sl3rR/YiaN7I5CGQgx2FFPNmV/wHwd+7rbeMcc6YWOUmU1
 mThkh+RZc/MvH1arO4UtIA06ZcGxDAQpoEFxIg6fZATAd5IKM5wzWxKRv/Qheov8X5J9
 ZVxsoE/rBUPrqYNoHIjIGG7UiJSQXuWt4KkZq1NOnCn9TyDfm9zN+H58mukM5TdPWA0+
 VB4A==
X-Gm-Message-State: ACgBeo32SD1rz+InE+OqenxlcA2S5/sUy/qqeLEycQxuJLJHnHi5KgD4
 QH6cQWa8dHvFkFuyTZqfSWNwhnFn718=
X-Google-Smtp-Source: AA6agR6hvU8rZR6XiNX4QJlB2Rl2OU6w3qEjGtRyEUxdbH5S2Cbh42oxFd+4wLkD6XZzT6FurThiAA==
X-Received: by 2002:a05:6402:5110:b0:440:4cb1:c137 with SMTP id
 m16-20020a056402511000b004404cb1c137mr12756494edd.262.1659986268693; 
 Mon, 08 Aug 2022 12:17:48 -0700 (PDT)
Received: from [192.168.0.99] ([83.148.32.207])
 by smtp.gmail.com with ESMTPSA id
 d23-20020a05640208d700b0043a7134b381sm4920922edz.11.2022.08.08.12.17.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 12:17:48 -0700 (PDT)
Message-ID: <4ca106e2-0f5d-e56e-6ab7-fb0a7538f944@gmail.com>
Date: Mon, 8 Aug 2022 21:17:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
To: cd <cd@terminal.space>
References: <37yG0UFnzHTZ7-GIuAOuBTpDHSZJcVJ4ptbi_8EqOtSEECEfjYVz6XXafSGqH7Xh2NeCgynDhaXOdwakzIZp4WN-nGyyXmky3nZu2IP-5Jg=@terminal.space>
 <05af76bc-f2e5-e048-4cee-046a7a3fff6c@gmail.com>
 <DsA-kai9sqaBsEnyYy0G8i3RWSSTHr2ww3B8Q6RtQSVh1uULit6cXAZC0dOf3GkwGBUwL8ievZojvSe1d5enC2pzSDBNTJzmWvPnDZ6Zbcg=@terminal.space>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <DsA-kai9sqaBsEnyYy0G8i3RWSSTHr2ww3B8Q6RtQSVh1uULit6cXAZC0dOf3GkwGBUwL8ievZojvSe1d5enC2pzSDBNTJzmWvPnDZ6Zbcg=@terminal.space>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [linux-lvm] Creating/restoring snapshots in early userspace
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 08. 08. 22 v 20:14 cd napsal(a):
>>
>>
>> Dne 07. 08. 22 v 22:38 cd napsal(a):
>>
>>> Hello,
>>>
>>> I have created some scripts which runs in the initramfs during the boot process. Very specifically, it's an initcpio runtime hook https://man.archlinux.org/man/mkinitcpio.8#ABOUT_RUNTIME_HOOKS
>>> Question: Is this a supported environment which to create/restore snapshots?
>>>
>>> When my script runs lvm lvconvert --merge testvg/lvmautosnap-root-1659902622-good
>>> it appears to succeed (exit code is 0, and the restore appears to work properly). However, the following warnings appear in stderr as part of the restore process:
>>>
>>> /usr/bin/dmeventd: stat failed: No such file or directory
>>> WARNING: Failed to unmonitor testvg/lvmautosnap-root-1659902622-good.
>>> /usr/bin/dmeventd: stat failed: No such file or directory
>>
>>
>> Hi
>>
>> Your initramfs likely needs to contain 'modified' version of your system's
>> lvm.conf where 'monitoring' will be disabled (set to 0) - as you do not want
>> to start your monitoring while you are operating in your ramdisk.
>>
>> Once you flip to your rootfs with your regular /etc/lvm/lvm.conf - you need
>> to start monitoring of you activated LVs (vgchange --monitor y)
>>
>>> Merging of volume testvg/lvmautosnap-root-1659902622-good started.
>>> /run/lvm/lvmpolld.socket: connect failed: No such file or directory
>>
>>
>> Again a thing you do not want to run in your ramdisk - lvmpolld is another
>> service/daemon you should run while you are in your rootfs.
>>
>> fully removed.
>>
>>> And I get similar errors when trying to create new volumes with lvm lvcreate --permission=r --snapshot --monitor n --name my_snapshot
>>> /usr/bin/dmeventd: stat failed: No such file or directory
>>>
>>> In summary, I'm happy to just ignore the warning messages. I just want to make sure I'm not risking the integrity of the lvm volumes by modifying them during this part of the boot process.
>>
>>
>> It looks like you are trying to do something in your ramdisk you really should
>> be doing once you flip to your rootfs - ramdisk is purely meant to be used
>> to get things 'booting' and flip to rootfs ASAP - doing things in your
>> ramdisk which is really not a 'working environment' sounds like you are
>> asking yourself for some big troubles with resolving error paths (i.e. using
>> unmonitored devices like 'snapshot/mirror/raids/thin...' for longer period of
>> time is simply 'bad design/plan' - switch to rootfs should happen quickly
>> after you initiate things in your initramdfs...
>>
>> Regards
>>
>> Zdenek
> 
> Thanks for the insightful response. Indeed, setting monitoring = 0 in lvm.conf makes the warning messages go away. Interestingly, on arch, the initcpio hook for lvm2 _does_ attempt to set this setting:
> with sed -i '/^\smonitoring =/s/1/0/' "${BUILDROOT}/etc/lvm/lvm.conf"
> https://github.com/archlinux/svntogit-packages/blob/packages/lvm2/trunk/lvm2_install#L38
> 
> However, the sed pattern fails to match because the line is commented out in lvm.conf.
> I've filed a bug with arch to address this: https://bugs.archlinux.org/task/75552?project=1&string=lvm2
> 

Yep - I think there was a similar issue with Dracut.
It's the side-effect result of making most of default settings as 'commented' 
- then this scripts stopped to work in such case.

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

