Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C44D2698AF
	for <linux-lvm@lists.linux.dev>; Wed, 19 Nov 2025 20:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763584737; cv=none; b=RRvAdaZ04pr2bOP2HeL36KXhmnDt1OUyQzr1KbEDSBvPti7dsuGWyz9Fp7p1/vR6XaTX2yiQpqe6V1jFPMnONNgrc82Mi6KWPh5ZCeoynwVBjH12mVzhrmR5dX0XvhzAKbzuzzw5MTkQ3KhcDIP5gUeDHwEk1ZXTMznOPS5r0PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763584737; c=relaxed/simple;
	bh=JoJTbtBaI/XBXkJ+tTxybvfhAH6oiaLzCaGu3V9luMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hZxz0IAewGmOjyiJqmPyChp0HEbbKCxr4d+zHTTOHzHigInFpGoc+MitdIIzm6bByFXETmMuPrlApQwzeu9+yVj/prKjJ1XpxIxKsGIiTHbp3ILVusK4ryjHX/vNHzOuQOC8gWAfYlegrycxwnCCRSB+vCue0roTuRNFMAm/WG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HsP8h4nn; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HsP8h4nn"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477770019e4so1717265e9.3
        for <linux-lvm@lists.linux.dev>; Wed, 19 Nov 2025 12:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763584734; x=1764189534; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rw4OastIuoWZmiIkU488fhEhGd24QRPQ/sd+IK/z5us=;
        b=HsP8h4nnPMGAlCa/71MdZv9xyaJaSyjlOQIGGRzGbnk8yq2Jgfeh6DXYfczTvceAFZ
         6G1j7FI0PeH2KSccwdPdyj7Ivf8PKdTb32JydYhy5zaHLj5PS97op8Q1SOdKQH8RtDRr
         clWQ/bKX8RqQFHBH1CWIoDU/21i6hdY43qefVI2BiHrDHcfLHixk9nuOjr7g2Lr4YhL+
         FXYSU6H22aG+oaTnbzdV4zVEaPwvFBSyt0MeBwvflaBqhIp5q2yjDBguWqrvaPdTQIKf
         0Za86vPrqexnZXdGQWRrIuF7L2hTMd2oP79OCVVQweT93czgoDQ7tbnxCBdLRW/j7DA1
         8prg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763584734; x=1764189534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rw4OastIuoWZmiIkU488fhEhGd24QRPQ/sd+IK/z5us=;
        b=h5hYQxMzP7pyuhxtYMDV+T+VU06iDlA7jpDu/TboJGeJRXiLBq4101mgp6kRW5Ri/p
         42Zs4NBS5SuW/jDglOYJQe5dvpKSr2af5VYEdgckDcimBRJzvT3D3DJvKqv9AyxGAEXI
         jZMDP2Sv1cGhzZaqHWNXC9yiCoz6PQhLTowYDGHj4YAVkZc//TxewmFzhlk7hco/Mkqt
         tQ8KQqMD2ZBLYWGVq2/kWiq5qQdcfxo46ABe4QVsSrDyqLU3WxyOd7hLwAj0pUMoVksf
         12gcIg0RsDMb39jtZDjE6FN2euOamMJsaUR8aMLDXgfn5PjQYSXGfvx8EJbStbAuiNhz
         RSYw==
X-Forwarded-Encrypted: i=1; AJvYcCWd1eOMl5VZAQUyU3siJHwnmvYYElsDXjQST1OZgurbimhpek25S5ELA8NSMazcpv/iYcalBbMWI0o=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywsl3J+/LcfzH5XBgru517L+Hf5rn8Zx8yeSCCySTk5JXBkdfnB
	7GOpU/HknlYYLgW40lBKavVxbMQoPytohk2BHkceLNcFcKdT9tBSDgda
X-Gm-Gg: ASbGncsHBKMvDUt0yfnEXWV2acXb2JtCxHCr2vsGs+mUoSB6szVn8l3SFG8SYT8SZJn
	+KqtnsUQBKBULB3HMoUMEb5Cj8b2eFCjkm8XyX8s2HlnVeMSxgIv/7dvf6isoJankz5YMmnxCvf
	vOWXsbO6maY87UCtnMaVF2OOAvEU9zxnQypsTyzNjl87bE2ypnm9GMnbFWm7q1zt2yJ+kusfd7c
	V9CkodxaDVoEDG1AFXUulfrv8BhduCmZBIXc+Tt1CSd194ZObfj7QE7wgFFPG1+HHf4UKXnQmv4
	+N4BJq5OAV7f42ab/hyKcM0Bq2FJlH4frQA7Iz/16/wZEQEKrahO3Q8Wpq1g/PvOjFKxrZN3uBJ
	N5hTedq2M6/n+tvWUliPlRFrLJM1a+zW+8aGPlOuR345Q3Je81zn5MYovlNmDYhktZ7jI+vzOnQ
	Ew6XswfbEjIKqDaB08xLgVaQ==
X-Google-Smtp-Source: AGHT+IGX+7Zafo9L/8vrk8pnfcfF6unJATx1knys8KCyu8/mdAwkSGsGGpx6Tvav1AM07I6md+6dGw==
X-Received: by 2002:a05:600c:46c3:b0:477:58:7cf4 with SMTP id 5b1f17b1804b1-477b8954d83mr6497375e9.4.1763584734092;
        Wed, 19 Nov 2025 12:38:54 -0800 (PST)
Received: from [192.168.0.111] ([212.20.115.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a973dbabsm50848045e9.3.2025.11.19.12.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 12:38:53 -0800 (PST)
Message-ID: <f1fdc32b-0c9d-41a4-a3bb-98169351e9be@gmail.com>
Date: Wed, 19 Nov 2025 21:38:52 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pvmove thin volume doesn't move
To: matthew patton <pattonme@yahoo.com>,
 "Brian J. Murrell" <brian@interlinx.bc.ca>,
 "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
References: <be9db13beb543be237fa069e3c72e22e1df2446c.camel@interlinx.bc.ca>
 <1b6fb117-7283-4ba9-91ee-7412a2d77b3d@gmail.com>
 <29209080-c09b-40df-86c3-f22c1d7f6520@interlinx.bc.ca>
 <5067ec8d-991b-4b90-ad3b-f9dbbb0472d5@gmail.com>
 <81e51a5ad8f9c32610b8262447af635da81d53c3.camel@interlinx.bc.ca>
 <3620fc27-e54b-472d-bc82-be01f7b2739b@gmail.com>
 <6D706D06-AB0F-4C55-9F68-E8E07926A511@yahoo.com>
 <9c2a15d0-0d7d-4462-af43-83221c2ecbdd@gmail.com>
 <94679191.5310372.1763572932545@mail.yahoo.com>
 <42516759-f09a-407a-9c2d-1f82d0db19af@gmail.com>
 <cd5a3a1b5560f8634b434220a828b535c7a5ebe6.camel@interlinx.bc.ca>
 <51838d90-cdd7-4e1d-bc9c-9f1ae0e29caf@gmail.com>
 <2068740993.5350374.1763581304153@mail.yahoo.com>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <2068740993.5350374.1763581304153@mail.yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 19. 11. 25 v 20:41 matthew patton napsal(a):
>> If the tool would have known 'which areas' are  mapped  (which knows thin-pool
>> target internally) then it would need to copy only those blocks.
> 
> no doubt. but if lvmthin is basically a private implementation that LVM (aka thick) doesn't actually know anything about and is just being used as a pass-thru to thin API, I'm not sure we want to expose thin internals to the caller. I obviously haven't read the code implementing either thick or thin, but if thick does a thin_read(one 4MB extent) then thin should just return a buffer with 4mb populated with all the data converted into a thick+linear representation that Thick is expecting. Then the traditional workflow can resume with the extent written out to its destination PV. In other words you're hydrating a thin representation into a thick representation. Could you take that buffer and thin_write(dest thin pool)? I don't see why not.
> 


Clearly tiny thin-pool can provide a space to virtual volume of some massive 
size - i.e. you can have 10TiB LV using just couple MiB of the real physical 
storage in a VG.

So if I'd be an 'unaware' admin how this all works - I'd kind of naively 
expect then when I 'pvmove' such thinLV where the original LV takes just those 
'couple' MiB - then I'd expect that copied volume would also take take 
approximately 'same' space and you would be coping couple MiB instead of 
having an operation running for even days.

We can 'kind of script' these things nowadays offline - but making this 
'online' requires a lot of new kernel code...

So while a naive/dumb pvmove may possibly have some minor 'usage' - it has 
many 'weak' points - and plain 'dd' can be likely copy data faster - and as 
said I'm not aware users would ever requested such operation until today.

Typically admins do move the whole storage to the faster hardware - so 
thinpool with its data & metadata is moved to the new drive - which is fully 
supported online.

> Or you could just punt and say pvmove() of a thin is necessarily a hydrate operation and can only be written out into a non-then PV, tough luck. Use offline `dd`if you want more.
> 
> I haven't been particularly impressed by LVM caching (it has it's uses don't get me wrong) but I find layering open-cas to be more intuitive and gives me a degree of freedom.
> 

It's worth to note -  dm-cache target is fully customizable - so anyone can 
come with 'policies' that fits their needs -  somehow this doesn't happen and 
users mostly stick with default 'smq' policy - which is usually 'good enough' 
- but its a hot-spot cache. There is also 'writecache' which is targeted for 
heavy write loads....

If some likes OpenCas more :) obviously we can't change his mind. We've tried 
to make 'caching' simple for lvm2 users aka:
    'lvcreate --type cache -L100G  vg/lv /dev/nvme0p1'
(assuming vg was already vgextended with /dev/nvme0p1)
but surely there are many ways to skin the cat...

Regards

Zdenek

