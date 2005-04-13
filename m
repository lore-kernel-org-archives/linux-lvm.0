Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3DEtRO14381
	for <linux-lvm@redhat.com>; Wed, 13 Apr 2005 10:55:27 -0400
Received: from vscan4.vignette.com (vscan4.vignette.com [12.161.72.105])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j3DEtPOn016802
	for <linux-lvm@redhat.com>; Wed, 13 Apr 2005 10:55:26 -0400
Received: from [10.18.201.1] (digdug.vignette.com [10.18.201.1])
	by omail1.vignette.com (8.12.9/8.11.2) with ESMTP id j3DEt78u012904
	for <linux-lvm@redhat.com>; Wed, 13 Apr 2005 09:55:12 -0500 (CDT)
Message-ID: <425D32CE.4060107@cjs226.com>
Date: Wed, 13 Apr 2005 09:55:10 -0500
From: Clif Smith <redhat@cjs226.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] invalid physical volume SOLVED (sorta)
References: <425B37D8.7060801@cjs226.com>	<20050412082844.M43465@pk25.com>	<425BE068.6050106@cjs226.com>	<20050412151937.M53113@pk25.com>	<425BE8C5.4030502@cjs226.com>
	<20050412153719.M45202@pk25.com> <425BED9A.6010304@cjs226.com>
In-Reply-To: <425BED9A.6010304@cjs226.com>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

The problem "invalid physical volume" was caused by LVM not recognizing 
the volume being called by the path /dev/emcpowera and/or 
/dev/emcpowera1.  Being that I'm not clustering and I don't need the 
functionality provided by EMC's app/wrapper PowerPath, I uninstalled it 
and used the standard device name /dev/sdX.

cjs

Clif Smith wrote:

> I don't understand what to try as I'm already running lvm-1.0.8-9?  
> Yes, that's my comment #37.  Any idea what "U5" is in comment #38?
>
> Diaz Rodriguez, Eduardo wrote:
>
>> try this:
>>
>> https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=124647
>>
>> are you the last comment?.
>>
>> regards!
>>
>> On Tue, 12 Apr 2005 10:27:01 -0500, Clif Smith wrote
>>  
>>
>>> I receive the same for all commands you requested, for example:
>>> # pvcreate /dev/emcpowera1
>>> pvcreate -- invalid physical volume "/dev/emcpowera1"
>>>
>>> Diaz Rodriguez, Eduardo wrote:
>>>
>>>   
>>>
>>>> try pvcreate /dev/emcpowera1 is for the partition not for the disk...
>>>>
>>>> please summarize
>>>>
>>>> regards!
>>>>
>>>> On Tue, 12 Apr 2005 09:51:20 -0500, Clif Smith wrote
>>>>
>>>>
>>>>     
>>>>
>>>>> Responses in line.
>>>>>
>>>>> Thanks, Clif
>>>>>
>>>>> Diaz Rodriguez, Eduardo wrote:
>>>>>
>>>>>  
>>>>>       
>>>>>
>>>>>> Clif try to make a partition type linux lvm.. (8e) and after try 
>>>>>> pvcreate
>>>>>>    
>>>>>>         
>>>>>
>>>> over it
>>>>
>>>>
>>>>     
>>>>
>>>>>>    
>>>>>>         
>>>>>
>>>>> # fdisk -l /dev/emcpowera
>>>>> Disk /dev/emcpowera: 10.7 GB, 10737418240 bytes
>>>>> 255 heads, 63 sectors/track, 1305 cylinders
>>>>> Units = cylinders of 16065 * 512 = 8225280 bytes
>>>>>        Device Boot    Start       End    Blocks   Id  System
>>>>> /dev/emcpowera1             1      1305  10482381   8e  Linux LVM
>>>>>
>>>>> # pvcreate /dev/emcpowera
>>>>> pvcreate -- invalid physical volume "/dev/emcpowera"
>>>>>
>>>>>  
>>>>>       
>>>>>
>>>>>> send a output of pvcreate -v /dev/emcpowera
>>>>>>
>>>>>>
>>>>>>    
>>>>>>         
>>>>>
>>>>> # pvcreate -v /dev/emcpowera
>>>>> pvcreate -- locking logical volume manager
>>>>> pvcreate -- checking physical volume name "/dev/emcpowera"
>>>>> pvcreate -- getting physical volume size
>>>>> pvcreate -- checking maximum physical volume size
>>>>> pvcreate -- checking partition type
>>>>> pvcreate -- invalid physical volume "/dev/emcpowera"
>>>>>
>>>>>  
>>>>>       
>>>>>
>>>>>> if you complile with debug use pvcreate -dv /dev/emcpowera
>>>>>>
>>>>>>
>>>>>>
>>>>>>    
>>>>>>         
>>>>>
>>>>> # pvcreate -dv /dev/emcpowera
>>>>> <1> lvm_get_iop_version -- CALLED
>>>>> <22> lvm_check_special -- CALLED
>>>>> <22> lvm_check_special -- LEAVING
>>>>> <1> lvm_get_iop_version -- AFTER ioctl ret: 0
>>>>> <1> lvm_get_iop_version -- LEAVING with ret: 10
>>>>> pvcreate -- locking logical volume manager
>>>>> <1> lvm_lock -- CALLED
>>>>> <22> lvm_check_special -- CALLED
>>>>> <22> lvm_check_special -- LEAVING
>>>>> <1> lvm_lock -- LEAVING with ret: 0
>>>>> pvcreate -- checking physical volume name "/dev/emcpowera"
>>>>> <1> pv_check_name -- CALLED with "/dev/emcpowera"
>>>>> <22> lvm_check_chars -- CALLED with name: "/dev/emcpowera"
>>>>> <22> lvm_check_chars -- LEAVING with ret: 0
>>>>> <1> pv_check_name -- LEAVING with ret: 0
>>>>> pvcreate -- getting physical volume size
>>>>> <1> _pv_get_dev_size -- CALLED with /dev/emcpowera and 0xbfffa650
>>>>> <1> _pv_get_dev_size -- LEAVING with ret: 20971520
>>>>> pvcreate -- checking maximum physical volume size
>>>>> <1> pv_create_kdev_t -- CALLED with "/dev/emcpowera"
>>>>> <22> pv_check_name -- CALLED with "/dev/emcpowera"
>>>>> <333> lvm_check_chars -- CALLED with name: "/dev/emcpowera"
>>>>> <333> lvm_check_chars -- LEAVING with ret: 0
>>>>> <22> pv_check_name -- LEAVING with ret: 0
>>>>> <1> pv_create_kdev_t -- LEAVING with ret: E800
>>>>> <1> lvm_check_partitioned_dev -- CALLED
>>>>> <22> lvm_get_device_type called
>>>>> <22> lvm_get_device_type leaving with -1
>>>>> <1> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
>>>>> pvcreate -- checking partition type
>>>>> <1> pv_read -- CALLED with /dev/emcpowera
>>>>> <22> pv_check_name -- CALLED with "/dev/emcpowera"
>>>>> <333> lvm_check_chars -- CALLED with name: "/dev/emcpowera"
>>>>> <333> lvm_check_chars -- LEAVING with ret: 0
>>>>> <22> pv_check_name -- LEAVING with ret: 0
>>>>> <1> pv_read -- going to read /dev/emcpowera
>>>>> <22> lvm_check_dev -- CALLED
>>>>> <333> lvm_check_partitioned_dev -- CALLED
>>>>> <4444> lvm_get_device_type called
>>>>> <4444> lvm_get_device_type leaving with -1
>>>>> <333> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
>>>>> <22> lvm_check_dev -- LEAVING with ret: 0
>>>>> <1> pv_read -- LEAVING with ret: -270
>>>>> pvcreate -- invalid physical volume "/dev/emcpowera"
>>>>>
>>>>> <1> lvm_unlock -- CALLED
>>>>> <1> lvm_unlock -- LEAVING with ret: 0
>>>>>
>>>>>  
>>>>>       
>>>>>
>>>>>> send the error leve returns echo $?
>>>>>>
>>>>>> regards!
>>>>>>
>>>>>>
>>>>>>
>>>>>> On Mon, 11 Apr 2005 21:52:08 -0500, Clif Smith wrote
>>>>>>
>>>>>>
>>>>>>    
>>>>>>         
>>>>>>
>>>>>>> I'm running lvm-1.0.8-9 on RHES3 and am receiving the following 
>>>>>>> when I try to utilize a volume from an EMC array:
>>>>>>> # pvcreate /dev/emcpowera
>>>>>>> pvcreate -- invalid physical volume "/dev/emcpowera"
>>>>>>>
>>>>>>> The OS sees the volume fine:
>>>>>>> # fdisk -l /dev/emcpowera
>>>>>>> Disk /dev/emcpowera: 10.7 GB, 10737418240 bytes
>>>>>>> 255 heads, 63 sectors/track, 1305 cylinders
>>>>>>> Units = cylinders of 16065 * 512 = 8225280 bytes
>>>>>>>
>>>>>>> I can create a partition and then a filesystem without issue, 
>>>>>>> but I really need to use it within LVM.
>>>>>>>
>>>>>>> Any ideas?
>>>>>>>
>>>>>>> _______________________________________________
>>>>>>> linux-lvm mailing list
>>>>>>> linux-lvm@redhat.com
>>>>>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>>>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>>>>>  
>>>>>>>
>>>>>>>      
>>>>>>>           
>>>>>>
>>>>>>    
>>>>>>         
>>>>>
>>>> ======================================================================================= 
>>>>
>>>>     
>>>>
>>>>>  
>>>>>       
>>>>>
>>>>>> La teta que la mano no cubre, no es teta sino ubre.
>>>>>>         -- An�nim.    
>>>>>>         
>>>>>
>>>> ======================================================================================= 
>>>>
>>>>     
>>>>
>>>>>  
>>>>>       
>>>>>
>>>>>> _______________________________________________
>>>>>> linux-lvm mailing list
>>>>>> linux-lvm@redhat.com
>>>>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>>>>
>>>>>>
>>>>>>    
>>>>>>         
>>>>>
>>>>> _______________________________________________
>>>>> linux-lvm mailing list
>>>>> linux-lvm@redhat.com
>>>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>>>  
>>>>>       
>>>>
>>>>     
>>>
>>> ======================================================================================= 
>>>
>>>   
>>>
>>>> La teta que la mano no cubre, no es teta sino ubre.
>>>>         -- An�nim.     
>>>
>>> ======================================================================================= 
>>>
>>>   
>>>
>>>> _______________________________________________
>>>> linux-lvm mailing list
>>>> linux-lvm@redhat.com
>>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>>
>>>>
>>>>     
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>   
>>
>>
>>
>> ======================================================================================= 
>>
>> La teta que la mano no cubre, no es teta sino ubre.
>>         -- An�nim. 
>> ======================================================================================= 
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>  
>>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
