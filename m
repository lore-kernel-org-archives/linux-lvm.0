Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A059C00144
	for <linux-lvm@archiver.kernel.org>; Tue,  2 Aug 2022 03:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659409335;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Bx/Xi0kXqjFBNmvU6j8YFOr1qzRDlxtef9Nd6wCGQSk=;
	b=WVF0dWnmdserAMnw/GBYJfdCN2vVc2PHrcX4HFRayizUkiTVbjH/ovMcdbaf9PsGqW8b6L
	suwbMgrd8WZXrU/I8JMfrVWjG26GHBjTUOKpR5Z5aG+6AyxSO8saf98BqcEwLXtdDq6s7z
	mFWnfuGTckyvr77BuCNt8TuGcaDAvLA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-qig3C7v2O56TbJHMZOR6UQ-1; Mon, 01 Aug 2022 23:02:11 -0400
X-MC-Unique: qig3C7v2O56TbJHMZOR6UQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D70A3101A588;
	Tue,  2 Aug 2022 03:02:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DBC4B492C3B;
	Tue,  2 Aug 2022 03:02:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A0D421946A4A;
	Tue,  2 Aug 2022 03:02:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BD13F1946A41
 for <linux-lvm@listman.corp.redhat.com>; Tue,  2 Aug 2022 03:02:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A708FC1D3AD; Tue,  2 Aug 2022 03:02:03 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A33CFC15D4F
 for <linux-lvm@redhat.com>; Tue,  2 Aug 2022 03:02:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BC1A811E7A
 for <linux-lvm@redhat.com>; Tue,  2 Aug 2022 03:02:03 +0000 (UTC)
Received: from yamato.tf-network.de (yamato.tf-network.de [93.186.202.221])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-gL8FCkLwO5-9COHz_DJluQ-1; Mon, 01 Aug 2022 23:02:01 -0400
X-MC-Unique: gL8FCkLwO5-9COHz_DJluQ-1
Received: from amavis3.tf-network.de ([IPv6:2001:4ba0:ffa0:1b::d1:221])
 by yamato.tf-network.de (Postfix) with ESMTP id 4Lxfsh0wJrz4R4W
 for <linux-lvm@redhat.com>; Tue,  2 Aug 2022 05:02:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at amavis3.tf-network.de
Received: from smtp.tf-network.de ([93.186.202.221])
 by amavis3.tf-network.de ([IPv6:2001:4ba0:ffa0:1b::d1:221]) (amavisd-new,
 port 10024) with LMTP id rvlB_htbn84R for <linux-lvm@redhat.com>;
 Tue,  2 Aug 2022 05:01:59 +0200 (CEST)
Received: from data (2a0a-a546-4e33-0-8d75-b483-dcce-df26.ipv6dyn.netcologne.de
 [IPv6:2a0a:a546:4e33:0:8d75:b483:dcce:df26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by securesmtp.tf-network.de (Postfix) with ESMTPSA id 4Lxfsg3BTlz41sy
 for <linux-lvm@redhat.com>; Tue,  2 Aug 2022 05:01:59 +0200 (CEST)
From: "Thomas Deutschmann" <whissi@whissi.de>
To: "'LVM general discussion and development'" <linux-lvm@redhat.com>
References: <000101d8a432$08688fe0$1939afa0$@whissi.de>
 <d73e7506-a754-55d0-734f-084ffda1d6f2@gmail.com>
 <17c7871a-0849-bd03-40b6-146e338e364e@gmail.com>
 <000601d8a5e6$29a770d0$7cf65270$@whissi.de>
In-Reply-To: <000601d8a5e6$29a770d0$7cf65270$@whissi.de>
Date: Tue, 2 Aug 2022 05:01:57 +0200
Message-ID: <000901d8a61c$3adf2fb0$b09d8f10$@whissi.de>
MIME-Version: 1.0
Thread-Index: AQHYpcxN9zKqPKFYKkmeF5SvHEfebK2aLKiAgABTfpCAAD1wkA==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Zdenek Kabelac wrote:
> Now - you suggests you are able to reproduce this issue also on your bare 
> metal hw - in this case run these 3 commands  before  'lvcreate'

Here we go:

> $ dmsetup table
> devDataStore1-volMachines: 0 5368709120 linear 9:127 2048
> devDataStore2-volData: 0 11596414976 linear 259:6 2048
> devSystem-volRoot: 0 419430400 linear 8:3 50333696
> devSystem-volSwap: 0 50331648 linear 8:3 2048

> $ dmsetup info -c
> Name                      Maj Min Stat Open Targ Event  UUID
> devDataStore1-volMachines 253   1 L--w    1    1      0
LVM-AzPWjYw7Nts8ZnQyaKdjJ8cyaG0b9umSFIx2fo4zZvW8QplyYM3jNaQSFXSDMNDW
> devDataStore2-volData     253   0 L--w    1    1      0
LVM-RZtslsKN16YTBhJZE4qzFkvFQVChUKEcyUS1BwtKv3CeDUnKkTz53p8IwT5pqMnk
> devSystem-volRoot         253   3 L--w    1    1      0
LVM-TZlj0Mwy3bA5QpPVVpeO6ncufQ2Va36MgxgnvVn7fNGMme2prgc1xn9e25vua36d
> devSystem-volSwap         253   2 L--w    2    1      0
LVM-TZlj0Mwy3bA5QpPVVpeO6ncufQ2Va36Mp6kfZF6l8ubeUOo00BrK7kFGK8JvcG6X

> $ dmsetup ls --tree
> devDataStore1-volMachines (253:1)
>  L- (9:127)
> devDataStore2-volData (253:0)
>  L- (259:6)
> devSystem-volRoot (253:3)
>  L- (8:3)
> devSystem-volSwap (253:2)
>  L- (8:3)

...and during lvcreate when the system hangs:

> $ dmsetup table
> devDataStore1-volMachines: 0 5368709120 linear 9:127 2048
> devDataStore1-volMachines-real:
> devDataStore1-volMachines_snap:
> devDataStore1-volMachines_snap-cow: 0 209715200 linear 9:127 5368711168
> devDataStore2-volData: 0 11596414976 linear 259:6 2048
> devSystem-volRoot: 0 419430400 linear 8:3 50333696
> devSystem-volSwap: 0 50331648 linear 8:3 2048

> $ dmsetup info -c
> Name                               Maj Min Stat Open Targ Event  UUID
> devDataStore1-volMachines          253   1 LI-w    1    1      0
LVM-AzPWjYw7Nts8ZnQyaKdjJ8cyaG0b9umSFIx2fo4zZvW8QplyYM3jNaQSFXSDMNDW
> devDataStore1-volMachines-real     253   4 -I-w    2    0      0
LVM-AzPWjYw7Nts8ZnQyaKdjJ8cyaG0b9umSFIx2fo4zZvW8QplyYM3jNaQSFXSDMNDW-real
> devDataStore1-volMachines_snap     253   6 -I-w    0    0      0
LVM-AzPWjYw7Nts8ZnQyaKdjJ8cyaG0b9umSHue1IrGu69toKQ0ZdcbSv97i3xq5YP2v
> devDataStore1-volMachines_snap-cow 253   5 L--w    1    1      0
LVM-AzPWjYw7Nts8ZnQyaKdjJ8cyaG0b9umSHue1IrGu69toKQ0ZdcbSv97i3xq5YP2v-cow
> devDataStore2-volData              253   0 L--w    1    1      0
LVM-RZtslsKN16YTBhJZE4qzFkvFQVChUKEcyUS1BwtKv3CeDUnKkTz53p8IwT5pqMnk
> devSystem-volRoot                  253   3 L--w    1    1      0
LVM-TZlj0Mwy3bA5QpPVVpeO6ncufQ2Va36MgxgnvVn7fNGMme2prgc1xn9e25vua36d
> devSystem-volSwap                  253   2 L--w    2    1      0
LVM-TZlj0Mwy3bA5QpPVVpeO6ncufQ2Va36Mp6kfZF6l8ubeUOo00BrK7kFGK8JvcG6X

> $ dmsetup ls --tree
> devDataStore1-volMachines (253:1)
>  L- (9:127)
> devDataStore1-volMachines-real (253:4)
> devDataStore1-volMachines_snap (253:6)
> devDataStore1-volMachines_snap-cow (253:5)
>  L- (9:127)
> devDataStore2-volData (253:0)
>  L- (259:6)
> devSystem-volRoot (253:3)
>  L- (8:3)
> devSystem-volSwap (253:2)
>  L- (8:3)

> $ cat /proc/meminfo | grep Dirty
> Dirty:                0 kB

In case someone will ask: During I/O, the value increased/decreased
as expected.


Zdenek Kabelac wrote:
> Note: you could always 'experiment' without lvm2 in the picture -
> you can ran   'fsfreeze --freeze|--unfreeze'  yourself - to see whether
even 
> this command is able to finish  ?

fsfreeze caused the same problem :/

I also changed filesystem from xfs to ext4 just in case... same issue.

For testing I stopped the MDRAID and removed one NVMe disk which I
cleared and where I created a new ext4 partition. Running

  $ fsfreeze --freeze /mnt/test

returned within seconds and I was unable do any I/O against /mnt/test
as expected.

I unfreezed the filesystem and started to copy ~50GB to the volume.
After waiting 5 minutes and verifying that /proc/meminfo didn't list
any 'dirty' pages, I re-run the fsfreeze command which caused the
same issue -- system hangs. :/

I will repeat the test with the other NVMe later...

So probably a kernel/driver issue or hardware problem.


-- 
Regards,
Thomas


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

