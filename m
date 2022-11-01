Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB7BC4332F
	for <linux-lvm@archiver.kernel.org>; Tue,  1 Nov 2022 17:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667325546;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IwoRqi+k9xCQ16ioRF9964kjh82L6LzNe69fsylWyjE=;
	b=QJtPibgLJtnJeIVSpbefB6utQk7/d28tjLNdZhXHYsbUfcfLIva9FDHy8KxbiXZGHTRUxp
	/ZMvs58qUGdMLWuVJVlf6Rn9Jm4SMyEWw8A3+vEtnpLwVXAvoC62kJZnCjajMez8sa+JPv
	IilRF1oB3UQ2RLR09QtALg9e1MwEfag=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-1hBH8F85NJSu83hq1kl5vg-1; Tue, 01 Nov 2022 13:58:09 -0400
X-MC-Unique: 1hBH8F85NJSu83hq1kl5vg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC1953816EA8;
	Tue,  1 Nov 2022 17:58:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 30D81141511F;
	Tue,  1 Nov 2022 17:57:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D72611946A42;
	Tue,  1 Nov 2022 17:57:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7FEC31946594
 for <linux-lvm@listman.corp.redhat.com>; Tue,  1 Nov 2022 17:57:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 48EE12166B4D; Tue,  1 Nov 2022 17:57:58 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CE2E2166B2D;
 Tue,  1 Nov 2022 17:57:57 +0000 (UTC)
Date: Tue, 1 Nov 2022 12:57:56 -0500
From: David Teigland <teigland@redhat.com>
To: Zhiyong Ye <yezhiyong@bytedance.com>
Message-ID: <20221101175756.GB11193@redhat.com>
References: <4b031c4d-b83a-cc92-fabf-cc9cefb4e491@bytedance.com>
 <20221101144230.GA11193@redhat.com>
 <bd522c48-03df-1130-54af-bee8a58440f0@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <bd522c48-03df-1130-54af-bee8a58440f0@bytedance.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [linux-lvm] How to implement live migration of VMs in thinlv
 after using lvmlockd
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
Cc: damon.devops@gmail.com,
 LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 02, 2022 at 01:02:27AM +0800, Zhiyong Ye wrote:
> Hi Dave,
> 
> Thank you for your reply!
> 
> Does this mean that there is no way to live migrate VMs when using lvmlockd?

You could by using linear LVs, ovirt does this using sanlock directly,
since lvmlockd arrived later.

> As you describe, the granularity of thinlv's sharing/unsharing is per
> read/write IO, except that lvmlockd reinforces this limitation for the lvm
> activation command.
> 
> Is it possible to modify the code of lvmlockd to break this limitation and
> let libvirt/qemu guarantee the mutual exclusivity of each read/write IO
> across hosts when live migration?

lvmlockd locking does not apply to the dm i/o layers.  The kind of
multi-host locking that you seem to be talking about would need to be
implemented inside dm-thin to protect on-disk data structures that it
modifies.  In reality you would need to write a new dm target with locking
and data structures designed for that kind of sharing.

Dave
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

