Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nA5JGTiE031557
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 14:16:29 -0500
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nA5JGBm6027325
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 14:16:11 -0500
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1N67oY-00047T-8l
	for linux-lvm@redhat.com; Thu, 05 Nov 2009 11:16:10 -0800
Date: Thu, 05 Nov 2009 13:16:08 -0600
From: Ray Morris <support@bettercgi.com>
Subject: Re: [linux-lvm] PFree is 0 on a drive with nothing on it
In-Reply-To: <896EDE05-E939-4C70-9513-5805DB864BD4@gmail.com> (from
	adam.mooz@gmail.com on Thu Nov  5 12:57:24 2009)
Message-Id: <1257448568.17792.35@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

> All drives are part of 'fileshare/lv_fileshare',
> which only has 400GB of data on it at the moment;

    The FILESYSTEM which you built in lv_fileshare
has 400GB of data in a 2TB filesystem, probably.
The lv_fileshare LV itself is around 2TB, so it won't
fit on a 1TB drive.  You would need to first reduce
the size of the filesystem, using resize2fs or similar,
then reduce the size of the LV using lvreduce, then
move it using pvmove.

   A tip - reduce the filesystem 10%-20% smaller than
the LV will be on - making it about 800GB, to make sure
it will fit on a 1000GB volume.  A 1000GB filesystem
won'yt necesarily fit on a 1000GB volume because of
rounding, GB versus GiB, etc.  After resizing the LV,
you can resize2fs it to fill the volume.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 11/05/2009 12:57:24 PM, Adam Mooz wrote:
> That is correct.  All drives are part of 'fileshare/lv_fileshare',  
> which only has 400GB of data on it at the moment; which I can see  
> reflected in the PFREE columns of the PVS output.  Is there an easy  
> way to force the LVM to rescan it's allocation unit or would I have  
> to remove the drives and re-insert them into the LVM?
> 
> 
> On 2009-11-05, at 10:55 AM, Ray Morris wrote:
> 
>>>  --- Physical Segments ---
>>>  Physical extent 0 to 238343:
>>>    Logical volume	/dev/fileshare/lv_fileshare
>>>    Logical extents	0 to 238343
>> 
>> 
>>  OK according to that both are full of an LV
>> called "lv_fileshare".  Try mounting that and
>> see what, if anything, is on it.  Don't remember
>> creating that?  Try history | grep -10 lv_fileshare
>> for a reminder.
>> --
>> Ray Morris
>> support@bettercgi.com
>> 
>> Strongbox - The next generation in site security:
>> http://www.bettercgi.com/strongbox/
>> 
>> Throttlebox - Intelligent Bandwidth Control
>> http://www.bettercgi.com/throttlebox/
>> 
>> Strongbox / Throttlebox affiliate program:
>> http://www.bettercgi.com/affiliates/user/register.php
>> 
>> 
>> On 11/05/2009 09:36:35 AM, Adam Mooz wrote:
>>> Here it is for both SDA and SDB:
>>> #pvdisplay -m /dev/mapper/cryptsda
>>> File descriptor 4 left open
>>>  --- Physical volume ---
>>>  PV Name               /dev/mapper/cryptsda
>>>  VG Name               fileshare
>>>  PV Size               931.04 GB / not usable 3.87 MB
>>>  Allocatable           yes (but full)
>>>  PE Size (KByte)       4096
>>>  Total PE              238344
>>>  Free PE               0
>>>  Allocated PE          238344
>>>  PV UUID               6OfRxC-R59i-CVjX-igtB-pg4e-2qAw-OdiPSc
>>>  --- Physical Segments ---
>>>  Physical extent 0 to 238343:
>>>    Logical volume	/dev/fileshare/lv_fileshare
>>>    Logical extents	0 to 238343
>>> #pvdisplay -m /dev/mapper/cryptsdb
>>> File descriptor 4 left open
>>>  --- Physical volume ---
>>>  PV Name               /dev/mapper/cryptsdb
>>>  VG Name               fileshare
>>>  PV Size               931.04 GB / not usable 3.87 MB
>>>  Allocatable           yes (but full)
>>>  PE Size (KByte)       4096
>>>  Total PE              238344
>>>  Free PE               0
>>>  Allocated PE          238344
>>>  PV UUID               zCLder-PF5b-fQpy-RdMS-Ayc0-caWh-LA2Esm
>>>  --- Physical Segments ---
>>>  Physical extent 0 to 238343:
>>>    Logical volume	/dev/fileshare/lv_fileshare
>>>    Logical extents	238344 to 476687
>>> On 2009-11-05, at 10:10 AM, Ray Morris wrote:
>>>> What is the output of?:
>>>> pvdisplay -m /dev/mapper/cryptsda
>>>> --
>>>> Ray Morris
>>>> support@bettercgi.com
>>>> Strongbox - The next generation in site security:
>>>> http://www.bettercgi.com/strongbox/
>>>> Throttlebox - Intelligent Bandwidth Control
>>>> http://www.bettercgi.com/throttlebox/
>>>> Strongbox / Throttlebox affiliate program:
>>>> http://www.bettercgi.com/affiliates/user/register.php
>>>> On 11/05/2009 01:57:53 AM, Adam Mooz wrote:
>>>>> Hello List,
>>>>> I have a fileserver that is driving me nuts at the moment.  Setup:
>>>>> 4x 1TB HDD's
>>>>> 1x 320GB HDD
>>>>> They all have the same partition layout:
>>>>> 512MB Swap, rest is LVM data.
>>>>> The LVM only contains ~400GB of data, but 2 of the TB drives  
>>>>> report having 0 free PFree's:
>>>>> PV                   VG        Fmt  Attr PSize   PFree
>>>>> /dev/mapper/cryptsda fileshare lvm2 a-   931.03G      0
>>>>> /dev/mapper/cryptsdb fileshare lvm2 a-   931.03G      0
>>>>> /dev/mapper/cryptsdc fileshare lvm2 a-   297.61G 297.61G
>>>>> /dev/mapper/cryptsdd fileshare lvm2 a-   931.03G 633.42G
>>>>> /dev/mapper/cryptsde           lvm2 --   931.04G 931.04G
>>>>> I've successfully managed to remove SDE from the LVM, but I need  
>>>>> to move the data off SDD onto either SDA or SDB.  When the whole  
>>>>> system is mounted it properly reports having 2.1TB of free space  
>>>>> (931 * 2 + 297). Is there an easy way to fix this issue?
>>>> ------quoted attachment------
>>>>> _______________________________________________
>>>>> linux-lvm mailing list
>>>>> linux-lvm@redhat.com
>>>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>> _______________________________________________
>>>> linux-lvm mailing list
>>>> linux-lvm@redhat.com
>>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>> 
>> ------quoted attachment------
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>> 
>> 
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
