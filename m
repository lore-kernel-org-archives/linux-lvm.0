Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAN2AYr27423
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2004 21:10:34 -0500
Received: from erc-server.ercwc.org (mail.ercwc.org [198.85.167.1])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id iAN2ASxS022606
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2004 21:10:34 -0500
Message-ID: <41A29C06.90900@ercwc.org>
Date: Mon, 22 Nov 2004 21:10:14 -0500
From: "Frank J. Buchholz" <frankb@ercwc.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: lvextend error on XFS
References: <1100857645.13422.99.camel@grma-lap>	<1100888487.4379.9.camel@tesuji.nac.uci.edu>	<20041119192447.GB10969@nile.gs.washington.edu>	<1100909625.4379.51.camel@tesuji.nac.uci.edu>	<20041120002207.GK3139@polop.usc.edu>	<1100914586.4379.75.camel@tesuji.nac.uci.edu>	<20041120020807.GP3139@polop.usc.edu>	<1100917096.4379.92.camel@tesuji.nac.uci.edu>	<1101137773.3399.4.camel@dhcp174.msp.redhat.com>
	<1101170556.24828.11.camel@soot.ess.uci.edu>
In-Reply-To: <1101170556.24828.11.camel@soot.ess.uci.edu>
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

>"Frank J. Buchholz" <frankb ercwc org> writes:
>
>>> "Frank J. Buchholz" <frankb ercwc org> writes:
>>>
>>>> Hello,
>>>>
>>>> I recently attempted to extend my logical volume.  First I added an
>>>> additional physical volume to an existing volume group.  This worked
>>>> fine.
>>>>
>>>> vgextend Volume00 /dev/sba
>>>> lvextend -L+100G /dev/Volume00/LogVol00
>>>>
>>>> However when it came time to run the lvextend command I received a
>>>> number of  device-mapper errors.  While I was trying to determine what
>>>> the errors were I noticed that the filesystem that sits on the logical
>>>> volume being extended was no longer available.  I attempted to umount
>>>> the filesystem however the command froze.  I then rebooted the system
>>>> without mounting the filesystem in question and manually mounted the
>>>> filesystem. XFS reported back that it could not locate the superblock.
>>>
>>> I have done lvextend followed by xfs_growfs many times without any
>>> problems.  Have you checked for hardware errors?
>>
>> Unfortunately the timing is far too coincidental to be a hardware error.
>
>Since you had just added another disk, it may not be so coincidental
>after all.
>
>> Just after typing the following command and recieving the following error
>> lvm> lvextend -L+1G /dev/Volume00/LogVol00
>>   Extending logical volume LogVol00 to 2.93 TB
>>   device-mapper ioctl cmd 9 failed: Invalid argument
>>   Couldn't load device 'Volume00-LogVol00'.
>>   Problem reactivating LogVol00
>
>The last line would explain why the filesystem went offline.
>Something went wrong just after the LV had been extended, and was
>about to be reactivated.
>
>> I then noticed that the filesystem on LogVol00 was no longer available
>> and when I ran xfs_repair it stated the following:
>> # xfs_repair /dev/Volume00/LogVol00 
>> Phase 1 - find and verify superblock...
>> superblock read failed, offset 0, size 524288, ag 0, rval 0
>>
>> fatal error -- Invalid argument
>
>What does "dmesg" have to say about this?
>
>I had a problem once with some strange errors from a disk.  It turned
>out the cable wasn't plugged in properly.
>
>-- 
>M�ns Rullg�rd
>mru inprovide com

Hello M�ns
I now realize how I created this problem, I just don't know how to fix it.

I mistakingly added /dev/sba as the physical volume to a volume group 
that contained /dev/sba1, the one partition on sba.  These are 
essentially one in the same.  So when I executed the lvextend command 
device-mapper had an error.  I'm honestly surprised it did anything, 
especially write over the superblock on the filesystem.

Any direction on how I can recover from within LVM?  I never was able to 
execute the xfs_grow so I'm hoping the data in the filesystem still exists.

Thanks,
Frank
