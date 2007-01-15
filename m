Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0FMg1PG027539
	for <linux-lvm@redhat.com>; Mon, 15 Jan 2007 17:42:01 -0500
Received: from mailserv03.cliche.dk (mailserv03.cliche.dk [195.249.40.228])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0FMfxW0031336
	for <linux-lvm@redhat.com>; Mon, 15 Jan 2007 17:42:00 -0500
Received: from [81.216.192.212] by mailserv03.cliche.dk [195.249.40.228] with
	SmartMax MailMax for linux-lvm@redhat.com;
	Mon, 15 Jan 2007 23:53:02 +0100
Received: from aragorn (aragorn [10.76.16.120])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.hyllander.org (Postfix) with ESMTP id 808EB482DD
	for <linux-lvm@redhat.com>; Mon, 15 Jan 2007 23:41:48 +0100 (CET)
Message-ID: <45AC032A.20104@hyllander.org>
Date: Mon, 15 Jan 2007 23:41:46 +0100
From: Magnus Hyllander <mhylist1@hyllander.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Different sizes being reported for logical volume
	after	extend
References: <456F4196.4020603@hyllander.org>
In-Reply-To: <456F4196.4020603@hyllander.org>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

I've been trying to solve this problem on my own but without success. 
One thing has changed though, and that is that the size of the logical 
volume is now 8GB both when I boot from the disk and from the rescue cd. 
So at least the logical volume seems to be alright now. But fsck still 
complains that the "device" is half the size of the file system. What 
"device" is fsck looking at, and why is the size wrong? I'd really 
appreciate some help!

Thanks,
Magnus

Magnus Hyllander wrote:
>  Hi,
>
> I have a little problem with a logical volume: in short, the size of 
> the volume is different depending on if I boot from the FC5 rescue CD 
> or from the installed FC5.
>
> I have two mirrored disks. On the mirror I have created a logical 
> volume /dev/VolGroup00/LogVol00 which contains the root filesystem. 
> Initially I made the volume 4GB. Later I needed more space, so I 
> decided to extend the volume to 8GB. I booted from the FC5 rescue CD 
> and ran the following commands:
>
>    dmraid -a y
>    lvm vgscan
>    lvm vgchange -a y
>    lvm lvextend -L +4G /dev/VolGroup00/LogVol00
>    fsck /dev/VolGroup00/LogVol00
>    resize2fs /dev/VolGroup00/LogVol00
>
> So far so good. Then I rebooted the system from disk and got the 
> following error:
>
>    Checking filesystems
>    /dev/VolGroup00/LogVol00: The filesystem size (according to the
>    superblock) is 2097152 blocks
>    The physical size of the device is 1048576 blocks
>    Either the superblock or the partition table is likely to be corrupt!
>
>    /dev/VolGroup/LogVol00: UNEXPECTED INCONSISTENCY, run fsck manually.
>
> I entered the system administration mode and checked the size of 
> /dev/VolGroup/LogVol00 with "lvm lvs": 4.00G
> Strange... so I booted with the rescue CD again and checked the size 
> once more from the rescue environment: 8.00G.
>
> So it seems that when I boot the system normally it doesn't "see" that 
> the size of the logical volume has changed. Can someone explain this, 
> and hopefully help me fix the problem?
>
> /Magnus
