Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07ABC00144
	for <linux-lvm@archiver.kernel.org>; Thu,  4 Aug 2022 07:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659596857;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=woBusx534OOM3SUhWTXfln31/WkRA4rwasyF/c9zo9o=;
	b=CWEct3xTXpFTOE+qdB510281uskdngG9o1+C8qqnk0ME/r4GT8lxco77XCiI2p45xxwlom
	IpXSLPiGCu6R1Ts/s7RXlCmMaE1ZLRZ941w6tCFiJhd5t0G8q2ZD42cqHd481hz4HVwhcf
	A9UrzBmi1yz3KuVRM/fFGkCIMtBahkU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-BdrZQXqINu65DjM6SsHgAg-1; Thu, 04 Aug 2022 03:07:34 -0400
X-MC-Unique: BdrZQXqINu65DjM6SsHgAg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E52613C10698;
	Thu,  4 Aug 2022 07:07:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 96176403168;
	Thu,  4 Aug 2022 07:07:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5716A1946A56;
	Thu,  4 Aug 2022 07:07:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 70DFF1946A4E
 for <linux-lvm@listman.corp.redhat.com>; Wed,  3 Aug 2022 21:14:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 55FA4492CA2; Wed,  3 Aug 2022 21:14:34 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49804492C3B
 for <linux-lvm@redhat.com>; Wed,  3 Aug 2022 21:14:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31FBB185A7B2
 for <linux-lvm@redhat.com>; Wed,  3 Aug 2022 21:14:34 +0000 (UTC)
Received: from mx1.helsinki.tools (mx1.helsinki.tools [116.202.14.156]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-zUCM5M6bMAC14tNEqFL-cQ-1; Wed, 03 Aug 2022 17:14:31 -0400
X-MC-Unique: zUCM5M6bMAC14tNEqFL-cQ-1
Date: Wed, 3 Aug 2022 23:14:26 +0200
From: ajs124 <linux-lvm@ajs124.de>
To: David Teigland <teigland@redhat.com>
Message-ID: <20220803231426.4bc948e3@desk>
In-Reply-To: <20220803151554.GA28867@redhat.com>
References: <20220802162753.6c214fe5@desk> <20220803151554.GA28867@redhat.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mailman-Approved-At: Thu, 04 Aug 2022 07:07:27 +0000
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 3 Aug 2022 10:15:54 -0500
David Teigland <teigland@redhat.com> wrote:

> On Tue, Aug 02, 2022 at 04:27:53PM +0200, ajs124 wrote:
> > Hi,
> > 
> > I've been wondering. Why does lvconvert not allow me to add raid
> > integrity to LVs that are not top level?
> > It only says "Integrity can only be added to top level raid LV."
> > 
> > Skimming the commit that added this [1] did not provide me with
> > an answer, so I thought I'd ask here.  
> 
> Hi, good question, I think it was just an effort to limit the scope of the
> feature initially.  Over time we can possibly expand the scope after
> seeing how things were working technically, and the experience of users.
> I'm curious to know what configuration you're trying, and if you have any
> experience using raid+integrity otherwise.
> 
> Dave

Hi,

we're using a thin pool on top of two raid lvs for thinpool metadata
and data and I tried adding integrity to that.

We don't have much experience with raid+integrity, just a handful of
systems, which have been running fine. They're not particularly
performance critical and we don't have much data on how exactly they
behave.

The reason why I started looking into this again is because I observed
some mismatched sectors on a host, where all drives seem fine and I'd
like to have integrity to maybe figure out if any of the drives are
actually faulty.

ajs124

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

