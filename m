References: <3f51904f43c45f8c1259f1b050402358@assyoma.it>
	<5070f4fa-81ad-9c9a-b0a7-8d5463ea09d3@redhat.com>
	<056d2d5dd9a7846a56971ce5f4cb3537@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <4f98430e-f6eb-b7b7-d1b0-f54ad07361de@redhat.com>
Date: Thu, 17 Sep 2020 21:27:20 +0200
MIME-Version: 1.0
In-Reply-To: <056d2d5dd9a7846a56971ce5f4cb3537@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvmcache with vdo - inconsistent block size
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>

Dne 16. 09. 20 v 0:32 Gionatan Danti napsal(a):
> Il 2020-09-15 20:34 Zdenek Kabelac ha scritto:
>> Dne 14. 09. 20 v 23:44 Gionatan Danti napsal(a):
>>> Hi all,
>>> I am testing lvmcache with VDO and I have issue with devices block size.
>>>
>>> The big & slow VDO device is on top of a 4-disk MD RAID 10 device (itself 
>>> on top of dm-integrity). Over the VDO device I created a thinpool and a 
>>> thinvol [1]. When adding the cache device to the volume group via vgextend, 
>>> I get an error stating "Devices have inconsistent logical block sizes (4096 
>>> and 512)." [2]
>>>
>>> Now, I know why the error shows and what i means. However, I don't know how 
>>> to force the cache device to act as a 4k sector device, and/if this is 
>>> really required to cache a VDO device.
>>>
>>> My current workaround is to set VDO with --emulate512=enabled, but this can 
>>> be suboptimal and it is not recommended.
>>>
>>> Any idea on what I am doing wrong?
>>
>> Hi
>>
>> LVM currently does not support mixing devices of different sector sizes within
>> a single VG as it brings lot of troubles we have not yet clear vision what
>> to do with all of them.
> 
> Hi Zdenek, yes, I understand. What surprised me is that lvmvdo *can* be 
> combined with caching, and it does not suffer from this issue. Can you 
> elaborate on why it works in this case?
> 
>> Also this combination of provisioned devices is not advised - since
>> you are combining 2 kind of devices on top of each other and it can be
>> a big problem
>> to solve recovery case.
> 
> True.
> 
>> On lvm2 side we do not allow to use 'VDO LV' as backend for thin-pool device.
> 
> I noticed it. However, from what I can read on RedHat docs, thinpool over VDO 
> device should be perfectly fine (the other way around, not so much).
> 

You've most likely found the bug and this should be likely disable
(and enabled only with some force option).

Problem is, when such device stack is used for XFS - where the 'geometry' 
changes, but for some other it's not a big issue (i.e. ext4).

So if you already hit some problem - feel free to open upstream BZ for this issue.

Zdenek
