References: <1599670049-6641-1-git-send-email-heming.zhao@suse.com>
	<74001d9c-1024-81c9-66f9-d5bc399e1ca1@redhat.com>
	<4a6b7e89-49b9-72a8-6938-a1fc7419ccc1@suse.com>
	<58d180ab-489d-465f-35de-8442dde067b8@redhat.com>
	<b9524b39-3171-887f-efa8-e13a9a9aad51@suse.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <f38c16c5-1df6-b27a-f325-9aa441545ac4@redhat.com>
Date: Fri, 18 Sep 2020 13:38:28 +0200
MIME-Version: 1.0
In-Reply-To: <b9524b39-3171-887f-efa8-e13a9a9aad51@suse.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
To: "heming.zhao" <heming.zhao@suse.com>, LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>
Cc: teigland@sourceware.org


On 9/18/20 9:07 AM, heming.zhao wrote:
> On 9/17/20 6:18 PM, Heinz Mauelshagen wrote:
>> On 9/10/20 8:34 AM, heming.zhao wrote:
>>> On 9/10/20 1:17 AM, Zdenek Kabelac wrote:
>>>> Dne 09. 09. 20 v 18:47 Zhao Heming napsal(a):
>>>>> report LV is usable for upper layer.
>>>>>
>>>>> leave issues
>>>>> - this patch doesn't contain dm table comparison. So if the disk
>>>>>    is removed then re-inserted, but the re-inserted disk
>>>>>    major:minor is changed, the code doesn't have ability to detect.
>>>>> - raid10: removing any 2 disks will think as array broken.
>>>>>
>>>>> Signed-off-by: Zhao Heming <heming.zhao@suse.com>
>>>>> ---
>>>>> v2:
>>>>> - remove dm table parsing code in _lv_is_usable()
>>>>> - add new status bit NOT_USABLE_LV.
>>>>>    note, I chose the first available bit 0x0000000080000000
>>>>> - _lvusable_disp() uses lv_is_usable() to return usable status
>>>>>
>>>>      dm_list_iterate_items(lvseg, &lv->segments) {
>>>>>           for (s = 0; s < lvseg->area_count; ++s) {
>>>>>               if (seg_type(lvseg, s) == AREA_PV) {
>>>>> -                if (is_missing_pv(seg_pv(lvseg, s)))
>>>>> +                pv = seg_pv(lvseg, s);
>>>>> +                if (!(pv->dev) && 
>>>>> is_missing_pv(pv)) {
>>>>>                       lv->status |= PARTIAL_LV;
>>>>> +                    lv->status |= NOT_USABLE_LV;
>>>>> +                }
>>>>>               }
>>>>>           }
>>>>>       }
>>>>
>>>> Hi
>>>>
>>>> As it can be seen here - there is big intersection with meaning of
>>>> PARTIAL_LV.
>>
>>
>> The semantics of a usable LV is fuzzy by definition, because for 
>> instance a multi-segment PARTIAL_LV
>> linear LV with a subset if its segments missing is still accessible 
>> relative to the remaining segments
>> thus doesn't make it unusable.   As a result, LVs failing t o 
>> activate would be the 'unusable ones'.
>> The later is given for RAID when it's, e.g.  missing more than its 
>> maximum number of parity devices
>> for striped RAID layouts.  So PARTIAL_LV is sufficient to tell that 
>> any LV is still partially usable.
>>
>>
> the usable or unusable is up to from which side to see. I prefer to 
> see from top to bottom, upper
> software (e.g. FS, VM) see the virtual disk (e.g. which is made up of 
> RaidLV) unusable when missing beyond
> max limit parity devices.

We are on the same plate looking downstack.

> Or linear LV missing any one underlying devices.
> The reason is that there are only few system/kernel level issue which 
> can make lvm not to work. e.g.
> device-mapper layer doesn't work, lvm internal bugs. The missing 
> devices won't block lvm issue io, and this
> time kernel (lower dm layer) will report io error to lvm.
> So we could make the usable definition:
> - whether lvm believes the uppser layer can successfully do io to the 
> entire LV


...which is the semantics of PARTIAL_LV state flag when it is set (i.e. 
parts of the LV are accessible fine
and other parts will cause I/O errors). So fully usable is the adequate 
of 'activated && !PARTIAL_LV'.


>
>>>>
>>>> And the question is - what does it mean in the context of various 
>>>> segment
>>>> types.
>>>>
>>>> I believe we need to discuss with Heinz - whether we want to mark
>>>> Raid LVs partial in case they are actually 'only leg-pertial' and 
>>>> should
>>>> be actually activatable without partial activation  - which is ATM 
>>>> abused for this purpose.
>>
>> Degraded RAID layouts are always usable unless more than its parity 
>> devices or all its mirrors failed because of missing PVs.  Hence 
>> such activatable RaidLVs are not partial at the LV but at the SubLV 
>> Level.
>>
> agree.
>
>>>>
>>>> ATM I'm not sure we want to introduce new flags, which has only slight
>>>> deviation from current partial flag - which should deserve closer look
>>>> of its meaning.
>>>>
>>>> We'll try to find something with Heinz to agree with.
>>>>
>>> Ok, wait for feedback from Heinz.
>>
>> What are we missing if we define any SubLV partial state with 
>> PARTIAL_LV/not activatable and
>> leave it to the specific segment type handlers of the mappings on top 
>> of such SubLVs
>> to define their respective PARTIAL_LV state or reject activation. 
>> E.g. a fully usable RAID6 with a maximimum of 2 missing legs with 
>> those missing legs either being partial and RAID6 I/O addressing a 
>> missing segment -or- thise leg SubLVs not having been activated _not_ 
>> setting PATIAL_LV on the RAID6 LV ('lvs -oname,attr,devices' will 
>> show state details on the LV tree nodes).
>>
>> Let's discuss this first before adding MISSING_PV to the picture...
>>
> not to active PARTIAL_LV means the SubLV doesn't work? by suspend 
> dm-table?

PARTIAL_LV will allow the activation with segments mapped to 'error' 
targets.
IOW: the table will be resumed with segment mappings replaced.

E.g. (linear with 4 segements split across 4 PVs with PV#2 missing):

# dmsetup table t-l
0 2088960 linear 8:0 2048
2088960 2088960 linear 254:2 0
4177920 2088960 linear 65:176 2048
6266880 24576 linear 65:192 2048

# ll /dev/mapper/|grep dm-2
lrwxrwxrwx. 1 root root������ 7 Sep 18 13:25 t-l-missing_1_0 -> ../dm-2

# dmsetup table t-l-missing_1_0
0 2088960 error

FWIW: this works even all segments are gone presuming the VG is still 
accessible.


> It looks there is no big different between marking PARTIAL_LV flag and 
> suspend dm-table.
> For me, keep exist logic is more acceptable.
>
>> FWIW:
>> raid0 mappings with a subset of missing segments may not be of much 
>> use but will provide data still.
>>
> this situation will make upper layer software work abnormally. if a 
> upper layer software can directly manage
> subset of raid0LV, (in my opinion) there is no reason to set up raid0.
>
Right, you're seconding what I stated as '...not be of much use...'


So what do you and Zdenek think about the proposal to tag any LV tree 
nodes with PARTIAL_LV
on behalf of the involved segment type handler of the respective node 
(e.g. linear has to set it on any missing segment as oposed to RAID 
setting it if degradation prevents full access)?

>> Heinz
>>
>>
>>>
>>> I agree with you. the PARTIAL_LV is more closer to the new bit 
>>> NOT_USABLE_LV.
>>> There is another bit MISSING_PV, which is set when pv is missing or 
>>> the pv is not workable.
>>
>>> From my understanding, we could reuse the PARTIAL_LV to show 
>>> different meaning according to different context. For example, in 
>>> raid env, the top layer LV will be set PARTIAL_LV when the raid 
>>> array not usable (e.g. raid0 missing a disk). Other cases, within 
>>> raid limit, top layer raid LV won't be set. if following the rule, 
>>> there will no need to set the new bit NOT_USABLE_LV.
>>>
>>> Heming
>>>
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
