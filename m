Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE6BC77B6E
	for <linux-lvm@archiver.kernel.org>; Mon, 10 Apr 2023 01:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681090822;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=etRMjQBSLfyMHH2RsiNY/qyQ6fy9VbsMWk8QZyIJ/IM=;
	b=g6HlyblpZ6PBG3Mhxm0FmP1kw7Ncekevx+RY4jpIVzP1/yZOyhFZIk5UqX7jJq6zzUO9iX
	ihv787q9EDbLpSrz3N3fyPeHAh4g2Wy7SsWvDMeXhyzjldY9RLlDEh6FeDXCTW2vdj/tvf
	7rZ+EVwXDmRNhzYjoYapx/4YfRTwzd8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-rRAkrSzuN8Cn-BAY7umOrw-1; Sun, 09 Apr 2023 21:40:19 -0400
X-MC-Unique: rRAkrSzuN8Cn-BAY7umOrw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87A0780C8C1;
	Mon, 10 Apr 2023 01:40:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2611840C20FA;
	Mon, 10 Apr 2023 01:40:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D6E9F19465B1;
	Mon, 10 Apr 2023 01:40:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D7BD51946586
 for <linux-lvm@listman.corp.redhat.com>; Mon, 10 Apr 2023 01:40:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C8EF72027040; Mon, 10 Apr 2023 01:40:11 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C08B7202701F
 for <linux-lvm@redhat.com>; Mon, 10 Apr 2023 01:40:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A05C8185A78B
 for <linux-lvm@redhat.com>; Mon, 10 Apr 2023 01:40:11 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-vnD7JPmuMTqroH5qFT3bKQ-1; Sun, 09 Apr 2023 21:40:09 -0400
X-MC-Unique: vnD7JPmuMTqroH5qFT3bKQ-1
Received: from mail.gathman.org (wiki.gathman.org [IPv6:2001:470:8:809::1010])
 (authenticated bits=0)
 by mail.gathman.org (8.14.7/8.14.7) with ESMTP id 339No4js009364
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 9 Apr 2023 19:50:09 -0400
Date: Sun, 9 Apr 2023 19:50:04 -0400 (EDT)
From: Stuart D Gathman <stuart@gathman.org>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <845e5b45-42d5-3d7f-bdad-a66ce7a2e5a9@web.de>
Message-ID: <26fc468-3c70-c7f-3afd-0621ed16999@gathman.org>
References: <4649980a-7af2-5b2e-47de-ce88ccb8ac6f@web.de>
 <CAAMCDefZC-J7Nc0H45e_EmqkRDr8ZjpOn-JvNWyBzExh8TaCsg@mail.gmail.com>
 <845e5b45-42d5-3d7f-bdad-a66ce7a2e5a9@web.de>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [linux-lvm] bug? shrink lv by specifying pv extent to be
 removed does not behave as expected
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
Cc: Roger Heflin <rogerheflin@gmail.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gathman.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

I use a utility that maps bad sectors to files, then move/rename the
files into a bad blocks folder.  (Yes, this doesn't work when critical
areas are affected.)  If you simply remove the files, then
modern disks will internally remap the sectors when they are written
again  - but the quality of remapping implementations varies.

It is more time efficient to just buy a new disk, but with wars and
rumors of wars threatening to disrupt supply chains, including tech,
it's nice to have the skills to get more use from failing hardware.

Plus, it is a challenging problem, which can be fun to work on at leisure.

On Sun, 9 Apr 2023, Roland wrote:

>>  What is your use case that you believe removing a block in the middle
>>  of an LV needs to work?
>
> my use case is creating some badblocks script with lvm which intelligently
> handles and skips broken sectors on disks which can't be used otherwise...

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

