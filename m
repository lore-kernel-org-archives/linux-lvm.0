References: <CAO_L6qEOfivZ2PwJEzNFWnuECikZb8HqOX2Hn9DigMC62WSgqA@mail.gmail.com>
	<5715E82D.1070300@redhat.com>
	<CAO_L6qE_kYnYUKPswVvP50yOWt28_U6CPQjOep3fOhDa3AJaYA@mail.gmail.com>
	<CAO_L6qHfU=S4fZF5kZAYi6DawNO=-HFGw9f3j98QNtBvZosbQA@mail.gmail.com>
	<CAO_L6qH-W+d77nuDgVmz_1-j-LGZi27nGGH6LCb0tOdsQkzzOA@mail.gmail.com>
From: Marian Csontos <mcsontos@redhat.com>
Message-ID: <5721E3F5.1010603@redhat.com>
Date: Thu, 28 Apr 2016 12:20:37 +0200
MIME-Version: 1.0
In-Reply-To: <CAO_L6qH-W+d77nuDgVmz_1-j-LGZi27nGGH6LCb0tOdsQkzzOA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Thin Pool Performance
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
To: linux-lvm@redhat.com, shankhabanerjee@gmail.com

On 04/20/2016 09:50 PM, shankha wrote:
> Chunk size for lvm was 64K.

What's the stripe size?
Does 8 disks in RAID5 mean 7x data + 1x parity?

If so, 64k chunk cannot be aligned with RAID5 stripe size and each write 
is potentially rewriting 2 stripes - rather painful for random writes as 
this means to write 4k of data, 64k are allocated and that requires 2 
stripes - almost twice the amount of written data to pure RAID.

-- Martian


> Thanks
> Shankha Banerjee
>
>
> On Wed, Apr 20, 2016 at 11:55 AM, shankha <shankhabanerjee@gmail.com> wrote:
>> I am sorry. I forgot to post the workload.
>>
>> The fio benchmark configuration.
>>
>> [zipf write]
>> direct=1
>> rw=randrw
>> ioengine=libaio
>> group_reporting
>> rwmixread=0
>> bs=4k
>> iodepth=32
>> numjobs=8
>> runtime=3600
>> random_distribution=zipf:1.8
>> Thanks
>> Shankha Banerjee
>>
>>
>> On Wed, Apr 20, 2016 at 9:34 AM, shankha <shankhabanerjee@gmail.com> wrote:
>>> Hi,
>>> I had just one thin logical volume and running fio benchmarks. I tried
>>> having the metadata on a raid0. There was minimal increase in
>>> performance. I had thin pool zeroing switched on. If I switch off
>>> thin pool zeroing initial allocations were faster but the final
>>> numbers are almost similar. The size of the thin poll metadata LV was
>>> 16 GB.
>>> Thanks
>>> Shankha Banerjee
>>>
>>>
>>> On Tue, Apr 19, 2016 at 4:11 AM, Zdenek Kabelac <zkabelac@redhat.com> wrote:
>>>> Dne 19.4.2016 v 03:05 shankha napsal(a):
>>>>>
>>>>> Hi,
>>>>> Please allow me to describe our setup.
>>>>>
>>>>> 1) 8 SSDS with a raid5 on top of it. Let us call the raid device :
>>>>> dev_raid5
>>>>> 2) We create a Volume Group on dev_raid5
>>>>> 3) We create a thin pool occupying 100% of the volume group.
>>>>>
>>>>> We performed some experiments.
>>>>>
>>>>> Our random write operations dropped  by half and there was significant
>>>>> reduction for
>>>>> other operations(sequential read, sequential write, random reads) as
>>>>> well compared to native raid5
>>>>>
>>>>> If you wish I can share the data with you.
>>>>>
>>>>> We then changed our configuration from one POOL to 4 POOLS and were able
>>>>> to
>>>>> get back to 80% of the performance (compared to native raid5).
>>>>>
>>>>> To us it seems that the lvm metadata operations are the bottleneck.
>>>>>
>>>>> Do you have any suggestions on how to get back the performance with lvm ?
>>>>>
>>>>> LVM version:     2.02.130(2)-RHEL7 (2015-12-01)
>>>>> Library version: 1.02.107-RHEL7 (2015-12-01)
>>>>>
>>>>
>>>>
>>>> Hi
>>>>
>>>>
>>>> Thanks for playing with thin-pool, however your report is largely
>>>> incomplete.
>>>>
>>>> We do not see you actual VG setup.
>>>>
>>>> Please attach  'vgs/lvs'  i.e. thin-pool zeroing (if you don't need it keep
>>>> it disabled), chunk size (use bigger chunks if you do not need snapshots),
>>>> number of simultaneously active thin volumes in single thin-pool (running
>>>> hundreds of loaded thinLV is going to loose battle on locking) , size of
>>>> thin pool metadata LV -  is this LV located on separate device (you should
>>>> not use RAID5 with metatadata)
>>>> and what kind of workload you try on ?
>>>>
>>>> Regards
>>>>
>>>> Zdenek
>>>>
>>>> _______________________________________________
>>>> linux-lvm mailing list
>>>> linux-lvm@redhat.com
>>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
