Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56CCECAAA1
	for <linux-lvm@archiver.kernel.org>; Mon, 24 Oct 2022 17:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666633990;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D46mTFwtgWWHvaoPBVqB1u/bVJhZX0/mzcPptGmI8Gs=;
	b=QykwaOqF3R5hXd/Z/BhpcpZE5IOS78a8Ba0qAdd2U9O8owbc+Ty8lf4HMZKbS096DbfMfy
	Al1YMV5EfGtYvMkiEaLOWUR6NvXXPtrvQ3FEEQmTZrYuoa2N3QToGnV/oRDdEypzBHuxQf
	i58k+TfB4mqk1KQ/4ecA4OpbULuh2FE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-Cd4xjfqCMkeXb0EP_9xGAA-1; Mon, 24 Oct 2022 13:51:56 -0400
X-MC-Unique: Cd4xjfqCMkeXb0EP_9xGAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 768D33C32C44;
	Mon, 24 Oct 2022 17:51:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 883831415114;
	Mon, 24 Oct 2022 17:51:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6703B19465A4;
	Mon, 24 Oct 2022 17:51:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6CDB4194658F
 for <linux-lvm@listman.corp.redhat.com>; Mon, 24 Oct 2022 17:51:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DB00E492CA4; Mon, 24 Oct 2022 17:51:38 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A98D492CA2;
 Mon, 24 Oct 2022 17:51:38 +0000 (UTC)
Date: Mon, 24 Oct 2022 12:51:37 -0500
From: David Teigland <teigland@redhat.com>
To: corubba <corubba@gmx.de>
Message-ID: <20221024175137.GA3747@redhat.com>
References: <e47a6b2f-e5f3-a81a-a4ba-e5bde5c7f3b6@gmx.de>
MIME-Version: 1.0
In-Reply-To: <e47a6b2f-e5f3-a81a-a4ba-e5bde5c7f3b6@gmx.de>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [linux-lvm] lvs activation columns are confusing for shared
 volume groups
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Oct 22, 2022 at 02:05:39PM +0200, corubba wrote:
> Hi,
> 
> in 2018 there was a change [0] that removed clvmd support from the LV
> active columns of the `lvs` tool. The column `lv_active_remotely` is
> always unset/empty, and the columns `lv_active_locally` and
> `lv_active_exclusively` are all simply coupled to the activation state
> of the LV. For a local VG this all fine and dandy, but it gets confusing
> for shared VGs. Take this example of a 2-node shared VG setup using
> lvmlockd+sanlock:

> As soon as a LV is active, `lvs` will report it as "active exclusively"
> regardless of whether it was activated in exclusive or shared mode. To
> get accurate information, you have to check the lock-mode on that LV
> using `lvmlockctl --info`. And as noted above, it is never reported as
> "active remotely" even if it is. It took me a while to realise this.

Hi, thanks for the report, these are some good questions.

"active remotely": lvmlockd is unable to passively report the remote
active or locked state of an LV.  A node only knows if it has the LV
active or locked itself.  One node can find out if other nodes have the LV
locked only by attempting to lock the LV and seeing if it fails.  This
interferes with actual usage, so it wouldn't be appropriate to do this
lock-to-check-state automatically.  Also, an LV is locked due to being
either active or modified, so calling it the "active" state would not be
entirely accurate.

"active exclusively": lvm could be improved here by not setting this field
when lvmlockd holds a shared lock on the LV.  The lvm reporting would need
to ask lvmlockd what lock mode was held (_query_lock_lv.)  The same caveat
applies about calling it the "active" state, although we could combine the
lock state with the active state to exclude the case where the LV is
locked exclusively for modification while inactive.

> I am willing to spend some time on this to develop a fix, but I am
> unsure in what direction to move.

I think a patch would be useful to improve lv_active_exclusively
(_lvactiveexclusively_disp) to consider the state from both lv_is_active()
and query_lock_lv().

> deprecation note in the docs for these columns would be appropriate. Or
> more drastically, remove these columns altogether.

The "active remotely" deprecation could be added to the lvmlockd man page
under "changes from clvmd".

> The downside is the output of `lvmlockctl` in its current state isn't
> very human-readable, especially compared to lvs.

Right, it's for debugging so any useful info should be added to lvs.

Dave
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

