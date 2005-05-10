Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4AFDFO09594
	for <linux-lvm@redhat.com>; Tue, 10 May 2005 11:13:15 -0400
Received: from mxout2.cac.washington.edu (mxout2.cac.washington.edu
	[140.142.33.4])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j4AFD9Gr015733
	for <linux-lvm@redhat.com>; Tue, 10 May 2005 11:13:09 -0400
Received: from mead12.u.washington.edu (mead12.u.washington.edu
	[140.142.12.176])
	by mxout2.cac.washington.edu (8.13.4+UW05.04/8.13.4+UW05.04) with ESMTP
	id j4AFD8br002254
	for <linux-lvm@redhat.com>; Tue, 10 May 2005 08:13:08 -0700
Received: from localhost (mcrawfor@localhost)
	by mead12.u.washington.edu (8.13.4+UW05.03/8.13.4+UW05.04) with ESMTP
	id j4AFD8EX1335490
	for <linux-lvm@redhat.com>; Tue, 10 May 2005 08:13:08 -0700
Date: Tue, 10 May 2005 08:13:08 -0700 (PDT)
From: Miles Crawford <mcrawfor@u.washington.edu>
Subject: Re: [linux-lvm] lvm2 tools can't locate pvs on entire disks
In-Reply-To: <42804FE7.6000906@gmx.net>
Message-ID: <Pine.A41.4.61b.0505100810490.3018850@mead12.u.washington.edu>
References: <Pine.A41.4.61b.0505091803260.4722918@mead11.u.washington.edu>
	<42804FE7.6000906@gmx.net>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>


On Tue, 10 May 2005, Klaus Strebel wrote:

> Miles Crawford schrieb:
>> 
>> I'm running into trouble here, getting the lvm scanning tools to notice PVs 
>> I have created on entire disks, like this:
>> 
>> pvcreate /dev/hdd
>> 
>> Some output:
>> 
>> root@end root # lvm version
>>   LVM version:     2.01.04 (2005-02-09)
>>   Library version: 1.01.00-ioctl (2005-01-17)
>>   Driver version:  4.1.0
>> root@end root # uname -a
>> Linux end.snip.net 2.6.8 #6 Sat Oct 9 20:59:02 PDT 2004 i686 GNU/Linux
>> root@end root # lvmdiskscan
>>   /dev/hda1  [      111.79 GB]
>>   /dev/hdb1  [       18.63 GB]
>>   /dev/hdd1  [      186.31 GB]
>>   /dev/hdb2  [      127.59 GB]
>>   /dev/hdb3  [        2.83 GB]
>>   0 disks
>>   5 partitions
>>   0 LVM physical volume whole disks
>>   0 LVM physical volumes
>> root@end root # pvscan
>>   No matching physical volumes found
>> 
>> Well that's odd, I know they're there.  Lets try this:
>> 
>> root@end root # losetup /dev/loop0 /dev/hda
>> root@end root # losetup /dev/loop1 /dev/hdd
>> root@end root # pvscan
>>   PV /dev/loop0   VG media_vg   lvm2 [111.79 GB / 0    free]
>>   PV /dev/loop1   VG media_vg   lvm2 [186.31 GB / 0    free]
>>   Total: 2 [298.10 GB] / in use: 2 [298.10 GB] / in no VG: 0 [0   ]
> Hi Miles,
>
> the disks hda and hdb obviously are partitioned (they are shown as /dev/hda1 
> and /dev/hdb1), so don't trying to detroy these partitions, he doesn't know 
> what the contents of, is good behaviour of lvm, isn't it ;-).
>
> Ciao
> Klaus

So, you're saying that although the lvm PVs are _not_ on partitions, 
the disklabel still describes some partition on the disk, so lvm is 
ignoring the disk as a whole as a possible PV?

-miles
