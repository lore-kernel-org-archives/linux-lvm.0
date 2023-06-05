Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F45C77B73
	for <linux-lvm@archiver.kernel.org>; Mon,  5 Jun 2023 15:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685979249;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6d9S3F21NZDA83775YDOMq39GlNdaEQp2bv9fnK0pQ4=;
	b=eFMEU2maK8HZjK5FCJEdwpovlcU67SrmTCxSsbtSxUiK2m3/+Jk4C7wj7JuJhEKK2Ssizq
	bZ9Y4yuoaqafPn207Od0RQEmaV8GnWrMl0Sev9q2RlKA6Bpe5xLX1tPaiGp/JCxI1nOQb1
	7URsUoVslznxS2UnD5Y8mFXsfm0gbkc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-yg-aXVD_NvyhglCqAJCx7w-1; Mon, 05 Jun 2023 11:34:05 -0400
X-MC-Unique: yg-aXVD_NvyhglCqAJCx7w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4B39811E91;
	Mon,  5 Jun 2023 15:34:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C86DC0448E;
	Mon,  5 Jun 2023 15:33:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4A6A819465A4;
	Mon,  5 Jun 2023 15:33:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 438661946595
 for <linux-lvm@listman.corp.redhat.com>; Mon,  5 Jun 2023 15:33:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D2194140E956; Mon,  5 Jun 2023 15:33:43 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A9D6140E955;
 Mon,  5 Jun 2023 15:33:43 +0000 (UTC)
Date: Mon, 5 Jun 2023 10:33:43 -0500
From: David Teigland <teigland@redhat.com>
To: Cyclic Group Z_1 <cyclicgroup-z1@yahoo.com>,
 LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <20230605153343.GA32210@redhat.com>
References: <2119294287.3320828.1685752201585.ref@mail.yahoo.com>
 <2119294287.3320828.1685752201585@mail.yahoo.com>
MIME-Version: 1.0
In-Reply-To: <2119294287.3320828.1685752201585@mail.yahoo.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [linux-lvm] Question on RAID integrity limitations
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jun 03, 2023 at 12:30:01AM +0000, Cyclic Group Z_1 wrote:
> The lvmraid documentation says the following: "To work around some
> limitations, it is possible to remove integrity from the LV, make the
> change, then add integrity again. (Integrity metadata would need to
> initialized when added again.) ... The following are not yet permitted
> on RAID LVs with integrity: lvreduce, pvmove, snapshots, splitmirror,
> raid syncaction commands, raid rebuild." Does this mean that RAID
> rebuilds can only be done with integrity temporarily turned off?

It refers specifically to running the command "lvchange --rebuild".  I'm
not entirely sure how important that command is, but I'd be happy to hear
more about its usefulness.

> This seems risky given that rebuilds are often when RAID arrays undergo the
> most stress and are thus vulnerable to failures/errors (namely, for
> parity RAID). Additionally, is the suggested workaround for snapshots to
> temporarily turn off integrity when taking/using snapshots?  Thank you!

Snapshots were recently enabled:
https://sourceware.org/git/?p=lvm2.git;a=commit;h=fd6e113bba5fed5ee41152cde33220294c24ce2b

Dave

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

