Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FE8A2166B27
	for <linux-lvm@redhat.com>; Sat, 29 Aug 2020 03:11:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39CD2801181
	for <linux-lvm@redhat.com>; Sat, 29 Aug 2020 03:11:59 +0000 (UTC)
References: <1597939504-31532-1-git-send-email-heming.zhao@suse.com>
	<ff41471a-d775-a314-434a-eac3fd0668a4@suse.com>
	<80e36f4c-8193-1df5-41ad-e0caf42f6537@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <4bb3e590-39f1-75e7-9000-03d1d3fc0e73@suse.com>
Date: Sat, 29 Aug 2020 11:11:42 +0800
In-Reply-To: <80e36f4c-8193-1df5-41ad-e0caf42f6537@redhat.com>
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] [PATCH] gcc: change zero-sized array to fexlible
	array
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
Content-Type: text/plain; charset="utf-8"
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>
Cc: dcermak@suse.com



On 8/29/20 3:32 AM, Zdenek Kabelac wrote:
> Dne 26. 08. 20 v 7:18 heming.zhao@suse.com napsal(a):
>> ping.
>>
>> @Marian & other maintainers
>>
>>
>> On 8/21/20 12:05 AM, Zhao Heming wrote:
>>> this patch makes gcc happy with compiling option: [-Wstringop-overflow=]
>>>
>>> Signed-off-by: Zhao Heming <heming.zhao@suse.com>
>>> ---
>>> �� device_mapper/libdm-common.c | 2 +-
>>> �� lib/activate/fs.c����������� | 2 +-
>>> �� libdm/libdm-common.c�������� | 2 +-
>>> �� 3 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/device_mapper/libdm-common.c b/device_mapper/libdm-common.c
>>> index bc691d6..3627457 100644
>>> --- a/device_mapper/libdm-common.c
>>> +++ b/device_mapper/libdm-common.c
>>> @@ -1445,7 +1445,7 @@ struct node_op_parms {
>>> ������ char *old_name;
>>> ������ int warn_if_udev_failed;
>>> ������ unsigned rely_on_udev;
>>> -��� char names[0];
>>> +��� char names[];
>>> �� };
> 
> 
> Hi
> 
> Here I don't see much problem with patch itself - except it seems to be somewhat mysterious. Lvm2 is not strict ISO C compilable - there are far to many other things which would need to be fixed - thus flexible arrays shouldn't be an issue.
> 
> I'm curious why these 3 were important in your case - while other 26 appearances passed for you just fine (see attachment).
> 
> So can you paste what sort of gcc problem do you actually try to solve ?
> 
> Regards
> 
> Zdenek

These 3 zero-sized array blocked me to create lvm2 package for opensuse tumbleweed.
Opensuse uses OBS (open build service: https://openbuildservice.org/) to create rpm packages.
In my eyes, the OBS is black-box, it only showed these 3 warning and stopped building work.
So I filed patch only about these 3 places.

the build error just related with [-Wstringop-overflow=]
```
[   72s] In function 'strcpy',
[   72s]     inlined from '_store_str' at device_mapper/libdm-common.c:1453:2,
[   72s]     inlined from '_stack_node_op' at device_mapper/libdm-common.c:1589:2:
[   72s] /usr/include/bits/string_fortified.h:90:10: warning: '__builtin_strcpy' writing 1 or more bytes into a region of size 0 overflows the destination [-Wstringop-overflow=]
[   72s]    90 |   return __builtin___strcpy_chk (__dest, __src, __bos (__dest));
```

thanks,
heming
