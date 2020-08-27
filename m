Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65083AE7CB
	for <linux-lvm@redhat.com>; Thu, 27 Aug 2020 15:52:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56BD918AE949
	for <linux-lvm@redhat.com>; Thu, 27 Aug 2020 15:52:35 +0000 (UTC)
References: <1598457044-28853-1-git-send-email-heming.zhao@suse.com>
	<20200826170320.GA11966@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <b509aa7c-777b-d925-e9c1-9493618d51f1@suse.com>
Date: Thu, 27 Aug 2020 23:52:18 +0800
In-Reply-To: <20200826170320.GA11966@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Subject: Re: [linux-lvm] [PATCH] lvdisplay: dispaly correct status on linear
	type
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
To: David Teigland <teigland@redhat.com>
Cc: linux-lvm@redhat.com

thank you for your kindly review.

On 8/27/20 1:03 AM, David Teigland wrote:
> On Wed, Aug 26, 2020 at 11:50:44PM +0800, Zhao Heming wrote:
>> It commit is enhancement for 1d0dc74f9147e3c1f3681efa4166cbe2edcb6571
>> 1d0dc74f9147 only supports all raid type, this commit adds linear type.
>>
>> With this patch, for linear type LV, one of two disks missing,
>> lvdisplay will show
>> from:
>>    LV Status              available (partial)
>> to:
>>    LV Status              NOT available (partial)
> 
> It would be nice if you could come up with a more formal definition for
> what you're calling "lv_is_available", and also in the same terms define
> the existing "lv_is_partial", explaining how they differ.  Both properties
> may be useful to show in lvs reporting fields (and possibly lv_attr).
> Reporting this state only via the lvdisplay line above seems strange.
I will send the v2 patch very soon.
the v2 patch only for lvdisplay cmd. if my code acceptable, I plan update lvs
cmd in v3, add a new letter (N)ot_available in bit 9 (Volume Health).
> 
>> +			} else if (seg_type(seg, s) == AREA_PV) {
>> +				if (seg_pv(seg, s)->status & MISSING_PV)
> 
> Using only MISSING_PV is probably insufficient, because that flag is used
> only when the metadata is written while the device is missing.  i.e.
> pv->dev can be NULL when the flag is not set.
> 
I have a little confused with your comments.
These 2 lines are same as _lv_mark_if_partial_single() code:
```
            if (seg_type(lvseg, s) == AREA_PV) {
                if (is_missing_pv(seg_pv(lvseg, s))) {
```
why _lv_mark_if_partial_single can use these 2 lines?
please wait for the v2 patch, I changed some code logic, set the NOT_AVAIL_LV in
_lv_mark_if_partial_single().

> Dave
> 
