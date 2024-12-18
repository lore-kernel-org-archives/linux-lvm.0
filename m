Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A5519755B
	for <linux-lvm@lists.linux.dev>; Wed, 18 Dec 2024 10:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734516785; cv=none; b=EPvgYfl5dLXNr6adagLeCK3f13DaTzyoavKoq7YWTuCH0gd1ZpwrX9xucoBq/ltaK9itP/GRNH7dg19JimefjfDr4Epn9As0YNgFxRvvhWZ2RkD73LVIwZ/H1qeC4/WHeUHmPQxkHkHCIs78iVqE+i0Zk9PwIsYe1NvmhVo/4PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734516785; c=relaxed/simple;
	bh=XcJHhDJoWHMwTg2Z2D2evuIPF5B+luZUnVa6cTHbvn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dbFZk1LhWZbq932hA+NISey2nj1oJxLg5W4aI435RCyZSf/fPgSn9juATS5d9vvDWtdal85uaeFhvglaAYyZPqC/TWVTX7JO6NgLmiiPTui013DCSewuE6BYcHOLtA7N26P3vegZwRl/FldRXdNZOWagph2Lw/iOeivNUVIKub0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDu4GIxv; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDu4GIxv"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43626213fffso3394095e9.1
        for <linux-lvm@lists.linux.dev>; Wed, 18 Dec 2024 02:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734516781; x=1735121581; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mgrtqXBin1iT6QaRljR5QkgSdE3ZFkLvNO0/qisTma8=;
        b=cDu4GIxvRrkZ3AeFXLpxcO6E5hllN3GRPyw+J8sRgKJ9cNMP2pQTdwEt7D/1TK0msI
         KM1Y9EDqEdkn3SucZGDF1nQ4hOvW3b319RX+XUUTACbRGrY3XXTqqvFpA/GW7TavH1Dh
         oLSxdNm8nAA2UYUXrkXQq/dyHOGr0nGgpaKRzNlWrjdr1F79XQt4DAUEixzwFNFAv5A5
         UEl8Z/tXd9UhWIZ0FFZKRkM1vDFmDkvuYEbuNxHmkJvd3JE0xCJ8orOV2kGYE9DiFr0Q
         aCX5JM6PFtstmIEf6CrnTLGIVi7b/bsOBKagmg8QoytiKvRY6H9FmXhKg1bygwxMGbjD
         hTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734516781; x=1735121581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgrtqXBin1iT6QaRljR5QkgSdE3ZFkLvNO0/qisTma8=;
        b=k629KDB6XSJGKsk/S55xE6uathhga4g3wXEsMwipsc1bATIu2ng0nZgseB7gC5l+X+
         hVyWHDZqCkdSKBgvYAGqz0nHLR5snI7frG9IJOFWBAVQABH7JgDfl5GwPcp7KfmKSIgg
         28zVASuSZmSQtxBRT0cN5WldKMpBED0+OHn8IJVvx7PWAF93p4Su8GMQ4hUP+BsyLTET
         XwHyYWV17QRpM53DFhykAed5HjrwQIE4PlsjBNjGiQKmP2HChhMpRKxVvzoo9yJiTWv/
         4FSQqqe8a2BJIUQHGHNHZzg//VOsrpIWtzfxx/3xSKVDhZ2yKes7DNnmVsUSi+d16gBw
         7MxA==
X-Forwarded-Encrypted: i=1; AJvYcCVL59TNJhckSvSe/j7vJl0m20NvQGTz50YF8Z9z1DD8VbShJKjrNMADLc4eiVLW/Fc49kv+U6xtQO0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEBOPfIVGOdLTZXrzgGGL9lG0aO6PTaczxhlVQVljMwuVcpSJ4
	dLMqyCekVC0oLvFRsn1ocevElDio4gWQ1PT7OvP1gL2oMSAqmYmi
X-Gm-Gg: ASbGncscT3YMsLfZneLuTz1c5aq2e+L7rO/LAUqua57OrFyeiYcjKBz+mebHtjv3EXG
	feJSM71bdtOw4pWMyGcqHKrI0LhrR7iPprKXDnqsA950ilm9kOxYPPB4wSv/0N/624xaq/xwFcG
	aKDM9csRn2tgsqJAsRKoeI0lKnekLZNvvkaGFBP5np0pzGU0AGmGyZeRcZGm11+6XSvuu5m6X5j
	OSbfwgdGPftfrUwoz1gDMQiLIaSWLUjwceywVpdK3ku+Y9yWvkbYhfS7NSsidx2XrztRH0TopKI
	fdV3n/oZzk7DI2qlKPAn/yPaH/6hyYIcVck=
X-Google-Smtp-Source: AGHT+IGXXMkXd57gXVc9n8sSX0uU0Nvp1CRk7tizXOXcewE2vqXBKoAVzbggRbGBkWeD6m2GW0uMeg==
X-Received: by 2002:a05:600c:1d19:b0:434:fb8b:deee with SMTP id 5b1f17b1804b1-436553f2d16mr17004065e9.16.1734516781240;
        Wed, 18 Dec 2024 02:13:01 -0800 (PST)
Received: from ?IPV6:2a03:a900:1000:7e9:403e:7c8b:351b:f333? ([2a03:a900:1000:7e9:403e:7c8b:351b:f333])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b01b15sm15371375e9.11.2024.12.18.02.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 02:13:00 -0800 (PST)
Message-ID: <dbc7728b-352b-4982-a171-d8f177388a19@gmail.com>
Date: Wed, 18 Dec 2024 11:12:59 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: is it possible to add a new filter to detect unusable partition
 types
To: Michael Chang <mchang@suse.com>
Cc: Glass Su <glass.su@suse.com>, Heming Zhao <heming.zhao@suse.com>,
 "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>, grub-devel@gnu.org,
 util-linux@vger.kernel.org
References: <826b5136-7ee1-4664-98d6-a3441883f53e@suse.com>
 <43D73CB9-32E4-405E-93A9-E985C94F4A9E__33327.0934455626$1734427189$gmane$org@suse.com>
 <ec0d03c0-40b0-4719-a020-9bae7a3241ec@gmail.com>
 <yjiu3c3e4aknayawhw7lw52kev6fvp4wm6n6wte4t27hx3fr4u__21682.4523567752$1734439545$gmane$org@cc5bu2ij2ia3>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <yjiu3c3e4aknayawhw7lw52kev6fvp4wm6n6wte4t27hx3fr4u__21682.4523567752$1734439545$gmane$org@cc5bu2ij2ia3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 17. 12. 24 v 13:45 Michael Chang napsal(a):
> On Tue, Dec 17, 2024 at 11:21:26AM +0100, Zdenek Kabelac wrote:
>> Dne 17. 12. 24 v 10:13 Glass Su napsal(a):
>>>
>>>> On Dec 17, 2024, at 16:34, Heming Zhao <heming.zhao@suse.com> wrote:
>>>>
>>>> Hi LVM2 maintainers,
>>>>
>>>> One of SUSE's customers encountered an issue with LVM2. The user created several partitions, one of which was marked as "BIOS boot" (4) instead of "LINUX LVM" (8E). Subsequently, the user ran pvcreate/vgcreate/lvcreate on this partition. During a system update, grub2-install installed GRUB2 in the "BIOS boot" partition, resulting in LVM2 metadata corruption.
>>>>
>>>> The root cause of this issue is that grub2-install targets the "BIOS boot" partition when this lvm2 device is specified for installation. If the user had initially marked the partition as "LINUX LVM", grub2-install would not have chosen this partition.
>>>>
>>>> On the other hand, it would be beneficial if LVM2 could implement a new filter or a filter function to detect and exclude the "BIOS boot" partition from being considered a valid target for LVM2 device creation. This could involve issuing a warning or error message to alert the user of the potential conflict. This may also help user to notice the issue more easily.
>>
>> Hi
>>
>> lvm2 is using  blkid to detect 'present' signature on a block device - and
>> normally prompt to confirm wiping such signature.
>>
>> We may possibly add similar logic for 'partition signatures'.
>>
>> However there is still the plain fact that lvm2  with  --force  or even just
>> '--yes' option is assumed to simply proceed  and clean&clear such
>> conflicting signatures and simply makes the block device to be a PV.
>>
>> All that said IMHO primary bug here is within  'grub2-install'  which simply
>> should not be blindingly overwriting  block device which is in use - this
>> should be fixed ASAP as there is the biggest risk of data loss, although I
>> guess everyone is using  'grub2-install --force'  - as without this option
>> (even in my personal experience) is typically refusing to do any work....
> 
> IMHO, the BIOS Boot partition is dedicated to grub boot code and cannot
> be shared with other software. Any attempt other than grub writing to

Hi

Sorry to say this, but the fact the 'someone' has created 'GUID' for GPT with 
the name 'BIOS boot' doesn't really make anything in the Linux world - so far 
I was not even aware such partition type exists (not using this myself).

It's never even been submitted to lvm2 as something to be understood by tool 
till this thread.

There are over 220 types shown by 'cfdisk' just for GPT and there is a 
completely different set for DOS partition types...

So how should we know which type is lvm2 allowed to 'use' freely ?

Should we now store somewhere those 'hundreds' GUID where there is something 
with Linux in its name ?

I don't think this is a practical thing to do in lvm2 nor in many other 
userland tools that are doing something with block devices.

There should likely be something in blkid telling other Linux tools  'don't 
touch this device unless you are XYZ' eventually you use some --force override 
option.


> For LVM root with legacy BIOS boot, having a BIOS Boot partition is
> mandatory, otherwise grub won't have usable space to embed the boot code
> in the GPT partition layout, and you won't be able to boot or access a
> functional system in the first place. That said, the BIOS Boot partition
> is in use by grub before it is mistakenly used to create a PV and extend
> the LVM root onto it. It is unlikely that GRUB is overwriting it. In
> such cases, it's more likely the other way around.

Well protection needs to be from all sides here - otherwise it makes no sense. 
  When the grub sees some signature, it must be telling to a user and not just 
let user to loose his data blindly.

And in the same way blkid should expose installed grub loader - currently the 
partition with installed grub looks 'empty' with blkid....


Regards

Zdenek
