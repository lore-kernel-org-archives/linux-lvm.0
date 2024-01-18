Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBB12575C
	for <linux-lvm@lists.linux.dev>; Thu, 18 Jan 2024 15:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705592453; cv=none; b=dugwmxUqN6hvgcwlCfyKnl1iYvBAIsZEmwzDDdWKE/b8NxldKwiEqRz3Izqp87SHULNDo3hPcNQSMhyUc3JBwXqwUJe0pv6gB/ygJjCebqLcDesDZqHGGcB+pVLuQO9EQqG6lBF6ZAujDCnRE4ysjAYRKryK33C7ZSoExTJdQnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705592453; c=relaxed/simple;
	bh=pFc7v7QLJ80O+ApAQLZkiN6eoaz7f4l5jDpF3Y6ytf0=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=i03PxvzbU10DcZjSgWPfNLMX5qEHQHeea+fQK7DT7qi2xmbzkM6bnHY0nytKHVcyM85lsk9zIT5VyLO5XanhaBIbrpCeobCZGxEZwHNHEG8wIREy0iuBtPmPwVSCp2FZF9CZUeAYn2qHolvdR8/SLeR6c59Orr3HenP2bF+c/Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZmXyFvc; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZmXyFvc"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a2bdc3a3c84so872486766b.0
        for <linux-lvm@lists.linux.dev>; Thu, 18 Jan 2024 07:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705592450; x=1706197250; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kg3WQmJYKmXb57O9DFbWqI5CgrKhHpTR7nPoTJKX050=;
        b=ZZmXyFvcPsCYeH7vh9o3HZrkN93eKQC81dZXYXWS2ETZ0trRJOfqWBPbyS5Wp7D8yT
         9nRH6qkFkL95cFwD8oehYoQaL5g/mIx9oL4cijhAWkAXBhbaFkIgWoKEO8c73lLZEOa2
         pd6ZGz3hZyaV49SJ1W8lBQIFJuRA5l+d2J8VhjJQydUZ+FhjOcTeB70Q1xlo2bAE0VrZ
         bKaTr2qdIO3J3kYG9RRb4tvyQdcTraAoLB9/CTQlMedkHKcruEUBa3tmqEtnFulUjllV
         nYgbHg8/4Br9SRnUisIdeaOjvq4sApbRFJly8TG9ztVUOZhITkETC0P1VLIZpk1O3MlX
         CWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705592450; x=1706197250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kg3WQmJYKmXb57O9DFbWqI5CgrKhHpTR7nPoTJKX050=;
        b=FiGhD/3UcrwohSJy57IQ0/FW8M6tKHpGBzVYGQtJaxcoIQG43W5OHMSJMkO0YDTtV6
         mmKZ7sQUCWCOG63rpi7tgipqrqe2difnxAF/MuT1+3rSMZn42tfoKA/R409/0pZYnjut
         rgQhc7RZR39ScuFpptjLMiqu3vJc+9OiBKGHuaBV9BdfouEXbBS2LPlTQ2JFLcnGsLIe
         efERGBVT+hTu4p4A26OiOg9JIcLEDw8cKpU4ZD6kzjIwYB0+ZpmvKp/AIK82BjwSihxV
         qXDZeBJXMUA4XHg2/ZXluUAhozS+GMKpWD/Z7sqX4QUkHfSrmV3UeCSwBbqrh6z5+ke8
         ASJQ==
X-Gm-Message-State: AOJu0YzIniJmqNBzGahtZqBCgeupESFf3zlP3gU60md4KST5I/t9kA9c
	UmOJjiwjUKK2VY69Zdp6ExgxlvQcKWw4Qcr4EgXi+EIw/EWXNWe4I6Q9eUHL
X-Google-Smtp-Source: AGHT+IFBWcd38aLc9N8YzOskpcX7W/ziKCgONDv2HGIGrlhI1pl53DLiRXFTFUzSJD8vXW/xqCVruA==
X-Received: by 2002:a17:906:26ce:b0:a27:b489:b5d8 with SMTP id u14-20020a17090626ce00b00a27b489b5d8mr580758ejc.72.1705592449565;
        Thu, 18 Jan 2024 07:40:49 -0800 (PST)
Received: from [192.168.0.99] ([94.142.239.37])
        by smtp.gmail.com with ESMTPSA id f1-20020a1709062c4100b00a2cfb31290fsm7464453ejh.191.2024.01.18.07.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 07:40:49 -0800 (PST)
Message-ID: <3d1e18f3-a79f-4e0d-8b6c-7f10e5c8debf@gmail.com>
Date: Thu, 18 Jan 2024 16:40:47 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: add volatile flag to PV/LVs (for cache) to avoid degraded state
 on reboot
To: Gionatan Danti <g.danti@assyoma.it>
Cc: lists.linux.dev@frank.fyi, linux-lvm@lists.linux.dev
References: <pyftyueewc6bobclhkb2eqnbjnhsem3fk3euhjmqrxz5d7eevn@ejymv4rlmb5m>
 <5848cefc-bc5e-4f23-8278-d1654607398f@gmail.com>
 <498260979ce52ebe20da0c0a36a4342e@assyoma.it>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <498260979ce52ebe20da0c0a36a4342e@assyoma.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 17. 01. 24 v 23:00 Gionatan Danti napsal(a):
> Il 2024-01-17 12:08 Zdenek Kabelac ha scritto:
>> It's also not completely
>> true that even 'writethrough' cache cannot have dirty-blocks (aka -
>> only present in cache and origin had failed writes).
> 
> Hi, really? From dm-cache docs:
> 
> "If writethrough is selected then a write to a cached block will not
> complete until it has hit both the origin and cache devices.  Clean
> blocks should remain clean."
> 
> So I would not expect to see dirty blocks on write-through cache, unless the 
> origin device is unable to write at all - which means that removing the cache 
> device would be no worse that not having it at all in the first place.
> 
> What am I missing?
> 

Cache can contain blocks that are still being 'synchronized' to the cache 
origin. So while the 'writing' process doesn't get ACK for writes - the cache
may have valid blocks that are 'dirty' in terms of being synchronized to 
origin device.

And while this is usually not a problem when system works properly,
it's getting into weird 'state machine' model when i.e. origin device has 
errors - which might be even 'transient' with all the variety of storage types 
and raid arrays with integrity and self-healing and so on...

So while it's usually not a problem for a laptop with 2 disks, the world is 
more complex...


>> But ATM we are not seeing it as some major trouble.  Hotspot cache is
>> simply not supposed to be randomly removed from your systems - as it
>> it's not easy to rebuild.
> 
> As a write-through cache should not contain dirty data, using a single SSD for 
> caching should be OK. I think that if such expendable (and write-through) SSD 
> fails, one should be able to boot without issues.

This is mostly true - yet the lvm2 should be 'available' in boot ramdisk and 
the booting process should be possibly able to recognize problem and call some 
sort of 'lvconvert --repair' and proceed with boot.

As mentioned - there could be seen some similarity with raid with failed leg 
- so some sort of 'degraded' activation might be also an option here.
But it further needs some lvm2 metadata update to maintain the 'state' of 
metadata - so if there is again some 'reboot' and PV with cache appears back - 
it will not interfere with the system (aka providing some historical cached 
blocks,  so just like mirrored leg needs some care...)

Regards

Zdenek

