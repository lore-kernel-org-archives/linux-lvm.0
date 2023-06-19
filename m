Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F26EB64D9
	for <linux-lvm@archiver.kernel.org>; Mon, 19 Jun 2023 12:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687177617;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8cSitk+WPz+PDSg4ZrP2cDXDkPI47uV3CkMYTQgvEzg=;
	b=GZ7p5v7ZewsJ3Rk1oj1Q6eZGJ3038iiGTT6VzDvlwLmQfkFNNsw3RkXFzUIkXC8bh4PTjY
	Zhbicx+KrdP+nWzUzIkBSUyqleNAmbj91guZ0+GEHNk9bQ+Qa8pZlTbERLtaN/0UZJDhFW
	KZcl+0QabCcVKioanJaBxG8JS+Bt5UI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-daN-kblsOlS_9vk7j1q0xQ-1; Mon, 19 Jun 2023 08:26:56 -0400
X-MC-Unique: daN-kblsOlS_9vk7j1q0xQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 505AB101AA46;
	Mon, 19 Jun 2023 12:26:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C6F552026D49;
	Mon, 19 Jun 2023 12:26:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6C8201946595;
	Mon, 19 Jun 2023 12:26:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EB3681946589
 for <linux-lvm@listman.corp.redhat.com>; Mon, 19 Jun 2023 12:26:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C79BDC1604C; Mon, 19 Jun 2023 12:26:29 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0311C1603B
 for <linux-lvm@redhat.com>; Mon, 19 Jun 2023 12:26:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A45E785A5BB
 for <linux-lvm@redhat.com>; Mon, 19 Jun 2023 12:26:29 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-VG4_LTlLN4utwA8qJRFMvg-1; Mon, 19 Jun 2023 08:26:28 -0400
X-MC-Unique: VG4_LTlLN4utwA8qJRFMvg-1
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-9887ebe16d0so191131466b.2
 for <linux-lvm@redhat.com>; Mon, 19 Jun 2023 05:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687177586; x=1689769586;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d3wIRJPzVEPI2rh0cWvgZMQPrx0j4IDckko5bmFyuAE=;
 b=UY5rDAa3Ahhs0a2PReNPoXEvKNQHatNWPe5Rcm1+4BuFG8jS4g+PNOMUumuVDIxlkE
 yh4ED97GK2O/O3dBsgUP+CBxkddr8BC1tduOy9BueQFPgwwN8TRZbLPJ31JYugY4Erxt
 lQvCV/Ntzc1mOpS7zR7kpa1RpGOG8Q0QRsn4AzpvtFwTgjQOcQgOPyZzC4rE6NC1qo8Z
 2dSxVdWl01NNgYpGyph6+9SntzDEN+pn/WY/XpoO/PT01xdn4Q8q7vBfsHt6tTQJ4lIm
 r9JZC7vtSyQNKlEiKAoCH0eku6L0WXYiWMxOYgaiQlx+gAEe3Y1f4q9DroibyRvwI+WW
 SejQ==
X-Gm-Message-State: AC+VfDzqxCsCE25RHKFzobQooMRY4GLoriryM2UfaOhp57K8SBZe7oCC
 wNCtgQnV5tNV3BKamk6hJ/ytWk2BgQSQsg==
X-Google-Smtp-Source: ACHHUZ5AooLByA8eQsQ6ia9L4TKVr6aFwHmblFUX2AQW6+jVaqhNZdzw+KNkXeU45kf6LfykiUfKbQ==
X-Received: by 2002:a17:907:983:b0:96f:a935:8997 with SMTP id
 bf3-20020a170907098300b0096fa9358997mr8567394ejc.12.1687177586144; 
 Mon, 19 Jun 2023 05:26:26 -0700 (PDT)
Received: from [10.43.17.48] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 le8-20020a170907170800b00988b6d05f33sm1222790ejc.223.2023.06.19.05.26.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 05:26:25 -0700 (PDT)
Message-ID: <331beb2b-ec8e-5525-edc5-71fbdfc93c34@gmail.com>
Date: Mon, 19 Jun 2023 14:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Scott Moser <smoser@brickies.net>
References: <CAKxE60wDS+8d2q5PVZ7SeqN5vMhXK_vK12j_CknZt6rStp5v6g@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CAKxE60wDS+8d2q5PVZ7SeqN5vMhXK_vK12j_CknZt6rStp5v6g@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [linux-lvm] lvm2-testsuite stability
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 15. 06. 23 v 20:02 Scott Moser napsal(a):
> Hi,
> [sorry for duplicate post, re-sending from a subscribed address]
> 
> I'm looking to enable the lvm2 testsuite as an autopkgtest [1] to run
> in debian and ubuntu. I have a merge request up at [2].  The general
> idea is just to a.) package 'lvm2-testsuite' as an installable package
> b.) run the testsuite as part of the autopkgtest.
> 
> The version I'm testing on Ubuntu 22.04 is 2.03.16-3 from debian
> (rebuilt for 22.04). I'm running udev-vanilla  in a 2 cpu/4GB VM, and
> stopping/masking  the following services: dm-event lvm2-lvmpolld
> lvm2-monitor lvm2-lvmdbusd .
> 
> I'm seeing some failures when running the test.  Some seem expected
> due to size limitations, some seem to fail every time, and some see
> transient failures.
> 
> Here is the list of tests that I'm seeing fail and my initial
> categorization.  I've seen this across say half a dozen runs:
> 

Yep - some tests are failing

> expected-fail  api/dbustest.sh

We do have them even split to individual tests;

api/dbus_test_cache_lv_create.sh																							
api/dbus_test_copy_signature.sh																																			
api/dbus_test_external_event.sh																																			
api/dbus_test_log_file_option.sh																																			
api/dbus_test_wipefs.sh																																			
api/dbus_test_z_sigint.sh

these need to be fixed and resolved.

> expected-fail  shell/lvconvert-repair-thin.sh



> space-req      shell/lvcreate-large-raid.sh
> space-req      shell/lvcreate-thin-limits.sh
> expected-fail  shell/lvm-conf-error.sh
> expected-fail  shell/lvresize-full.sh
> timeout        shell/pvmove-abort-all.sh
> space-req      shell/pvmove-basic.sh
> expected-fail  shell/pvscan-autoactivation-polling.sh
> expected-fail  shell/snapshot-merge.sh
> space-req      shell/thin-large.sh
> racy           shell/writecache-cache-blocksize.sh

These are individual - we have some of those testing on some machines.
They may need some 'extra' care.

> 
> expected-fail fails most every time. timeout seems to work sometimes,
> space-req i think is just space requirement issue (i'll just skip
> those tests).
> 

I'd likely need to get access/see  to the logs of such machines
(or you would need to provide as some downloadable image of you Qemu machine 
installation)


> The full output from the test run can be seen at [3] in the
> testsuite-stdout.txt and testsuite-stderr.txt files.
> 
> Do others run this test-suite in automation and get reliable results ?
> 

We surely do run these tests on regular basis on VM - so those are usually 
slightly modified to avoid collisions with tests.
There is also no strict rule to not break some 'tests' - so occasionally some 
tests can be failing for a while if they are seen 'less important' over some 
other bugs...

We would need to think much harder if the test should be running with some 
daemons or autoactivation on the system that could see and could interact with 
our devices generated during the test run (one of the reasons machine for 
tests need some local modification - we may provide some Ansible-like testing 
script eventually.

But anyway - the easiest is to give us access to your test results so we could 
see whether there is something wrong with our test environment,  lvm2 bug, or 
system setup - it's not always trivial to guess...


Regards

Zdenek


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

