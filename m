Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8B43A1DD
	for <linux-lvm@lists.linux.dev>; Mon, 22 Jan 2024 10:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705921132; cv=none; b=bVC4PnH6zlGLpH5msZYODGoi5h5ru919FiM09XiUlCLQ8dTqBdYsGpWMxdDloGdNd6RgqUWHcPeBctLcizU2NLGOqVPnHSk7G4CPrRDtZxlPgym/QdR/Ue0Qh4e1fzZHlV7nY8I9A2L/md3AfyDbFb2+EAfQ8NrA5D2l30crEIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705921132; c=relaxed/simple;
	bh=lzMkKRQIcRLt0aENY7+PshfJp083TPQ97a7gzuUu+ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IAI5gA6geQ/AVxRdzbhVp//h831l6vkerXyrjgnLRei242B5SuQJP1ZfHGsRjtbolJewDGZrXEBFKstbGKQcmF+bNkCaLyO8ZFNApJGRaqYBuGWsQjq9vY5M3Cpb5uwE6lk2Sbx6aelYEo2RywLoOgvJ2u4oeHab5njvcXm2otc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxS+sa5L; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxS+sa5L"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40eaf3528c8so4675525e9.2
        for <linux-lvm@lists.linux.dev>; Mon, 22 Jan 2024 02:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705921129; x=1706525929; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9N+UoZRtIQkfjokuoRR31YaAyzZS5Vx1ZOFMDq51dCE=;
        b=kxS+sa5LELcPdTXnpLNBw7NGka7wqVGsQWYJ9SuHjPTqDMB5YTlFxWWBDkmRfyUd4b
         HrIRc7/yLT0INaOut9m4qZAwue+3GLCqQIdBsYrj7v5KjracqeXdjIa2tQGULd9KqJ6d
         qbhVXpaHm8krPwXqlE7Ztg8fyYjceM6iNudx7LJIj83g7PEKb+kcfieOCUZhvPKqYcMn
         IJd4Jy0dBxXO6uVy4GZgCMb1itnOihFlrv+lZ5E/5cLnWzRASyZ1Bv9YMvl6rVXmeAaE
         xRYr4aZkoInkk+/D/RtEF+LwaoJAcpYBPr9gVkkIHOi+jGQ7csj7zJx1qox3CUjIgzsz
         cv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705921129; x=1706525929;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9N+UoZRtIQkfjokuoRR31YaAyzZS5Vx1ZOFMDq51dCE=;
        b=hSk/saGfb9HavndeGsP+SZ7HMdjIqjzdu7Seo2M7806A4kKR+JfeDDWvwGjUZy7eSX
         aMWKI5E5x0j8adKowC23jPin6+kh7EzY7BV5hX0XgM0NJJzVM0uH20NZYXX0NBQI0gEm
         HrXuqWiJxyhZqd81MnEx0rklwf03LI00VefZO6kI3jWv9PbTkeATtUc1ymDGdQMW/zDc
         dbvKYyu9CePxSXeurjMNznrY4f4Sp7PBBAQjcJ19jhA26zFng/t6OcUdlla0eDFoYmid
         3uQVzOtCv1UYN1gMMcb/OqnDRN87szu+E07vqzLJ5UP/8qLI17UBkNAx02ZcE9ebDQyk
         Nqeg==
X-Gm-Message-State: AOJu0Yz4l+ukfwS04yS1lqLa7wVwpTjCme6zdPVgcBA8j+PZMyyHM215
	3LXuleAPAKuL6ZO3uJvjCIDnkOJ8NOogowdCy+Im+/Rxt4Km/po2NEfW06D+
X-Google-Smtp-Source: AGHT+IEw0OkVvMqUz9lR026UH1fT5yKSkqoncGXSzB7JvRUmKzeRjwFQ9izvW/B1x70z+Yh0pQxjbA==
X-Received: by 2002:a7b:c455:0:b0:40e:47fb:fcca with SMTP id l21-20020a7bc455000000b0040e47fbfccamr2499840wmi.147.1705921129162;
        Mon, 22 Jan 2024 02:58:49 -0800 (PST)
Received: from [10.43.17.38] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id i17-20020a05600c355100b0040d5f466deesm38481482wmq.38.2024.01.22.02.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 02:58:48 -0800 (PST)
Message-ID: <59d111f1-bd73-4f88-b036-2cd09977ea24@gmail.com>
Date: Mon, 22 Jan 2024 11:58:47 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: add volatile flag to PV/LVs (for cache) to avoid degraded state
 on reboot
To: matthew patton <pattonme@yahoo.com>,
 "lists.linux.dev@frank.fyi" <lists.linux.dev@frank.fyi>
Cc: "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
References: <pyftyueewc6bobclhkb2eqnbjnhsem3fk3euhjmqrxz5d7eevn@ejymv4rlmb5m>
 <5848cefc-bc5e-4f23-8278-d1654607398f@gmail.com>
 <498260979ce52ebe20da0c0a36a4342e@assyoma.it>
 <3d1e18f3-a79f-4e0d-8b6c-7f10e5c8debf@gmail.com>
 <jtvhdzv3dcpbqlbatkhkzruedmc3tfa3vv6h54pvw4dayrnj6s@v2u63oe75k5z>
 <1279983342.522347.1705803666448@mail.yahoo.com>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <1279983342.522347.1705803666448@mail.yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 21. 01. 24 v 3:21 matthew patton napsal(a):
>> As like you already said it was never ACKed, so the software that tried to write it never expected it to be written.
> 
> we don't care about the user program and what it thinks got written or not. 
> That's way higher up the stack.
> 
> Any write-thru cache has NO business writing new data to cache first, it must 
> hit the source media first. Once that is done it can be ACK'd. The ONLY other 
> part of the "transaction" is an update to the cache management block-mapping 
> to invalidate the block so as to prevent stale reads.
> 
> THEN  IF there is a case to be made for re-caching the new data (we know it 
> was a block under active management), that is a SECOND OP that can also be 
> made asynchronous. Write-thru should ALWAYS perform and behave like cache 
> device doesn't exist at all.


Hi

Anyone can surely write a caching policy following rules above, however 
current DM cache is working differently with cached 'blocks'.

Method above would require to drop/demote whole cached block out of the cache 
first. Then update the content on the origin device, and promote the whole 
such updated block back to cache. i.e. user writes sector 512b  and the cached 
block with 512KiB would need to be recached...

So here I could wish a good luck with performance of such engine, the current 
DM cache engine is using parallel writes - thus there can be a moment where 
the cache has simply the more recent and valid data.

The problem here will happen when origin would have faulty sectors - so DM 
target takes this risk - it should not have any impact on properly written 
software that is using transactional mechanisms properly.

So if there is a space for much slower caching that will never ever have any 
dirty pages - someone can bravely step-in and write a new caching policy for 
such engine.

Regards

Zdenek

