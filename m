From: Duane Evenson <devenson@shaw.ca>
Subject: Re: [linux-lvm] vgscan problem
Message-id: <3EB33772.6080309@shaw.ca>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
References: <3EAC2003.5030106@shaw.ca> <20030428105618.A28159@sistina.com>
 <3EAF28A8.5010107@shaw.ca> <20030430130450.A5346@sistina.com>
 <3EB07FB0.4020704@shaw.ca>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri May  2 22:29:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

A little more information:
I looked at the metadata using
od -v -A x -t x1z /dev/hde|more
and the UUID shown in pvscan
is at 0x1e00, I get something else at 0x1000:
000fe0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  >................<
000ff0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  >................<
001000 c1 c0 e0 04 24 10 0c a0 80 e5 0f 0a c5 51 8b 0e  >....$........Q..<
001010 92 25 d1 e1 e2 fe 59 ee 42 b0 20 51 8b 0e 92 25  >.%....Y.B. Q...%<
001020 d1 e1 e2 fe 59 ee 51 8b 0e 92 25 d1 e1 e2 fe 59  >....Y.Q...%....Y<
...
001df0 e9 c0 fa c6 06 18 25 20 90 e9 4c fa b0 b0 f7 06  >......% ..L.....<
001e00 78 31 6c 32 61 32 58 55 7a 58 58 45 6a 5a 68 50  >x1l2a2XUzXXEjZhP<
001e10 33 6b 71 41 6d 6f 47 35 6a 48 55 31 7a 31 43 38  >3kqAmoG5jHU1z1C8<
001e20 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  >................<
001e30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  >................<

Is this the problem?


Duane Evenson wrote:

> pvscan only finds hde -- good, as that's all it should.
> ...so I did as you suggested: pvcreate -ff /dev/hde; vgcfgrestore -n 
> data_group /dev/hde; vgscan returned:
> #vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data 
> of volume
> group "data_group" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your 
> volume group
>
> I think this is the same problem as before.
> There exists /etc/lvmconf/data_group.conf  and 
> /etc/lvmconf/data_group.conf.1.old. Testing this volume group 
> descriptor data:
> # vgcfgrestore -t -l -n data_group /dev/hde
> vgcfgrestore -- INFO: using backup file "/etc/lvmconf/data_group.conf"
> vgcfgrestore -- backup of volume group "data_group"  is consistent
> --- Volume group ---
> VG Name               data_group
> VG Access             read/write
> VG Status             NOT available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                1
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                1
> Act PV                1
> VG Size               111.79 GB
> PE Size               4 MB
> Total PE              28617
> Alloc PE / Size       25600 / 100 GB
> Free  PE / Size       3017 / 11.79 GB
> VG UUID               rVEO6Y-kq5c-5SR0-uw0I-VPF1-v1ka-HK1WQS
>
> # vgcfgrestore -t -b 1 -l -n data_group /dev/hde
> vgcfgrestore -- INFO: using backup file 
> "/etc/lvmconf/data_group.conf.1.old"
> vgcfgrestore -- backup of volume group "data_group"  is consistent
> --- Volume group ---
> VG Name               data_group
> VG Access             read/write
> VG Status             NOT available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                0
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                1
> Act PV                1
> VG Size               111.79 GB
> PE Size               4 MB
> Total PE              28617
> Alloc PE / Size       0 / 0
> Free  PE / Size       28617 / 111.79 GB
> VG UUID               rVEO6Y-kq5c-5SR0-uw0I-VPF1-v1ka-HK1WQS
>
> The first old backup has 0 allocatings, so I don't want this. The most 
> recent backup file seems to have an error. If the error is in 
> /etc/lvmconf/data_group.conf, how can I recreate the volume group 
> descriptor area without touching the data?
> Thanks
>
> PS
> I think I may want to move from a LVM newbee to a LVM tyro (ie. 
> understand the descriptor area and metadata data structures -- you 
> know at the "a little knowledge is a dangerous thing" level -- about 2 
> or 3 levels down from expert :) ). Where's the best place to start to 
> learn?
>
> Heinz J . Mauelshagen wrote:
>
>> Duane,
>>
>> does pvscan evetually find more than hde (which I assume should be your
>> _only_ PV in the system) ?
>> If so, you need to decide, if those can be removed (pvcreate -ff ...).
>>
>> If not, you might want to restore the metadata to hde and 
>> rescan+activate.
>> (pvcreate -ff /dev/hde;vgcfgrestore -n data_group 
>> /dev/hde;vgscan;vgchange -ay).
>>
>> pvcreate doesn't destroy any data, it just initializes the LVM 
>> metadata area
>> for vgcfgrestore to work.
>>
>> Regards,
>> Heinz    -- The LVM Guy --
>>
>>
>> On Tue, Apr 29, 2003 at 07:36:40PM -0600, Duane Evenson wrote:
>>  
>>
>>> I've upgraded to 1.0.7 but now get the following output - indicating 
>>> the real problem.
>>> If I recreate the volume group and logical volume, will the data 
>>> contained therein still be available or is there another way to 
>>> recover the volume?
>>> vgscan -v
>>> vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
>>> vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
>>> vgscan -- reading all physical volumes (this may take a while...)
>>> vgscan -- scanning for all active volume group(s) first
>>> vgscan -- reading data of volume group "data_group" from physical 
>>> volume(s)
>>> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get 
>>> data of volume
>>> group "data_group" from physical volume(s)
>>> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
>>> vgscan -- WARNING: This program does not do a VGDA backup of your 
>>> volume group
>>>
>>> Some other information of the system:
>>>
>>> # pvdisplay /dev/hde
>>> --- Physical volume ---
>>> PV Name               /dev/hde
>>> VG Name               data_group
>>> PV Size               111.79 GB [234441648 secs] / NOT usable 4.25 
>>> MB [LVM: 239
>>> KB]
>>> PV#                   1
>>> PV Status             available
>>> Allocatable           yes
>>> Cur LV                1
>>> PE Size (KByte)       4096
>>> Total PE              28617
>>> Free PE               3017
>>> Allocated PE          25600
>>> PV UUID               x1l2a2-XUzX-XEjZ-hP3k-qAmo-G5jH-U1z1C8
>>>
>>>
>>> # vgcfgrestore   -n data_group -ll
>>> vgcfgrestore -- INFO: using backup file "/etc/lvmconf/data_group.conf"
>>> --- Volume group ---
>>> VG Name               data_group
>>> VG Access             read/write
>>> VG Status             NOT available/resizable
>>> VG #                  0
>>> MAX LV                256
>>> Cur LV                1
>>> Open LV               0
>>> MAX LV Size           255.99 GB
>>> Max PV                256
>>> Cur PV                1
>>> Act PV                1
>>> VG Size               111.79 GB
>>> PE Size               4 MB
>>> Total PE              28617
>>> Alloc PE / Size       25600 / 100 GB
>>> Free  PE / Size       3017 / 11.79 GB
>>> VG UUID               rVEO6Y-kq5c-5SR0-uw0I-VPF1-v1ka-HK1WQS
>>>
>>> --- Logical volume ---
>>> LV Name                /dev/data_group/logical_volume1
>>> VG Name                data_group
>>> LV Write Access        read/write
>>> LV Status              NOT available
>>> LV #                   1
>>> # open                 0
>>> LV Size                100 GB
>>> Current LE             25600
>>> Allocated LE           25600
>>> Allocation             next free
>>> Read ahead sectors     10000
>>> Block device           58:0
>>>
>>>
>>> --- Physical volume ---
>>> PV Name               /dev/hde
>>> VG Name               data_group
>>> PV Size               111.79 GB [234441648 secs] / NOT usable 4.25 
>>> MB [LVM: 239
>>> KB]
>>> PV#                   1
>>> PV Status             available
>>> Allocatable           yes
>>> Cur LV                1
>>> PE Size (KByte)       4096
>>> Total PE              28617
>>> Free PE               3017
>>> Allocated PE          25600
>>> PV UUID               x1l2a2-XUzX-XEjZ-hP3k-qAmo-G5jH-U1z1C8
>>>
>>>
>>> Heinz J . Mauelshagen wrote:
>>>
>>>   
>>>
>>>> Duane,
>>>>
>>>> since you're running 1.0.3 I assume you might be hitting an array 
>>>> derefenerence
>>>> bug in the LVM1 library we fixed in 1.0.6.
>>>>
>>>> Please upgrade to 1.0.7 and try again.
>>>>
>>>> Regards,
>>>> Heinz    -- The LVM Guy --
>>>>
>>>> On Sun, Apr 27, 2003 at 12:22:59PM -0600, Duane Evenson wrote:
>>>>
>>>>
>>>>     
>>>>
>>>>> I'm having troubles and can't find the solution in the HOWTO, or 
>>>>> the archived mailing lists articles.
>>>>> I installed lvm on an entire hard drive (hde), made one logical 
>>>>> group with a logical volume of 100G.
>>>>> I mounted to volume, copied files over OK, but vgscan caused 
>>>>> segmentation faults.
>>>>> I rebooted, hoping that it was a conflict between the kernel info 
>>>>> and physical info. Obviously, it wasn't.
>>>>> Here are the results of running pvdisplay, pvscan, vgscan, and 
>>>>> vgdisplay.
>>>>>
>>>>> # pvdisplay /dev/hde -v
>>>>> --- Physical volume ---
>>>>> PV Name               /dev/hde
>>>>> VG Name               data_group
>>>>> PV Size               111.79 GB [234441648 secs] / NOT usable 4.25 
>>>>> MB [LVM: 239
>>>>> KB]
>>>>> PV#                   1
>>>>> PV Status             available
>>>>> Allocatable           yes
>>>>> Cur LV                1
>>>>> PE Size (KByte)       4096
>>>>> Total PE              28617
>>>>> Free PE               3017
>>>>> Allocated PE          25600
>>>>> PV UUID               x1l2a2-XUzX-XEjZ-hP3k-qAmo-G5jH-U1z1C8
>>>>>
>>>>> pvdisplay -- "/etc/lvmtab.d/data_group" doesn't exist
>>>>>
>>>>> # pvscan -v
>>>>> pvscan -- reading all physical volumes (this may take a while...)
>>>>> pvscan -- walking through all physical volumes found
>>>>> pvscan -- inactive PV "/dev/hde"  is associated to unknown VG 
>>>>> "data_group" (run
>>>>> vgscan)
>>>>> pvscan -- total: 1 [111.79 GB] / in use: 1 [111.79 GB] / in no VG: 
>>>>> 0 [0]
>>>>>
>>>>> # vgscan -v
>>>>> vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
>>>>> vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
>>>>> vgscan -- reading all physical volumes (this may take a while...)
>>>>> vgscan -- scanning for all active volume group(s) first
>>>>> vgscan -- reading data of volume group "data_group" from physical 
>>>>> volume(s)
>>>>> Segmentation fault
>>>>>
>>>>> # vgscan -d
>>>>> ...
>>>>> <55555> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hde
>>>>> <55555> system_id_check_exported -- CALLED
>>>>> <55555> system_id_check_exported -- LEAVING with ret: 0
>>>>> <4444> pv_read -- LEAVING with ret: 0
>>>>> <4444> vg_copy_from_disk -- CALLED
>>>>> <55555> vg_check_vg_disk_t_consistency -- CALLED
>>>>> <666666> vg_check_name -- CALLED with VG:
>>>>> <7777777> lvm_check_chars -- CALLED with name: ""
>>>>> <7777777> lvm_check_chars -- LEAVING with ret: 0
>>>>> <666666> vg_check_name -- LEAVING with ret: 0
>>>>> <55555> vg_check_vg_disk_t_consistency -- LEAVING with ret: -344
>>>>> <4444> vg_copy_from_disk -- LEAVING
>>>>> Segmentation fault
>>>>>
>>>>> # vgdisplay data_group -h
>>>>> Logical Volume Manager 1.0.3
>>>>> Heinz Mauelshagen, Sistina Software  19/02/2002 (IOP 10)
>>>>>
>>>>> vgdisplay -- display volume group information
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> linux-lvm mailing list
>>>>> linux-lvm@sistina.com
>>>>> http://lists.sistina.com/mailman/listinfo/linux-lvm
>>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>>>  
>>>>>       
>>>>
>>>> *** Software bugs are stupid.
>>>>   Nevertheless it needs not so stupid people to solve them ***
>>>>
>>>> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
>>>>
>>>>
>>>> Heinz Mauelshagen                                 Sistina Software 
>>>> Inc.
>>>> Senior Consultant/Developer                       Am Sonnenhang 11
>>>>                                                 56242 Marienrachdorf
>>>>                                                 Germany
>>>> Mauelshagen@Sistina.com                           +49 2626 141200
>>>>                                                      FAX 924446
>>>> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
>>>>
>>>>
>>>> _______________________________________________
>>>> linux-lvm mailing list
>>>> linux-lvm@sistina.com
>>>> http://lists.sistina.com/mailman/listinfo/linux-lvm
>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>>
>>>>
>>>>
>>>>     
>>>
>>>
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@sistina.com
>>> http://lists.sistina.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>   
>>
>>
>> *** Software bugs are stupid.
>>    Nevertheless it needs not so stupid people to solve them ***
>>
>> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
>>
>>
>> Heinz Mauelshagen                                 Sistina Software Inc.
>> Senior Consultant/Developer                       Am Sonnenhang 11
>>                                                  56242 Marienrachdorf
>>                                                  Germany
>> Mauelshagen@Sistina.com                           +49 2626 141200
>>                                                       FAX 924446
>> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@sistina.com
>> http://lists.sistina.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>  
>>
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
