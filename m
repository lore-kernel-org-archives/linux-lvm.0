Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E8772022780
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2020 04:17:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7C10102F1E2
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2020 04:17:57 +0000 (UTC)
From: Annamalai Gurusami <annamalai.gurusami@oracle.com>
References: <87362fg62i.fsf@oracle.com>
	<24457.45991.672260.342062@quad.stoffel.home>
Date: Mon, 19 Oct 2020 09:47:39 +0530
Message-ID: <87eelu97do.fsf@oracle.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Identifying Unused VG
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
To: John Stoffel <john@stoffel.org>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

"John Stoffel" <john@stoffel.org> writes:

>>>>>> "Annamalai" == Annamalai Gurusami <annamalai.gurusami@oracle.com> writes:
>
> Annamalai> I am new user of LVM.  At home, in a desktop machine, I
> Annamalai> installed Ubuntu 20.04 LTS and while doing so I opted for
> Annamalai> LVM.  This desktop computer has 2 hard disks.  I want to
> Annamalai> remove 1 hard disk and use it for another computer.  But I
> Annamalai> need to remove the hard disk without loss of data.  The
> Annamalai> problem now is that there are two VG listed, while I think
> Annamalai> it should be only one.  How to identify the unwanted VG?
> Annamalai> Maybe this is because of multiple attempts at installation.
> Annamalai> Any help on this is much appreciated.
>
> Ugh!  How did you do this?  Did you clone one disk on top of another?

I did installation two times.  My first installation attempt failed and
I repeated the process.  I don't remember what exactly failed in the
first attempt. In the two attempts, I guess I might have given different
hard disk for the root file system.  In each attempt, I told Ubuntu to
use both the hard disks with LVM.

Suppose Ubuntu is installed on both the hard disks, then I should be
able to boot Ubuntu from either of them.  But currently I can boot from
only one of them.

> Can you boot off a liveCD and do the same command again please?   Also
> please run the 'blkid' command show that output as well.  And show the
> output of 'cat /proc/partitions' and /proc/mdstat as well.  Are you
> running RAID on this system?  Or did you try to do that?

I don't have a live CD ready with me.  I'll try the other simpler option
(below) first and will come back to this if that didn't work.

> Annamalai> Here are some of the output of the commands in that desktop:
>
> Looking at your 'lsblk' output, I suspect you can remove drive sda,
> the Seagate.  So I'd probably try to shutdown cleanly, then remove
> that drive and boot up again.

I'll try this first and let you know how it goes.

Thanks.

Rgds,
anna

-- 
mysql> help year data type;
Name: 'YEAR DATA TYPE'
Description:
YEAR[(4)]

A year in 4-digit format. MySQL displays YEAR values in YYYY format,
but permits assignment of values to YEAR columns using either strings
or numbers. Values display as 1901 to 2155, or 0000.
