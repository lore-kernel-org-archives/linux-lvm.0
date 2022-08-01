Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBECC00144
	for <linux-lvm@archiver.kernel.org>; Mon,  1 Aug 2022 17:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659375000;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=d8QLbcqfJ2bxEWN/M9zWsZW+57Wahl9jwF+u1UY5oyU=;
	b=iK1eHvwYGWCbminWfWTl/h6EqEtMiH+dtyt6kDpW18W2Vm+ZfbnpECQe6B/427HnH+7gBQ
	17bDMganEzVisRpJwRoYjs2CqIUOg/kNsQJ9m2Z5AIvLQKMWaryBRucs32rUVCbi5aVIGR
	zyut3H/JV5uMvHa8Zl75F/r/iEl92Uo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-n3u-sAR6P4K-YpY4zoQ1HA-1; Mon, 01 Aug 2022 13:29:57 -0400
X-MC-Unique: n3u-sAR6P4K-YpY4zoQ1HA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D918C18E6C44;
	Mon,  1 Aug 2022 17:29:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CDAF940CFD0A;
	Mon,  1 Aug 2022 17:29:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 879E71946A44;
	Mon,  1 Aug 2022 17:29:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DAE551946A40
 for <linux-lvm@listman.corp.redhat.com>; Mon,  1 Aug 2022 17:29:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A2BFE401E23; Mon,  1 Aug 2022 17:29:46 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EF62492C3B
 for <linux-lvm@redhat.com>; Mon,  1 Aug 2022 17:29:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CB6485A584
 for <linux-lvm@redhat.com>; Mon,  1 Aug 2022 17:29:46 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-oLtNCfvKNWC6GLA9w6rdBQ-1; Mon, 01 Aug 2022 13:29:44 -0400
X-MC-Unique: oLtNCfvKNWC6GLA9w6rdBQ-1
Received: by mail-ej1-f43.google.com with SMTP id k26so5918917ejx.5
 for <linux-lvm@redhat.com>; Mon, 01 Aug 2022 10:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GjTv0tb7Fb8A4R6C6FIXuoDsjAx81MT3KCIeV5HnRKw=;
 b=pNvtvTOEVY0LMf7ZTqUjcMSs1K7qGqXNzv8+uCDC0mWFoFakAYybmG75+ILkLt7tJo
 k3DwTLvXPMgzzb77jIeNKNLNGiYzpy5qab4++DvYEf+bOYxYVh4F9HCpzaExy3R9e5/S
 m+8zt0pns1DiYeAwZuPQNcQosRNz34yjRxxuzzSngpfrqWVUXN47cS63X+aZE5+q0sHB
 cmIHoMptc2M0vtIwWe1L/nJfIhi/Nrbswcap3/51N4VrhB0sY823qqLZAT0XQSVNMZjj
 4BtbyE66G2uc0T+5EtbQtxMHxUVJHjgn4JZWmq0CYqAvI58txo9OEi+XfBtQM5OenC4V
 +LuA==
X-Gm-Message-State: AJIora+IsTHZ90tb6HNM5awASeySlyUvyXl3lUMexWDYRYE0PtbROZNM
 Wrk3e9tSufZ4s3ZFQwgda/v7k0teGypgNw==
X-Google-Smtp-Source: AGRyM1uisplcvkykV+degUi9OisBcvklsfDYEWDCLzeLYy7g5+0v1M52Dgq8mGuEZ/mvz2RpHuwPdQ==
X-Received: by 2002:a17:907:720e:b0:72b:9cfe:21da with SMTP id
 dr14-20020a170907720e00b0072b9cfe21damr12792588ejc.575.1659374982972; 
 Mon, 01 Aug 2022 10:29:42 -0700 (PDT)
Received: from [192.168.0.99] ([83.148.32.207])
 by smtp.gmail.com with ESMTPSA id
 a8-20020aa7d908000000b0043bc33530ddsm7177411edr.32.2022.08.01.10.29.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 10:29:42 -0700 (PDT)
Message-ID: <d73e7506-a754-55d0-734f-084ffda1d6f2@gmail.com>
Date: Mon, 1 Aug 2022 19:29:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Thomas Deutschmann <whissi@whissi.de>
References: <000101d8a432$08688fe0$1939afa0$@whissi.de>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <000101d8a432$08688fe0$1939afa0$@whissi.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [linux-lvm] lvcreate hangs forever during snapshot creation
 when suspending volume
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 30. 07. 22 v 18:33 Thomas Deutschmann napsal(a):
> Hi,
> 
> while trying to backup a Dell R7525 system running
> Debian bookworm/testing using LVM snapshots I noticed that the system
> will 'freeze' sometimes (not all the times) when creating the snapshot.
> To recover from this, a power cycle is required.
> 
> Is this a problem caused by LVM or a kernel issue?
> 
> The command I run:
> 
>    /usr/sbin/lvcreate \
>    -vvvvv \
>    --size 100G \
>    --snapshot /dev/mapper/devDataStore1-volMachines \
>    --name volMachines_snap
> 
> The last 4 lines:
>> [Sat Jul 30 16:31:34 2022] debugfs: Directory 'dm-4' with parent 'block' already present!
>> [Sat Jul 30 16:31:34 2022] debugfs: Directory 'dm-7' with parent 'block' already present!
>> [Sat Jul 30 16:34:55 2022] INFO: task mariadbd:1607 blocked for more than 120 seconds.
>> [Sat Jul 30 16:34:55 2022]       Not tainted 5.18.0-2-amd64 #1 Debian 5.18.5-1
>> [Sat Jul 30 16:34:55 2022] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>> [Sat Jul 30 16:34:55 2022] task:mariadbd        state:D stack:    0 pid: 1607 ppid:  1289 flags:0x00000000
>> [Sat Jul 30 16:34:55 2022] Call Trace:
>> [Sat Jul 30 16:34:55 2022]  <TASK>
>> [Sat Jul 30 16:34:55 2022]  __schedule+0x30b/0x9e0
>> [Sat Jul 30 16:34:55 2022]  schedule+0x4e/0xb0
>> [Sat Jul 30 16:34:55 2022]  percpu_rwsem_wait+0x112/0x130
>> [Sat Jul 30 16:34:55 2022]  ? __percpu_rwsem_trylock.part.0+0x70/0x70
>> [Sat Jul 30 16:34:55 2022]  __percpu_down_read+0x5e/0x80
>> [Sat Jul 30 16:34:55 2022]  io_write+0x2e9/0x300
>> [Sat Jul 30 16:34:55 2022]  ? _raw_spin_lock+0x13/0x30
>> [Sat Jul 30 16:34:55 2022]  ? newidle_balance+0x26a/0x400
>> [Sat Jul 30 16:34:55 2022]  ? fget+0x7c/0xb0
>> [Sat Jul 30 16:34:55 2022]  io_issue_sqe+0x47c/0x2550
>> [Sat Jul 30 16:34:55 2022]  ? select_task_rq_fair+0x174/0x1240
>> [Sat Jul 30 16:34:55 2022]  ? hrtimer_try_to_cancel+0x78/0x110
>> [Sat Jul 30 16:34:55 2022]  io_submit_sqes+0x3ce/0x1aa0
>> [Sat Jul 30 16:34:55 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
>> [Sat Jul 30 16:34:55 2022]  ? wake_up_q+0x4a/0x90
>> [Sat Jul 30 16:34:55 2022]  ? __do_sys_io_uring_enter+0x565/0xa60
>> [Sat Jul 30 16:34:55 2022]  __do_sys_io_uring_enter+0x565/0xa60
>> [Sat Jul 30 16:34:55 2022]  do_syscall_64+0x3b/0xc0
>> [Sat Jul 30 16:34:55 2022]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>> [Sat Jul 30 16:34:55 2022] RIP: 0033:0x7f05b90229b9
>> [Sat Jul 30 16:34:55 2022] RSP: 002b:00007eff8e9efa38 EFLAGS: 00000216 ORIG_RAX: 00000000000001aa
>> [Sat Jul 30 16:34:55 2022] RAX: ffffffffffffffda RBX: 0000561c424f1d18 RCX: 00007f05b90229b9
>> [Sat Jul 30 16:34:55 2022] RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000009
>> [Sat Jul 30 16:34:55 2022] RBP: 00007eff8e9efa90 R08: 0000000000000000 R09: 0000000000000008
>> [Sat Jul 30 16:34:55 2022] R10: 0000000000000000 R11: 0000000000000216 R12: 0000561c42500938
>> [Sat Jul 30 16:34:55 2022] R13: 00007f05b9821c00 R14: 0000561c425009e0 R15: 0000561c424f1d18
>> [Sat Jul 30 16:34:55 2022]  </TASK>
>> [Sat Jul 30 16:34:55 2022] INFO: task mariadbd:9955 blocked for more than 120 seconds.
>> [Sat Jul 30 16:34:55 2022]       Not tainted 5.18.0-2-amd64 #1 Debian 5.18.5-1
>> [Sat Jul 30 16:34:55 2022] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>> [Sat Jul 30 16:34:55 2022] task:mariadbd        state:D stack:    0 pid: 9955 ppid:  1289 flags:0x00000000
>> [Sat Jul 30 16:34:55 2022] Call Trace:
>> [Sat Jul 30 16:34:55 2022]  <TASK>
>> [...]
> 
> The message "mariadbd:1607 blocked for more than 120 seconds" will repeat.
> 
> MariaDB itself is running in a systemd-nspawn container. The container
> storage is located on the volume for which snapshot creation will hang.


Hi


Lvm2 is *NOT* supported to be used within containers!

This requires some very specific 'system' modification and its in overal very 
problematic - so rule #1 is - always run lvm2 command on your hosting machine.


Now - you suggests you are able to reproduce this issue also on your bare 
metal hw - in this case run these 3 commands  before  'lvcreate'


# dmsetup table
# dmsetup info -c
# dmsetup ls --tree

# lvcreate ....

If it blocks take again these:
# dmsetup table
# dmsetup info -c
# dmsetup ls --tree


You 'lvcreate -vvvv'  & 'dmesg' trace simply suggest that system is waiting to 
fulfill  'fsfreeze'  operation - it's unclear why it cannot be finished - 
maybe some problem with your 'raid' array ??

So far I do not see any bug on lvm2 side - all works from lvm2 side as 
expected - however it's unclear why your 'raid' is so slow ?

Note: you could always 'experiment' without lvm2 in the picture -
you can ran   'fsfreeze --freeze|--unfreeze'  yourself - to see whether even 
this command is able to finish  ?

Note2: if you system has lots of 'dirty' pages - it may potentially take a lot 
of time to 'fsfreeze' operation of a filesystem since all 'dirty' pages needs 
to be written to your disk..


Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

