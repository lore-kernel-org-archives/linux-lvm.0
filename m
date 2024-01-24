Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980F277622
	for <linux-lvm@lists.linux.dev>; Wed, 24 Jan 2024 12:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706099754; cv=none; b=LD1G7oEo5t1WIpJJhEBdykZHFz+i6KIwJpjUrelyNufavYzNAeN40I3WCETCh7ej7+ueMK2bBbXNXBvsBne1B6i8UpWI7MUrAZjqHrWU2DqY1ktfBtc09HkAdA23fhcXOQgUChn++3Cd4tec5vE3nuWRptb/YbXXCUSvHTKZg48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706099754; c=relaxed/simple;
	bh=QMTu+WyvF8W7yiD3/DUAH0SXDeiH/t04n2jKJ9xZfS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cwHId7K8K5lj99bPqqQh8pkNgpNru1bhtdZ3I7xVjZPNSrMI84nz/MKXCyVghUj7OgF3Dh+fCFN6L6pZYs2j0qjLcO3JEUM9Pu6E+VPXMZnRNKh/nUtQzx7TKjm5S8TqWTUJsCg0T32Sz7n39lWZFPNWm/loWPWpHeYkqj2lLBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/FqLiC9; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/FqLiC9"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40e80046246so32809935e9.1
        for <linux-lvm@lists.linux.dev>; Wed, 24 Jan 2024 04:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706099751; x=1706704551; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NOf2hCbXFVfNhalwFoHM5agTuAKJJHyAhFT68YaVKaE=;
        b=W/FqLiC9Qj8DPZI/f9rOb6knzPK21FoM/mWVeyRM+CaG/traOVpHpr2edSQqQCANK+
         x8I/iXIvXGiltio7cr1Cfmuhg1GTxqA/VmnTOBg7mnc9ThrGrNt5U+4TBJ/ACJ5Lxqc0
         YAEP3pTw+z6v9nwyCt9TQENm/BaoafuHYredTYjFBW8a1HN0o4V8rcQkztV5VWVEl9tm
         pf3n8ZDn3cprdysuKZ/0xtG1WF2r/lfWwRnY9tu45wrGHn4VmkOKeFgTX0enekzT/Mcu
         c3CLKJ0eG0ad0k7s/opeBXnM62uiACKcmIRBQpcmgdE7sIdhYHz+budd8lRrO3mcdJHw
         uBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706099751; x=1706704551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NOf2hCbXFVfNhalwFoHM5agTuAKJJHyAhFT68YaVKaE=;
        b=HCvKJyjNIfEoq9XST/y2k5K6HffE+NKguXPOCpIUWnLpqJodVyQciioTjvxKG5e/YU
         sGChHwVEeAZQBfxaVT0Rc6jgQ79jwAHGv3dTWhFD8SgWQ7a7RQ0QwPLBA/wLTZXeQq8N
         Iuhf7ckFlWZoUZngwuFjTV39A6tlio0BWhQN1/ruhmMAiLwYzwqD3forVUMOtLUg3WSp
         h0qLtfShnYLSHqLa9tCYPziEsyCbEeZHkR16jKKmJHdqudQenPv/VgfFS4kW68MZAH3T
         CFSyXFtTgspXQBR6Rie2Kl0Eyr8YEkxFR9xtlssfVaRFWNOP1s1jJ+H8jHBMVMid4gzb
         WImA==
X-Gm-Message-State: AOJu0YxHKCb4pC0dpi6WvALH86d7McrJrD2KCdUyKzjB01g9Ttl8s9Yj
	4fC2u7d8mnRukwPqIjGgQyAPqh7+oQ+D0f+Ufz+GOw3ojf3wtdaK
X-Google-Smtp-Source: AGHT+IGtNP9uMY47KEMgJmG6kHxhgKzMhXzt4fugW800BTUxamELv1F54kKR7kXBSboekq2ReFXnkg==
X-Received: by 2002:a05:600c:1c92:b0:40e:ac23:4edc with SMTP id k18-20020a05600c1c9200b0040eac234edcmr653048wms.25.1706099750512;
        Wed, 24 Jan 2024 04:35:50 -0800 (PST)
Received: from [10.43.17.38] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c468c00b0040e56830a35sm45655844wmo.18.2024.01.24.04.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 04:35:50 -0800 (PST)
Message-ID: <0072b514-1201-4f7b-b328-303c42d037c0@gmail.com>
Date: Wed, 24 Jan 2024 13:35:49 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Question] why not flush device cache at _vg_commit_raw
To: Anthony Iliopoulos <ailiop@suse.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Su Yue <glass.su@suse.com>, linux-lvm@lists.linux.dev,
 Heming Zhao <heming.zhao@suse.com>, Lidong Zhong <lidong.zhong@suse.com>,
 martin.wilck@suse.com
References: <A4568496-76AE-479C-8B80-F27D7EBC1DEB@suse.com>
 <eb604d09-a713-4d61-a155-8e289cc5328a@gmail.com> <Za5xpeEStkITRMtc@technoir>
 <16a16fd6-d15d-4f92-bb79-fe3a4006258e@gmail.com> <Za_swUm-PGHoaf1X@itl-email>
 <e36e85b4-4f4f-4638-81ae-0980b32e69d2@gmail.com> <ZbD7ddzZQqjTC5eB@technoir>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <ZbD7ddzZQqjTC5eB@technoir>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 24. 01. 24 v 12:58 Anthony Iliopoulos napsal(a):
> On Tue, Jan 23, 2024 at 06:50:01PM +0100, Zdenek Kabelac wrote:
>> Dne 23. 01. 24 v 17:42 Demi Marie Obenour napsal(a):
>>> On Mon, Jan 22, 2024 at 03:52:57PM +0100, Zdenek Kabelac wrote:
>>>> Dne 22. 01. 24 v 14:46 Anthony Iliopoulos napsal(a):
>>>>> On Mon, Jan 22, 2024 at 01:48:41PM +0100, Zdenek Kabelac wrote:
>>>>>> Dne 22. 01. 24 v 12:22 Su Yue napsal(a):
>>>>>>> Hi lvm folks,
>>>>>>>       Recently We received a report about the device cache issue after vgchange —deltag.
>>>>>>> What confuses me is that lvm never calls fsync on block devices even at the end of commit phase.
>>>>>>>
>>>>>>> IIRC, it’s common operations for userspace tools to call fsync/O_SYNC/O_DSYNC while writing
>>>>>>> critical data. Yes, lvm2 opens devices with O_DIRECT if they support , but O_DIRECT doesn't
>>>>>>> provide data was persistent to storage when write returns. The data can still be in the device cache,
>>>>>>> If power failure happens in the timing, such critical metadata/data like vg metadata could be lost.
>>>>>>>
>>>>>>> Is there any particular reason not to flush data cache at VG commit time?
>>>>>>>
>>>>>>
>>>>>> Hi
>>>>>>
>>>>>> It seems the call to 'dev_flush()' function got somehow lost over the time
>>>>>> of conversion to async aio usage - I'll investigate.
>>>>>>
>>>>>> On the other hand the chance here of losing any data this way would be
>>>>>> really really very specific to some oddly behaving device.
>>>>>
>>>>> There's no guarantee that data will be persisted to storage without
>>>>> explicitly flushing the device data cache. Those are usually volatile
>>>>> write-back caches, so the data aren't really protected against power
>>>>> loss without fsyncing the blockdev.
>>>>
>>>> At technical level modern storage devices 'should' have enough energy held
>>>> internally to be able to flush out all the caches in emergency cases to the
>>>> persistent storage. So unless we deal with some 'virtual' storage that may
>>>> fake various responses to IO handling - this should not be causing major
>>>> troubles.
>>>
>>> This is only true for enterprise storage with power loss protection.
>>> The vast majority of Qubes OS users use LVM with consumer storage, which
>>> does not have power loss protection.  If this is unsafe, then Qubes OS
>>> should switch to a different storage pool that flushes drive caches as
>>> needed.
>>
>>  From lvm2 perspective - there are first written metadata - then there is
>> usually a full flush of all I/O and suspend to the actual device - if there
>> is any device already active on such disk -  so even if there would be no
>> direct flush initiated by lvm2 itself - there is going to such on whenever
>> we update existing LVs.
> 
> Can you elaborate on that? Flushing IO does not imply flushing of the
> device cache, but it is not clear what you mean by "suspend" here.

i.e. when you create a snapshot of an LV - the origin LV is being suspended,
so this operation goes with   'flush & fsfreeze' request.
Basically we skip these suspend flags only for 'device extension' where we 
intentionally do not want to flush all data - but we need to know think though 
some cases and how to properly submit fsync() for them.

We also may likely need to extend this also to some files maintained by lvm2
where we may likely go with fdatasync().

>> There is usually a stream of cache flushing operation whenever i.e.
>> thin-pool is synchronizing metadata or any app running of device is
>> synchronizing its data as well.
> 
> We cannot make any assumptions about what processes may be running and
> if they are actually doing fsync on the partition. Also, on devices that
> support FUA, data integrity operations are optimized by leveraging that
> and global device cache is elided.

Note - it's not that we would want to depend on them. All I mean by this is - 
that in practice the race-window where the potential data remains only in 
disk's cache is very small - that's also likely the reason why we have not 
spotted it yet.

> 
> In our case this came in because LV tag manipulation wasn't properly
> persisted in some HA failover scenario, but definitely not resulted to
> actual data loss.

I'd be very interested in the more detailed description of this scenario how 
it's been observed and whether we can manage to write some simulation for this 
in our test suite  with monitoring via i.e. perf or something like this.

> An alternative to fsync on the blockdev would be to do open the device
> with O_DSYNC or submit io with RWF_DSYNC so that all writes are flushed
> to the storage medium.
> 

I guess our dev_flush() function is mostly handling all those cases properly
with the use of  ioctl(BLKFLSBUF).
The only problem is - it's usage somehow vanished - and even in the past it's 
been  basically used only for non-direct usage so likely still not correct.

Regards

Zdenek

