Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3KJpDDv021833
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 20 Apr 2016 15:51:13 -0400
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6EE177F356
	for <linux-lvm@redhat.com>; Wed, 20 Apr 2016 19:51:12 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id n62so72540407vkb.0
	for <linux-lvm@redhat.com>; Wed, 20 Apr 2016 12:51:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAO_L6qHfU=S4fZF5kZAYi6DawNO=-HFGw9f3j98QNtBvZosbQA@mail.gmail.com>
References: <CAO_L6qEOfivZ2PwJEzNFWnuECikZb8HqOX2Hn9DigMC62WSgqA@mail.gmail.com>
	<5715E82D.1070300@redhat.com>
	<CAO_L6qE_kYnYUKPswVvP50yOWt28_U6CPQjOep3fOhDa3AJaYA@mail.gmail.com>
	<CAO_L6qHfU=S4fZF5kZAYi6DawNO=-HFGw9f3j98QNtBvZosbQA@mail.gmail.com>
From: shankha <shankhabanerjee@gmail.com>
Date: Wed, 20 Apr 2016 15:50:31 -0400
Message-ID: <CAO_L6qH-W+d77nuDgVmz_1-j-LGZi27nGGH6LCb0tOdsQkzzOA@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Chunk size for lvm was 64K.
Thanks
Shankha Banerjee


On Wed, Apr 20, 2016 at 11:55 AM, shankha <shankhabanerjee@gmail.com> wrote:
> I am sorry. I forgot to post the workload.
>
> The fio benchmark configuration.
>
> [zipf write]
> direct=1
> rw=randrw
> ioengine=libaio
> group_reporting
> rwmixread=0
> bs=4k
> iodepth=32
> numjobs=8
> runtime=3600
> random_distribution=zipf:1.8
> Thanks
> Shankha Banerjee
>
>
> On Wed, Apr 20, 2016 at 9:34 AM, shankha <shankhabanerjee@gmail.com> wrote:
>> Hi,
>> I had just one thin logical volume and running fio benchmarks. I tried
>> having the metadata on a raid0. There was minimal increase in
>> performance. I had thin pool zeroing switched on. If I switch off
>> thin pool zeroing initial allocations were faster but the final
>> numbers are almost similar. The size of the thin poll metadata LV was
>> 16 GB.
>> Thanks
>> Shankha Banerjee
>>
>>
>> On Tue, Apr 19, 2016 at 4:11 AM, Zdenek Kabelac <zkabelac@redhat.com> wrote:
>>> Dne 19.4.2016 v 03:05 shankha napsal(a):
>>>>
>>>> Hi,
>>>> Please allow me to describe our setup.
>>>>
>>>> 1) 8 SSDS with a raid5 on top of it. Let us call the raid device :
>>>> dev_raid5
>>>> 2) We create a Volume Group on dev_raid5
>>>> 3) We create a thin pool occupying 100% of the volume group.
>>>>
>>>> We performed some experiments.
>>>>
>>>> Our random write operations dropped  by half and there was significant
>>>> reduction for
>>>> other operations(sequential read, sequential write, random reads) as
>>>> well compared to native raid5
>>>>
>>>> If you wish I can share the data with you.
>>>>
>>>> We then changed our configuration from one POOL to 4 POOLS and were able
>>>> to
>>>> get back to 80% of the performance (compared to native raid5).
>>>>
>>>> To us it seems that the lvm metadata operations are the bottleneck.
>>>>
>>>> Do you have any suggestions on how to get back the performance with lvm ?
>>>>
>>>> LVM version:     2.02.130(2)-RHEL7 (2015-12-01)
>>>> Library version: 1.02.107-RHEL7 (2015-12-01)
>>>>
>>>
>>>
>>> Hi
>>>
>>>
>>> Thanks for playing with thin-pool, however your report is largely
>>> incomplete.
>>>
>>> We do not see you actual VG setup.
>>>
>>> Please attach  'vgs/lvs'  i.e. thin-pool zeroing (if you don't need it keep
>>> it disabled), chunk size (use bigger chunks if you do not need snapshots),
>>> number of simultaneously active thin volumes in single thin-pool (running
>>> hundreds of loaded thinLV is going to loose battle on locking) , size of
>>> thin pool metadata LV -  is this LV located on separate device (you should
>>> not use RAID5 with metatadata)
>>> and what kind of workload you try on ?
>>>
>>> Regards
>>>
>>> Zdenek
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
