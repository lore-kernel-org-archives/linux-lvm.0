Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14192C433F5
	for <linux-lvm@archiver.kernel.org>; Mon, 31 Jan 2022 07:48:11 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-1r4f6T8_PGyq9-Pn7arXJQ-1; Mon, 31 Jan 2022 02:48:08 -0500
X-MC-Unique: 1r4f6T8_PGyq9-Pn7arXJQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E26621006AA6;
	Mon, 31 Jan 2022 07:48:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 065A91037F37;
	Mon, 31 Jan 2022 07:47:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D6C11809CB8;
	Mon, 31 Jan 2022 07:47:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20V7lexL005829 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 31 Jan 2022 02:47:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B876440CFD18; Mon, 31 Jan 2022 07:47:40 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B46EE40CFD0F
	for <linux-lvm@redhat.com>; Mon, 31 Jan 2022 07:47:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 328683C02186
	for <linux-lvm@redhat.com>; Mon, 31 Jan 2022 07:47:40 +0000 (UTC)
Received: from plutone.assyoma.it
	(host195-56-237-212.serverdedicati.aruba.it [212.237.56.195]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-249-cXOgo_a9NDiEIHMzoEnbog-1; Mon, 31 Jan 2022 02:47:37 -0500
X-MC-Unique: cXOgo_a9NDiEIHMzoEnbog-1
Received: from webmail.assyoma.it (localhost [IPv6:::1])
	by plutone.assyoma.it (Postfix) with ESMTPA id 99F16DEBDF33;
	Mon, 31 Jan 2022 08:47:34 +0100 (CET)
MIME-Version: 1.0
Date: Mon, 31 Jan 2022 08:47:34 +0100
From: Gionatan Danti <g.danti@assyoma.it>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <30ba3f0683afb9c3b60d96ac0019ced4ce9bb5b8.camel@gathman.org>
References: <YfWkwtOTFYxDyYrW@itl-email>
	<6da8a7fc-4ca4-9c1d-c547-dcba827c5c99@gmail.com>
	<YfXcxHenCZw4+EFX@itl-email>
	<4bb347f0-b63b-d6f6-d501-1318053d0e56@gmail.com>
	<YfbApm+9ac6iBbbg@itl-email>
	<30ba3f0683afb9c3b60d96ac0019ced4ce9bb5b8.camel@gathman.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <c38e3b194516441f9fa08139b80fa0f6@assyoma.it>
X-Sender: g.danti@assyoma.it
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-lvm@redhat.com
Cc: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Subject: Re: [linux-lvm] LVM performance vs direct dm-thin
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Il 2022-01-30 22:39 Stuart D. Gathman ha scritto:
> I use LVM as flexible partitions (i.e. only classic LVs, no thin pool).
> Classic LVs perform like partitions, literally using the same driver
> (device mapper) with a small number of extents, and are if anything
> more recoverable than partition tables.  We used to put LVM on bare
> drives (like AIX did) - who needs a partition table?  But on Wintel,
> you need a partition table for EFI and so that alien operating systems
> know there is something already on a disk.

Classical (fat) LVs are rock solid, but how do you cope with fast (maybe 
rolling) snapshotting? This is the main selling point of thinlvm.

> Since we use LVs like partitions - mixing with btrfs is not an issue.
> Just use the LVs like partitions.  I haven't tried ZFS on linux - it
> may have LVM like features that could fight with LVM.  ZFS would be my
> first choice on a BSD box.

I broadly use ZFS - and yes, it is a wonderful tools. Than said, it has 
its own gotcha. For example:
- snapshot rollback is a destructive operation (ie: after rollback, you 
permanently lose the current filesystem state);
- clones (writable snapshots) depend on the read-only base image (ie: on 
the original snapshot), which you can not delete until you have its 
clones around.

Moreover, snapshotting/cloning a ZFS dataset (or volume) does not appear 
to be significantly faster then LVM - sometime it requires ~1s, 
depending on the load.

> We do not use LVM raid - but either run mdraid underneath, or let btrfs
> do it's data duplication thing with LVs on different spindles.

I always found btrfs very underperforming when facing random rewrite 
workloads as VMs and DBs. Can I ask your experience?
Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

