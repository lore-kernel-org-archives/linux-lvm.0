Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73216645
	for <linux-lvm@lists.linux.dev>; Fri, 14 Mar 2025 00:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741912064; cv=none; b=hkRsXzLkHcU+oDOIeaWzZSXy79M96nko/iYH1LboHQSomUD+VxchEOxLfLIk5t7mbulILtpslQOd/FiQFKleWUyeR6ZjbbTScGYlgtb5UWVjvcpnu6uUF8w10tuDOElJLYJrTad/6QD5dP2QqDYiIDadveorSKfrHoHVJ4fKU20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741912064; c=relaxed/simple;
	bh=iQMvR8hmuRLo6o9Vor+VqcFCUonrLwRDzkSwLLupdDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=P4HnKLQ2n0jnTMk+N4dqq7AUBDkDOGD7+TWR/vBQtm3FVhK3jM6wg+VbNS5sDzQcP2ayyNaurgXifvwteLNtc5iEZ6DTq1CLU5dSu2mKkAvDsuTRxVh4zZ2vHlWNOBpqWytsYEF2dLffZg2yRH0GP60D44TRPrAV0eTCfCa2YYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EE6AsrmE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EE6AsrmE"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so9900645e9.3
        for <linux-lvm@lists.linux.dev>; Thu, 13 Mar 2025 17:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741912061; x=1742516861; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wOoeovNrJVlgOh1FVGRrXbgka86oMfLk4Pn8q6oJ4+I=;
        b=EE6AsrmEYABi9dfbFivWM1JiB0YG7ZQ53oj9L9lfgvsB2Exn5B9mmokpz5x7rgjiud
         WxMoO6FyEB+Q7nXlYey8yWcctpGT9B6+iMjL3p+RI4UHAKENZaCLoU78E7IY8SlAyPdd
         sMXfQh1bsU5T4aOhQcV85LvM6DkkSr50F84qYyP3OghGwZLX2Uev4EjyQ6sEZcHALSg3
         QU3fNSJYCIyw+eMWZStzKY41G9XKnI7PQ2UFBwUjxCL9swySeL0IzFnUQjha4wopxHqW
         jyiSJLZCt2+W0bsvBi/THlusJUsBdj3YLZsD97PZ2kAOrbIQIUkPPj0+o8UMNlTyOHjp
         strw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741912061; x=1742516861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wOoeovNrJVlgOh1FVGRrXbgka86oMfLk4Pn8q6oJ4+I=;
        b=q4ChUp3BMMwiShaKF/qURQ/e+cfjR/x1z49BuvDK6o61AYvkp/eJDf9gXvuyBN5Gh7
         AedOnng+j1UKknVkXRUmxfHPg+fqL7qHuOplAMQQNs00lc+rChCacLpJRfRjBRP4r2MB
         DL96lf77XHhpjTIRHuYGAmgHH3pmU8H38SUZIIvTpCoX/PAszcST8DrejIIegkgv/qmV
         k54WzItAxIVPbGgmF19Ji87vN+upXz05wSiM9Qb9447vPaYoAijfl8vhAXFM3bUOVJzq
         4JRctflPF0XKrOttkj3l0i/s79zMkp8Z2MZsSNCo18Hlgp1IvSLM38qqtMw7w1nD8Ybf
         RG2g==
X-Forwarded-Encrypted: i=1; AJvYcCUuBWhl684MfuGkEYlOT9PgTac+ROncKI+/h3Fqls468yIZ+IjkLoitkWpMSgZ1q4+aRVps9kBQXQU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLa0nIgxiT7PKxF1tkblceSpTo8pabJ9EBWzzCaD7xabMbKf+T
	pFsfpNbsTGTzkP/MjaeDLPzM/Drrse9R9RJqJDbDCRCe9LWSyrLM3s0ZMq7I
X-Gm-Gg: ASbGncvt1RL8K/f0k2oqIpc2cGHtJxqd8pXDMs67JzNNjAY2jpV2kimZGJpDRBxRy1b
	oqIbNfS68bVVe01f/wsMYOJNjf38eZJANq3qZW2+KGSCRybjmqh+phF59lbkiQuISqHm8ACQdks
	OCxuJp6x/izaz8tT0f30H7eMHtdSpEGNFAFNRfBzgJZk1HIe0lxn8SmvoRqOIwOlM9Y9XoHrz5M
	iS7bX3OWFcT/q4zk7/d5WzF7JsKVj48VKzq2oeyGaLrtrdEyDSFOf3zJWMwq8wDJ7Pd+r/zDaCx
	107Wgg2Fby45JxK/7CS9h/8vBXAuJhr0O+0gSrgRJjMLkUTIDfHaVWsrCQyR1nK1okSHsrJif6D
	zDTiuNgfN0QELNTxYXfrtYYA=
X-Google-Smtp-Source: AGHT+IGM2aXdSteNHZxzDkxZNyUpTL1d73PwQwqQe/P12YNvoZ+ttlsuyJ0UU6svImqhubQ0jymPXA==
X-Received: by 2002:a5d:5f8f:0:b0:38f:38eb:fcfc with SMTP id ffacd0b85a97d-3971d136069mr481087f8f.7.1741912060603;
        Thu, 13 Mar 2025 17:27:40 -0700 (PDT)
Received: from ?IPV6:2a03:a900:1000:7e9:403e:7c8b:351b:f333? ([2a03:a900:1000:7e9:403e:7c8b:351b:f333])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7ebaa5sm3656394f8f.87.2025.03.13.17.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 17:27:39 -0700 (PDT)
Message-ID: <7a5b8bb3-d413-4804-9a50-7f2874a93dfd@gmail.com>
Date: Fri, 14 Mar 2025 01:27:38 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Converting thin stripe volume to linear
To: Patrick Hemmer <phemmer+lvm@stormcloud9.net>, linux-lvm@lists.linux.dev
References: <0eb680b5-ad45-45e6-bc17-de052aa583a1@app.fastmail.com>
 <c75b67e6-fff1-4a06-8abb-e0501bb039c3@gmail.com>
 <a6386aa0-4eba-4a29-b737-aa93aa2232ff@app.fastmail.com>
 <c6889d49-e07b-4452-bcb9-f800087b9e90@gmail.com>
 <9cc24dd9-9589-42fc-85e0-620996523cc8@app.fastmail.com>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <9cc24dd9-9589-42fc-85e0-620996523cc8@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 14. 03. 25 v 1:17 Patrick Hemmer napsal(a):
> 
> On Thu, Mar 13, 2025, at 20:05, Zdenek Kabelac wrote:
>> Dne 14. 03. 25 v 0:14 Patrick Hemmer napsal(a):
>>> On Thu, Mar 13, 2025, at 14:54, Zdenek Kabelac wrote:
>>>> Dne 13. 03. 25 v 1:38 Patrick Hemmer napsal(a):
>>>>> I've got a LVM thin stripe volume across 2 drives that I'm trying to migrate to a new larger single drive (getting rid of the old drives). Following various information on the subject, it seems the procedure here is to first convert from stripe to mirror, and then from mirror to linear. While attempting this, I seem to have hit an issue on the second part of that process, and am not having much luck resolving it.
>>>>
>>>> Hi
>>>>
>>>> Likely you can convert your nearly full thin-pool with a single thin volume to
>>>> a linear  LV by just taking  'dd' copy of  if=/dev/thin of=/dev/linear - using
>>>> direct io option (and this can be actually faster then raid mirroring).
>>>
>>> I assume I need to copy both the tdata and tmeta volumes to their new linear counterparts. Did this, but now I assume I need to do something to get lvm to rescan the new linear thin volume to pick up the logical volumes that are now on it. And also stop LVM from picking them up off the old thin volume. I deactivated the old thin volume, but LVM is still recognizing up all the logical volumes inside it. I could completely delete the old thin volume, but I'd prefer to get the new volume online before doing that.
>>>
>>
>> Hi
>>
>> Thin volume is using thin pool that is using data & metadata.
>>
>> Thus thin-pool can remain active even when thin LV is already deactivated,
>> depends on the use case - and you can obviously deactivate also your thin-pool.
>>
>> In your case you need to 'forget' copying thin_tdata or thin_tmeta or even
>> thin-pool ssd/thin itself.
>> Your 'lvs -a'  you've shown unfortunately  lists *ONLY* thin-pool  (ssd/thin)
>> but not a single thin LV  (with letter 'V' in attributes and using 'ssd/thin'
>> as Poll volume)
>>
> Yes, I mentioned a couple times in the first email that there are many volumes which sit on top of the thin volume, but which I omitted. And that I did not want to copy them manually, because there's a lot of them, and many of them are snapshots. So to recreate the snapshots, I'd have to copy the oldest snapshot to the new thin volume, snapshot it, copy the next oldest, etc down the line. That would be a very time consuming and painful process. Hence why it's not under consideration.


Then you are using somewhat  confusing terminology.

If you want to convert  thin  to linear - it means you no longer want it would 
a thin volume.

For this you need to copy 'dd'  thins you want to convert - and obviously if 
you had 300G thinLV + 300G snapshot thinLV -  you need  600G to store them in 
linear volumes.

If you want to something different you will need to desribe things differently.

Buf if you do not want to use thin-pool with your new storage - then use 'dd' 
copy

If you want to however just 'migrage' thin-pool to a new PV  - then you can 
simply  'vgextend'  new drive to your existing VG.
Then  pvmove  /dev/old  /dev/new
lvm2 will figure out how to do a mirroring.
Once this all is finished you simply 'vgreduce' your old PV from this VG.

Regards

Zdenek

