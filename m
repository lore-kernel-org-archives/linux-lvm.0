Message-ID: <5012A48D.80007@redhat.com>
Date: Fri, 27 Jul 2012 16:24:13 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <501289B0.1020504@profihost.ag> <501292F4.8010108@profitbricks.com>
	<50129825.1060302@profihost.ag>
In-Reply-To: <50129825.1060302@profihost.ag>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] metadata problems while testing lvm2 git with
	dm_thin_pool
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: sebastian.riemer@profitbricks.com, Stefan Priebe - Profihost AG <s.priebe@profihost.ag>

Dne 27.7.2012 15:31, Stefan Priebe - Profihost AG napsal(a):
> Hello Sebastian,
>
> i was also able to fix this by set poolmetadatasize? But normally LVM should
> set this correctly? Are you using dm thin in production?
>
> This fixes it:
> lvcreate --poolmetadatasize 5G -L 10G -T thinvol/pool1 -V 100G --name disk1
>

Using 5G for metadata is quite a lot - suggested value is in range of hundreds 
of megabytes.

> Stefan
> Am 27.07.2012 15:09, schrieb Sebastian Riemer:
>> Hi Stefan,
>>
>> I had a similar issue some time ago.
>>
>> Which vgcreate commands did you use?
>>
>> The last device in the list is used for the meta data. If you don't give
>> it a further device for the metadata then LVM puts the metadata onto the
>> same device like the data resulting in your issue.
>>
>> Do it like this:
>>
>> vgcreate thinvg /dev/sda /dev/sdb
>> lvcreate -L 10G -T thinvg/pool1
>> lvcreate -V 100G -T thinvg/pool1 -n disk1
>>
>> The data is put on /dev/sda and the metadata is put on /dev/sdb. You can
>> only use the size of /dev/sda for the data. /dev/sdb shouldn't be bigger
>> than 16 GiB or your wasting disk space. You can also use a regular 16
>> GiB LV as PV and put it as metadata device into the VG.
>>
>> Looks like this:
>> pvcreate /dev/sdb
>> vgcreate meta /dev/sdb
>> lvcreate -L 16G meta -n meta1
>> vgcreate thinvg /dev/sda /dev/mapper/meta-meta1
>> lvcreate -L 10G -T thinvg/pool1
>> lvcreate -V 100G -T thinvg/pool1 -n disk1
>>
>> Cheers,
>> Sebastian
>>
>>
>> On 27.07.2012 14:29, Stefan Priebe - Profihost AG wrote:
>>> Hello list,
>>>
>>> i'm testing dm_thin_pool with lvm2 right now. And i'm always running
>>> into the situation that the metadata get's full.
>>>
>>> Kernel: 3.5-rc7
>>> lvm/dmeventd: up2date git version 186a2772
>>>
>>> I created my thin disk like this:
>>> lvcreate -L 10G -T thinvol/pool1 -V 100G --name disk1
>>>
>>> After some autoresizing lvs looks like this:
>>> # lvs
>>>    LV    VG      Attr     LSize   Pool  Origin Data%  Move Log Copy%
>>> Convert
>>>    disk1 thinvol Vwi-a-tz 100,00g pool1         22,95
>>>    pool1 thinvol twi-a-tz  33,77g               67,97
>>>


Currently the resize of thin pool is not connected to the amount of allocated 
space by LVs allocated from this pool.

Thus it just takes the size and increases size of the pool to match configured 
values.  Similar problem is with old style snapshots which may grow a lot past 
the size of origin.

It will be addressed in future versions of lvm.

Zdenek
