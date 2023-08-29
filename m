Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA1EC71153
	for <linux-lvm@archiver.kernel.org>; Tue, 29 Aug 2023 16:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693326868;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NbrY72oeJewKcq6MBsgU3j8VkIDdbILneK9pH5kBQ5g=;
	b=g9ursNzMzPS4n7KJafkh5422emCEww+avKi99oDh0yzUu1qSBVrkFG23PAQUjxfVwdIIbb
	8d49Chu/64JTLV439xUGEQS1g7KBTp6zsPfNgFCkFzFwYoru3VpM75ldNionJAeVypg922
	UXb+JfVp6+O6IPY4bZ4rQglLsR9eesA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-59HIbrnGMcGpfXLttB9NBQ-1; Tue, 29 Aug 2023 12:34:24 -0400
X-MC-Unique: 59HIbrnGMcGpfXLttB9NBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39A20856DED;
	Tue, 29 Aug 2023 16:34:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 636422166B25;
	Tue, 29 Aug 2023 16:34:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3D49D1946A43;
	Tue, 29 Aug 2023 16:34:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9F9BD19465A0
 for <linux-lvm@listman.corp.redhat.com>; Tue, 29 Aug 2023 16:34:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7DC861121319; Tue, 29 Aug 2023 16:34:17 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 764DC1121318
 for <linux-lvm@redhat.com>; Tue, 29 Aug 2023 16:34:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59849101A53C
 for <linux-lvm@redhat.com>; Tue, 29 Aug 2023 16:34:17 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-33-mKUdjcmQOJG_4nJORT4qmQ-1; Tue, 29 Aug 2023 12:34:15 -0400
X-MC-Unique: mKUdjcmQOJG_4nJORT4qmQ-1
Received: from mail.gathman.org (mail.gathman.org [IPv6:2001:470:8:809::1010])
 (authenticated bits=0)
 by mail.gathman.org (8.14.7/8.14.7) with ESMTP id 37TFbnDC007925
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <linux-lvm@redhat.com>; Tue, 29 Aug 2023 11:37:53 -0400
Date: Tue, 29 Aug 2023 11:37:49 -0400 (EDT)
From: Stuart D Gathman <stuart@gathman.org>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <CABh+8g7i+=_bWEofrEBrzj2yPXt2GaAH5WEyZdEcd68LpwVVBw@mail.gmail.com>
Message-ID: <dd13e87-d713-eee9-e638-e7b4caa3c135@gathman.org>
References: <CABh+8g5708fk_yJ_P-9Ne20ir+qjFV8BHj7tj6_HWamUdi55=Q@mail.gmail.com>
 <f96fd13d-8fe5-cf49-82f-78186d1f6349@gathman.org>
 <CABh+8g6O4_zgiZjoJn4yEyEP-Lh+en0hdyH2ZO6G7Z=8PW9xAA@mail.gmail.com>
 <CABh+8g7i+=_bWEofrEBrzj2yPXt2GaAH5WEyZdEcd68LpwVVBw@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [linux-lvm] Swapping LLVM drive
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gathman.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On Mon, 28 Aug 2023, Roska Postit wrote:

> After reading your answer more carefully I got the following idea:

> How do you see if I boot the system (this is a desktop computer and the old
> and the new drive are both NVMe SSD) from USB Linux and then just do a 'dd'
> for the entire drive (in block level, bit-by-bit). Then I remove the old
> disk out of the system. Shouldn't it boot normally now ?

That would work, yes, but you don't expand /boot - which you really
should do.  Also, copying the entire filesystem is not only less
efficient, but involves needless writes to an SSD (where they are 
a more limited resource than on magnetic drives).

> Then I will create a new partition for the all unused space (1.5GB) on new
> disk which I then will add to the LVM as a new Physical Volume (PV) in

That is pointless when you can just expand the partition (which is
trivial when it is the last one).  You don't want more PVs 
unless they are actually physical volumes - or there is some special
circumstance that prevents just expanding the partition.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

