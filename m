Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6B3C4332F
	for <linux-lvm@archiver.kernel.org>; Wed,  4 Jan 2023 08:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672819253;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cYSUw9KIoIjo2m5rrDsyfKqZVcVqWxtycZ6Lz1mlo6A=;
	b=QzwbWRYRTo90kKyd53oHabL/00DWUA+LsiyBQz89bRM07I/NibNGRr2frWURcyww3Ad8XA
	hNTIWWa7j6W7hY+w2/v+LajyUTQG7+5r15qjmncs6Qs7N9F16DBQAClJ+CmsRJnjXf9SRj
	cje2H35LTYob6Gt0v5jiuliJmGou2so=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-PJNcma5sOgWcW0NzSESB3Q-1; Wed, 04 Jan 2023 03:00:49 -0500
X-MC-Unique: PJNcma5sOgWcW0NzSESB3Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE4E7802D1B;
	Wed,  4 Jan 2023 08:00:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C1A64492D8B;
	Wed,  4 Jan 2023 08:00:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ABE66194658C;
	Wed,  4 Jan 2023 08:00:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9FD3A1946587
 for <linux-lvm@listman.corp.redhat.com>; Wed,  4 Jan 2023 08:00:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8E4F51121315; Wed,  4 Jan 2023 08:00:25 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 868221121314
 for <linux-lvm@redhat.com>; Wed,  4 Jan 2023 08:00:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66D0C101A55E
 for <linux-lvm@redhat.com>; Wed,  4 Jan 2023 08:00:25 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-490-6jZKvBh3P2OKGi5BIS-_og-1; Wed, 04 Jan 2023 03:00:23 -0500
X-MC-Unique: 6jZKvBh3P2OKGi5BIS-_og-1
Received: by mail-pj1-f42.google.com with SMTP id v23so35362475pju.3
 for <linux-lvm@redhat.com>; Wed, 04 Jan 2023 00:00:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aUN2//vsijkJ+Jz23hQaEPJVRKWefE/+WSZPV6sbktw=;
 b=hyIjAUpSQIxbs3AAHWMqoJgHKNkFbKfirtLWKUh6wCBFJGBu0P+B2Y6xEWDL/v0WtY
 BXx0OC5WTfJpCU6VlY0lX4nkcRwHV4fahseGG/Fbo/legFOZ7hgByAdu8qTfNXwUZ7rn
 aZC4YcOWQ0YhBXKfoZ6bqc4NwAKFNeSrP9/Eg6lbaP+5FiMAJ0+ndgEog4lzsjgJSrzX
 R5awtNFqw9KV+p8SqC5HNYpTK3UiHt10RtuQZLgCoP0wPS+zN44dfNKCRqJ/fLBIjISh
 AgAQFGoQi5fWSvGmcZM3vSNAEeM53VZzJwYWZCez/XdtA03Z9/XcJiQsfrr0z8bM7g3R
 wL4Q==
X-Gm-Message-State: AFqh2kp7mUawZkm2kqU1HUphl1SJCoAXrtptC/rnhFmXykE5fD6cNRTJ
 FhLaUo0Klps7fAps8g6gkyZkMxAD9C7g0JfW
X-Google-Smtp-Source: AMrXdXvY9KyQeYTgzGj90uPan8R/K9k5DFN+F5U6Jrx1Y90lVCARLpKNrsOpIAi0SjGJds6ytjqdbA==
X-Received: by 2002:a17:903:3311:b0:189:c380:7c7c with SMTP id
 jk17-20020a170903331100b00189c3807c7cmr51183300plb.23.1672819222546; 
 Wed, 04 Jan 2023 00:00:22 -0800 (PST)
Received: from [10.4.126.217] ([139.177.225.231])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a170902db1100b00186acb14c4asm23835722plx.67.2023.01.04.00.00.21
 for <linux-lvm@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 00:00:22 -0800 (PST)
Message-ID: <eed877f5-53f5-101b-44ab-a61f1328e62f@bytedance.com>
Date: Wed, 4 Jan 2023 16:00:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
To: linux-lvm@redhat.com
From: Zhiyong Ye <yezhiyong@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Wed, 04 Jan 2023 08:00:43 +0000
Subject: [linux-lvm] The feasibility of implementing an alternative snapshot
 approach
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dear all,

The current standard lv implementation of snapshots is COW 
(Copy-on-write), which creates snapshots very quickly. However, the 
first write performance of the original lv will be poor after creating a 
snapshot because of COW. Moreover, the more snapshots there are, the 
worse the performance of the original lv will be.

I tested the random read/write performance when the original lv was 
created with different number of snapshots. The data is shown below:
Number of snapshots  Randread(iops)  Randwrite(iops)
         0                21989           22034
         1                10048           10041
         2                6770            6773
         3                5375            5378

There are scenarios where the performance of the original lv is more 
demanding, and the speed of snapshot creation is not as strong a 
requirement. Because it is the original lv that will actually be used, 
and the snapshot is only a secondary function. Therefore snapshots using 
the COW approach will not meet the needs of this scenario.

Therefore, is it feasible to implement another way of taking snapshots? 
Let's say the first snapshot is created as a full snapshot, and all 
subsequent snapshots are based on incremental data from the previous 
snapshot.

Regards,

Zhiyong Ye

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

