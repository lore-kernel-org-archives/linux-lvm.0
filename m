Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56E1E80A99
	for <linux-lvm@archiver.kernel.org>; Wed, 27 Sep 2023 06:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695797120;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zbOG4e4oL87/O4p7sa+p59zAK9nD8JedFoOQrSU+GNY=;
	b=eHQIZKg3s4D8/xVYVlR8byy/PJ1nsfQRodsd/hxgOSvdgBSs5+dh2lBTDa2GkxlzjQl6QK
	1FpjPcunrETlUvVjQVmxaDNmDrSERjMBRCBoPSeoozVXH60EdL9+q5hIDO3raztTeqS5Zk
	rBGJOdVbbT9Bhgkm2+4yeJeR0PrvgT0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-7_Dwdht5O3Cdd5wUeHQKPQ-1; Wed, 27 Sep 2023 02:45:17 -0400
X-MC-Unique: 7_Dwdht5O3Cdd5wUeHQKPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF7D73C100AE;
	Wed, 27 Sep 2023 06:45:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 39133176E0;
	Wed, 27 Sep 2023 06:45:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0A0D2194658D;
	Wed, 27 Sep 2023 06:45:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1D82F194658C
 for <linux-lvm@listman.corp.redhat.com>; Tue, 26 Sep 2023 09:33:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 081441005E29; Tue, 26 Sep 2023 09:33:15 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3C0E1004058
 for <linux-lvm@redhat.com>; Tue, 26 Sep 2023 09:33:14 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA0C3803470
 for <linux-lvm@redhat.com>; Tue, 26 Sep 2023 09:33:14 +0000 (UTC)
Received: from mail.aixigo.de (mail.aixigo.de [5.145.142.10]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-508-dMPaGglkM6-bDThTvrntIQ-1; Tue,
 26 Sep 2023 05:33:11 -0400
X-MC-Unique: dMPaGglkM6-bDThTvrntIQ-1
Received: from mailhost.ac.aixigo.de (mailhost.ac.aixigo.de [172.19.96.11])
 by mail.aixigo.de (OpenSMTPD) with ESMTPS id 25e709fb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <linux-lvm@redhat.com>;
 Tue, 26 Sep 2023 11:26:30 +0200 (CEST)
Received: from [172.19.97.128] (dpcl082.ac.aixigo.de [172.19.97.128])
 by mailhost.ac.aixigo.de (8.15.2/8.15.2/Debian-22) with ESMTP id
 38Q9QUqf003643; Tue, 26 Sep 2023 11:26:30 +0200
Message-ID: <920eb138-93f7-4e9f-b505-0bbd00565811@aixigo.com>
Date: Tue, 26 Sep 2023 11:26:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-lvm@redhat.com
References: <CAM5YWZfo5q5rP+E2JFudGaHJLQ-2bk2UfpR=En5eDF37JKq2rw@mail.gmail.com>
From: Harald Dunkel <harald.dunkel@aixigo.com>
In-Reply-To: <CAM5YWZfo5q5rP+E2JFudGaHJLQ-2bk2UfpR=En5eDF37JKq2rw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.103.8 at srvvm01.ac.aixigo.de
X-Virus-Status: Clean
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Wed, 27 Sep 2023 06:41:07 +0000
Subject: Re: [linux-lvm] Can I combine LUKS and LVM to achieve encryption
 and snapshots?
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aixigo.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

What about encrypting the physical volumes, and creating the volume groups
and logical volumes on top of it?

Regards
Harri

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

