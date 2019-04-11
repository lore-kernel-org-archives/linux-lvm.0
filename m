References: <1674381816.392064.1554814805982.JavaMail.zimbra@helmholtz-muenchen.de>
	<6d88edff-8ec2-7724-04c2-9909f2013d29@gmail.com>
	<15435045.175922.1554903378472.JavaMail.zimbra@helmholtz-muenchen.de>
	<70292f72-f282-51de-a913-55f579dcef4f@redhat.com>
	<69170546.143990.1554985968570.JavaMail.zimbra@helmholtz-muenchen.de>
	<787104895.51532.1554994161932.JavaMail.zimbra@helmholtz-muenchen.de>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <37332d31-8ab2-af15-1e0b-cb26a2421603@redhat.com>
Date: Thu, 11 Apr 2019 17:59:01 +0200
MIME-Version: 1.0
In-Reply-To: <787104895.51532.1554994161932.JavaMail.zimbra@helmholtz-muenchen.de>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] can't remove snapshot
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Cc: Zdenek Kabelac <zkabelac@redhat.com>

Dne 11. 04. 19 v 16:49 Lentes, Bernd napsal(a):
> ----- On Apr 11, 2019, at 2:32 PM, Bernd Lentes bernd.lentes@helmholtz-muenchen.de wrote:
> 
>> ----- On Apr 11, 2019, at 1:09 PM, Zdenek Kabelac zkabelac@redhat.com wrote:
>>
>>
>>>>>> Hello list,
>>>>>>
>>>>>> I have a two-node HA-cluster which uses local and cluster LVM.
>>>>>> cLVM is currently stopped, I try to remove a snapshot from the root lv which
>>>>>> is located on a local VG.
>>>>>> I get this error:
>>>>>> ha-idg-2:/mnt/spp # lvremove -fv vg_local/lv_snap_pre_sp4
>>>>>>      connect() failed on local socket: No such file or directory
>>>>>>      Internal cluster locking initialisation failed.
>>>>>>      WARNING: Falling back to local file-based locking.
>>>>>>      Volume Groups with the clustered attribute will be inaccessible.
>>>>>>        Archiving volume group "vg_local" metadata (seqno 26).
>>>>>>        Removing snapshot volume vg_local/lv_snap_pre_sp4.
>>>>>>        Loading table for vg_local-lv_root (254:8).
>>>>>>      device-mapper: reload ioctl on  (254:8) failed: Invalid argument
>>>>>>      Failed to refresh lv_root without snapshot.
>>>>>>
>>>>>
>   
> 
>>>
>>> What is the related error message from kernel (IOCTL) - check and show dmesg
>>> messages. Eventually please supply
>>>
>>> 'dmsetup table'
>>> 'dmsetup status'
>>> 'dmsetup info -c'
>>
>> Hi Zdenek,
>>
>> thanks for your support. I managed to delete the snapshot via "dmsetup remove",
>> but in lvs and lvdisplay it still appears.
>> And i'm still not able to remove it via lvremove:
>>
>> ha-idg-2:~ # lvremove -fv /dev/vg_local/lv_snap_pre_sp4
>>   connect() failed on local socket: No such file or directory
>>   Internal cluster locking initialisation failed.
>>   WARNING: Falling back to local file-based locking.
>>   Volume Groups with the clustered attribute will be inaccessible.
>>     Archiving volume group "vg_local" metadata (seqno 26).
>>     Removing snapshot volume vg_local/lv_snap_pre_sp4.
>>     Loading table for vg_local-lv_root (254:9).
>>   device-mapper: reload ioctl on  (254:9) failed: Invalid argument
>>   Failed to refresh lv_root without snapshot.
>>
>> dmesg:
>> [88310.980351] device-mapper: ioctl: can't change device type after initial
>> table load.
>>
>> dmsetup:
>> ha-idg-2:~ # dmsetup -c table
>> vg_local-lv_root-real: 0 209715200 linear 254:4 167774208
>> vg_local-lv_var: 0 83886080 linear 254:4 83888128
>> 3600508b1001c5037520913a9b581d78d-part3: 0 2081866639 linear 254:0 262248448
>> 3600508b1001c5037520913a9b581d78d-part2: 0 262144000 linear 254:0 104448
>> 3600c0ff00012824b04af7a5201000000: 0 3738281088 multipath 1 queue_if_no_path 1
>> alua 2 1 service-time 0 1 2 8:32 1 1 service-time 0 1 2 8:16 1 1
>> 3600508b1001c5037520913a9b581d78d-part1: 0 102400 linear 254:0 2048
>> 3600c0ff00012824b04af7a5201000000-part3: 0 626951296 linear 254:1 3111329792
>> 3600c0ff00012824b04af7a5201000000-part2: 0 999999744 linear 254:1 2111328256
>> vg_local-lv_tmp: 0 83886080 linear 254:4 2048
>> vg_local-lv_root: 0 209715200 snapshot-origin 254:8
>> 3600c0ff00012824b04af7a5201000000-part1: 0 2111325952 linear 254:1 2048
>> 3600508b1001c5037520913a9b581d78d: 0 2344115120 multipath 1 queue_if_no_path 0 1
>> 1 service-time 0 1 2 8:0 1 1


Hi

So here is the reason:

ioctl: can't change device type after initial table load.

You already have snapshot-origin in the table - which likely is not what lvm2 
would have expected - you could either try 'lvchange --refresh' to get the dm 
table into matching state - or reboot and start from beginning.

Clearly you are not supposed to partial modify DM table targets yourself while 
lvm2 holds the metadata state for them - so ATM it looks like lvm2 cannot 
proceed with the command - as the content of DM node is different and 
transition is not allowed.

lvm2 should probably detect the case sooner and report error about 
incompatible state of device for present metadata (but this will not help
you to resolve the problem).

So waht you can do is to probably restore to the metadata you had before 
you've took your snapshot and try change into this table - but looking into 
your current DM table - such transition might be untrivial.

Is there a reason why you cannot reboot - as that's IMHO the simplest fix??

Regards

Zdenek
