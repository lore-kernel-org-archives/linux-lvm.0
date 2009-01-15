Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0F1Gib4009186
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 20:16:44 -0500
Received: from mail-gx0-f19.google.com (mail-gx0-f19.google.com
	[209.85.217.19])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n0F1FguW018234
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 20:15:42 -0500
Received: by gxk12 with SMTP id 12so778534gxk.3
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 17:15:42 -0800 (PST)
Message-ID: <496E8E3A.8060901@gmail.com>
Date: Wed, 14 Jan 2009 18:15:38 -0700
From: Colin Faber <cfaber@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Major problems after soft raid 5 failure
References: <496E8353.50207@gmail.com> <20090115010441.GA6852@us.ibm.com>
In-Reply-To: <20090115010441.GA6852@us.ibm.com>
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

malahal@us.ibm.com wrote:
> Colin Faber [cfaber@gmail.com] wrote:
>   
>> was unavailable. After searching around I kept coming back to suggestions 
>> stating that removal of the missing device from the volume group was the 
>> solution to getting thing back online again. So using 'vgreduce 
>> --removemissing raid' then 'lvchange -ay raid' to update the changes - 
>> Neither command errored and vgreduce noted that 'raid' was not available 
>> again.
>>     
>
> Since your LV (array) is most likely allocated on md1 that disappeared,
> you really want --partial (lvm command) rather than --removemissing.
> Your metadata is updated and any knowledge about 'array' LV is now
> almost gone due to the above 'vgreduce'. I say almost gone because it
> might be there but you really need true LVM expertise now!
>
> Did you save a copy of your old LVM metadata before the reboot? See your
> /etc/lvm/backup/raid has any reference to 'array' LV at all.
>   
Yes, it's still there (well /etc/lvm/archive/). So how do I back out of 
this after I've already run removemissing? If I try and restore the old 
vg backup it just tells me that it can't restore it because the uuid is 
missing for md1.

By the way, thank you very much for the response. Any suggestions and 
help are greatly welcome.

-cf

> --Malahal.
>
>   
>> So as it stands now I have no logical volume, I have a volume group and I 
>> have a functional md0 array. If I dump the first 50 or so megs of the md0 
>> raid array I can see the volume group information, as well as the lv 
>> information including various bits of file system information.
>>
>> At this point I'm wondering can I recover the logical volume and recover 
>> this 1.8TB of data.
>>
>> For completeness here is the results of various display and scan commands:
>>
>> root@Aria:/dev/disk/by-id# pvscan
>>  PV /dev/md0   VG raid   lvm2 [1.82 TB / 1.82 TB free]
>>  Total: 1 [1.82 TB] / in use: 1 [1.82 TB] / in no VG: 0 [0   ]
>>
>> root@Aria:/dev/disk/by-id# pvdisplay
>>  --- Physical volume ---
>>  PV Name               /dev/md0
>>  VG Name               raid
>>  PV Size               1.82 TB / not usable 2.25 MB
>>  Allocatable           yes
>>  PE Size (KByte)       4096
>>  Total PE              476933
>>  Free PE               476933
>>  Allocated PE          0
>>  PV UUID               oI1oXp-NOSk-BJn0-ncEN-HaZr-NwSn-P9De9b
>>
>> root@Aria:/dev/disk/by-id# vgscan
>>  Reading all physical volumes.  This may take a while...
>>  Found volume group "raid" using metadata type lvm2
>>
>> root@Aria:/dev/disk/by-id# vgdisplay
>>  --- Volume group ---
>>  VG Name               raid
>>  System ID
>>  Format                lvm2
>>  Metadata Areas        1
>>  Metadata Sequence No  11
>>  VG Access             read/write
>>  VG Status             resizable
>>  MAX LV                0
>>  Cur LV                0
>>  Open LV               0
>>  Max PV                0
>>  Cur PV                1
>>  Act PV                1
>>  VG Size               1.82 TB
>>  PE Size               4.00 MB
>>  Total PE              476933
>>  Alloc PE / Size       0 / 0
>>  Free  PE / Size       476933 / 1.82 TB
>>  VG UUID               quRohP-EcsI-iheW-lbU5-rBjO-TnqS-JbjmZA
>>
>> root@Aria:/dev/disk/by-id# lvscan
>> root@Aria:/dev/disk/by-id#
>>
>> root@Aria:/dev/disk/by-id# lvdisplay
>> root@Aria:/dev/disk/by-id#
>>
>>
>> Thank you.
>>
>> -cf
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>     
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>   
