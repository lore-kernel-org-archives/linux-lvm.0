Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F21CD20244F7
	for <linux-lvm@redhat.com>; Thu, 10 Sep 2020 06:34:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7CCB811E76
	for <linux-lvm@redhat.com>; Thu, 10 Sep 2020 06:34:31 +0000 (UTC)
References: <1599670049-6641-1-git-send-email-heming.zhao@suse.com>
	<74001d9c-1024-81c9-66f9-d5bc399e1ca1@redhat.com>
From: "heming.zhao" <heming.zhao@suse.com>
Message-ID: <4a6b7e89-49b9-72a8-6938-a1fc7419ccc1@suse.com>
Date: Thu, 10 Sep 2020 14:34:15 +0800
In-Reply-To: <74001d9c-1024-81c9-66f9-d5bc399e1ca1@redhat.com>
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
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>
Cc: teigland@sourceware.org

On 9/10/20 1:17 AM, Zdenek Kabelac wrote:
> Dne 09. 09. 20 v 18:47 Zhao Heming napsal(a):
>> report LV is usable for upper layer.
>>
>> leave issues
>> - this patch doesn't contain dm table comparison. So if the disk
>> �� is removed then re-inserted, but the re-inserted disk
>> �� major:minor is changed, the code doesn't have ability to detect.
>> - raid10: removing any 2 disks will think as array broken.
>>
>> Signed-off-by: Zhao Heming <heming.zhao@suse.com>
>> ---
>> v2:
>> - remove dm table parsing code in _lv_is_usable()
>> - add new status bit NOT_USABLE_LV.
>> �� note, I chose the first available bit 0x0000000080000000
>> - _lvusable_disp() uses lv_is_usable() to return usable status
>>
>  ����dm_list_iterate_items(lvseg, &lv->segments) {
>> ��������� for (s = 0; s < lvseg->area_count; ++s) {
>> ������������� if (seg_type(lvseg, s) == AREA_PV) {
>> -��������������� if (is_missing_pv(seg_pv(lvseg, s)))
>> +��������������� pv = seg_pv(lvseg, s);
>> +��������������� if (!(pv->dev) && is_missing_pv(pv)) {
>> ��������������������� lv->status |= PARTIAL_LV;
>> +������������������� lv->status |= NOT_USABLE_LV;
>> +��������������� }
>> ������������� }
>> ��������� }
>> ����� }
> 
> Hi
> 
> As it can be seen here - there is big intersection with meaning of
> PARTIAL_LV.
> 
> And the question is - what does it mean in the context of various segment
> types.
> 
> I believe we need to discuss with Heinz - whether we want to mark
> Raid LVs partial in case they are actually 'only leg-pertial' and should
> be actually activatable without partial activation� - which is ATM abused for this purpose.
> 
> ATM I'm not sure we want to introduce new flags, which has only slight
> deviation from current partial flag - which should deserve closer look
> of its meaning.
> 
> We'll try to find something with Heinz to agree with.
> 
Ok, wait for feedback from Heinz.

I agree with you. the PARTIAL_LV is more closer to the new bit NOT_USABLE_LV.
There is another bit MISSING_PV, which is set when pv is missing or the pv is not workable.

 From my understanding, we could reuse the PARTIAL_LV to show different meaning according to different context. For example, in raid env, the top layer LV will be set PARTIAL_LV when the raid array not usable (e.g. raid0 missing a disk). Other cases, within raid limit, top layer raid LV won't be set. if following the rule, there will no need to set the new bit NOT_USABLE_LV.

Heming
