Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A312EC2BB41
	for <linux-lvm@archiver.kernel.org>; Tue, 16 Aug 2022 09:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660643195;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zYNiqrRgMs1uvOXy8SEfP6xSqQdwztETJoupNgfsXOI=;
	b=TvW2qi4mXEJEi3CzXKjPkVFtijQE98pSa0IoKT4l6gOTF2e2BUTcvgw87YhDFllUMa+Ntf
	lawzkyMFxdngsg0Zmm/R7d50e6mBK0Kc2ZcSjvDrFzRCVjkrnCMl8aMMBA6AGwb17LVmBI
	CDk61Yc3W0F54ayIfCNX4vy5SLX/dvg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-TqF9h0QXP8ifo5xzAXSiog-1; Tue, 16 Aug 2022 05:46:31 -0400
X-MC-Unique: TqF9h0QXP8ifo5xzAXSiog-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8135729AB41A;
	Tue, 16 Aug 2022 09:46:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 23EE1403349;
	Tue, 16 Aug 2022 09:46:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C82571940352;
	Tue, 16 Aug 2022 09:46:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6068C1940350
 for <linux-lvm@listman.corp.redhat.com>; Tue, 16 Aug 2022 09:38:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 33682492CA5; Tue, 16 Aug 2022 09:38:57 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FA21492C3B
 for <linux-lvm@redhat.com>; Tue, 16 Aug 2022 09:38:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB10938149A5
 for <linux-lvm@redhat.com>; Tue, 16 Aug 2022 09:38:56 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-216-aeSBD7XZMjKSPbd_4HTuvg-1; Tue, 16 Aug 2022 05:38:55 -0400
X-MC-Unique: aeSBD7XZMjKSPbd_4HTuvg-1
Received: by mail-ed1-f47.google.com with SMTP id o22so12725688edc.10;
 Tue, 16 Aug 2022 02:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=zeewrL7ToPsS+HGwL71YG1FsAEqk8lhimKivZZU8YG8=;
 b=rZcYo7vA1YsxCC2tduPintLmgP4cSzaYd9utIiWtbq5BTrxsZ5R9evT9+9F52VX7s6
 HiuTgmtg60LuOjnY+XgHSmPf0Wkbsyq6KB6EEwF+YdjZBohmk6VWG/M1SH6P8LmPNa06
 R9IegqDiL62jBIxmYhcSamGrXDFnBG7ADoA8nGBB2AMGS0xEeOssQquqyfjPRWrE8v+N
 ECwR5KkArgGGPgA5m1SohZ5oh+uMdYHH/+4jXZNlq/G/VVrIxn4phtVPxUakm2NsPKte
 +LnzwiitNJej7/8AGyEMrB1SCpmphHP+oJgaML92mK6nTq1QaGGCaDgjSAmdrp8WxPM2
 SuhQ==
X-Gm-Message-State: ACgBeo0DtAdQtHAIeddEDy45AVpHlyFpQj0Mkkvb96635C+FbVrhng10
 pGTXLLF8xpzuloHM2Qj1m7EhxrbqCmQ/3g==
X-Google-Smtp-Source: AA6agR6/1fdcBRvk6WfescxuLMz2vAvvDAjQag/fGm4R7/t29p/+AKufrjGGIVjW6OQfKVTuaeEs8Q==
X-Received: by 2002:a05:6402:510a:b0:43d:ab25:7d68 with SMTP id
 m10-20020a056402510a00b0043dab257d68mr17902318edd.102.1660642733681; 
 Tue, 16 Aug 2022 02:38:53 -0700 (PDT)
Received: from [10.43.17.48] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a17090618a200b007246492658asm1202525ejf.117.2022.08.16.02.38.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 02:38:53 -0700 (PDT)
Message-ID: <be332c6b-4b65-6462-c570-ee6d0e81b985@gmail.com>
Date: Tue, 16 Aug 2022 11:38:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
To: Heming Zhao <heming.zhao@suse.com>, linux-lvm@redhat.com,
 martin.wilck@suse.com
References: <20220816092820.6xbab36dcmxq5hfm@c73>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <20220816092820.6xbab36dcmxq5hfm@c73>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [linux-lvm] lvmpolld causes IO performance issue
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
Cc: teigland@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 16. 08. 22 v 11:28 Heming Zhao napsal(a):
> Hello maintainers & list,
> 
> I bring a story:
> One SUSE customer suffered lvmpolld issue, which cause IO performance dramatic
> decrease.
> 
> How to trigger:
> When machine connects large number of LUNs (eg 80~200), pvmove (eg, move a single
> disk to a new one, cmd like: pvmove disk1 disk2), the system will suffer high
> cpu load. But when system connects ~10 LUNs, the performance is fine.
> 
> We found two work arounds:
> 1. set lvm.conf 'activation/polling_interval=120'.
> 2. write a speical udev rule, which make udev ignore the event for mpath devices.
>     echo 'ENV{DM_UUID}=="mpath-*", OPTIONS+="nowatch"' >\
>      /etc/udev/rules.d/90-dm-watch.rules
> 
> Run above any one of two can make the performance issue disappear.
> 
> ** the root cause **
> 
> lvmpolld will do interval requeset info job for updating the pvmove status
> 
> On every polling_interval time, lvm2 will update vg metadata. The update job will
> call sys_close, which will trigger systemd-udevd IN_CLOSE_WRITE event, eg:
>    2022-<time>-xxx <hostname> systemd-udevd[pid]: dm-179: Inotify event: 8 for /dev/dm-179
> (8 is IN_CLOSE_WRITE.)
> 
> These VGs underlying devices are multipath devices. So when lvm2 update metatdata,
> even if pvmove write a few data, the sys_close action trigger udev's "watch"
> mechanism to gets notified frequently about a process that has written to the
> device and closed it. This causes frequent, pointless re-evaluation of the udev
> rules for these devices.
> 
> My question: Does LVM2 maintainers have any idea to fix this bug?
> 
> In my view, does lvm2 could drop VGs devices fds until pvmove finish?

Hi

Please provide more info about lvm2  metadata and also some  'lvs -avvvvv' 
trace so we can get better picture about the layout - also version of 
lvm2,systemd,kernel in use.

pvmove is progressing by mirroring each segment of an LV - so if there would 
be a lot of segments - then each such update may trigger udev watch rule event.

But ATM I could hardly imagine how this could cause some 'dramatic' 
performance decrease -  maybe there is something wrong with udev rules on the 
system ?

What is the actual impact ?

Note - pvmove was never designed as a high performance operation (in fact it 
tries to not eat all the disk bandwidth as such)


Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

