Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2Q9IPXh018487
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2007 05:18:25 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.187])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l2Q9IMGU032453
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2007 05:18:22 -0400
Message-ID: <46078FD9.7030605@arabidopsis.info>
Date: Mon, 26 Mar 2007 10:18:17 +0100
From: Tim Milstead <tim@arabidopsis.info>
MIME-Version: 1.0
Subject: Re: [linux-lvm] failing hard drive
References: <Pine.LNX.4.44.0703222125390.17837-100000@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.44.0703222125390.17837-100000@bmsred.bmsi.com>
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

Stuart D. Gathman wrote:
> On Thu, 22 Mar 2007, Lamont Peterson wrote:
>
>   
>> If you're not using RAID, might I suggest that you do?  Those 9 disks would 
>> make a nice RAID5 or RAID6 array, and LVM works beautifully on top of 
>> software RAID, hardware RAID or any combination of both.
>>
>> LVM does not provide redundancy (yes, I know it can do mirroring, but I 
>> wouldn't suggest that), it's about easily managing lots of storage space.  
>> RAID is about reliability/redundancy.  Use the right tool for the right job, 
>> and use both tools together to get all the best benefits of both.
>>     
>
> In my use, reliability is paramount.  So I prefer RAID1.  You get 
> a performance boost for reads as well.  The md based mirrors can be
> mounted separately (careful!) if needed for data recovery and bug workarounds.
> (E.g. On Centos-3 grub won't install on mirrored boot partition.  So 
> unmount md0, setfaulty hdb1, mount hda1 /boot, grub-install, umount hda1,
> mount md0, raidhotadd hdb1.)  RAID5 arrays can only be accessed as raid.
>
>   
Well I changed the drive and it seems to work although dd appears to 
have copied the error across beacuse smartd reports

Device: /dev/hde, 1 Currently unreadable (pending) sectors.

I guess this would be expected? There are no heat issues.

You are correct about the redundancy issue - it's not my choice. I think 
space was paramount when the machine was built.

Thanks for all the help,

Tim.
