Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAMMNVr29704
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2004 17:23:31 -0500
Received: from main.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iAMMNESX021029
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2004 17:23:30 -0500
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1CWMaS-0006fW-00
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2004 23:23:08 +0100
Received: from 76.80-203-227.nextgentel.com ([80.203.227.76])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2004 23:23:08 +0100
Received: from mru by 76.80-203-227.nextgentel.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2004 23:23:08 +0100
From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@inprovide.com>
Date: Mon, 22 Nov 2004 23:23:04 +0100
Message-ID: <yw1xsm71wmk7.fsf@ford.inprovide.com>
References: <1101161308.4630.8.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: lvextend error on XFS
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

"Frank J. Buchholz" <frankb@ercwc.org> writes:

>> "Frank J. Buchholz" <frankb ercwc org> writes:
>>
>>> Hello,
>>>
>>> I recently attempted to extend my logical volume.  First I added an
>>> additional physical volume to an existing volume group.  This worked
>>> fine.
>>>
>>> vgextend Volume00 /dev/sba
>>> lvextend -L+100G /dev/Volume00/LogVol00
>>>
>>> However when it came time to run the lvextend command I received a
>>> number of  device-mapper errors.  While I was trying to determine what
>>> the errors were I noticed that the filesystem that sits on the logical
>>> volume being extended was no longer available.  I attempted to umount
>>> the filesystem however the command froze.  I then rebooted the system
>>> without mounting the filesystem in question and manually mounted the
>>> filesystem. XFS reported back that it could not locate the superblock.
>>
>> I have done lvextend followed by xfs_growfs many times without any
>> problems.  Have you checked for hardware errors?
>
> Unfortunately the timing is far too coincidental to be a hardware error.

Since you had just added another disk, it may not be so coincidental
after all.

> Just after typing the following command and recieving the following error
> lvm> lvextend -L+1G /dev/Volume00/LogVol00
>   Extending logical volume LogVol00 to 2.93 TB
>   device-mapper ioctl cmd 9 failed: Invalid argument
>   Couldn't load device 'Volume00-LogVol00'.
>   Problem reactivating LogVol00

The last line would explain why the filesystem went offline.
Something went wrong just after the LV had been extended, and was
about to be reactivated.

> I then noticed that the filesystem on LogVol00 was no longer available
> and when I ran xfs_repair it stated the following:
> # xfs_repair /dev/Volume00/LogVol00 
> Phase 1 - find and verify superblock...
> superblock read failed, offset 0, size 524288, ag 0, rval 0
>
> fatal error -- Invalid argument

What does "dmesg" have to say about this?

I had a problem once with some strange errors from a disk.  It turned
out the cable wasn't plugged in properly.

-- 
M�ns Rullg�rd
mru@inprovide.com
