Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11085C433EF
	for <linux-lvm@archiver.kernel.org>; Tue, 28 Dec 2021 05:32:43 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-Y15PdUp6PD2B5wk2lRGtFQ-1; Tue, 28 Dec 2021 00:32:40 -0500
X-MC-Unique: Y15PdUp6PD2B5wk2lRGtFQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB4FF1006AA7;
	Tue, 28 Dec 2021 05:32:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5563570D24;
	Tue, 28 Dec 2021 05:32:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C7771809CB8;
	Tue, 28 Dec 2021 05:32:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BS5VpEF003539 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 28 Dec 2021 00:31:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CD8FC2166B44; Tue, 28 Dec 2021 05:31:51 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C86AF2166B2F
	for <linux-lvm@redhat.com>; Tue, 28 Dec 2021 05:31:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A89563C00088
	for <linux-lvm@redhat.com>; Tue, 28 Dec 2021 05:31:48 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-45-QE77hRJ3NH2MugNlmam81Q-1; Tue, 28 Dec 2021 00:31:46 -0500
X-MC-Unique: QE77hRJ3NH2MugNlmam81Q-1
Received: from mail.gathman.org (mail.gathman.org [IPv6:2001:470:8:809::1010])
	(authenticated bits=0)
	by mail.gathman.org (8.14.7/8.14.7) with ESMTP id 1BS546tA014195
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 28 Dec 2021 00:04:10 -0500
Date: Tue, 28 Dec 2021 00:04:06 -0500 (EST)
From: Stuart D Gathman <stuart@gathman.org>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <CACrcyfJW0UyEPmx6AXk_+X0N7hjR0ms2SLtXwaEtsafVUUvedA@mail.gmail.com>
Message-ID: <1b906296-f66d-e755-9574-f1398bc9564@gathman.org>
References: <0026c26e-a5e0-272d-e5d6-739466cbd6b2@gmail.com>
	<89C3404F-E604-45DA-AEFD-200DCC89631D@gmail.com>
	<a9188fbf-5859-4406-7075-4a116bdc036f@gmail.com>
	<CACrcyfJW0UyEPmx6AXk_+X0N7hjR0ms2SLtXwaEtsafVUUvedA@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-lvm@redhat.com
Cc: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Subject: Re: [linux-lvm] how to convert a disk containing a snapshot to a
 snapshot lv?
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

> If you want to give it a try, just create a snapshot on a specific device
> And change all the blocks on the origin, there you are, you now have a cow
> device containing all data needed.
> How to move this snapshot device to another server, reattach it to an empty
> lv volume as a snapshot.
> lvconvert -s, command requires an argument of an existing snapshot volume
> name.
> But there is no snapshot on the new server, so it can't re-attach the
> volume.
> So what procedures should be invoked to create just the detached references
> in LVM, so that the lvconver -s command can work?

Just copy the snapshot to another server, by whatever method you would
use to copy the COW and Data volumes (I prefer partclone for supported
filesystems).  No need for lvconvert.  You are trying WAY WAY too hard.
Are you by any chance trying to create an incremental backup system
based on lvm snapshot COW?  If so, say so.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

