Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E61EB64D9
	for <linux-lvm@archiver.kernel.org>; Mon, 10 Jul 2023 17:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689008703;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D0IX4bEK5Rkhi+yKWQri2Sz+F97+DDYSH55hTQ5cNwI=;
	b=FIipQ8vWDiu69BYNJL0wqOpodaEfbGdy2kJ8F2lPKlIzrSkpiQ5XuW+gO0KiZox4YPgiLk
	xWDozRnCuztPJaOEV3bY9tlNGZ0TWSv5oUgXAHZv815Gb1tGxW+Qo9PzbfbpNN5guCH3/H
	aQV6YFUy/zsBeQwvwwIDLVx4T8ppCcE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-72yN20wWPWmu21iqlOkXWw-1; Mon, 10 Jul 2023 13:04:18 -0400
X-MC-Unique: 72yN20wWPWmu21iqlOkXWw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D75F29AA3B2;
	Mon, 10 Jul 2023 17:04:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C601492B02;
	Mon, 10 Jul 2023 17:04:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5395C19451D6;
	Mon, 10 Jul 2023 17:04:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B4F4019451D3
 for <linux-lvm@listman.corp.redhat.com>; Mon, 10 Jul 2023 17:04:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 988CE4CD0C6; Mon, 10 Jul 2023 17:04:04 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CEC1492C13;
 Mon, 10 Jul 2023 17:04:04 +0000 (UTC)
Date: Mon, 10 Jul 2023 12:04:03 -0500
From: David Teigland <teigland@redhat.com>
To: "wangzhiqiang (Q)" <wangzhiqiang95@huawei.com>
Message-ID: <20230710170403.GB3668@redhat.com>
References: <23f736c2-a264-f366-e217-6cbec424f9ed@huawei.com>
MIME-Version: 1.0
In-Reply-To: <23f736c2-a264-f366-e217-6cbec424f9ed@huawei.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [linux-lvm] The logical volume cannot be activated
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
Cc: linfeilong@huawei.com, lixiaokeng@huawei.com, wuguanghao3@huawei.com,
 louhongxiang@huawei.com, linux-lvm@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 10, 2023 at 02:47:07PM +0800, wangzhiqiang (Q) wrote:
> Dear all
> 
> I have a environment that disk online after switch root, link in /dev/disk/by-id is not generated when 69-dm-lvm.rules is executed,
> but i set link to filter in lvm.conf, so that pvscan failed to scan physical volumes and set environment variable LVM_VG_NAME_COMPLETE,
> finally, the logical volume is not activated.

Hi, using /dev/disk/ links in the filter was fixed here:
https://sourceware.org/git/?p=lvm2.git;a=commit;h=17a3585cbb55d9a15ced9775a18b50c53a50ee8e

Dave
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

