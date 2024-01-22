Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E293CF45
	for <linux-lvm@lists.linux.dev>; Mon, 22 Jan 2024 14:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705935183; cv=none; b=CYEO7JqiGPNlfz/0hNriU9ngnnGvEg/9lTA25OLctbxnfMgzhJgdQfYuFMcywvR8xT+ioJN4Xw9suBRVecSqlh/B0NCgrbNYXV3nmz++ROvJyiHf6Dy6//lWWQcMkmSM76nFhGQFNz23ngZTktTwwun2Wrvgqe1ckjk+w5Uu5So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705935183; c=relaxed/simple;
	bh=Ooh+9ZOQPriII60n0iG60zNtXWW6uhS0KiqOL1FSxAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tc3XRwZkBg28ayh+/23BO7tdjLRMBWJpFK4rNG598wCJKXq5FZlmvKV+8LW0oIHt8ONBveI3nfPRDPsiEYafbMpurBoo/GF4X1rPW4LhM92wuKbxrp2SelJSMqHKJWP0jNkpuAhHuoBYcUDjDrehYPTs0HuWC6aKpmg1RORQrtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gyrf933W; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gyrf933W"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6001449a2beso4379347b3.3
        for <linux-lvm@lists.linux.dev>; Mon, 22 Jan 2024 06:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705935181; x=1706539981; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+XR4Bjv6N1kknR7kbQzOHsKAx2Blmkk9561YZCVd6xo=;
        b=Gyrf933Wuu4y5lu7DLhLvRtd9j6c1IZFz/1wskuy22275+vP6KYfEedo1acjVlN6yv
         ITm+qoSQWZ4C9KkwqIsYT8NPpsKJ6BwaLe1YfN3tvaKII9+yDrisV093mWP1zhNua990
         Z4Or/BMEpb8HxL8dAmn99KlSF5b2Kk2CsRTmfJXtNfTmzbcO9zINVdXdzcd44ZKySgT8
         l8ZnJksZnGhv3463TGn8e/ZU4jZ7R6ynwmF+/S+YO7wgMH1Wt5uUosDTy3FshH1+x/sX
         0SlfQN7pRv+7u/qZEE80Et0eqtHNmvJzxvKYGja6hhpkAxoUwER9O17HSuT52b7LekT+
         pqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705935181; x=1706539981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+XR4Bjv6N1kknR7kbQzOHsKAx2Blmkk9561YZCVd6xo=;
        b=sAAWsLjC1ET8ue61EdcZUbeYXglkKLnrVn2G9YVV/R1jE2P3EQQbkP85o8L84YMM9g
         v+7xk5/sJD39sriQeUZEZxGoIhz+H3THon0I6Z1mjyaFrWQXFxSucMg6eHCtoc2AQs/H
         TfaLXKiJy4940QiFKCjHtPjTckKi4Ov86HBaIrfycBdlj7omGgdxOczPyviNFBbJ9Ov9
         r+qER4dLhTJDe8yQt6nGwVEGm7/ok3SKsttgkoQF9Cw2CwFL8dm9zcGu2L/pgo4ZMvko
         MIKPLQrjIsWCVJbdF/Zs37mehL6v6jLpACx9Z336S4iUEmdurTPcMTJxwHWgLVUxhlw3
         hu3Q==
X-Gm-Message-State: AOJu0YxfyaWye641G3OyjTicCmeB8RTrJ7haC64LWIZcf1ZjaU5VkqKc
	Ymb6GVtSUwRwhlMbo5SSTLmuYYb8zuo0/mJAaNV8/7e/Snnd/FYiPyom1YDImsA=
X-Google-Smtp-Source: AGHT+IEkaQB6ZdhWhqITDuv221RHkXoURrMfJF8VhUMHceQfDRxhiEGleULaTN3he1f4KrQcENacDw==
X-Received: by 2002:a81:9251:0:b0:5ff:5331:61b4 with SMTP id j78-20020a819251000000b005ff533161b4mr3541491ywg.66.1705935181036;
        Mon, 22 Jan 2024 06:53:01 -0800 (PST)
Received: from [10.43.17.38] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id bn22-20020a05620a2ad600b007832b17f3eesm2177708qkb.41.2024.01.22.06.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 06:53:00 -0800 (PST)
Message-ID: <16a16fd6-d15d-4f92-bb79-fe3a4006258e@gmail.com>
Date: Mon, 22 Jan 2024 15:52:57 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Question] why not flush device cache at _vg_commit_raw
To: Anthony Iliopoulos <ailiop@suse.com>
Cc: Su Yue <glass.su@suse.com>, linux-lvm@lists.linux.dev,
 Heming Zhao <heming.zhao@suse.com>, Lidong Zhong <lidong.zhong@suse.com>,
 martin.wilck@suse.com
References: <A4568496-76AE-479C-8B80-F27D7EBC1DEB@suse.com>
 <eb604d09-a713-4d61-a155-8e289cc5328a@gmail.com> <Za5xpeEStkITRMtc@technoir>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <Za5xpeEStkITRMtc@technoir>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 22. 01. 24 v 14:46 Anthony Iliopoulos napsal(a):
> On Mon, Jan 22, 2024 at 01:48:41PM +0100, Zdenek Kabelac wrote:
>> Dne 22. 01. 24 v 12:22 Su Yue napsal(a):
>>> Hi lvm folks,
>>>     Recently We received a report about the device cache issue after vgchange —deltag.
>>> What confuses me is that lvm never calls fsync on block devices even at the end of commit phase.
>>>
>>> IIRC, it’s common operations for userspace tools to call fsync/O_SYNC/O_DSYNC while writing
>>> critical data. Yes, lvm2 opens devices with O_DIRECT if they support , but O_DIRECT doesn't
>>> provide data was persistent to storage when write returns. The data can still be in the device cache,
>>> If power failure happens in the timing, such critical metadata/data like vg metadata could be lost.
>>>
>>> Is there any particular reason not to flush data cache at VG commit time?
>>>
>>
>> Hi
>>
>> It seems the call to 'dev_flush()' function got somehow lost over the time
>> of conversion to async aio usage - I'll investigate.
>>
>> On the other hand the chance here of losing any data this way would be
>> really really very specific to some oddly behaving device.
> 
> There's no guarantee that data will be persisted to storage without
> explicitly flushing the device data cache. Those are usually volatile
> write-back caches, so the data aren't really protected against power
> loss without fsyncing the blockdev.

At technical level modern storage devices 'should' have enough energy held 
internally to be able to flush out all the caches in emergency cases to the 
persistent storage. So unless we deal with some 'virtual' storage that may 
fake various responses to IO handling - this should not be causing major troubles.

However it's clearly a problem which happened while the code has been shifted 
towards the use of libaio.

Zdenek
