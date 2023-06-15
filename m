Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633F0EB64D9
	for <linux-lvm@archiver.kernel.org>; Thu, 15 Jun 2023 18:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686853240;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=woQrs5LuiqZRppkrZF8m4LOfdaiDYhHJmQaArNZMKPE=;
	b=TcxT6bobqyxGQWRbxV/DxWPQ1QJOa68xvBxEz6LdY+JOViTJavu6QfEqTdFijTz/7objhp
	UrJNCOeBUvWiqbfo13pY8Qu/LvZl4Rjuxr6rzVem0hFLXtBFoE1cEng/L4fALkII8IDnWC
	wH9/k0p2ihTeZkXNe0ZEV+laITJe3gg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-m6-TARaDNqC5uclLFnOD-Q-1; Thu, 15 Jun 2023 14:20:36 -0400
X-MC-Unique: m6-TARaDNqC5uclLFnOD-Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 677FD85A5A6;
	Thu, 15 Jun 2023 18:20:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B6D0C40D1B60;
	Thu, 15 Jun 2023 18:20:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 837781946597;
	Thu, 15 Jun 2023 18:20:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D5C151946589
 for <linux-lvm@listman.corp.redhat.com>; Thu, 15 Jun 2023 18:20:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9F3B52026D6A; Thu, 15 Jun 2023 18:20:26 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97AE62026D49
 for <linux-lvm@redhat.com>; Thu, 15 Jun 2023 18:20:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76A033C01C1B
 for <linux-lvm@redhat.com>; Thu, 15 Jun 2023 18:20:26 +0000 (UTC)
Received: from antelope.elm.relay.mailchannels.net
 (antelope.elm.relay.mailchannels.net [23.83.212.4]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-WJuT-0r3N9-_dZPEAtOuHg-1; Thu, 15 Jun 2023 14:20:24 -0400
X-MC-Unique: WJuT-0r3N9-_dZPEAtOuHg-1
X-Sender-Id: dreamhost|x-authsender|relay@brickies.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 5CE345C1061
 for <linux-lvm@redhat.com>; Thu, 15 Jun 2023 18:02:53 +0000 (UTC)
Received: from pdx1-sub0-mail-a210.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id C8AF95C1E29
 for <linux-lvm@redhat.com>; Thu, 15 Jun 2023 18:02:52 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|relay@brickies.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|relay@brickies.net
X-MailChannels-Auth-Id: dreamhost
X-Hook-Sponge: 6292e7147817285e_1686852173153_2006455264
X-MC-Loop-Signature: 1686852173153:351268898
X-MC-Ingress-Time: 1686852173153
Received: from pdx1-sub0-mail-a210.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.103.24.91 (trex/6.9.1); Thu, 15 Jun 2023 18:02:53 +0000
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: relay@brickies.net)
 by pdx1-sub0-mail-a210.dreamhost.com (Postfix) with ESMTPSA id 4Qhqrr4ZJ3z8t
 for <linux-lvm@redhat.com>; Thu, 15 Jun 2023 11:02:52 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2b39bf8d5faso23686671fa.1
 for <linux-lvm@redhat.com>; Thu, 15 Jun 2023 11:02:52 -0700 (PDT)
X-Gm-Message-State: AC+VfDyegqgqX/GJ07MCPAeQt5r/EyMGNF+7/0fToFp+WnzJ2pyzYTpK
 SfQVY1dMN0AIKigmj48BKhUUZ4JcuD84QqFoZls=
X-Google-Smtp-Source: ACHHUZ6+LVH3tvcAll28da8HGcKNwRcoe9Q4bl3oAiH3JIvhzdoW4OG67o+h9RI4OWMnpyV3VhjAy4+Ez7P3QwY9FPY=
X-Received: by 2002:a2e:6817:0:b0:2b4:45b1:4748 with SMTP id
 c23-20020a2e6817000000b002b445b14748mr161981lja.14.1686852171224; Thu, 15 Jun
 2023 11:02:51 -0700 (PDT)
MIME-Version: 1.0
From: Scott Moser <smoser@brickies.net>
Date: Thu, 15 Jun 2023 14:02:40 -0400
X-Gmail-Original-Message-ID: <CAKxE60wDS+8d2q5PVZ7SeqN5vMhXK_vK12j_CknZt6rStp5v6g@mail.gmail.com>
Message-ID: <CAKxE60wDS+8d2q5PVZ7SeqN5vMhXK_vK12j_CknZt6rStp5v6g@mail.gmail.com>
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [linux-lvm] lvm2-testsuite stability
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: brickies.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,
[sorry for duplicate post, re-sending from a subscribed address]

I'm looking to enable the lvm2 testsuite as an autopkgtest [1] to run
in debian and ubuntu. I have a merge request up at [2].  The general
idea is just to a.) package 'lvm2-testsuite' as an installable package
b.) run the testsuite as part of the autopkgtest.

The version I'm testing on Ubuntu 22.04 is 2.03.16-3 from debian
(rebuilt for 22.04). I'm running udev-vanilla  in a 2 cpu/4GB VM, and
stopping/masking  the following services: dm-event lvm2-lvmpolld
lvm2-monitor lvm2-lvmdbusd .

I'm seeing some failures when running the test.  Some seem expected
due to size limitations, some seem to fail every time, and some see
transient failures.

Here is the list of tests that I'm seeing fail and my initial
categorization.  I've seen this across say half a dozen runs:

expected-fail  api/dbustest.sh
expected-fail  shell/lvconvert-repair-thin.sh
space-req      shell/lvcreate-large-raid.sh
space-req      shell/lvcreate-thin-limits.sh
expected-fail  shell/lvm-conf-error.sh
expected-fail  shell/lvresize-full.sh
timeout        shell/pvmove-abort-all.sh
space-req      shell/pvmove-basic.sh
expected-fail  shell/pvscan-autoactivation-polling.sh
expected-fail  shell/snapshot-merge.sh
space-req      shell/thin-large.sh
racy           shell/writecache-cache-blocksize.sh

expected-fail fails most every time. timeout seems to work sometimes,
space-req i think is just space requirement issue (i'll just skip
those tests).

The full output from the test run can be seen at [3] in the
testsuite-stdout.txt and testsuite-stderr.txt files.

Do others run this test-suite in automation and get reliable results ?

Thanks in advance for any help.

--
[1] https://wiki.ubuntu.com/ProposedMigration#autopkgtests
[2] https://salsa.debian.org/lvm-team/lvm2/-/merge_requests/6
[3] https://gist.github.com/smoser/3107dafec490c0f4d9bf9faf02327f04

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

