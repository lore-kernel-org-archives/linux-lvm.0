Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3899B286AA
	for <linux-lvm@lists.linux.dev>; Thu, 26 Oct 2023 11:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlvAyk5F"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-507b18cf2e1so1029626e87.3
        for <linux-lvm@lists.linux.dev>; Thu, 26 Oct 2023 04:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698320558; x=1698925358; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7jqk0RNI1hOhvLGhY8gtY0MbDZyMfAqyeB4G2jzNRwM=;
        b=FlvAyk5FZU6dE4aiIM5wQp9oKLleQB5QYM9S6VAc+gQRsWFBXnXVcIZobhQD5mk0fK
         RNfuEQUaoO540qyJzJ30Dsbp3Kep9iwW39zzyhauF1SlKO72pIse2TuIwi3mx3o9ipgh
         4jGlI4hn4PZga+WwvWy6KkOsA4Zujhe1+5F7kTNHlkpWPpuGH/6ASyfTvrKVNORF6o37
         HAGc8/ZuV3+CdQ4BM0kfGyRsqcNf1wWti/MZs29NUDNF4GsXXDTiVKN6SmxxvtPw/jxD
         FbSAhOryH3CtdtPx1mWXNcltWukrSR0RpzMBS7Bh++jBkvdKLL7171vkctn10WkePVeH
         7cOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698320558; x=1698925358;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7jqk0RNI1hOhvLGhY8gtY0MbDZyMfAqyeB4G2jzNRwM=;
        b=v6IjCoNthXRQx1Ynx7dU9i9cE+9HVGUthV/HJwqmPDxiPlIi9o6ubvPh6SaTg39jaH
         J8CcxvitmSpMXJaDvWB7PlR+EICsHL2Bn/Z7ZJpH9mt2qBibF/JETo42cnL1X8awzjrs
         4HDgAzKSzrxXn4AJDjiCBmH+7wmvTWIBMFSy5oeYS7SSQJ4DkFkM0MZ7TNzu87jQqpHt
         KJLCTczMz3BNRxZgGxMy5N/zLOVG6e+6Q4/hcQocc+DtfITaoCGL6On4csdNhXrVznLi
         s2rm/ruRGsAiS2OaBycHxSVlQwBGDmBSBvEHYrs6lb8e0IdhSRaUWznb8YGiIxh6Cynn
         jgUg==
X-Gm-Message-State: AOJu0Yzt5H0wvX/1jpuoiLHzCU+omYKn+oJ59z0Ek4HQ1a7zbRmJ2CRQ
	koj0aLu3NCx2dEsKZ0EH2Z/GhEF7XDc=
X-Google-Smtp-Source: AGHT+IFwnoOdY9YeJ8+d5iwcujNpkp9uRXxsffdLAPMZ7bmHRllhbqH0y+pSAAoC7fD6l0qgvx13tA==
X-Received: by 2002:a19:914e:0:b0:500:daec:2817 with SMTP id y14-20020a19914e000000b00500daec2817mr12224572lfj.54.1698320557988;
        Thu, 26 Oct 2023 04:42:37 -0700 (PDT)
Received: from [10.43.17.103] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ck8-20020a0564021c0800b0053f11e3c019sm10984114edb.90.2023.10.26.04.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 04:42:37 -0700 (PDT)
Message-ID: <bf108e22-0f19-44c3-90ad-dfed9eed683d@gmail.com>
Date: Thu, 26 Oct 2023 13:42:35 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problems on enabling snapshots after reboot,.
Content-Language: en-US, cs
To: Borut Rozman <borut.rozman@bioch.ox.ac.uk>,
 "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
References: <fa6f76d0422d63ce89ec7aea2ecfe3c7184f3696.camel@bioch.ox.ac.uk>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <fa6f76d0422d63ce89ec7aea2ecfe3c7184f3696.camel@bioch.ox.ac.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 25. 10. 23 v 14:55 Borut Rozman napsal(a):
> Hi everyone,
> 
> I have a machine where I run snapshots of the FS every 12 hours, and
> keep a week lot of those snapshots. After a crash or a clean restart,
> filesystem with snapshots does not get enabled and I have to wait
> several hours for lvm snapshots to get back online which of course is
> stressful. Last time I had to wait for 8 hours for all the snapshots to
> get enabled and then I had to remove all the snapshots so my FS would
> come up normally. I was wondering if this is a know issue or how can I
> avoid this.
> 
> PS: FS is about 200TB in size and snapshots 5TB in size but they might
> be even empty.
> 

Hi

Unfortunately you are misusing the original *thick* snapshot purpose.
It's been designed to be a short living small sized object.
If your snapshot gets into the GiB range - it gets very very inefficient.

You should check the thin-pool and its snapshot capabilities - where your 
operation should be mostly instant then. And there is not a problem of 
amplified write when you take a multiple snapshot of the same volume and you 
can even take snapshot of a snapshot.

With 5TiB old thick snapshot there is simply a zero chance to fly.


Regards

Zdenek

