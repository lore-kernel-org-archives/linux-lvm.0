Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCA881207
	for <linux-lvm@lists.linux.dev>; Tue, 23 Jan 2024 17:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706032208; cv=none; b=S6IWUL4d7gfyCkSaf8ggwO67Kf5NzYWb5W/WEXMrLwZAjIUI/wYOa/7PaXuTo8P3VZ+zv61Qp2+BJevIS+7aj4IHFi8Eq77LtqUqp8m0icUM+5sLNSeBvCLbo9TRNmwaw8X2Vku4P5zxTcEdgH1BxSogZ23aHwkffFCV1+LoBdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706032208; c=relaxed/simple;
	bh=Dl+2NhUMhUSHVyhLgIQ6gZx32mfuW5w1dacV9BGM92Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ap/2yAtIHELtyWVM4PZwN7OeWg4UhGCi1HUGKkCq5m2zpD7sAN0GEjXQCnR8gi1DFE0rDPisSW3LRwV8JVc42XzTxEheKTEqCWPin+Hc7klKEibsWuSIfPh4RT/LOKQJ89/TaVXo7cRf+FoPEdm3bH4Gze2RFQpSXvoXq+4IWL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQFCsH1e; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQFCsH1e"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55c6bc3dd54so2745755a12.1
        for <linux-lvm@lists.linux.dev>; Tue, 23 Jan 2024 09:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706032204; x=1706637004; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TD9mB1S6x50F9dxUMs3IfKHb8iZ37GGHweuX73zjEg4=;
        b=aQFCsH1eSZxHdzOKP8jCmNP0NbhjemxSJyEA1sxvtVWRWU+cq2TDB/wQGcCKOuh5J+
         MHllU9NNTa4+Uz7dkOrtE1sqSJ2/GXYKW3ssqAN1JRrYp6V9G9GJhdkKHLlIlbjUv/yq
         P1bSd3Bk3+8Ws3Icll1OcHH/eFmqh+A94gqtZ1mmlM5oPyScfQQd9uflJmPKNuXKlaEt
         aCPpivNIRyAobiyDd8KnuN/hLXvTCOQgwQjgnjfO0A1XEbP15/iDXpWruAxJZj0oKLgB
         DcFQmRdHpYJgVGJls2F1TfTaVn4MfkN1sV09q/nh6MW+lvOXUCl3V8rvzGhr/117mfIb
         2pMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706032204; x=1706637004;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TD9mB1S6x50F9dxUMs3IfKHb8iZ37GGHweuX73zjEg4=;
        b=w9SJ3V7uUvzlgUik6+BvARnfIznTSMT6c8MOAYU+wQ51fhG1JgJnJnFcjeTQhKt7qN
         MM9y0dzWCrR7kc6CWGB5kFRju434iaC463fLD+OJB22re4VIlAbQpgCKNjCe0g9jeMIu
         dGDmvA1emGuRvOm8qE+E/YPAhyAeoMRPAGgbi5qczIf2JCTmIHv/on/L8IX04jgRxlfX
         02WeOqid0CuzKUjVDpvOexV0Ez9ZI13Ty/StxzhuGMW84PJPqASt/gWgj0tkurlQpEQN
         hZip/Qy3+oytsLtgX/ePoGwDcOxu2QL0Vp86sLFJkXRGp8ySd6GBAS/QvSAjOuuRGyeS
         z0IQ==
X-Gm-Message-State: AOJu0YyD3HrDPYGsOPO65PAm10p8LJf/h6uCOrxTKuH6Jyj+mkfw2t7C
	DpDahMfVG+qE9xj7628Z3HtfIUanmWsP7cNecuRZO9/7MvosE0Yy
X-Google-Smtp-Source: AGHT+IFeDsBaVHIGXzEzfFDrM2c/9wSwEUS9snBDGpN3bciBuUIg6qBAFvDKHWKWY3tDJCuZ0QdKyQ==
X-Received: by 2002:a50:fb09:0:b0:553:671f:5caf with SMTP id d9-20020a50fb09000000b00553671f5cafmr2277847edq.16.1706032204237;
        Tue, 23 Jan 2024 09:50:04 -0800 (PST)
Received: from [192.168.0.99] ([94.142.239.37])
        by smtp.gmail.com with ESMTPSA id h27-20020a056402095b00b0055c643f4f8asm1694209edz.32.2024.01.23.09.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 09:50:03 -0800 (PST)
Message-ID: <e36e85b4-4f4f-4638-81ae-0980b32e69d2@gmail.com>
Date: Tue, 23 Jan 2024 18:50:01 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Question] why not flush device cache at _vg_commit_raw
Content-Language: en-US, cs
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Anthony Iliopoulos <ailiop@suse.com>
Cc: Su Yue <glass.su@suse.com>, linux-lvm@lists.linux.dev,
 Heming Zhao <heming.zhao@suse.com>, Lidong Zhong <lidong.zhong@suse.com>,
 martin.wilck@suse.com
References: <A4568496-76AE-479C-8B80-F27D7EBC1DEB@suse.com>
 <eb604d09-a713-4d61-a155-8e289cc5328a@gmail.com> <Za5xpeEStkITRMtc@technoir>
 <16a16fd6-d15d-4f92-bb79-fe3a4006258e@gmail.com> <Za_swUm-PGHoaf1X@itl-email>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <Za_swUm-PGHoaf1X@itl-email>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 23. 01. 24 v 17:42 Demi Marie Obenour napsal(a):
> On Mon, Jan 22, 2024 at 03:52:57PM +0100, Zdenek Kabelac wrote:
>> Dne 22. 01. 24 v 14:46 Anthony Iliopoulos napsal(a):
>>> On Mon, Jan 22, 2024 at 01:48:41PM +0100, Zdenek Kabelac wrote:
>>>> Dne 22. 01. 24 v 12:22 Su Yue napsal(a):
>>>>> Hi lvm folks,
>>>>>      Recently We received a report about the device cache issue after vgchange —deltag.
>>>>> What confuses me is that lvm never calls fsync on block devices even at the end of commit phase.
>>>>>
>>>>> IIRC, it’s common operations for userspace tools to call fsync/O_SYNC/O_DSYNC while writing
>>>>> critical data. Yes, lvm2 opens devices with O_DIRECT if they support , but O_DIRECT doesn't
>>>>> provide data was persistent to storage when write returns. The data can still be in the device cache,
>>>>> If power failure happens in the timing, such critical metadata/data like vg metadata could be lost.
>>>>>
>>>>> Is there any particular reason not to flush data cache at VG commit time?
>>>>>
>>>>
>>>> Hi
>>>>
>>>> It seems the call to 'dev_flush()' function got somehow lost over the time
>>>> of conversion to async aio usage - I'll investigate.
>>>>
>>>> On the other hand the chance here of losing any data this way would be
>>>> really really very specific to some oddly behaving device.
>>>
>>> There's no guarantee that data will be persisted to storage without
>>> explicitly flushing the device data cache. Those are usually volatile
>>> write-back caches, so the data aren't really protected against power
>>> loss without fsyncing the blockdev.
>>
>> At technical level modern storage devices 'should' have enough energy held
>> internally to be able to flush out all the caches in emergency cases to the
>> persistent storage. So unless we deal with some 'virtual' storage that may
>> fake various responses to IO handling - this should not be causing major
>> troubles.
> 
> This is only true for enterprise storage with power loss protection.
> The vast majority of Qubes OS users use LVM with consumer storage, which
> does not have power loss protection.  If this is unsafe, then Qubes OS
> should switch to a different storage pool that flushes drive caches as
> needed.

 From lvm2 perspective - there are first written metadata - then there is 
usually a full flush of all I/O and suspend to the actual device - if there is 
any device already active on such disk -  so even if there would be no direct 
flush initiated by lvm2 itself - there is going to such on whenever we update 
existing LVs.

There is usually a stream of cache flushing operation whenever i.e. thin-pool 
is synchronizing metadata or any app running of device is synchronizing its 
data as well.

So while lvm2 is using O_DIRECT with write - there is likely a tiny window of 
opportunity where the user could 'crash' the device with lose of it's caches. 
If this happens - lvm2 still has 'history' & archive so it should be at worst 
case scenario see the older version of metadata for possible recovery.

All that said - for so many years - we have not seen a single reported issue 
caused by such mysterious crash event yet - and the potential 'risk of 
failure' could likely happen only in the case of user creating some new empty 
LV - so there shouldn't be a risk of losing any real data (unless I miss 
something).

So while we figure out how to add proper fsync call for device writes - as it 
seems to be still demanded with  direct i/o usage, it's IMHO not a reason to 
stop using of lvm2 ;)

Regards

Zdenek

