Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F4AFA373D
	for <linux-lvm@archiver.kernel.org>; Tue,  1 Nov 2022 08:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667291319;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=n8QjPJBIxOaNC5VCiRDqQbcgyncHHr5X7wNKo4dh0pk=;
	b=XD2r+2uuv3307JuwprDuDVdFC0bY6iJK5ffXxpuehXFpvl2klMinrbMXWchBBC+BHY1jg7
	u9A+YI0QR3vf3z7nlQSLLcucfXAy4JEsXtYhPYocrQq9iXA/QRDe4ttGwlD9JeBeIBe64t
	HrSSFuFCjh3XiCQFXH7h3NAXgIIS+1k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628--ZR-TDGMN0y135LnStZF-w-1; Tue, 01 Nov 2022 04:28:36 -0400
X-MC-Unique: -ZR-TDGMN0y135LnStZF-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4254D8027EC;
	Tue,  1 Nov 2022 08:28:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC308140EBF3;
	Tue,  1 Nov 2022 08:28:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 84E2E1946A42;
	Tue,  1 Nov 2022 08:28:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5C8B11946594
 for <linux-lvm@listman.corp.redhat.com>; Tue,  1 Nov 2022 05:36:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 363632166BB1; Tue,  1 Nov 2022 05:36:26 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E45E2166BAD
 for <linux-lvm@redhat.com>; Tue,  1 Nov 2022 05:36:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 160F01C07836
 for <linux-lvm@redhat.com>; Tue,  1 Nov 2022 05:36:25 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-120-n8eCn9ayNHi96-to3SaiJw-1; Tue, 01 Nov 2022 01:36:23 -0400
X-MC-Unique: n8eCn9ayNHi96-to3SaiJw-1
Received: by mail-pf1-f179.google.com with SMTP id k15so4507971pfg.2
 for <linux-lvm@redhat.com>; Mon, 31 Oct 2022 22:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=760nsfNvb7LTfhYVlrKIncmGOAsPzBbMVRDoIsU7gtk=;
 b=y1JEK1b3nXeLXrScOw6aaxdLLQL75PT3kYY0wzxvuihlNBq42KkcAVOArkNrk9EU7W
 Ip+PMCbvJsn4kV9R+jwm7ABM3FKJxrsn/g9ChK5g4MChQX45TGUv0+rRuqWHQJ/txhM2
 2ZkwJ8G26mtE2IhzA567GI5KwyyTOha/pczrjnVCE3vACppGNBScU+pK6g6UnEipAMEP
 gVsZDBobF0S7QhyF8erabAnloXKcGritK3UCixhF5TRH0v8ajCD5bkf2uaZnF4qTTrQ+
 WTEh+mWsyrZARC7HgQl/e29ra6QlptoEd6Qirf2LctNaxs5xfF81iiTsJpX6jrcWE7+4
 VExA==
X-Gm-Message-State: ACrzQf2bVRNN92Aq0FZxaMVDJmaVNhHTv1/mHz1OQ1nqKv5bKCACqMKb
 o5pZoIB21MYDxJ9SDQrs98QI0PnGOzfLaQ==
X-Google-Smtp-Source: AMsMyM4+vWpE0ercgKC/UbqydmhRCRr6iy70/frMX7G8UZ3j6QjQtH75urIsHtqx7Dpq88LlluZG5g==
X-Received: by 2002:a05:6a00:1ac6:b0:56d:919b:f4a1 with SMTP id
 f6-20020a056a001ac600b0056d919bf4a1mr6500521pfv.50.1667280982200; 
 Mon, 31 Oct 2022 22:36:22 -0700 (PDT)
Received: from [10.87.56.20] ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a17090b018c00b001fd6066284dsm5105945pjs.6.2022.10.31.22.36.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 22:36:21 -0700 (PDT)
Message-ID: <4b031c4d-b83a-cc92-fabf-cc9cefb4e491@bytedance.com>
Date: Tue, 1 Nov 2022 13:36:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
From: Zhiyong Ye <yezhiyong@bytedance.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Tue, 01 Nov 2022 08:28:28 +0000
Subject: [linux-lvm] How to implement live migration of VMs in thinlv after
 using lvmlockd
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
Cc: damon.devops@gmail.com, David Teigland <teigland@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Hi all,

I want to implement live migration of VMs in the lvm + lvmlockd + 
sanlock environment. There are multiple hosts in the cluster using the 
same iscsi connection, and the VMs are running on this environment using 
thinlv volumes. But if want to live migrate the vm, it will be difficult 
since thinlv which from the same thin pool can only be exclusive active 
on one host.

I found a previous subject that discussed this issue:

https://lore.kernel.org/all/20180305165926.GA20527@redhat.com/

The VM in the source host will become suspended after completing the 
drain IO operation, and no new IO will be issued until the VM in the 
destination host resumes again during the live migration. Dave 
recommends to uninstall volumes at the source and activate at the 
destination within this time window.

However, executing the activate/deactivate command for thinlv volumes 
during a VM live migration will cause the VM Guest received an acpi 
message and the Guest will suppose that the disk device has been unmounted.

Or maybe my understanding is off. Can I ask for your help?

Regards,

Zhiyong Ye

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

