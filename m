Mime-Version: 1.0 (Apple Message framework v623)
In-Reply-To: <1145997578.26842.119.camel@localhost.localdomain>
References: <444E73C3.7040305@nrel.colostate.edu>
	<1145995049.26842.103.camel@localhost.localdomain>
	<f9361e496ca792ff924de60979c1bbb9@redhat.com>
	<1145997578.26842.119.camel@localhost.localdomain>
Message-Id: <170c7e6afcd3f12b930f700dc856034e@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] lvm2 *TEMPORARY* PV failure - what happens?
Date: Tue, 25 Apr 2006 16:34:21 -0500
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, mingz@ele.uri.edu

y, sounds right.  It's pretty much what I get.

  brassow

On Apr 25, 2006, at 3:39 PM, Ming Zhang wrote:

> assume 2 scenarios
>
> 1) this PV is under use when it is disconnected temporarily. then
> eventually will return r/w errors to applications. but other LVs are
> still accessible.
>
> 2) system is off and boot up again. for this system will complain PV
> with UUID ... is not found. so the only way is to partially activate 
> VG.
>
> am i correct here?
>
> ming
>
>
>
> On Tue, 2006-04-25 at 15:21 -0500, Jonathan E Brassow wrote:
>> It is simple to play with this type of scenario by doing:
>>
>> echo offline > /sys/block/<sd dev>/device/state
>>
>> and later
>>
>> echo running > /sys/block/<sd dev>/device/state
>>
>> I know this doesn't answer your question directly.
>>
>>   brassow
>>
>>
>> On Apr 25, 2006, at 2:57 PM, Ming Zhang wrote:
>>
>>> my 2c. fix me if i am wrong
>>>
>>> either activate the VG partially, and then all LVs on other PVs are
>>> still accessible. I remember these LVs will only have RO access. 
>>> Though
>>> I have no idea why.
>>>
>>> use dm-zero to generate a fake PVs and add to VG, then allow VG to
>>> activate and access those LV. But i do not know if you access a LV 
>>> that
>>> is partially or fully on this PV, what will happen.
>>>
>>> Ming
>>>
>>>
>>> On Tue, 2006-04-25 at 13:08 -0600, Ty! Boyack wrote:
>>>> I've been intrigued by the discussion of what happens when a PV 
>>>> fails,
>>>> and have begun to wonder what would happen in the case of a 
>>>> transient
>>>> failure of a PV.
>>>>
>>>> The design I'm thinking of is a SAN environment with several
>>>> multi-terabyte iSCSI arrays as PVs, being grouped together into a
>>>> single
>>>> VG, and then carving LVs out of that.  We plan on using the CLVM 
>>>> tools
>>>> to fit into a clustered environment.
>>>>
>>>> The arrays themselves are robust (RAID 5/6, redundant power 
>>>> supplies,
>>>> etc.) and I grant that if we lose the actual array (for example, if
>>>> multiple disks fail), then we are in the situation of a true and
>>>> possibly total failure of the PV and loss of it's data blocks.
>>>>
>>>> But there is always the possiblity that we could lose the CPU, 
>>>> memory,
>>>> bus, etc. in the iSCSI controller portion of the array, which will
>>>> cause
>>>> downtime, but no true loss of data.  Or someone may hit the wrong
>>>> power
>>>> switch and just reboot the thing, taking it offline for a short 
>>>> time.
>>>> Yes, that someone would probably be me.  Shame on me.
>>>>
>>>> The key point is that the iSCSI disk will come back in a few
>>>> minutes/hours/days depending on the failure type, and all blocks 
>>>> will
>>>> be
>>>> intact when it comes back up.  I suppose the analagous situation 
>>>> would
>>>> be using LVM on a group of hot swap drives and pulling one of the
>>>> disks,
>>>> waiting a while, and then re-inserting it.
>>>>
>>>> Can someone please walk me through the resulting steps that would
>>>> happen
>>>> within LVM2 (or a GFS filesystem on top of that LV) in this 
>>>> situation?
>>>>
>>>> Thanks,
>>>>
>>>> -Ty!
>>>>
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>
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
