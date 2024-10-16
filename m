Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B470A20514C
	for <linux-lvm@lists.linux.dev>; Wed, 16 Oct 2024 11:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729079152; cv=none; b=eqw1EP6LXQZDQWtb9ijl7XYWVby7cNBxMv3MQN9npi5wRAf7PMJnrnjR2of80S3KC3XFwF1CUXD7KwQtgtFPofrGwWqUKsGvRc5+eb3TC8N0wdq/jHvfwEh2qEVTKo7frYUug7Z5QsTMuGZtdmCE1Ie7KWcCbknI1QDPMJFvBk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729079152; c=relaxed/simple;
	bh=xgZWP2vnfA1ftxUKyn4GRHYc3Cp7aYRfC/RM3yEQFTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IrhzFNeQUGh5M2wWoBeBcg0HGAdjArsw7SGc6ixpx6V0mq0m5RT3GVtuCwmwNRWN6lXd1iaezPWrhq559ckDJVyWx+FeyZq/6a6V6UXoAXrsDv92djLgS+ofuJf7/Dg4d8KMkSGUoMKSqWbsKEer8Psg2MHJcUhFs6c9ezSlqbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aIkJOHlH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIkJOHlH"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43118c9a955so54959405e9.3
        for <linux-lvm@lists.linux.dev>; Wed, 16 Oct 2024 04:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729079149; x=1729683949; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q4gU+XrnabTwX/r/exMjxxLq5mXV30zfJs6PTHT8uHI=;
        b=aIkJOHlHX2boH6za8gde8C5SHeeMYuVZKtgv5FeC1bitNT6ecKjBYRGFW1IkWI4hyb
         TL0nqKOr40b2CSChsjWrc4MuUGzG4PuDjMDUOVuG+ZL6Nujbbmhx+2C/ca6xlyVYSNH/
         e37irTX9auInPspVqFiQoSOOgwR9XkSjhxNt9nSXghaqPh35ee9VpMdJoxtqUoXtilm+
         euNv4rqFESd16E0Fos3jlyGR1bPAt+heV6XEwxQyRFopB/97n+wgTTpPXsvTI6mBpRMp
         hEVJyWBA65N365+fJVzDwFTIPQ34uwTsEmh0BaZmoPljCSekEE8IryT9NSIlcZZajTPK
         1SOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729079149; x=1729683949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4gU+XrnabTwX/r/exMjxxLq5mXV30zfJs6PTHT8uHI=;
        b=BMqZ5BietD1RcgEJ1D6t/taeJagnSPRH6J4eWEiHmTMNtpeMdWuYDQ4VwTb82roD7D
         48DF/BOZHsdPOA57EoF8u7yFntr10s1/X7asWKlpNX5AbtAypk9DbFpugYcPcAvvQiLY
         4/vueCnB1iMWidteuddhP5rHEjhsjd8nL16QTrFQgU4zPV0TbJMKubNWGzxLxk/aN34+
         muF1qY/8VuXVauyfrFRVQIeF3CcqM43lMWQ00h6fGBLEXDwPvpzcFeSON/48FuqJgIpG
         YhpJOBc7b5EaaGBdQwE3C93I0HQuNm2hSfc3bEjLUMgrsq2twlqnXtBbPnrlqa+AEee+
         F7EA==
X-Forwarded-Encrypted: i=1; AJvYcCXGJZjhQnGFZyaqa4bUsrbsasXl6l3JRRPh1Y7T8Kfq7i/Bpg1uUBELwtO06DZDghXOLKogFQ9a0Vs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwltEBEihCdLsU3T0hO+SgP3mMC311qkdPx2APiDLoyqB4iy4di
	WOKNBLpfoLdSV+2mxikb9F4z7VfNE8gkTicrhLlpi5QRytLGX0T8
X-Google-Smtp-Source: AGHT+IHwkkCMs/FqyGpnRX3tFclREPDskfTLjCTh2l5t6tbL1OvD3z2ybxN6rseXAYl1ZBAIm6dtYg==
X-Received: by 2002:a05:600c:510d:b0:42c:bd4d:e8ba with SMTP id 5b1f17b1804b1-4311ded1c9dmr152167565e9.8.1729079148742;
        Wed, 16 Oct 2024 04:45:48 -0700 (PDT)
Received: from ?IPV6:2a03:a900:1000:7e9:403e:7c8b:351b:f333? ([2a03:a900:1000:7e9:403e:7c8b:351b:f333])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4314b32e3c9sm30789365e9.36.2024.10.16.04.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 04:45:48 -0700 (PDT)
Message-ID: <5cff8619-087d-473c-86d3-83344e39e02e@gmail.com>
Date: Wed, 16 Oct 2024 13:45:47 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: lvm2/dm-thin snapshot memory and disk overhead
To: Drew Eckhardt <drew.eckhardt2@gmail.com>, linux-lvm@lists.linux.dev
References: <CAFqQACz8umkccaKVfoECxeCwTghjFP_uVXKXByJ2TL8LEcHYgw@mail.gmail.com>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CAFqQACz8umkccaKVfoECxeCwTghjFP_uVXKXByJ2TL8LEcHYgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 12. 10. 24 v 0:46 Drew Eckhardt napsal(a):
> What's the lvm2/dm-thin snapshot memory and disk overhead for each
> chunk (default 64k) overwritten?
> 
> 

Hi

Depends on the usage.

If you write full 64K block - the whole new provisioned chunk is written.

If you write 1st. 4K block to 'not yet provisioned' chunk for snapshot - then 
remains of 64-4 of the origin chunk to be 'copied' to this newly provisioned 
chunk.

If you write to already provisioned chunk for a snapshot thin LV - nothing is 
copied and all goes just the this chunks.

When origin 'write' to a chunk shared with 'snapshot' - then snapshot will 
keep the unmodified chunk and origin gets a new copy with updated content.

Note - snapshot thin LV is just like any other 'thin LV' - it just 'shares' 
already allocated chunks with its origin.

Simply said - writing task always 'pays' the price with block update...

Hopefully this makes it clear.

Regards

Zdenek


PS: it's way more efficient compared with old 'thick' snapshots...
