Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D72C00140
	for <linux-lvm@archiver.kernel.org>; Mon,  8 Aug 2022 10:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659956283;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JjaCOVsQ/OE59wOdqe6k+EbuUMnd2T1O917mta/5kmE=;
	b=XqBREE1D2IErqRuBn2MJJ1y16Kf806Nsg7ZYI9ymtcGBkEPDB88GKu5zTqRw0hPzK8Rg69
	Yiu1Qxs+DwSj5zqPZ5tKtna6qCrmPrIpcdewA8M3DVjvhdWYBLtwYYfCa7lXEnEEwQQFvf
	Pac6JBR3igZWHfIk0SPiO+iAQC6z6nU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155-J8Lu4ylaMzWaqSfEmjH-eg-1; Mon, 08 Aug 2022 06:58:00 -0400
X-MC-Unique: J8Lu4ylaMzWaqSfEmjH-eg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A26D8041B5;
	Mon,  8 Aug 2022 10:57:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5BF561121315;
	Mon,  8 Aug 2022 10:57:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 34E2E1946A55;
	Mon,  8 Aug 2022 10:57:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F0E2E1946A49
 for <linux-lvm@listman.corp.redhat.com>; Mon,  8 Aug 2022 10:57:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E3A8F1415125; Mon,  8 Aug 2022 10:57:51 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFCE3140EBE3
 for <linux-lvm@redhat.com>; Mon,  8 Aug 2022 10:57:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C68048037B3
 for <linux-lvm@redhat.com>; Mon,  8 Aug 2022 10:57:51 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-dqvZ3YvmPZGzRCuCDmZJ1w-1; Mon, 08 Aug 2022 06:57:50 -0400
X-MC-Unique: dqvZ3YvmPZGzRCuCDmZJ1w-1
Received: by mail-ej1-f45.google.com with SMTP id m4so15893364ejr.3
 for <linux-lvm@redhat.com>; Mon, 08 Aug 2022 03:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=GFHejBGYp/2X6QY9N8t3w7M7l1wGGH+ItPArLRhhGQs=;
 b=GtV5bj3bIMNKPEGNqlVRwH7b1CygGGHu/F7ZCTnNeUeB8RLLepfo1VCxoCBncO6ik1
 IxIC14mS0t64wEp5hmf/4/eYKYUiRco7Hju94y89pCmN9u3IhtFNz64LhfuS+rQiThsx
 loFMQsHhTYI7ooUoHmCQBVtu5qoomXLlwGj+Gt2Z1uo3bQ+EQj/vC4zPCSTrE66QTVif
 DkpHrxRXYOd91Zw2NpRVAPxl73as0uT5Vd7oZ2dssb2uhYVPvA8I30jjp4jxltyfV+kj
 5k7r46Meh5fUwA7a33kDTkoz2zvgbT2LJQ6hvW+T3MQ2M4Zn9v1uK1qAzKyhC4GnSFYC
 QIEA==
X-Gm-Message-State: ACgBeo2/lyuk6NCSDegGnqlU/INGpXiyfjQF3BsTDiFCJtL+c9JIUezX
 R1vlpsuJzOt1Coht2c6DPieRMMdX628=
X-Google-Smtp-Source: AA6agR52aT5Gw4OTSrxbfn2eGMO00/YAGscfZXidUGX7YQB7iA6O12AiTlvixHUkWmc0LJ3O3I4gzA==
X-Received: by 2002:a17:907:3e21:b0:730:92bb:7fcd with SMTP id
 hp33-20020a1709073e2100b0073092bb7fcdmr13282861ejc.170.1659956269051; 
 Mon, 08 Aug 2022 03:57:49 -0700 (PDT)
Received: from [192.168.0.99] ([83.148.32.207])
 by smtp.gmail.com with ESMTPSA id
 rp12-20020a170906d96c00b00731747c3107sm577186ejb.73.2022.08.08.03.57.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 03:57:48 -0700 (PDT)
Message-ID: <05af76bc-f2e5-e048-4cee-046a7a3fff6c@gmail.com>
Date: Mon, 8 Aug 2022 12:57:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
To: cd <cd@terminal.space>,
 LVM general discussion and development <linux-lvm@redhat.com>
References: <37yG0UFnzHTZ7-GIuAOuBTpDHSZJcVJ4ptbi_8EqOtSEECEfjYVz6XXafSGqH7Xh2NeCgynDhaXOdwakzIZp4WN-nGyyXmky3nZu2IP-5Jg=@terminal.space>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <37yG0UFnzHTZ7-GIuAOuBTpDHSZJcVJ4ptbi_8EqOtSEECEfjYVz6XXafSGqH7Xh2NeCgynDhaXOdwakzIZp4WN-nGyyXmky3nZu2IP-5Jg=@terminal.space>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 07. 08. 22 v 22:38 cd napsal(a):
> Hello,
> 
> I have created some scripts which runs in the initramfs during the boot process. Very specifically, it's an initcpio runtime hook https://man.archlinux.org/man/mkinitcpio.8#ABOUT_RUNTIME_HOOKS
> Question: Is this a supported environment which to create/restore snapshots?
> 
> When my script runs lvm lvconvert --merge testvg/lvmautosnap-root-1659902622-good
> it appears to succeed (exit code is 0, and the restore appears to work properly). However, the following warnings appear in stderr as part of the restore process:
> 
> /usr/bin/dmeventd: stat failed: No such file or directory
> WARNING: Failed to unmonitor testvg/lvmautosnap-root-1659902622-good.
> /usr/bin/dmeventd: stat failed: No such file or directory

Hi

Your initramfs likely needs to contain  'modified' version of your system's 
lvm.conf where 'monitoring'  will be disabled  (set to 0) - as you do not want 
to start your monitoring while you are operating in your ramdisk.

Once you flip to your rootfs with your regular /etc/lvm/lvm.conf  - you need 
to start monitoring of you activated LVs  (vgchange --monitor y)

> Merging of volume testvg/lvmautosnap-root-1659902622-good started.
> /run/lvm/lvmpolld.socket: connect failed: No such file or directory

Again a thing you do not want to run in your ramdisk - lvmpolld is another 
service/daemon you should run while you are in your rootfs.

fully removed.
> 
> And I get similar errors when trying to create new volumes with lvm lvcreate --permission=r --snapshot --monitor n --name my_snapshot
>   /usr/bin/dmeventd: stat failed: No such file or directory
> 
> In summary, I'm happy to just ignore the warning messages. I just want to make sure I'm not risking the integrity of the lvm volumes by modifying them during this part of the boot process.

It looks like you are trying to do something in your ramdisk you really should 
be doing once you flip to your rootfs  -   ramdisk is purely meant to be used 
to  get things  'booting' and flip to rootfs  ASAP -  doing things in your 
ramdisk which is really not a 'working environment'  sounds like you are 
asking yourself  for some big troubles with resolving error paths  (i.e. using 
unmonitored devices like 'snapshot/mirror/raids/thin...' for longer period of 
time is simply 'bad design/plan' - switch to rootfs should happen quickly 
after you initiate things in your initramdfs...

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

