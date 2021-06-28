Return-Path: <SRS0=u9pG=LW=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 383DCC2B9F4
	for <linux-lvm@archiver.kernel.org>; Mon, 28 Jun 2021 04:23:27 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8D8061C34
	for <linux-lvm@archiver.kernel.org>; Mon, 28 Jun 2021 04:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8D8061C34
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gathman.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-LkdavMaTMYO1Jv5BcGyTLQ-1; Mon, 28 Jun 2021 00:23:23 -0400
X-MC-Unique: LkdavMaTMYO1Jv5BcGyTLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5E27107AD81;
	Mon, 28 Jun 2021 04:23:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 031C05C1C5;
	Mon, 28 Jun 2021 04:23:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BFA2D4EA2A;
	Mon, 28 Jun 2021 04:22:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15S4MttJ014759 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 28 Jun 2021 00:22:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4B5A39D54; Mon, 28 Jun 2021 04:22:55 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4697E51DD
	for <linux-lvm@redhat.com>; Mon, 28 Jun 2021 04:22:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4A1989B841
	for <linux-lvm@redhat.com>; Mon, 28 Jun 2021 04:22:51 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-408-DQUJ0A2iPICGI-N9pH1Aww-1; Mon, 28 Jun 2021 00:22:47 -0400
X-MC-Unique: DQUJ0A2iPICGI-N9pH1Aww-1
Received: from wiki.gathman.org (mail.gathman.org [IPv6:2001:470:8:809::1010])
	(authenticated bits=0)
	by mail.gathman.org (8.14.7/8.14.7) with ESMTP id 15S3SK3Y024992
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sun, 27 Jun 2021 23:28:23 -0400
Date: Sun, 27 Jun 2021 23:28:20 -0400 (EDT)
From: Stuart D Gathman <stuart@gathman.org>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <d59d7b98-3eb6-4d7d-a0f0-f1d82af143f5@suse.com>
Message-ID: <b0c22aef-8a9-73e6-db74-c24633c3496@gathman.org>
References: <ba88aa20-e176-0a07-5578-20afb39e0950@suse.com>
	<2d5ff29e-2836-0407-ce76-271255487baa@redhat.com>
	<d59d7b98-3eb6-4d7d-a0f0-f1d82af143f5@suse.com>
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
Cc: Zhong Lidong <lidong.zhong@suse.com>, David Teigland <teigland@redhat.com>,
	Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [linux-lvm] Does LVM have any plan/schedule to support btrfs in
 fsadm
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On Mon, 28 Jun 2021, heming.zhao@suse.com wrote:

> In my opinion, the using style of btrfs by many users are same as ext4/xfs.

Yes.  I like the checksums in metadata feature for enhanced integrity
checking.

It seems too complicated to have anytime soon - but when a filesystem
detects corruption, and is on an LVM (or md) RAID1 layer, an ioctl to
read alternate mirror branches to see which (if any) has the correct
data would allow recovery.  Btrfs does this if it is doing the
mirroring, but then you lose all the other features from LVM or md raid10, 
including running other filesystems and efficient virtual disks for
virtual machines.

We eventually got DISCARD operations to pass to lower layers.
Dealing with mirror branches should really be a thing too.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

