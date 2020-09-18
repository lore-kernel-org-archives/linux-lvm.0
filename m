Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A20C3115DEF
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2020 07:07:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DC8480088F
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2020 07:07:23 +0000 (UTC)
References: <1599670049-6641-1-git-send-email-heming.zhao@suse.com>
	<74001d9c-1024-81c9-66f9-d5bc399e1ca1@redhat.com>
	<4a6b7e89-49b9-72a8-6938-a1fc7419ccc1@suse.com>
	<58d180ab-489d-465f-35de-8442dde067b8@redhat.com>
From: "heming.zhao" <heming.zhao@suse.com>
Message-ID: <b9524b39-3171-887f-efa8-e13a9a9aad51@suse.com>
Date: Fri, 18 Sep 2020 15:07:09 +0800
In-Reply-To: <58d180ab-489d-465f-35de-8442dde067b8@redhat.com>
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] [PATCH v2] lvs: add -o lv_usable
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
To: Heinz Mauelshagen <heinzm@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>
Cc: teigland@sourceware.org

On 9/17/20 6:18 PM, Heinz Mauelshagen wrote:
> On 9/10/20 8:34 AM, heming.zhao wrote:
>> On 9/10/20 1:17 AM, Zdenek Kabelac wrote:
>>> Dne 09. 09. 20 v 18:47 Zhao Heming napsal(a):
>>>> report LV is usable for upper layer.
>>>>
>>>> leave issues
>>>> - this patch doesn't contain dm table comparison. So if the disk
>>>>    is removed then re-inserted, but the re-inserted disk
>>>>    major:minor is changed, the code doesn't have ability to detect.
>>>> - raid10: removing any 2 disks will think as array broken.
>>>>
>>>> Signed-off-by: Zhao Heming <heming.zhao@suse.com>
>>>> ---
>>>> v2:
>>>> - remove dm table parsing code in _lv_is_usable()
>>>> - add new status bit NOT_USABLE_LV.
>>>>    note, I chose the first available bit 0x0000000080000000
>>>> - _lvusable_disp() uses lv_is_usable() to return usable status
>>>>
>>>      dm_list_iterate_items(lvseg, &lv->segments) {
>>>>           for (s = 0; s < lvseg->area_count; ++s) {
>>>>               if (seg_type(lvseg, s) == AREA_PV) {
>>>> -                if (is_missing_pv(seg_pv(lvseg, s)))
>>>> +                pv = seg_pv(lvseg, s);
>>>> +                if (!(pv->dev) && is_missing_pv(pv)) {
>>>>                       lv->status |= PARTIAL_LV;
>>>> +                    lv->status |= NOT_USABLE_LV;
>>>> +                }
>>>>               }
>>>>           }
>>>>       }
>>>
>>> Hi
>>>
>>> As it can be seen here - there is big intersection with meaning of
>>> PARTIAL_LV.
> 
> 
> The semantics of a usable LV is fuzzy by definition, because for instance a multi-segment PARTIAL_LV
> linear LV with a subset if its segments missing is still accessible relative to the remaining segments
> thus doesn't make it unusable.   As a result, LVs failing t o activate would be the 'unusable ones'.
> The later is given for RAID when it's, e.g.  missing more than its maximum number of parity devices
> for striped RAID layouts.  So PARTIAL_LV is sufficient to tell that any LV is still partially usable.
> 
> 
the usable or unusable is up to from which side to see. I prefer to see from top to bottom, upper
software (e.g. FS, VM) see the virtual disk (e.g. which is made up of RaidLV) unusable when missing beyond
max limit parity devices.  Or linear LV missing any one underlying devices.
The reason is that there are only few system/kernel level issue which can make lvm not to work. e.g.
device-mapper layer doesn't work, lvm internal bugs. The missing devices won't block lvm issue io, and this
time kernel (lower dm layer) will report io error to lvm.
So we could make the usable definition:
- whether lvm believes the uppser layer can successfully do io to the entire LV

>>>
>>> And the question is - what does it mean in the context of various segment
>>> types.
>>>
>>> I believe we need to discuss with Heinz - whether we want to mark
>>> Raid LVs partial in case they are actually 'only leg-pertial' and should
>>> be actually activatable without partial activation  - which is ATM abused for this purpose.
> 
> Degraded RAID layouts are always usable unless more than its parity devices or all its mirrors failed because of missing PVs.  Hence such activatable RaidLVs are not partial at the LV but at the SubLV Level.
> 
agree.

>>>
>>> ATM I'm not sure we want to introduce new flags, which has only slight
>>> deviation from current partial flag - which should deserve closer look
>>> of its meaning.
>>>
>>> We'll try to find something with Heinz to agree with.
>>>
>> Ok, wait for feedback from Heinz.
> 
> What are we missing if we define any SubLV partial state with PARTIAL_LV/not activatable and
> leave it to the specific segment type handlers of the mappings on top of such SubLVs
> to define their respective PARTIAL_LV state or reject activation. E.g. a fully usable RAID6 with a maximimum of 2 missing legs with those missing legs either being partial and RAID6 I/O addressing a missing segment -or- thise leg SubLVs not having been activated _not_ setting PATIAL_LV on the RAID6 LV ('lvs -oname,attr,devices' will show state details on the LV tree nodes).
> 
> Let's discuss this first before adding MISSING_PV to the picture...
> 
not to active PARTIAL_LV means the SubLV doesn't work? by suspend dm-table?
It looks there is no big different between marking PARTIAL_LV flag and suspend dm-table.
For me, keep exist logic is more acceptable.

> FWIW:
> raid0 mappings with a subset of missing segments may not be of much use but will provide data still.
> 
this situation will make upper layer software work abnormally. if a upper layer software can directly manage
subset of raid0LV, (in my opinion) there is no reason to set up raid0.

> Heinz
> 
> 
>>
>> I agree with you. the PARTIAL_LV is more closer to the new bit NOT_USABLE_LV.
>> There is another bit MISSING_PV, which is set when pv is missing or the pv is not workable.
> 
>> From my understanding, we could reuse the PARTIAL_LV to show different meaning according to different context. For example, in raid env, the top layer LV will be set PARTIAL_LV when the raid array not usable (e.g. raid0 missing a disk). Other cases, within raid limit, top layer raid LV won't be set. if following the rule, there will no need to set the new bit NOT_USABLE_LV.
>>
>> Heming
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
