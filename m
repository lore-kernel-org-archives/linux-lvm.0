Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731061386DF
	for <linux-lvm@lists.linux.dev>; Mon,  3 Jun 2024 19:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717442752; cv=none; b=I/F9v+xFLLcaADC2euocpF3wo73MJhf8/x3y+go2cLa5M5JgCsnZJH0xdgxA0rxVDYVlzdwmNj9YXxNqiNAbNpca8pPClA0EHodsdvzUl9sN4507kOQ4nFTCuxpEvJVicoEHGDb2u+kftmz8TWJ9GsI3OSvDp6cKV38VsnJHU0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717442752; c=relaxed/simple;
	bh=9tMieSrXZbRvQDP+jhagQmWhcb5vMOqmdXxdmSxOYpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QluKCirpC6kg2WEQwDygPDp8Z+VeTkay+tytlDaJHbmSorRp/x0GuA5vMR6FJSGBKV2XbviLrOHdSQgJparlD0pBBQHnb5PJqFnAFhsYyUgAwioOu8N7pny4X2Tij2uWS+QcHpRbkxwqUKaduwp/IE1JJytQOyuxghNUjeRMi/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdY0EiWm; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdY0EiWm"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2e95a1eff78so63079101fa.0
        for <linux-lvm@lists.linux.dev>; Mon, 03 Jun 2024 12:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717442749; x=1718047549; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ubg9kXO5EXoWlUOxJ/GR1rBbbgF7nzyjfbZiDySWsGM=;
        b=QdY0EiWmVRo25DcnkXsTFIDrb/ZYOQcJFKu0jZJP+QNnLfEiTpaCM639NDcWAABfqt
         alWZb5w8eYiie1lYu4eZlJw7UWwgEIAovLtmTISWVVNhk81g9h5GFe8QDPzhrO3MzvsC
         7f/kvWpQRi6bKbcvK12GQ6Xi/hzoV4g+qJNq2uj4e9f1K8zkhqszYPb0rEvHBGbDqQZt
         I4I7zlK/qLswyp0mcnlkJGO/IU/jDSgVswpwh0Z7U0moNBTHPPKX5lIswkBu9ljj3HBK
         CCU84vDxKmFOCUYeNSa3x2GsAX+5BQJV+P7QqFduTpr1p4UcdMxiqo3hi3UqhQ+eSOmj
         GJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717442749; x=1718047549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ubg9kXO5EXoWlUOxJ/GR1rBbbgF7nzyjfbZiDySWsGM=;
        b=v+QU3+8V9XX0vgVRKx8FibWjNNy3MHjrfNluGfFIZ8OGAIUCOVlcWzAl5Q3O94TZwd
         LtYvMI0srKBpy+sIOsYDLsqSX+MDPjSBbao01l3o1671KpVJJ7AGu0vBRniUeV2/2v20
         p3RCUgAkGYj5+DcpUWc3MMmBqUoiEcniN6QF3NQ46+n43C9tTIlQFdaZM5QF1k9+wL03
         0v4uu9GQjHYoo2M3qts4C3CsNA5SEnizrVPT5H/naaNAAGkvdYApQSxxxQip/qbGNnTG
         mmpAkBg9gDUzIDouq+OY6iJ9kNpH4CLhunp9+2Q9t7zOLbLFseCodS6a2JGGhL6OSAot
         tDOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwD2sL61//V0Rie0OmBbwP1iUADQtINF219VJUtxL5MkKEM+qe+40aAEG9NXayK0Lq6t5dmA1+qXHcRCj7+9Xk/6nf8lW7nrCA
X-Gm-Message-State: AOJu0Yyk8DJbUcCmh0qWyFhYnzyQGqmeoUkydT1IAhT1LyUOr453YcR9
	lTb8AthF/DLcF1/5denVJvm8NA4pIVIVLk7OFuE92KgSkApNqB/qcoB/jQ==
X-Google-Smtp-Source: AGHT+IHGaCkcSP1YR692ndIcK7jgA8myIx9qnVXaXaSmL41O4ACh9RQBtaWisVL8aPYEfLmI5VvyMQ==
X-Received: by 2002:a2e:a983:0:b0:2e6:d1fb:4470 with SMTP id 38308e7fff4ca-2ea951e4b30mr84713211fa.42.1717442748276;
        Mon, 03 Jun 2024 12:25:48 -0700 (PDT)
Received: from ?IPV6:2a03:a900:1000:7e9:403e:7c8b:351b:f333? ([2a03:a900:1000:7e9:403e:7c8b:351b:f333])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04d94f1sm9440891f8f.49.2024.06.03.12.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 12:25:47 -0700 (PDT)
Message-ID: <b77c19de-48b4-4a7d-9174-0d42414ce920@gmail.com>
Date: Mon, 3 Jun 2024 21:25:45 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: lvm2 deadlock
To: Jaco Kroon <jaco@uls.co.za>,
 "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
References: <c828486f-46d1-45b6-8477-ed390553f4dd@uls.co.za>
 <a6c24173-d138-49dc-afb0-f48d41128477@gmail.com>
 <9bac4556-bdf8-4034-9322-522277ff311e@uls.co.za>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <9bac4556-bdf8-4034-9322-522277ff311e@uls.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 03. 06. 24 v 14:56 Jaco Kroon napsal(a):
> Hi,
> 
> Thanks for the insight.  Please refer below.
> 
> On 2024/05/31 14:34, Zdenek Kabelac wrote:
>> Dne 30. 05. 24 v 12:21 Jaco Kroon napsal(a):
>>> Hi,
>>>
>> I'm kind of missing here to see your 'deadlock' scenario from this description.
> Well, stuff blocks, until the cookie is released by using the dmset 
> udevcomplete command, so wrong wording perhaps?
>>
>> Lvm2 takes the VG lock - creates LV - waits for udev till it's finished with 
>> its job and confirms all the udev work with dmsetup udevcomplete.
> 
> So what I understand from this is that udevcomplete ends up never executing?  
> Is there some way of confirming this?

udevcomplete needs  someone to create 'semaphore' for completion in the first 
place.


>>
>> It's also unclear which OS are you using - Debian, Fedora, ???
> 
> Gentoo.
> 
>> Version of your packages ?
> 
> I thought I did provide this:
> 
> Kernel version was 6.4.12 when this hapened, is now 6.9.3.
> 
> crowsnest [12:19:47] /run/lvm # udevadm --version
> 254
> 
> aka systemd-utils-254.10
> 
> lvm2-2.03.22

Since this is most likely your personal build - please provide full output of
'lvm version'  command.

For the 'udev' synchronization, there needs to be '--enable-udev_sync' 
configure option. So let's check which configure/build option were used here.
And also preferably upstream udev rules.

> 
> Thanks for the feedback, what you say makes perfect sense, and the implication 
> is that there are only a few options:
> 
> 1.  Something is resulting in the udev trigger to take longer than three 
> minutes, and the dmsetup udevcomplete never being executed.

systemd simply kills udev worker if takes too long.

However on properly running system, it would be very very unusual to hit these 
timeouts  - you would need to work with thousands of devices....

> 
> This could potentially be due to extremely heavy disk IO, or LVM itself 
> freezing IO.

well reducing the percentage of '/proc/sys/vm/dirty_ration' may possibly help
when your disk system is too slow and you create a very lengthy 'sync' io 
queues...

> I don't see the default value for udev_log from the config. Explicitly set to 
> debug now, but still not seeing anything logged to syslog. Running with udevd 
> --debug, which logs to a ramdisk on /run.  Hopefully (if/when this happens 
> again) that may shed some light.  There is 256GB of RAM available, so as long 
> as the log doesn't grow too quickly should be fine.

A lot of RAM may possibly create a huge amount of dirty pages...

Regards

Zdenek


