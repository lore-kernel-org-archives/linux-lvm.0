Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B8BA2166B44
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2020 19:53:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E1A3805BD6
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2020 19:53:37 +0000 (UTC)
MIME-Version: 1.0
Message-ID: <24461.61117.995223.318047@quad.stoffel.home>
Date: Mon, 19 Oct 2020 15:53:33 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <87eelu97do.fsf@oracle.com>
References: <87362fg62i.fsf@oracle.com>
	<24457.45991.672260.342062@quad.stoffel.home>
	<87eelu97do.fsf@oracle.com>
Content-Transfer-Encoding: 7bit
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
To: Annamalai Gurusami <annamalai.gurusami@oracle.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

>>>>> "Annamalai" == Annamalai Gurusami <annamalai.gurusami@oracle.com> writes:

Annamalai> "John Stoffel" <john@stoffel.org> writes:
>>>>>>> "Annamalai" == Annamalai Gurusami <annamalai.gurusami@oracle.com> writes:
>> 
Annamalai> I am new user of LVM.  At home, in a desktop machine, I
Annamalai> installed Ubuntu 20.04 LTS and while doing so I opted for
Annamalai> LVM.  This desktop computer has 2 hard disks.  I want to
Annamalai> remove 1 hard disk and use it for another computer.  But I
Annamalai> need to remove the hard disk without loss of data.  The
Annamalai> problem now is that there are two VG listed, while I think
Annamalai> it should be only one.  How to identify the unwanted VG?
Annamalai> Maybe this is because of multiple attempts at installation.
Annamalai> Any help on this is much appreciated.
>> 
>> Ugh!  How did you do this?  Did you clone one disk on top of another?

Annamalai> I did installation two times.  My first installation
Annamalai> attempt failed and I repeated the process.  I don't
Annamalai> remember what exactly failed in the first attempt. In the
Annamalai> two attempts, I guess I might have given different hard
Annamalai> disk for the root file system.  In each attempt, I told
Annamalai> Ubuntu to use both the hard disks with LVM.

So once you find out which disk boots Linux ok, note down the
partition layout.  Then reboot with the second disk attached and make
sure you do something like:

  dd if=/dev/zero bs=64k count=512 /dev/sd<second disk>

which will be either sda or sdb.  This 'dd' command will wipe the
partition table and all the LVM data as well, so you can install
windows on it.

Good luck.


Annamalai> Suppose Ubuntu is installed on both the hard disks, then I should be
Annamalai> able to boot Ubuntu from either of them.  But currently I can boot from
Annamalai> only one of them.

>> Can you boot off a liveCD and do the same command again please?   Also
>> please run the 'blkid' command show that output as well.  And show the
>> output of 'cat /proc/partitions' and /proc/mdstat as well.  Are you
>> running RAID on this system?  Or did you try to do that?

Annamalai> I don't have a live CD ready with me.  I'll try the other simpler option
Annamalai> (below) first and will come back to this if that didn't work.

Annamalai> Here are some of the output of the commands in that desktop:
>> 
>> Looking at your 'lsblk' output, I suspect you can remove drive sda,
>> the Seagate.  So I'd probably try to shutdown cleanly, then remove
>> that drive and boot up again.

Annamalai> I'll try this first and let you know how it goes.

Annamalai> Thanks.

Annamalai> Rgds,
Annamalai> anna

Annamalai> -- 
mysql> help year data type;
Annamalai> Name: 'YEAR DATA TYPE'
Annamalai> Description:
Annamalai> YEAR[(4)]

Annamalai> A year in 4-digit format. MySQL displays YEAR values in YYYY format,
Annamalai> but permits assignment of values to YEAR columns using either strings
Annamalai> or numbers. Values display as 1901 to 2155, or 0000.
