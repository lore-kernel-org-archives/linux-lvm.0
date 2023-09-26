Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFC9E7F150
	for <linux-lvm@archiver.kernel.org>; Wed, 27 Sep 2023 01:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695778688;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DzjfKY8G5y760O5y2pjgRa4yN2crKiVpLtaCtTJ8O0U=;
	b=fuKmGSZ17D8nbYLH5f/br8AURbHgXZykhhp52kggyyfs5pmtw61cLj41i02VFsrmyHlmWz
	a/a1zv2zJYGUXUwLaAHfvzPlJyDCgIvot5le6qKmhUrCq6XQuMWTYPZifBxX/jsP2YaFJJ
	ezVT25FVrhr3od0VZv5keZdFFigBOUk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-RQiq7U2mPPa6sBgxQHmXvQ-1; Tue, 26 Sep 2023 21:38:04 -0400
X-MC-Unique: RQiq7U2mPPa6sBgxQHmXvQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CE68185A790;
	Wed, 27 Sep 2023 01:38:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BE19410F1BE9;
	Wed, 27 Sep 2023 01:37:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 45D2B194658D;
	Wed, 27 Sep 2023 01:37:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 65BAE1946588
 for <linux-lvm@listman.corp.redhat.com>; Wed, 27 Sep 2023 01:34:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3527040C6E76; Wed, 27 Sep 2023 01:34:04 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DAA340C6EA8
 for <linux-lvm@redhat.com>; Wed, 27 Sep 2023 01:34:04 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 050E32815E2B
 for <linux-lvm@redhat.com>; Wed, 27 Sep 2023 01:34:04 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-KmidDc0WP2KZMEbCHdojtw-1; Tue, 26 Sep 2023 21:34:01 -0400
X-MC-Unique: KmidDc0WP2KZMEbCHdojtw-1
Received: from mail.gathman.org (mail.gathman.org [IPv6:2001:470:8:809::1010])
 (authenticated bits=0)
 by mail.gathman.org (8.14.7/8.14.7) with ESMTP id 38QNWgTW021005
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 26 Sep 2023 19:32:42 -0400
Date: Tue, 26 Sep 2023 19:32:42 -0400 (EDT)
From: Stuart D Gathman <stuart@gathman.org>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <CAM5YWZfL8zf9=re+VU2MiAQcYvXodqDV-08Zu5RkKUMfkDJ7Tg@mail.gmail.com>
Message-ID: <c071b13b-70a8-d2f4-bcd9-21ca33ce5b19@gathman.org>
References: <CAM5YWZfo5q5rP+E2JFudGaHJLQ-2bk2UfpR=En5eDF37JKq2rw@mail.gmail.com>
 <6e0faedf-f450-4454-a86b-6448a1b4747b@gmail.com>
 <CAM5YWZfL8zf9=re+VU2MiAQcYvXodqDV-08Zu5RkKUMfkDJ7Tg@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [linux-lvm] Can I combine LUKS and LVM to achieve encryption
 and snapshots?
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
Cc: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gathman.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On Wed, 27 Sep 2023, Jean-Marc Saffroy wrote:

> So I prefer to manage available raw (un-encrypted) space with LVM.
>
> Now, I also need to do backups of /home, and that's why I want
> snapshots. But that first layer of LVM would only show a snapshot of
> an encrypted volume, and the backup job shouldn't have the passphrase
> to decrypt the volume.
>
> Which is why I'm trying to find a way of doing snaphots of an "opened"
> LUKS volume: this way, the backup job can do its job without requiring
> a passphrase.

Besides LVM on LUKS on LVM which you already tried, consider using
a filesystem that supports snapshots.  I use btrfs, and snapshots work
beautifully, and if you use "btrfs send" you can even do differential
backups.  Btrfs is COW, so snaps share all blocks not touched.

Pipe the output of btrfs send directly to your backup process/server
running "btrfs receive".  Note, this requires the backup server to have
btrfs.  If it doesn't, then just use rsync from the snapshot directory
to the backup server like a typical unix backup solution.  (E.g. my vm
host uses XFS on the backup drives, so it uses rsync.)

> In simple tests, I could make it work, with dmsetup on LUKS on LVM,
> and also (after I sent my original email) with LVM on LUKS on LVM.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

