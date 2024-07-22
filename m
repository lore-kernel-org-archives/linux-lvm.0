Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB1316CD3B
	for <linux-lvm@lists.linux.dev>; Mon, 22 Jul 2024 12:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721650167; cv=none; b=F/i7+CqvfMtgfZym4iu5fA6OSl7koBarUtdVmoJ8l4MzuAnvId366KJui9Q491TlLGDTp5lZxsr2Aq+zMpU2fi/m5vdXSMO+mVbsWHheTJNLQ0UJ8QveneN3AWDGvq6L9L0ZQXIpPLhcGkBBMgon+9TQnLL7B2hvPxjQ8VYFiNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721650167; c=relaxed/simple;
	bh=UlGhCqC95Ptpvl7ChtLDJu+MIto4fq7i6sOYPKMMSS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rBqBTjj+/ly2bgE+qWDYWBzoF5ds7WGA7uJaIIgMhwIGFAdtm6fwGUC5MvPxu2u46B3YYRloSEUPTOS/llXqMbBOy6W03h6DQJGnovA80PRimqvjp8iiN++XCfpFO50FQdTm1ovQFvZvk2fNH47OHabEoayOYB7R1QmvlZ7nBzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlImXg5l; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlImXg5l"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4266f535e82so29594855e9.1
        for <linux-lvm@lists.linux.dev>; Mon, 22 Jul 2024 05:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721650164; x=1722254964; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ln1zgHvwIfNEva06ysjb5co2LZJpDahY2BLZaPgPOd8=;
        b=IlImXg5ldZCntbe5RS5Ryk9vTQBGImjGc1nL7XkWO2vuF9nhIQuBGFLNR27/csyYqh
         sDvgB9I0dZ+clWOg/+AKoOr+xZ0pLinnA26B5LEAFRiYVmOZL08s99wQ3ZcYBIbDKomt
         WsEZyXwIcYasyGnwzLPjGmGh9aeHuRSR3X+Hrjd+v5b+c7Y8P1N+wIVo3vXBF8mS3Mcb
         4WTy9P3Nrd4CSOz8AwsqsRu7XXlV3mkf3gmdKzg+T67p67qMkJCt5ONMa/ERYH7a/iXP
         1nnhBcl1bI/hfKnag6dbJ5duBJLUhGmoCi24/zRnakKUO2X6/JPXm9EaHzh/LX1RblIi
         Z6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721650164; x=1722254964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ln1zgHvwIfNEva06ysjb5co2LZJpDahY2BLZaPgPOd8=;
        b=cvqSp6cWLvw4t9CpxflsIF06q2wkPfM/SZNMCZPsokBLtiOfLOGBfPGDKrfCOsKUrs
         c8nHRA3ZbQszoEydUj+U9LBKsd60cDAa/KFu3Sx1FSXmPG+0PeyIsI3M2Xycla8AUYMw
         /7Q6+EacDUvausna3dAlBMTXHbt/PuTK9SaxAVZaROtLcpf10AFpfDLMGjQRFq2pCIZy
         6rS7OqxDFuGr+es4e/Cxa7pijBe84KHRvIJy/9FtSThWMZqSFmrNa9ugcutIr9mzHl2B
         2SjzQbKgZ5e4/i0LQEfxguN4HThtHisShr76Ebp54c9oefh90YbWYGUCqQc2rgaHPCHo
         o5cw==
X-Forwarded-Encrypted: i=1; AJvYcCWZBj7Y531VDMdt81iAhtiwlg5wlMie2ZqST0n0L7mAFyWoF1+0u/zwAx3QSH/angr10M68wHZNAjdv6bLNaA9GK8RWQXp3FvDs
X-Gm-Message-State: AOJu0Yz18x/alATOCe4WXJAl8b32aEKAMZtheRfJa977rS36/RarWR/x
	h+KAry3p/UYHy18AGPkVqMglTnJDIPPVnqKWJ+TS5BTrMZz1fWyN
X-Google-Smtp-Source: AGHT+IH1wFNB6tEHURyQs5LAhfp/Ckc8+vpuIn+OXLxpBepfBpbm7b6IOKrHy43WTGQOdducUmXIEg==
X-Received: by 2002:a05:6000:43:b0:368:36e6:b248 with SMTP id ffacd0b85a97d-369bae35a52mr4117544f8f.23.1721650163930;
        Mon, 22 Jul 2024 05:09:23 -0700 (PDT)
Received: from [10.43.17.8] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3687868482esm8341316f8f.16.2024.07.22.05.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 05:09:23 -0700 (PDT)
Message-ID: <d9aade3b-498d-4aaa-9ee9-64cb8b82ac33@gmail.com>
Date: Mon, 22 Jul 2024 14:09:22 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Guidance on increasing cache_pool_max_chunks for lvmcache
To: Pickles Creator <picklesthecreator@gmail.com>, linux-lvm@lists.linux.dev
References: <CAF2YDE6gvhs3o4QD4Y_CrDuQb7icHYOpNrgEiGcrwq5-Pe8qNw@mail.gmail.com>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CAF2YDE6gvhs3o4QD4Y_CrDuQb7icHYOpNrgEiGcrwq5-Pe8qNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 17. 07. 24 v 13:42 Pickles Creator napsal(a):
> Hi,
> 
> I'm currently evaluating using lvmcache with a local disk as a cache
> for a slower network attached disk, both of these are SSDs. The
> default value for `cache_pool_max_chunks` is 1,000,000 and I'm
> wondering the about the reasoning behind this. Is there degradation if
> the value is increased or has it not been tested?
> 
> With the current limit, a larger cache will be fairly inefficient with
> smaller random reads due to large chunk size being allocated, and the
> warmup of such a cache would take some time.
> 

Hi

The basic idea is that users should not really be creating that large caches 
as it may turn out less efficient to manipulate metadata of the cached volume.
Although if you have larger machine with a lot of RAM you can increase this 
max value to be i.e. 8 times more.

Other way is to cache bigger chunks  (i.e. 256K) - that should also reduce 
burden on the metadata manipulation.

Another thing to note is -  dm-cache is Hot Spot cache - if you would have 
1.000.000 hot spots on your drive - maybe you may consider consider switching 
to NVMe for the whole drive instead of caching it.

With all that said - if you have a lot of RAM - raising the limit of 
cache_pool_max_chunks is the easy way forward - but it's most likely not the 
best utilization of the caching resource   (aka having  'chunks' in cache 
which are there occupying the space for days/months without any use...)

Regards

Zdenek

