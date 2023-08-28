Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CE8C71153
	for <linux-lvm@archiver.kernel.org>; Mon, 28 Aug 2023 22:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693262834;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=N9ua0p9Bl5Dg35Np0O7EZzap9W8sa64jcNRqEQBkS3I=;
	b=Xs4NMcC+2apFu9EXpwOFVdAYW1NVUbfWbWZ7B7rMUTFuLOzLmnsrIqWjjkVwGfgMpJkF+F
	sX83hzyX9MRWQ7lbkvNl3E8zAu0EJFQ0N6n1l1zYreXEywGDClKmV1wFhcNZmOZQkuLULx
	uTmxuZxygAPKjF5KrrsuXJ8QKdBa1b0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-2s2VVmkqMle0PBM3rYovJg-1; Mon, 28 Aug 2023 18:47:10 -0400
X-MC-Unique: 2s2VVmkqMle0PBM3rYovJg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB30F185A78B;
	Mon, 28 Aug 2023 22:47:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 639916B59C;
	Mon, 28 Aug 2023 22:47:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2C22C19465B9;
	Mon, 28 Aug 2023 22:47:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 533E31946588
 for <linux-lvm@listman.corp.redhat.com>; Mon, 28 Aug 2023 22:47:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2C904112131E; Mon, 28 Aug 2023 22:47:02 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 239A01121318
 for <linux-lvm@redhat.com>; Mon, 28 Aug 2023 22:47:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD1F4280D584
 for <linux-lvm@redhat.com>; Mon, 28 Aug 2023 22:47:01 +0000 (UTC)
Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-265-E8n1gZo9MmOLHmLnDH2NZg-1; Mon,
 28 Aug 2023 18:46:59 -0400
X-MC-Unique: E8n1gZo9MmOLHmLnDH2NZg-1
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id 9FEF11365A9; Mon, 28 Aug 2023 18:36:44 -0400 (EDT)
References: <CABh+8g5708fk_yJ_P-9Ne20ir+qjFV8BHj7tj6_HWamUdi55=Q@mail.gmail.com>
 <f96fd13d-8fe5-cf49-82f-78186d1f6349@gathman.org>
User-agent: mu4e 1.7.12; emacs 27.1
From: Phillip Susi <phill@thesusis.net>
To: Stuart D Gathman <stuart@gathman.org>
Date: Mon, 28 Aug 2023 18:31:53 -0400
In-reply-to: <f96fd13d-8fe5-cf49-82f-78186d1f6349@gathman.org>
Message-ID: <87r0nmiykj.fsf@vps.thesusis.net>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [linux-lvm] Swapping LLVM drive
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: thesusis.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Stuart D Gathman <stuart@gathman.org> writes:

> Use dd to copy the partition table (this also often contains boot code)
> to the new disk on USB.
> Then use dd to copy the smaller partitions (efi,boot). Now use cfdisk
> to delete the 3rd partition. Expand the boot partition to 1G (you'll
> thank me later).
> Allocate the entire rest of the disk to p3.
> Create a new vg with a different name.  Allocate root and swap on
> new VG the same sizes.
> Take a snapshot of current root (delete swap on old drive since you
> didn't leave yourself any room), and use partclone to efficiently
> copy the filesystem over to new root.

Why would you use dd/partclone instead of just having LVM move
everything to the new drive on the fly?

Partition the new drive, use pvcreate to initialize the partition as a
pv, vgextend to add the pv to the existing vg, pvmove to evacuate the
logical volumes from the old disk, then vgreduce to remove it from the
vg.

Don't forget you'll need to reinstall grub on the new drive for it to
boot.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

