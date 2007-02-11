Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1B2Od78030704
	for <linux-lvm@redhat.com>; Sat, 10 Feb 2007 21:24:39 -0500
Received: from mailserv03.cliche.dk (mailserv03.cliche.dk [195.249.40.228])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l1B2OYd9020752
	for <linux-lvm@redhat.com>; Sat, 10 Feb 2007 21:24:35 -0500
Received: from [81.216.192.212] by mailserv03.cliche.dk [195.249.40.228] with
	SmartMax MailMax for linux-lvm@redhat.com;
	Sun, 11 Feb 2007 03:36:21 +0100
Received: from aragorn (aragorn [10.76.16.120])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.hyllander.org (Postfix) with ESMTP id 7CA77480B9
	for <linux-lvm@redhat.com>; Sun, 11 Feb 2007 03:24:07 +0100 (CET)
Message-ID: <45CE7E36.5070609@hyllander.org>
Date: Sun, 11 Feb 2007 03:23:50 +0100
From: Magnus Hyllander <mhylist1@hyllander.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Different sizes being reported for logical volume
	after extend
References: <456F4196.4020603@hyllander.org> <45AC032A.20104@hyllander.org>
In-Reply-To: <45AC032A.20104@hyllander.org>
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

I finally managed to solve my problem.

After some fiddling around with resize2fs, with which I changed the size 
of the root partition back and forth between 4GB and 8GB a couple of 
times, I actually ended up with the initial situation in which I again 
saw that the size of  /dev/VolGroup00/LogVol00 was 4GB when booting from 
disk. So I started thinking, maybe the metadata is wrong somehow (even 
though it looks right when booting with the rescue CD). I tried to run 
"lvm vgcfgrestore VolGroup00", but could not do that because I got a 
"Locking type 1" failure.

When I booted from the rescue CD, "lvm vgscan" followed by "lvm lvs" 
showed 8GB. Then I tried successfully to run "lvm vgcfgrestore 
VolGroup00". When I rebooted from disk again, the problem was solved!

I can't really say that I understand what was going on, why "lvm lvs" 
showed different results when booting from disk or the rescue CD. Maybe 
one of you knowledgeable people can offer an explanation?

Thanks,
Magnus

Magnus Hyllander wrote:
> Hi,
>
> I've been trying to solve this problem on my own but without success. 
> One thing has changed though, and that is that the size of the logical 
> volume is now 8GB both when I boot from the disk and from the rescue 
> cd. So at least the logical volume seems to be alright now. But fsck 
> still complains that the "device" is half the size of the file system. 
> What "device" is fsck looking at, and why is the size wrong? I'd 
> really appreciate some help!
>
> Thanks,
> Magnus
>
> Magnus Hyllander wrote:
>>  Hi,
>>
>> I have a little problem with a logical volume: in short, the size of 
>> the volume is different depending on if I boot from the FC5 rescue CD 
>> or from the installed FC5.
>>
>> I have two mirrored disks. On the mirror I have created a logical 
>> volume /dev/VolGroup00/LogVol00 which contains the root filesystem. 
>> Initially I made the volume 4GB. Later I needed more space, so I 
>> decided to extend the volume to 8GB. I booted from the FC5 rescue CD 
>> and ran the following commands:
>>
>>    dmraid -a y
>>    lvm vgscan
>>    lvm vgchange -a y
>>    lvm lvextend -L +4G /dev/VolGroup00/LogVol00
>>    fsck /dev/VolGroup00/LogVol00
>>    resize2fs /dev/VolGroup00/LogVol00
>>
>> So far so good. Then I rebooted the system from disk and got the 
>> following error:
>>
>>    Checking filesystems
>>    /dev/VolGroup00/LogVol00: The filesystem size (according to the
>>    superblock) is 2097152 blocks
>>    The physical size of the device is 1048576 blocks
>>    Either the superblock or the partition table is likely to be corrupt!
>>
>>    /dev/VolGroup/LogVol00: UNEXPECTED INCONSISTENCY, run fsck manually.
>>
>> I entered the system administration mode and checked the size of 
>> /dev/VolGroup/LogVol00 with "lvm lvs": 4.00G
>> Strange... so I booted with the rescue CD again and checked the size 
>> once more from the rescue environment: 8.00G.
>>
>> So it seems that when I boot the system normally it doesn't "see" 
>> that the size of the logical volume has changed. Can someone explain 
>> this, and hopefully help me fix the problem?
>>
>> /Magnus
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
