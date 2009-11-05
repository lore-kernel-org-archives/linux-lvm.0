Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nA5Ivqo5000773
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 13:57:52 -0500
Received: from mail-ew0-f205.google.com (mail-ew0-f205.google.com
	[209.85.219.205])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nA5IvXkY007620
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 13:57:34 -0500
Received: by ewy1 with SMTP id 1so314658ewy.3
	for <linux-lvm@redhat.com>; Thu, 05 Nov 2009 10:57:33 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1076)
Subject: Re: [linux-lvm] PFree is 0 on a drive with nothing on it
From: Adam Mooz <adam.mooz@gmail.com>
In-Reply-To: <1257436528.17792.32@raydesk1.bettercgi.com>
Date: Thu, 5 Nov 2009 13:57:24 -0500
Content-Transfer-Encoding: 7bit
Message-Id: <896EDE05-E939-4C70-9513-5805DB864BD4@gmail.com>
References: <1257433818.17792.30@raydesk1.bettercgi.com>
	<E6AFA4E4-A03C-4D1D-8A78-5DF2110EFA2E@gmail.com>
	<1257436528.17792.32@raydesk1.bettercgi.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

That is correct.  All drives are part of 'fileshare/lv_fileshare',  
which only has 400GB of data on it at the moment; which I can see  
reflected in the PFREE columns of the PVS output.  Is there an easy  
way to force the LVM to rescan it's allocation unit or would I have to  
remove the drives and re-insert them into the LVM?


On 2009-11-05, at 10:55 AM, Ray Morris wrote:

>>  --- Physical Segments ---
>>  Physical extent 0 to 238343:
>>    Logical volume	/dev/fileshare/lv_fileshare
>>    Logical extents	0 to 238343
>
>
>  OK according to that both are full of an LV
> called "lv_fileshare".  Try mounting that and
> see what, if anything, is on it.  Don't remember
> creating that?  Try history | grep -10 lv_fileshare
> for a reminder.
> --
> Ray Morris
> support@bettercgi.com
>
> Strongbox - The next generation in site security:
> http://www.bettercgi.com/strongbox/
>
> Throttlebox - Intelligent Bandwidth Control
> http://www.bettercgi.com/throttlebox/
>
> Strongbox / Throttlebox affiliate program:
> http://www.bettercgi.com/affiliates/user/register.php
>
>
> On 11/05/2009 09:36:35 AM, Adam Mooz wrote:
>> Here it is for both SDA and SDB:
>> #pvdisplay -m /dev/mapper/cryptsda
>> File descriptor 4 left open
>>  --- Physical volume ---
>>  PV Name               /dev/mapper/cryptsda
>>  VG Name               fileshare
>>  PV Size               931.04 GB / not usable 3.87 MB
>>  Allocatable           yes (but full)
>>  PE Size (KByte)       4096
>>  Total PE              238344
>>  Free PE               0
>>  Allocated PE          238344
>>  PV UUID               6OfRxC-R59i-CVjX-igtB-pg4e-2qAw-OdiPSc
>>  --- Physical Segments ---
>>  Physical extent 0 to 238343:
>>    Logical volume	/dev/fileshare/lv_fileshare
>>    Logical extents	0 to 238343
>> #pvdisplay -m /dev/mapper/cryptsdb
>> File descriptor 4 left open
>>  --- Physical volume ---
>>  PV Name               /dev/mapper/cryptsdb
>>  VG Name               fileshare
>>  PV Size               931.04 GB / not usable 3.87 MB
>>  Allocatable           yes (but full)
>>  PE Size (KByte)       4096
>>  Total PE              238344
>>  Free PE               0
>>  Allocated PE          238344
>>  PV UUID               zCLder-PF5b-fQpy-RdMS-Ayc0-caWh-LA2Esm
>>  --- Physical Segments ---
>>  Physical extent 0 to 238343:
>>    Logical volume	/dev/fileshare/lv_fileshare
>>    Logical extents	238344 to 476687
>> On 2009-11-05, at 10:10 AM, Ray Morris wrote:
>>> What is the output of?:
>>> pvdisplay -m /dev/mapper/cryptsda
>>> --
>>> Ray Morris
>>> support@bettercgi.com
>>> Strongbox - The next generation in site security:
>>> http://www.bettercgi.com/strongbox/
>>> Throttlebox - Intelligent Bandwidth Control
>>> http://www.bettercgi.com/throttlebox/
>>> Strongbox / Throttlebox affiliate program:
>>> http://www.bettercgi.com/affiliates/user/register.php
>>> On 11/05/2009 01:57:53 AM, Adam Mooz wrote:
>>>> Hello List,
>>>> I have a fileserver that is driving me nuts at the moment.  Setup:
>>>> 4x 1TB HDD's
>>>> 1x 320GB HDD
>>>> They all have the same partition layout:
>>>> 512MB Swap, rest is LVM data.
>>>> The LVM only contains ~400GB of data, but 2 of the TB drives  
>>>> report having 0 free PFree's:
>>>> PV                   VG        Fmt  Attr PSize   PFree
>>>> /dev/mapper/cryptsda fileshare lvm2 a-   931.03G      0
>>>> /dev/mapper/cryptsdb fileshare lvm2 a-   931.03G      0
>>>> /dev/mapper/cryptsdc fileshare lvm2 a-   297.61G 297.61G
>>>> /dev/mapper/cryptsdd fileshare lvm2 a-   931.03G 633.42G
>>>> /dev/mapper/cryptsde           lvm2 --   931.04G 931.04G
>>>> I've successfully managed to remove SDE from the LVM, but I need  
>>>> to move the data off SDD onto either SDA or SDB.  When the whole  
>>>> system is mounted it properly reports having 2.1TB of free space  
>>>> (931 * 2 + 297). Is there an easy way to fix this issue?
>>> ------quoted attachment------
>>>> _______________________________________________
>>>> linux-lvm mailing list
>>>> linux-lvm@redhat.com
>>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> ------quoted attachment------
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
