Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E81C433F5
	for <linux-lvm@archiver.kernel.org>; Tue, 18 Jan 2022 08:31:33 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-Dmd9UpGhPaCb2PZUQVN2_g-1; Tue, 18 Jan 2022 03:31:30 -0500
X-MC-Unique: Dmd9UpGhPaCb2PZUQVN2_g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 888A01006AA3;
	Tue, 18 Jan 2022 08:31:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 844A14EC67;
	Tue, 18 Jan 2022 08:31:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D1CA14BB7C;
	Tue, 18 Jan 2022 08:31:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20HIGCpP018835 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 17 Jan 2022 13:16:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D84D653DB; Mon, 17 Jan 2022 18:16:12 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D321753D9
	for <linux-lvm@redhat.com>; Mon, 17 Jan 2022 18:16:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 663391C09EC0
	for <linux-lvm@redhat.com>; Mon, 17 Jan 2022 18:16:06 +0000 (UTC)
Received: from mail.theworkmans.us (mail.theworkmans.us [3.18.13.81]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-487-Now5dU_JPse_oyJjxvxUQA-1; Mon, 17 Jan 2022 13:16:04 -0500
X-MC-Unique: Now5dU_JPse_oyJjxvxUQA-1
Received: from mail.theworkmans.us (mail.theworkmans.us [127.0.0.1])
	by mail.theworkmans.us (Postfix) with ESMTP id 4Jd0KK2QJCz4w4v
	for <linux-lvm@redhat.com>; Mon, 17 Jan 2022 18:09:09 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.theworkmans.us
Received: from mail.theworkmans.us ([127.0.0.1])
	by mail.theworkmans.us (mail.theworkmans.us [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id PAp3GiIDX7wq for <linux-lvm@redhat.com>;
	Mon, 17 Jan 2022 18:09:09 +0000 (UTC)
Received: from [10.0.0.200] (unknown [63.79.130.236])
	by mail.theworkmans.us (Postfix) with ESMTPSA id 4Jd0KK0RZbz4w3Q
	for <linux-lvm@redhat.com>; Mon, 17 Jan 2022 18:09:09 +0000 (UTC)
To: linux-lvm@redhat.com
From: Wayne Workman <wayne@theworkmans.us>
Message-ID: <bccb5451-65b9-5530-0c5d-97be83f2b133@theworkmans.us>
Date: Mon, 17 Jan 2022 12:09:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.14.0
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Tue, 18 Jan 2022 03:31:02 -0500
Subject: [linux-lvm] LVM pull requests?
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Hello,

Looking to confirm that the below repository is the place to submit pull 
requests for the lvm2 tool:

https://github.com/lvmteam/lvm2

Thanks,
Wayne

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

