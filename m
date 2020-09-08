Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31F322166B44
	for <linux-lvm@redhat.com>; Tue,  8 Sep 2020 06:40:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B011D101A568
	for <linux-lvm@redhat.com>; Tue,  8 Sep 2020 06:40:57 +0000 (UTC)
References: <1599296786-27353-1-git-send-email-heming.zhao@suse.com>
	<6b1c4f75-37ee-caa9-623a-363a8e791e4d@suse.com>
	<53a24f12-9f5e-535d-bf80-83b9db9259c6@gmail.com>
From: "heming.zhao" <heming.zhao@suse.com>
Message-ID: <c5d20f7f-e3f6-6d92-5b79-b73dc167d679@suse.com>
Date: Tue, 8 Sep 2020 14:40:43 +0800
In-Reply-To: <53a24f12-9f5e-535d-bf80-83b9db9259c6@gmail.com>
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] [PATCH] lvs: add -o lv_usable
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
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>
Cc: teigland@sourceware.org

On 9/7/20 10:32 PM, Zdenek Kabelac wrote:
> Dne 05. 09. 20 v 11:08 heming.zhao@suse.com napsal(a):
>>
>>
>> On 9/5/20 5:06 PM, Zhao Heming wrote:
>>> report LV is usable for upper layer.
>>>
>>> Signed-off-by: Zhao Heming <heming.zhao@suse.com>
>>> ---
>>>    lib/activate/activate.h          |   2 +
>>>    lib/activate/dev_manager.c       |  67 ++++++++++++++++
>>>    lib/metadata/metadata-exported.h |   1 +
>>>    lib/metadata/metadata.c          | 130 +++++++++++++++++++++++++++++++
>>>    lib/report/columns.h             |   1 +
>>>    lib/report/properties.c          |   2 +
>>>    lib/report/report.c              |  13 ++++
>>>    lib/report/values.h              |   1 +
>>>    8 files changed, 217 insertions(+)
>>>
>>
>> my test result:
>>
>> ## linear
>>
> 
> Hi
> 
> We will need to take closer look  - the patchset itself is not going in right direction - since all the info about missing or present devices is already
> available within lvm engine and we want to minimize 'repeated' query
> (ideally all the information should be checked only once - otherwise
> the decision state-machine is producing random-end result garbage - which
> is the very hard to trace and debug.
> 
> So all the code which is doing runtime query again can't be accepted.
> 
> Next main rule is - we cache status values whenever possible - so there
> should be at most  1 'status' per device per LV - but since lvm2 already
> knows from scanning point and from metadata parsing which device is missing
> the logic of evaluation of LV's usability needs to be based on these values.
> 
> But I think we also need some per-segment methods evaluating usability.
> 
> Regards
> 
> Zdenek
> 

Hello Zdenek,

Thank you for your review comments, I got your meaning.

Does it acceptable to add new status bit in lv->status?
I ever sent it in previoud patch "[PATCH v2] lib/metadata: add new api lv_is_available()"
The define as below (the 'NOT_AVAIL_LV' will change to 'NOT_USABLE_LV'):
```
+#define NOT_AVAIL_LV	UINT64_C(0x0000000080000000)	/* LV - derived flag, not
+							   written out in metadata*/

+#define lv_is_available(lv)	(((lv)->status & NOT_AVAIL_LV) ? 0 : 1)
```

some description about the new patch:
- it will combine with two patches:
   - [PATCH v2] lib/metadata: add new api lv_is_available()
   - [PATCH] lvs: add -o lv_usable
- the new patch will add new status bit NOT_USABLE_LV, and this bit will be
   set in _lv_mark_if_partial_single().
- The only output which related with new status bit: lvs -o lv_usable

if above is acceptable, I will send the v2 patch. if not, I will give up this 'lv_usable' patch.

Thanks
