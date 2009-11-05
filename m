Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nA5Fu3Aw011514
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 10:56:03 -0500
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nA5Ftj0B029886
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 10:55:45 -0500
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1N64ga-0001Gp-Kw
	for linux-lvm@redhat.com; Thu, 05 Nov 2009 07:55:44 -0800
Date: Thu, 05 Nov 2009 09:55:28 -0600
From: Ray Morris <support@bettercgi.com>
Subject: Re: [linux-lvm] PFree is 0 on a drive with nothing on it
References: <1257433818.17792.30@raydesk1.bettercgi.com>
	<E6AFA4E4-A03C-4D1D-8A78-5DF2110EFA2E@gmail.com>
In-Reply-To: <E6AFA4E4-A03C-4D1D-8A78-5DF2110EFA2E@gmail.com> (from
	adam.mooz@gmail.com on Thu Nov  5 09:36:35 2009)
Message-Id: <1257436528.17792.32@raydesk1.bettercgi.com>
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

>   --- Physical Segments ---
>   Physical extent 0 to 238343:
>     Logical volume	/dev/fileshare/lv_fileshare
>     Logical extents	0 to 238343


   OK according to that both are full of an LV
called "lv_fileshare".  Try mounting that and
see what, if anything, is on it.  Don't remember
creating that?  Try history | grep -10 lv_fileshare
for a reminder.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 11/05/2009 09:36:35 AM, Adam Mooz wrote:
> Here it is for both SDA and SDB:
> 
> #pvdisplay -m /dev/mapper/cryptsda
> File descriptor 4 left open
>   --- Physical volume ---
>   PV Name               /dev/mapper/cryptsda
>   VG Name               fileshare
>   PV Size               931.04 GB / not usable 3.87 MB
>   Allocatable           yes (but full)
>   PE Size (KByte)       4096
>   Total PE              238344
>   Free PE               0
>   Allocated PE          238344
>   PV UUID               6OfRxC-R59i-CVjX-igtB-pg4e-2qAw-OdiPSc
> 
>   --- Physical Segments ---
>   Physical extent 0 to 238343:
>     Logical volume	/dev/fileshare/lv_fileshare
>     Logical extents	0 to 238343
> 
> #pvdisplay -m /dev/mapper/cryptsdb
> File descriptor 4 left open
>   --- Physical volume ---
>   PV Name               /dev/mapper/cryptsdb
>   VG Name               fileshare
>   PV Size               931.04 GB / not usable 3.87 MB
>   Allocatable           yes (but full)
>   PE Size (KByte)       4096
>   Total PE              238344
>   Free PE               0
>   Allocated PE          238344
>   PV UUID               zCLder-PF5b-fQpy-RdMS-Ayc0-caWh-LA2Esm
> 
>   --- Physical Segments ---
>   Physical extent 0 to 238343:
>     Logical volume	/dev/fileshare/lv_fileshare
>     Logical extents	238344 to 476687
> 
> 
> 
> On 2009-11-05, at 10:10 AM, Ray Morris wrote:
> 
>> What is the output of?:
>> 
>> pvdisplay -m /dev/mapper/cryptsda
>> 
>> 
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
>> On 11/05/2009 01:57:53 AM, Adam Mooz wrote:
>>> Hello List,
>>> I have a fileserver that is driving me nuts at the moment.  Setup:
>>> 4x 1TB HDD's
>>> 1x 320GB HDD
>>> They all have the same partition layout:
>>> 512MB Swap, rest is LVM data.
>>> The LVM only contains ~400GB of data, but 2 of the TB drives report  
>>> having 0 free PFree's:
>>>  PV                   VG        Fmt  Attr PSize   PFree
>>>  /dev/mapper/cryptsda fileshare lvm2 a-   931.03G      0
>>>  /dev/mapper/cryptsdb fileshare lvm2 a-   931.03G      0
>>>  /dev/mapper/cryptsdc fileshare lvm2 a-   297.61G 297.61G
>>>  /dev/mapper/cryptsdd fileshare lvm2 a-   931.03G 633.42G
>>>  /dev/mapper/cryptsde           lvm2 --   931.04G 931.04G
>>> I've successfully managed to remove SDE from the LVM, but I need to  
>>> move the data off SDD onto either SDA or SDB.  When the whole  
>>> system is mounted it properly reports having 2.1TB of free space  
>>> (931 * 2 + 297). Is there an easy way to fix this issue?
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

------quoted attachment------
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
