Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D662C00140
	for <linux-lvm@archiver.kernel.org>; Fri,  5 Aug 2022 12:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659701024;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iw9dO5VlojAB2D4oa2qiVn1JsTJRx7l8IkNE+uRurjo=;
	b=Iaj8tDCIUYAZYncjm2DeAaZ7Gm6oDtxKcUQmcI/PAUfXUVScgp/HHKFopfO/fbeN1BG81J
	dE3wgwT6pB7mBbu9t6GiZ7ZnUvG3+sr1beW6LPcU2PV+Mih4qr0XJeyHjuQXUqgtMR55VM
	pZv4MY7VkHDCm0Qjp95/yxswsNCG6Ss=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-7X9DCpAqNJOxjhOpw68tKA-1; Fri, 05 Aug 2022 08:03:42 -0400
X-MC-Unique: 7X9DCpAqNJOxjhOpw68tKA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA0FA293249D;
	Fri,  5 Aug 2022 12:03:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97C0F2026D4C;
	Fri,  5 Aug 2022 12:03:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6D7401946A62;
	Fri,  5 Aug 2022 12:03:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5BA221946A5F
 for <linux-lvm@listman.corp.redhat.com>; Fri,  5 Aug 2022 12:03:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4DB6D2026D07; Fri,  5 Aug 2022 12:03:32 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49B2C2026D4C
 for <linux-lvm@redhat.com>; Fri,  5 Aug 2022 12:03:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B73DB3826264
 for <linux-lvm@redhat.com>; Fri,  5 Aug 2022 12:03:25 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-uGTPoqUdOEa_MbxO60LOLA-1; Fri, 05 Aug 2022 08:03:21 -0400
X-MC-Unique: uGTPoqUdOEa_MbxO60LOLA-1
Received: by mail-ej1-f52.google.com with SMTP id y13so4574199ejp.13
 for <linux-lvm@redhat.com>; Fri, 05 Aug 2022 05:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=N0uOHzygV7iiKpobAbG6uc+4b1Og44AniqeSGdwEqyQ=;
 b=h04zGnTQ/RkkOnhhdlrD/XDeID4BQwNyabKsEo1xkZOqhbd00TBn2Seoz7Q/FCiG4F
 Q3dh4oA8YNcGgwPS7EINNwQup9ic/NBUYgAoHDPtETWdRWXo6hWAxF1adQhy9HNHuUtp
 tq/VV6zgfF0f8fxaTj8YSIveIU7QNV3UnrBnGXrsjx/o51TDqtjYlFJZmytN44IAmNJk
 iHhRcUCiEBQJbq4xsGfTZZSM5FGwurfLX3B5rwAKNBFqV+3vY47jG39cWjmYx6+9Ndfv
 kQ5G8R/UQkoQGL0iPAvAoefAJWBz/vk6qBQfLt59QLgt+Omc12Ao0tHJAbQQqPB+Rs8d
 U/qQ==
X-Gm-Message-State: ACgBeo2O0rgJWcmqQul1hmRqthibd0MwufkB53xd7ezmndDbZ6vcEvuD
 RKg9niSTTsLOIim2J2vvRTDhAN/PZpDTiA==
X-Google-Smtp-Source: AA6agR5XHf3hVfyrRT9VqjjEUZ34jlS6L/shBpDk9fKkel5N+Kget+krbPe1OmGnk3Roc8s4d5NNyg==
X-Received: by 2002:a17:907:e8d:b0:730:a4e8:27ed with SMTP id
 ho13-20020a1709070e8d00b00730a4e827edmr4940047ejc.58.1659701000188; 
 Fri, 05 Aug 2022 05:03:20 -0700 (PDT)
Received: from [10.43.17.48] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a508d49000000b0043ba24a26casm1969214edt.23.2022.08.05.05.03.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 05:03:19 -0700 (PDT)
Message-ID: <f70a967b-81f8-d9bd-6873-7f96830bf4eb@gmail.com>
Date: Fri, 5 Aug 2022 14:03:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Ken Bass <daytooner@gmail.com>
References: <CAH5g025eDd60jvU+_d7DLaPdsmK0TsNjB-jkewKg5FSNJMEmJw@mail.gmail.com>
 <18239b39270.27a5.d4b3b9aee17a85f6bc878c68b3925db6@beardandsandals.co.uk>
 <CAAMCDecDyj_JLQvnxhsECng_t-x=Lxeta5WgrCLUGGqxHQvuiQ@mail.gmail.com>
 <1823f6818f8.27a5.d4b3b9aee17a85f6bc878c68b3925db6@beardandsandals.co.uk>
 <CAH5g027PhrTHgoNbgMP1bf=BbnwV+oSP7phJULWDzG-kVpwBGw@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CAH5g027PhrTHgoNbgMP1bf=BbnwV+oSP7phJULWDzG-kVpwBGw@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [linux-lvm] Problem with partially activate logical volume
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 03. 08. 22 v 23:31 Ken Bass napsal(a):
> 
> That's pretty much it. Whenever any app attempts to read a block from the 
> missing drive, I get the "Buffer I/O error" message. So, even though my 
> recovery apps can scan the LV, marking blocks on the last drive as 
> missing/unknown/etc., they can't display any recovered data - which I know 
> does exist. Looking at raw data from the apps' scans, I can see directory 
> entries, as well as files. I'm sure the inodes and bitmaps are still there for 
> some of these, I just can't really reverse engineer and follow them through. 
> But isn't that what the apps are supposed to do?

As mentioned by my previous email you shall *NOT* fix the partially activated 
device in-place - this will not lead to good result.

User should copy the content to some valid storage device with the same size 
as he tries to recover.

You can 'partially' activate device with  "zero"  filler instead of "error" 
(see the  lvm.conf setting:     missing_stripe_filler="...") - this way you 
will just 'read' zero for missing parts.

Your another 2nd. option is to 'correct' the VG by filling  missing PV with a 
new one with preferable zeroed content - so you will not read 'random' garbage 
in places this new PV will fill the space after your missing PV.
Although even in this case - I'd still run  'fsck' on the snapshot created on 
top of such LV to give you another chance of recovery if you will pick a wrong 
answer  (since fsck might be 'quite' interactive when doing such large-scale 
repair)


> Sorry I haven't replied sooner, but it takes a long time (days) to clone, then 
> scan 16Tb...
> 
> So, please any suggestions are greatly appreciated, as well as needed.
> 
> ken
> 
> (I know: No backup; got burned; it hurts; and I will now always have backups. 
> 'Nuf said.)

Before you run your 'fsck' create a snapshot of your newly created 'backup' 
and make all the repair actions in the snapshots.

Once you are 'satisfied' with 'repaired'  filesystem you can then 'merge' 
snapshot back to your origin and use it.

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

