Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4521C19F2D
	for <linux-lvm@archiver.kernel.org>; Wed,  3 Aug 2022 15:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659539770;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=41Ea/vrSQXddRKVb6sgE4b9jMl+utHZKokrYVCkP8K4=;
	b=JNeeSwXAbREty40BTfYiyrcawMYbvJTZXfxKpN9meQZmbueNr4BPopr1/sJd5R3f/Rn1J+
	3ZWMOc4/uZr429hXz7gC6h6cU2E/171FMaf2zK6DbHEoAWIfnyF/bq3d+uEuLVwh10tFo2
	RybsKAiX75mQuSdBrcFHRqAyGZgJ3RE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-SzkpjBH8O-GJUqBWuwkpeQ-1; Wed, 03 Aug 2022 11:16:07 -0400
X-MC-Unique: SzkpjBH8O-GJUqBWuwkpeQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B78D3804508;
	Wed,  3 Aug 2022 15:16:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 57DD51121314;
	Wed,  3 Aug 2022 15:15:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 025F51946A53;
	Wed,  3 Aug 2022 15:15:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CA8C61946A4E
 for <linux-lvm@listman.corp.redhat.com>; Wed,  3 Aug 2022 15:15:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A613C492CA5; Wed,  3 Aug 2022 15:15:56 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F24D492CA2;
 Wed,  3 Aug 2022 15:15:56 +0000 (UTC)
Date: Wed, 3 Aug 2022 10:15:54 -0500
From: David Teigland <teigland@redhat.com>
To: ajs124 <linux-lvm@ajs124.de>
Message-ID: <20220803151554.GA28867@redhat.com>
References: <20220802162753.6c214fe5@desk>
MIME-Version: 1.0
In-Reply-To: <20220802162753.6c214fe5@desk>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [linux-lvm] raidintegrity on non top level LVs
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
Cc: linux-lvm@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 02, 2022 at 04:27:53PM +0200, ajs124 wrote:
> Hi,
> 
> I've been wondering. Why does lvconvert not allow me to add raid
> integrity to LVs that are not top level?
> It only says "Integrity can only be added to top level raid LV."
> 
> Skimming the commit that added this [1] did not provide me with
> an answer, so I thought I'd ask here.

Hi, good question, I think it was just an effort to limit the scope of the
feature initially.  Over time we can possibly expand the scope after
seeing how things were working technically, and the experience of users.
I'm curious to know what configuration you're trying, and if you have any
experience using raid+integrity otherwise.

Dave
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

