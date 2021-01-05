Return-Path: <SRS0=nGWe=GI=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42422C433E0
	for <linux-lvm@archiver.kernel.org>; Tue,  5 Jan 2021 19:43:27 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BBE622D5A
	for <linux-lvm@archiver.kernel.org>; Tue,  5 Jan 2021 19:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BBE622D5A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thesusis.net
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-ZIHxOykTNsi7gXf4MjqE4g-1; Tue, 05 Jan 2021 14:43:22 -0500
X-MC-Unique: ZIHxOykTNsi7gXf4MjqE4g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 849C5800D55;
	Tue,  5 Jan 2021 19:43:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BADD75D9CC;
	Tue,  5 Jan 2021 19:43:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 965D04BB7B;
	Tue,  5 Jan 2021 19:42:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 105Jgs8i015171 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 5 Jan 2021 14:42:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 67A826F9C2; Tue,  5 Jan 2021 19:42:54 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 620636D9E3
	for <linux-lvm@redhat.com>; Tue,  5 Jan 2021 19:42:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD76B811E76
	for <linux-lvm@redhat.com>; Tue,  5 Jan 2021 19:42:50 +0000 (UTC)
Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-376-A1qW3Zy8O926ewvIUfpR2w-1; Tue, 05 Jan 2021 14:42:48 -0500
X-MC-Unique: A1qW3Zy8O926ewvIUfpR2w-1
Received: from localhost (localhost [127.0.0.1])
	by vps.thesusis.net (Postfix) with ESMTP id A9C9022B6E
	for <linux-lvm@redhat.com>; Tue,  5 Jan 2021 14:35:55 -0500 (EST)
Received: from vps.thesusis.net ([127.0.0.1])
	by localhost (vps.thesusis.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dpjz6XGLJG00 for <linux-lvm@redhat.com>;
	Tue,  5 Jan 2021 14:35:55 -0500 (EST)
Received: by vps.thesusis.net (Postfix, from userid 1000)
	id 5C7DF22D14; Tue,  5 Jan 2021 14:35:55 -0500 (EST)
User-agent: mu4e 1.5.7; emacs 26.3
From: Phillip Susi <phill@thesusis.net>
To: linux-lvm@redhat.com
Date: Tue, 05 Jan 2021 14:31:00 -0500
Message-ID: <87im8bch2c.fsf@vps.thesusis.net>
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
Subject: [linux-lvm] Mirror allocation policy
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I seem to remember ( and found some references on the web ) that there
used to be a way to change the allocation policy when creating a mirror
from the default of strict ( must use different pvs ), but I can't find
a mention of strict in the man pages these days.  I did see the option
for --alloc anywhere but lvconvert still refuses to change an lv into a
mirror saying that it can't find the extents ( there are plenty of
extents, but only one pv ).

How can I forge it to make the mirror on a single pv?  Alternatively,
how can I create a copy of an lv ( I was planning to mirror, then
--splitmirror ).

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

