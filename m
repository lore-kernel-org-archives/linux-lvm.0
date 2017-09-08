Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6D6D60241
	for <linux-lvm@redhat.com>; Fri,  8 Sep 2017 09:39:45 +0000 (UTC)
Received: from nm23-vm4.bullet.mail.ir2.yahoo.com
	(nm23-vm4.bullet.mail.ir2.yahoo.com [212.82.97.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E250A8046E
	for <linux-lvm@redhat.com>; Fri,  8 Sep 2017 09:39:42 +0000 (UTC)
References: <38537c05-ba92-9817-a791-19ac39b9615f@yahoo.co.uk>
	<2feba733-6812-3c1f-d42a-3e5eea82a636@redhat.com>
	<b1e00533-bfa7-fbe0-963d-73854fd0a47e@yahoo.co.uk>
	<857ca8ac-2fb0-0705-cd9e-151dfeb60869@redhat.com>
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <928aa0cd-c2b2-146f-7fe1-6bc8b651eb55@yahoo.co.uk>
Date: Fri, 8 Sep 2017 10:39:30 +0100
MIME-Version: 1.0
In-Reply-To: <857ca8ac-2fb0-0705-cd9e-151dfeb60869@redhat.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Subject: Re: [linux-lvm] lv raid - how to read this?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



On 07/09/17 17:27, Heinz Mauelshagen wrote:
> Works fine on upstream with actual lvm:
>
> [root@vm254 ~]# lvs 
> -aoname,size,attr,segtype,syncpercent,reshapelen,devices nvm
>   LV           LSize   Attr       Type   Cpy%Sync RSize 
> Devices
>   r              3.67t rwi-a-r--- raid0 
> r_rimage_0(0),r_rimage_1(0),r_rimage_2(0),r_rimage_3(0)
>   [r_rimage_0] 939.52g iwi-aor--- linear /dev/sda(0)
>   [r_rimage_1] 939.52g iwi-aor--- linear /dev/sdb(0)
>   [r_rimage_2] 939.52g iwi-aor--- linear /dev/sdc(0)
>   [r_rimage_3] 939.52g iwi-aor--- linear /dev/sdd(0)
>
> [root@vm254 ~]# time mkfs -t xfs -f /dev/nvm/r
> <SNIP>
>          =                       sunit=4      swidth=16 blks
> <SNIP>
>
>
> What kernel/lvm versions are you running this on?
> mkfs.xfs retrieves sizes from /sys/block/dm-N/queue/*size
> (look up dm-N in /dev/mapper/) which may be bogus?
>

⁂ SWIR 32 ~]$ cat /sys/block/dm-65/queue/hw_sector_size
512
⁂ SWIR 32 ~]$ cat /sys/block/dm-65/queue/logical_block_size
512
⁂ SWIR 32 ~]$ cat /sys/block/dm-65/queue/max_segment_size
65536
⁂ SWIR 32 ~]$ cat /sys/block/dm-65/queue/minimum_io_size
16384
⁂ SWIR 32 ~]$ cat /sys/block/dm-65/queue/optimal_io_size
1090502656
⁂ SWIR 32 ~]$ cat /sys/block/dm-65/queue/physical_block_size
512

> You can overwrite the kernel value by using swidth=N on 
> the mkfs.xfs command line.
>
> Heinz
>
> On 09/07/2017 03:12 PM, lejeczek wrote:
>>
>>
>> On 07/09/17 10:16, Zdenek Kabelac wrote:
>>> Dne 7.9.2017 v 10:06 lejeczek napsal(a):
>>>> hi fellas
>>>>
>>>> I'm setting up a lvm raid0, 4 devices, I want raid0 and 
>>>> I understand & expect - there will be four stripes, all 
>>>> I care of is speed.
>>>> I do:
>>>> $ lvcreate --type raid0 -i 4 -I 16 -n 0 -l 96%pv 
>>>> intel.raid0-0 /dev/sd{c..f} # explicitly four stripes
>>>>
>>>> I see:
>>>> $ mkfs.xfs /dev/mapper/intel.sataA-0 -f
>>>> meta-data=/dev/mapper/intel.sataA-0 isize=512    
>>>> agcount=32, agsize=30447488 blks
>>>>           =                       sectsz=512   attr=2, 
>>>> projid32bit=1
>>>>           =                       crc=1        
>>>> finobt=0, sparse=0
>>>> data     =                       bsize=4096 
>>>> blocks=974319616, imaxpct=5
>>>>           =                       sunit=4      
>>>> swidth=131076 blks
>>>> naming   =version 2              bsize=4096   
>>>> ascii-ci=0 ftype=1
>>>> log      =internal log           bsize=4096   
>>>> blocks=475744, version=2
>>>>           =                       sectsz=512   sunit=4 
>>>> blks, lazy-count=1
>>>> realtime =none                   extsz=4096   blocks=0, 
>>>> rtextents=0
>>>>
>>>> What puzzles me is xfs's:
>>>>   sunit=4      swidth=131076 blks
>>>> and I think - what the hexx?
>>>
>>>
>>> Unfortunatelly  'swidth'  in XFS has different meaning 
>>> than lvm2's  stripe size parameter.
>>>
>>> In lvm2 -
>>>
>>>
>>> -i | --stripes    - how many disks
>>> -I | --stripesize    - how much data before using next 
>>> disk.
>>>
>>> So  -i 4  & -I 16 gives  64KB  total stripe width
>>>
>>> ----
>>>
>>> XFS meaning:
>>>
>>> suinit = <RAID controllers stripe size in BYTES (or 
>>> KiBytes when used with k)>
>>> swidth = <# of data disks (don't count parity disks)>
>>>
>>> ----
>>>
>>> ---- so real-world example ----
>>>
>>> # lvcreate --type striped -i4 -I16 -L1G -n r0 vg
>>>
>>> or
>>>
>>> # lvcreate --type raid0  -i4 -I16 -L1G -n r0 vg
>>>
>>> # mkfs.xfs  /dev/vg/r0 -f
>>> meta-data=/dev/vg/r0             isize=512    agcount=8, 
>>> agsize=32764 blks
>>>          =                       sectsz=512   attr=2, 
>>> projid32bit=1
>>>          =                       crc=1        finobt=1, 
>>> sparse=0, rmapbt=0, reflink=0
>>> data     =                       bsize=4096   
>>> blocks=262112, imaxpct=25
>>>          =                       sunit=4      swidth=16 
>>> blks
>>> naming   =version 2              bsize=4096   ascii-ci=0 
>>> ftype=1
>>> log      =internal log           bsize=4096   
>>> blocks=552, version=2
>>>          =                       sectsz=512   sunit=4 
>>> blks, lazy-count=1
>>> realtime =none                   extsz=4096   blocks=0, 
>>> rtextents=0
>>>
>>>
>>> ---- and we have ----
>>>
>>> sunit=4         ...  4 * 4096 = 16KiB        (matching  
>>> lvm2 -I16 here)
>>> swidth=16 blks  ... 16 * 4096 = 64KiB
>>>    so we have  64 as total width / size of single strip 
>>> (sunit) ->  4 disks
>>>    (matching  lvm2 -i4 option here)
>>>
>>> Yep complex, don't ask... ;)
>>>
>>>
>>>
>>>>
>>>> In a LVM non-raid stripe scenario I've always remember 
>>>> it was: swidth = sunit * Y where Y = number of stripes, 
>>>> right?
>>>>
>>>> I'm hoping some expert could shed some light, help 
>>>> me(maybe others too) understand what LVM is doing 
>>>> there? I'd appreciate.
>>>> many thanks, L.
>>>
>>>
>>> We in the first place there is major discrepancy in the 
>>> naming:
>>>
>>> You use intel.raid0-0   VG name
>>> and then you mkfs device: /dev/mapper/intel.sataA-0  ??
>>>
>>> While you should be accessing: /dev/intel.raid0/0
>>>
>>> Are you sure you are not trying to overwrite some 
>>> unrelated device here?
>>>
>>> (As your shown numbers looks unrelated, or you have 
>>> buggy kernel or blkid....)
>>>
>>
>> hi,
>> I renamed VG in the meantime,
>> I get xfs intricacy..
>> so.. question still stands..
>> why xfs format does not do what I remember always did in 
>> the past(on lvm non-raid but stripped), like in your example
>>
>>          =                       sunit=4      swidth=16 blks
>> but I see instead:
>>
>>          =                       sunit=4      
>> swidth=4294786316 blks
>>
>> a whole lot:
>>
>> $ xfs_info /__.aLocalStorages/0
>> meta-data=/dev/mapper/intel.raid0--0-0 isize=512    
>> agcount=32, agsize=30768000 blks
>>          =                       sectsz=512   attr=2, 
>> projid32bit=1
>>          =                       crc=1        finobt=0 
>> spinodes=0
>> data     =                       bsize=4096   
>> blocks=984576000, imaxpct=5
>>          =                       sunit=4      
>> swidth=4294786316 blks
>> naming   =version 2              bsize=4096   ascii-ci=0 
>> ftype=1
>> log      =internal               bsize=4096   
>> blocks=480752, version=2
>>          =                       sectsz=512   sunit=4 
>> blks, lazy-count=1
>> realtime =none                   extsz=4096   blocks=0, 
>> rtextents=0
>>
>> $ lvs -a -o +segtype,stripe_size,stripes,devices 
>> intel.raid0-0
>>   LV           VG            Attr       LSize   Pool 
>> Origin Data% Meta%  Move Log Cpy%Sync Convert Type   
>> Stripe #Str Devices
>>   0            intel.raid0-0 rwi-aor--- 
>> 3.67t                                                     
>> raid0 16.00k    4 
>> 0_rimage_0(0),0_rimage_1(0),0_rimage_2(0),0_rimage_3(0)
>>   [0_rimage_0] intel.raid0-0 iwi-aor--- 938.96g 
>> linear     0 1 /dev/sdc(0)
>>   [0_rimage_1] intel.raid0-0 iwi-aor--- 938.96g 
>> linear     0 1 /dev/sdd(0)
>>   [0_rimage_2] intel.raid0-0 iwi-aor--- 938.96g 
>> linear     0 1 /dev/sde(0)
>>   [0_rimage_3] intel.raid0-0 iwi-aor--- 938.96g 
>> linear     0 1 /dev/sdf(0)
>>
>>
>>>
>>> Regards
>>>
>>> Zdenek
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
