Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694D2EB64D7
	for <linux-lvm@archiver.kernel.org>; Tue, 20 Jun 2023 18:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687287569;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QxSa3FrK92zTDAXb0DdBv4MroYSbxUIz/RJbRk4KY4Y=;
	b=eK36i35Vevg67TUC+FjL0g+dPfhWVOZdkQ/QOG21XCpL8b8CBbS8nik5BHYcJwIKzzxEp7
	t/8gfxkrYnKjM39b53MjXHh6U9ZIbm33PnbJJCpu7lB7imkD6Cg/RQv636xwsfQSu4pUZU
	gHC7d/WYqTGKmpcyZVikXabaN/LdmjQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-L0PSQIFkNraPMvWpao8Hjw-1; Tue, 20 Jun 2023 14:59:24 -0400
X-MC-Unique: L0PSQIFkNraPMvWpao8Hjw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 966661C05159;
	Tue, 20 Jun 2023 18:58:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 655F4492B01;
	Tue, 20 Jun 2023 18:58:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 243891946588;
	Tue, 20 Jun 2023 18:58:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7B8021946586
 for <linux-lvm@listman.corp.redhat.com>; Tue, 20 Jun 2023 18:58:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4192114682F8; Tue, 20 Jun 2023 18:58:45 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39B0114682F7
 for <linux-lvm@redhat.com>; Tue, 20 Jun 2023 18:58:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 193DF901180
 for <linux-lvm@redhat.com>; Tue, 20 Jun 2023 18:58:45 +0000 (UTC)
Received: from bird.elm.relay.mailchannels.net
 (bird.elm.relay.mailchannels.net [23.83.212.17]) by relay.mimecast.com with
 ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-hgEXGvmfNimLsDUlZnKvwg-1; Tue, 20 Jun 2023 14:58:42 -0400
X-MC-Unique: hgEXGvmfNimLsDUlZnKvwg-1
X-Sender-Id: dreamhost|x-authsender|relay@brickies.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id CCD45101EAE
 for <linux-lvm@redhat.com>; Tue, 20 Jun 2023 18:58:39 +0000 (UTC)
Received: from pdx1-sub0-mail-a300.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 437A2101D16
 for <linux-lvm@redhat.com>; Tue, 20 Jun 2023 18:58:39 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|relay@brickies.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|relay@brickies.net
X-MailChannels-Auth-Id: dreamhost
X-Eight-Troubled: 4c802ac75381e0af_1687287519625_2114985197
X-MC-Loop-Signature: 1687287519625:2057638940
X-MC-Ingress-Time: 1687287519625
Received: from pdx1-sub0-mail-a300.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.120.163.52 (trex/6.9.1); Tue, 20 Jun 2023 18:58:39 +0000
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: relay@brickies.net)
 by pdx1-sub0-mail-a300.dreamhost.com (Postfix) with ESMTPSA id 4Qlwrt6xhszFX
 for <linux-lvm@redhat.com>; Tue, 20 Jun 2023 11:58:38 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2b45a71c9caso66536561fa.3
 for <linux-lvm@redhat.com>; Tue, 20 Jun 2023 11:58:38 -0700 (PDT)
X-Gm-Message-State: AC+VfDyiaH87b7g7G/1ZqYholgqFkQca9b9EHac51lkKhJXA0xTZD0dK
 CuTC1dv1VYTqGy6OPSO3OlzytzZ1IhEhROg10Q8=
X-Google-Smtp-Source: ACHHUZ5wA4BfQ3voVY4WqsjRpYI+jvXJu4SR8Md5rnviX9p3d2LnWvdQBGfJV+K0C+ZEKlQ/mzV257UkCVwa1ZhT5qo=
X-Received: by 2002:a2e:94c1:0:b0:2b1:ac82:296 with SMTP id
 r1-20020a2e94c1000000b002b1ac820296mr8159786ljh.34.1687287517705; Tue, 20 Jun
 2023 11:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAKxE60wDS+8d2q5PVZ7SeqN5vMhXK_vK12j_CknZt6rStp5v6g@mail.gmail.com>
 <331beb2b-ec8e-5525-edc5-71fbdfc93c34@gmail.com>
 <CAKxE60xFh5HGjW2JgNd1Ev_gb1N9D6ns4HiCua7QM4Ga_ceZOw@mail.gmail.com>
 <982f2232-0263-85f7-606e-17afe0173e4f@gmail.com>
 <e8f61350-102e-31a9-3ad8-61c05b0a1d23@gmail.com>
In-Reply-To: <e8f61350-102e-31a9-3ad8-61c05b0a1d23@gmail.com>
From: Scott Moser <smoser@brickies.net>
Date: Tue, 20 Jun 2023 14:58:26 -0400
X-Gmail-Original-Message-ID: <CAKxE60y+nk=WWaUp737AUXAjZ9TiZcm7VUNa=SwDeagOZ2oQVA@mail.gmail.com>
Message-ID: <CAKxE60y+nk=WWaUp737AUXAjZ9TiZcm7VUNa=SwDeagOZ2oQVA@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: brickies.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>
>Missed to actually answer this embedded question about the current git tree
>for lvm2. We are still at sourceware:
>
>https://sourceware.org/git/?p=lvm2.git

Yeah, sorry. i was aware, I just pointed to the github being lazy.
It'd be nice for that to be up to date, but it isn't really important
here.

>So likely github has some out-of-sync mirror ATM and gitlab even looks like
>some Bastian's  fork ???  (which I'm finding seriously confusing for lvm2
>users - Debian should be giving different/distinct names here for their forked
>projects instead i.e. lvm2-debian  if there exists any real need for that...)

I'm not certain of this, but I think that the branch is maintained with
as many debian packages are being maintained now.  Rather than a set of
patches against an upstream, they're using git to maintain delta and git
merge to sync changes. See https://wiki.debian.org/PackagingWithGit  for
more information.

The upstream (lvm2) code is tagged in the repo, so you can see
differences between upstream/2.03.16 to debian/2.03.16-2 at:

   https://salsa.debian.org/lvm-team/lvm2/-/compare/debian%2F2.03.16-2...upstream%2F2.03.16?from_project_id=24161&straight=true

That will give you some idea of the changes in debian. you can get a
diff without debian/ dir with:

     git diff upstream/2.03.16..debian/2.03.16-2 -- ':!debian'

or

     git diff upstream/2.03.16..master -- ':!debian'

Unfortunately, that doesn't get you a whole lot more information. There
isn't a huge delta, but the delta there is not annotated particularly
well.  If I had to guess, I'd assume that some of it is no longer
necessary.

Dropping that delta would be a good example of something that is made
much easier with the integration test that autopkgtest provides.

>>> The gist at https://gist.github.com/smoser/3107dafec490c0f4d9bf9faf02327f04
>>> describes how I am doing this.  It is "standard" package build and autopkgtest
>>> on debian/ubuntu.  The autopkgtest VM does not use LVM for the system
>>> so we don't have to worry about interaction with that.
>
>So leads to a question was this testing actually tried against upstream git
>main/HEAD branch ?
>Is this test testing Debian packaged version of lvm2 which is not equivalent
>to upstream lvm2 ?

I was intentionally testing the debian package version here, as that is
the ultimate goal of package tests.  I've not tried with upstream.
Sorry if that wasn't clear.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

