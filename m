Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 970BA784CF
	for <linux-lvm@redhat.com>; Mon, 12 Jun 2017 12:53:46 +0000 (UTC)
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 21CE4369C4
	for <linux-lvm@redhat.com>; Mon, 12 Jun 2017 12:53:44 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id w1so123715056qtg.2
	for <linux-lvm@redhat.com>; Mon, 12 Jun 2017 05:53:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAPx6nLqwu=UMOaukpLf3o3rZOwzpkrYhftmRa8jGQHBNXF84Pg@mail.gmail.com>
References: <CAPx6nLqwu=UMOaukpLf3o3rZOwzpkrYhftmRa8jGQHBNXF84Pg@mail.gmail.com>
From: Jack Wang <jack.wang.usish@gmail.com>
Date: Mon, 12 Jun 2017 14:53:42 +0200
Message-ID: <CA+res+TWkj48=6N_TSXDxfVpg7KTkqCGfPTxObJuk1g9KYd59A@mail.gmail.com>
Subject: Re: [linux-lvm] deadlock during backup from lvm snapshot
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Sergey,

2017-05-11 11:46 GMT+02:00 Sergey Zhuravlev <sergey@divpro.ru>:
> Hi
>
> This message is a continuation of this thread:
> https://www.redhat.com/archives/linux-lvm/2016-November/msg00037.html
>
>> Please switch to newer version of lvm2.
>>
>> Sequence with snapshot activation had been reworked to minimize possibility to hit this kernel race - race is still there even with the latest kernel,
>> but in the real world you should not have a much chance to hit it.
>> If you still do - please report again - we will take more closer look and your workflow.
>
>
> The bug is still there. We have over 100 servers with LVM and everyday
> backups using snapshots.
> And we hit this race at least 1 time every week.
Looks the fix was included since 4.9.16+, have you tried it.

Do you have reproducer for the bug?

commit 21582cd0b64ca464084cb872b3d348065b0b54af
Author: Mikulas Patocka <mpatocka@redhat.com>
Date:   Wed Feb 15 11:26:10 2017 -0500

    dm: flush queued bios when process blocks to avoid deadlock

    commit d67a5f4b5947aba4bfe9a80a2b86079c215ca755 upstream.

    Commit df2cb6daa4 ("block: Avoid deadlocks with bio allocation by
    stacking drivers") created a workqueue for every bio set and code
    in bio_alloc_bioset() that tries to resolve some low-memory deadlocks
    by redirecting bios queued on current->bio_list to the workqueue if the
    system is low on memory.  However other deadlocks (see below **) may
    happen, without any low memory condition, because generic_make_request
    is queuing bios to current->bio_list (rather than submitting them).

    ** the related dm-snapshot deadlock is detailed here:
    https://www.redhat.com/archives/dm-devel/2016-July/msg00065.html

Regards,
Jack
