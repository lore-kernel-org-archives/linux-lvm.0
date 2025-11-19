Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD0A2036E9
	for <linux-lvm@lists.linux.dev>; Wed, 19 Nov 2025 16:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763570059; cv=none; b=i50Ic8qZrAbJQra+cAvjR/VKA1DL3RigSXnrK/POcP30MuMbiczi3cyHEL+CpyJ0NNTtfbXg93/+5b+eoCWlIy5y5jQLlikYhj1dxmL+59tfp6oF/B3/Akz8Vhv/BSouNgvrhfcvuALGD9XixNiG5NK0rGgSOerm6CgD858Ze34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763570059; c=relaxed/simple;
	bh=PyborbWvF8/pTKhwARaZoIl2b2YcH3fblN1ImZmXvyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oGypTFiSjmMSw7zr80s0gza6LywtjsbsqIOn1vNq1t8W/u716zdsZLNbknc4E3lvCbr5mT43Ju85rmy2fDtKqTFfH/6vT8snRnsJpYY64FICbipla6RKgyAqbsBw5Jc4rUgeEmKRA8lJCsdvZUgEfPLdf+uasLsryUbsV88s3Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxthzPTG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxthzPTG"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4775ae77516so75873505e9.1
        for <linux-lvm@lists.linux.dev>; Wed, 19 Nov 2025 08:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763570056; x=1764174856; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jhqGTyefFgrC6+gi5zWrMpffSwcvk+1j6n9NABQEXbw=;
        b=jxthzPTGmafNMavN77K1IY1nYlth4/cTjxC2xJlXmO1MhUrrU8nQHC3PCcnqTJmBl8
         qI+I6sTDRX9kHPA0QrPn23aToRy1wl//9dI+EX5b0D+6YTHzjDmYGT5FSdjN8OWkU9FX
         4fXSB/vkT7esJNRCBl4RtFVA9BXbsaQ3D45O5SIrIqqnC8QF0qwvsKhjC0dLylMiUuY7
         m13u3FLl+K6cwlSA1swIJrSqNIQNr0KFBguescSWB7FhQmcYGYU84jhWhJGgeIHxB/uY
         1kRRJEwbYu2x3/1Xf53Xt2TyfcE2ZoNio6B1mjUlN7UjJgtXYhtmnNJ6XHFxVZRkjnYA
         fmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763570056; x=1764174856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhqGTyefFgrC6+gi5zWrMpffSwcvk+1j6n9NABQEXbw=;
        b=SjV+zKnJ62xyRUub2YAWD69z+R4DBVxwnsbya9NgXzGXlZdoowtNGxK8cz492QaVFG
         c5GrPoR9xYx217r2nrzZKWUP1FGQ6cW78N7YS1rp8OHvWobcbiksSuDHPmSw2gnD8kHF
         sBIMdP9nRY+wrAUhxbjv03ruD11PqgrvnCY+KiIxD51KgvVPITJiqIklsKbinqq3rmR1
         Dij48gEwcTpS2cwu+Bmo2qzc7Vy8mAP7KU8DPI+q5iFGwmLdzw6PLkc+T0iJGmfYaCO4
         wmz2ulryX4KhvW33beL0bu2Pyy6/rEVkHvAf7HQjluS0he1OZoAEa63Crne9U9yRmant
         ikOw==
X-Forwarded-Encrypted: i=1; AJvYcCUXTGwUHhK/H1yNaC+7lS/XYNBQteA1PmFux4pijM+itBfBBag26mLvDbKohdHSfRklxPVctx4knIw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwX0ZsyeNKc0v0kyEdODIqGAlpNSVMiwwL9+IWVEIp+kTdf9+EX
	KlwDtO2rkOScajx9Kki9YpYaifSQ+B6BMAB2mLBcdVOcQVm5LneJRKbdjQlTZg==
X-Gm-Gg: ASbGncvq8z1Zm3xFEcuIK+gBmHx5g/JpEB8kWGlimQ98f5TZ3r39Mlut8v6MaG5kZyo
	HRysrzzIyD93GOIH6p494DGaS3eNnkfjV5UNeIu6lwU5iuoi3lOVFOH18poNzeOdDgGOpD0NzzZ
	OxU/girILidMozW/J4CCnHuRsGSz3AKDDeoYWvngPnO89OTuHS3hm+ktRoMB/i/YezNx5QwqdXD
	7Gb3UF9MvFIPW4oug1mUEsKHF3LUFajCjIhVhv56RHzsnvq1KFbvJPOnwXMOfwJ0s7aAbeTGdyE
	jNCTK7KluYM3T5CLw3Q213upM92Rzgkzq3Nq86Q9A+nWbO5gxdpv1NOCdgpQFHBcKJJCgWHGjba
	eynj+D9oiny0LZLgJ/yJAo7tYGaPBnyoAimKPT8IowTyCjZ1oPfo9OUTqRE836EE8Ll2BWgBLfx
	tp6dHJSh/JQXaO7fcYMKF2tw==
X-Google-Smtp-Source: AGHT+IEvpZPY7ZtarLWyMXCmh0v7bnBluk7uDFM6FOG7Y0LjLWUEQWvT8owPohN5Cyf/2+5tiXwEgg==
X-Received: by 2002:a05:600c:4513:b0:477:5cc6:7e44 with SMTP id 5b1f17b1804b1-4778fe5de1amr213673685e9.11.1763570055795;
        Wed, 19 Nov 2025 08:34:15 -0800 (PST)
Received: from [192.168.0.111] ([212.20.115.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a96a58c5sm47086875e9.0.2025.11.19.08.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 08:34:15 -0800 (PST)
Message-ID: <8973228e-7ca9-48a3-9743-dbd30f28e5bc@gmail.com>
Date: Wed, 19 Nov 2025 17:34:13 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pvmove thin volume doesn't move
To: "Brian J. Murrell" <brian@interlinx.bc.ca>, linux-lvm@lists.linux.dev
References: <be9db13beb543be237fa069e3c72e22e1df2446c.camel@interlinx.bc.ca>
 <1b6fb117-7283-4ba9-91ee-7412a2d77b3d@gmail.com>
 <29209080-c09b-40df-86c3-f22c1d7f6520@interlinx.bc.ca>
 <5067ec8d-991b-4b90-ad3b-f9dbbb0472d5@gmail.com>
 <81e51a5ad8f9c32610b8262447af635da81d53c3.camel@interlinx.bc.ca>
 <3620fc27-e54b-472d-bc82-be01f7b2739b@gmail.com>
 <6D706D06-AB0F-4C55-9F68-E8E07926A511@yahoo.com>
 <f53f9eb8b6bcd3cc0da29817f9e683ea32c69e44.camel@interlinx.bc.ca>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <f53f9eb8b6bcd3cc0da29817f9e683ea32c69e44.camel@interlinx.bc.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 19. 11. 25 v 16:46 Brian J. Murrell napsal(a):
> On Wed, 2025-11-19 at 09:07 -0500, Matthew Patton wrote:
>>
>> That is one hell of a wild and unsupported assumption.
> 
> Yeah, I too was going to challenge that statement that I was a "lonely"
> outlier in the community of LVM users that would want to be able to
> move a thinly-provisioned LV from one PV to another, just as non-
> thinly-provisioned LVs can be.
> 
>> Practically nobody , even seasoned sysadmins would know of this
>> deficiency.
> 
> Indeed, I was skeptical that this was commonly understood as well.
> Well by anyone who had not tried it as I did only to find it is not
> supported.
> 
> It does suck to have to choose between feature sets that are both very
> useful.


There is likely a major misunderstanding how thin-provisioning works with lvm2 
(and ATM I'm not sure how we can improve our 'man lvmthin' to make this more 
clear)

It's NOT lvm2 doing 'thin-provisioning' at lvm2 level.

lvm2 just drives a kernel target device - which you can think of like would 
attach some 'magic box' that take  space  X  a gives you back space Y with 
some properties (just like when lvm2 controls  'raidX' target).

lvm2 does not see 'how the magic of provisioning' is made - it just consumes 
it - thus lvm2 itself has no knowledge about the layout of thin-chunks - which 
are often very small compared with lvm2 extent size granularity.

So lvm2 cannot move  i.e. 64KiB thin chunk blocks - when the minimal pvmove 
granularity if 4MiB.

And while I'm not saying the work cannot be done somehow - it's quite a major 
feature request for thin-pool kernel target if that should be an online operation.

To add better example - it's like if you would want to 'extract' the file from 
filesytem and let the rest of 'device' compact.
I guess everyone sticks to 'cp'  command  - which can be seen as equivalent of 
'dd' command in our block device level...



Regards

Zdenek

