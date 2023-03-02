Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961DAC678D4
	for <linux-lvm@archiver.kernel.org>; Thu,  2 Mar 2023 00:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677718290;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8Sgq7ULoQ/axequWTL7X6UTCYwYfC+NENNssQH5jdck=;
	b=DaOHfZ68NvF7R+W2/m3vqeoSNI1Qbzl9OXcFCDwj7Q7fgwfJZcjIb/WsE0IQcm0RHBz5yL
	d3TWjC9VKqZfWjDshZBGTQXQMmF+naYn3qkGafmfYrZphusc+UYhtPPanxW4pB6L1lLL4t
	IRXEoDn4tctk05T1UsJH9OYHtP+pFqg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-uWbyGlEZMT6AEO7XaNhyWw-1; Wed, 01 Mar 2023 19:51:29 -0500
X-MC-Unique: uWbyGlEZMT6AEO7XaNhyWw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AB763814959;
	Thu,  2 Mar 2023 00:51:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 692702026D4B;
	Thu,  2 Mar 2023 00:51:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4005519452CE;
	Thu,  2 Mar 2023 00:51:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 48D9319472FC
 for <linux-lvm@listman.corp.redhat.com>; Thu,  2 Mar 2023 00:51:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 204351121318; Thu,  2 Mar 2023 00:51:22 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 123931121315
 for <linux-lvm@redhat.com>; Thu,  2 Mar 2023 00:51:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8136811E9C
 for <linux-lvm@redhat.com>; Thu,  2 Mar 2023 00:51:21 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-470-kkTsW_ZNN16z5Ltm-9S9Dw-1; Wed, 01 Mar 2023 19:51:20 -0500
X-MC-Unique: kkTsW_ZNN16z5Ltm-9S9Dw-1
Received: by mail-vs1-f45.google.com with SMTP id o32so20891104vsv.12
 for <linux-lvm@redhat.com>; Wed, 01 Mar 2023 16:51:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XXG6ZizqRN7AMlw7jjozGaEqhZu3b+ZG9uWpDeGdhco=;
 b=GnHnGptzPw6E7mPQUoy9wYYGtoE99Co+liPGl82dWHSmAr0EzWxzLY1kKWmvhbZf+E
 e9RU3YuAD0W1oemORpk0tX8S3V1Q/I0o55hh4rVoGsqiVM/elkB/3grcgtA7maaFzUnW
 46vCWXBIt1CgnsigQVyy/O2cvauVnBm8JRMnvPJKzlzF7sgFpBq2+gPgihT2XKVLVWeA
 nVo4aDzEGUVg9P4J3+aSQ0nXtuodvA6XrkvldX6XrM5MGPwBXlzuxOpctBXLJiW2viwZ
 j+l8Bj4ndakvmZP2YRyekEhAp0nK7tLhSw67gC0yU3trBgajhCSxNBrA2RuU9NjIVE5Z
 5yXg==
X-Gm-Message-State: AO0yUKXOg10F73PiaNHNm5LXHAzNo/anGcI28Y8TqLD51m2FsWsQCgHp
 eo+tbD4tI3RGvQCQNP96NiMHkRKyxdcf/LA9dyuPXWQ8
X-Google-Smtp-Source: AK7set93V5DOc6ThpA5yDLc04TmcJPEQvyX1ZBnZuMKnW8N9FxkWG4Emdmeo6AhaEC2aR/pfOe2wou8vRhELzbMzCBQ=
X-Received: by 2002:a67:cd05:0:b0:414:2d02:6c96 with SMTP id
 u5-20020a67cd05000000b004142d026c96mr5595819vsl.7.1677718279634; Wed, 01 Mar
 2023 16:51:19 -0800 (PST)
MIME-Version: 1.0
References: <2023967259.761825.1677710640334.JavaMail.zimbra@karlsbakk.net>
In-Reply-To: <2023967259.761825.1677710640334.JavaMail.zimbra@karlsbakk.net>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Wed, 1 Mar 2023 18:51:08 -0600
Message-ID: <CAAMCDeftn7gLN8s3EMFer+jJ95dRkdpR4007hDMqNNhjrbGDJA@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [linux-lvm] lvconvert --uncache takes hours
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
Cc: Malin Bruland <malin.bruland@pm.me>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 1, 2023 at 4:50 PM Roy Sigurd Karlsbakk <roy@karlsbakk.net> wrote:
>
> Hi all
>
> Working with a friend's machine, it has lvmcache turned on with writeback. This has worked well, but now it's uncaching and it takes *hours*. The amount of cache was chosen to 100GB on an SSD not used for much else and the dataset that is being cached, is a RAID-6 set of 10x2TB with XFS on top. The system mainly works with file serving, but also has some VMs that benefit from the caching quite a bit. But then - I wonder - how can it spend hours emptying the cache like this? Most write caching I know of last only seconds or perhaps in really worst case scenarios, minutes. Since this is taking hours, it looks to me something should have been flushed ages ago.
>
> Have I (or we) done something very stupid here or is this really how it's supposed to work?
>
> Vennlig hilsen
>
> roy

A spinning raid6 array is slow on writes (see raid6  write penalty).
Because of that the array can only do about 100 write operattions/sec.

If the disk is doing other work then it only has the extra capacity so
it could destage slower.

A lot depends on how big each chunk is.     The lvmcache indicates the
smallest chunksize is 32k.

100G / 32k = 3 million, and at 100seeks/sec that comes to at least an hour.

Lvm bookkeeping has to also be written to the spinning disks I would
think, so 2 hours if the array were idle.

Throw in a 50% baseload on the disks and you get 4 hours.

Hours is reasonable.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

