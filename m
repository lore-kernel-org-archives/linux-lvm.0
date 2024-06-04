Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779E653BE
	for <linux-lvm@lists.linux.dev>; Tue,  4 Jun 2024 16:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717517236; cv=none; b=fcqBc80jnWKre5r4dR8IadBDIQiOfPxiVktQMtajdqqVED2EBJcxE6Xl200GD6h0k4WcMVwZ8mpb9k6dD2+f/C0StfXH8QlP4UKCiOFmBh0DoVR+e7laxLDKKR1Ix+6SdPKKN29VMN5eKrDx2YPG3EHjNy3JUu/8ME+xGINbQX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717517236; c=relaxed/simple;
	bh=010euudqRX8WZO05ZbV/kvwVYnKcJL3rrT9dA+YSAxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ONA5M7uXswpq+ri1RSTg105yFVygdvoQWfMWLiFU2ICLkUnztqrGZ+hnkYHWKGHZ0s7Q4JYNj3flwZY8gixK8UsrxOQyihJ8koPqcChw3ym9VKcve4ruCrI2/qUw7wNipXbg0gv3/y3c2TRGpiDnV4w5OS9sb4W0riB3zSnvRKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEbh9lbW; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEbh9lbW"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a68f1017170so131323866b.0
        for <linux-lvm@lists.linux.dev>; Tue, 04 Jun 2024 09:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717517233; x=1718122033; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ETPltLCJbU/8qGXZsb5OFpZ05jciaWAhAC0vvJUzKc=;
        b=SEbh9lbW7C/fihUNpXSWhkKTFl8oezivFODd3/a7HczjERpwqHCCD0QUq0pacfAHkU
         F8U9cAqcMxDGVxiftCn5/u0OwYwjSgPYDotCKDjniUWiPCfRPt7LzldspcEJMJMwym2H
         fLW8j1YdYthWigJFcyTlG7BQAdJcuZYEcmt7wmmRh96wQsyjYPasD3gaGxsgx3/7q1x0
         l1YrKkf3JrFce8dfvZuyZDu8K4giz/9OEe2TFIaLX7wZXukqq6EnkZv1DsCHrchsU2b+
         N2IGw78m5J8W1oosGcAq/goLroS7PTgv1oI4mtq3mVOBAv5zqauCSZS5UThGIGiTw6tS
         K9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717517233; x=1718122033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ETPltLCJbU/8qGXZsb5OFpZ05jciaWAhAC0vvJUzKc=;
        b=mMPtBC/831lC+fxhiL+PKtPEsh4ecB0q9eqOtkoMbXeyx2lvopRG9l0WlHeoEogrD/
         75mOSw0vMX1ItQRwMCVFkDpiaDZnobedZX4LbRcTzSe4msMIbfnx/cowhnwNkwevkQm+
         rIEA6uD37IeVNDtKHC+pEqFJOmMIWGKanyELMu/rnkhSMOaaC8/UxSY9EOYT27MXi9YI
         7zJvLpQsIrrrl/yaJBAyMI22tlJWzHmYaYiCWTXrnXm/tMruWJpmUpP8o4z4qV9ooSw7
         YSXPKcOybaRmd72GPj2RZSZOpmoeVpzDnVQamHbzucrGLovMSkVTlJz9m2Bn+vpo4L+b
         oPpw==
X-Gm-Message-State: AOJu0Yxa2QT6xeYbeZ68WJQXQTqx1nT87L9WtoNZR84Y2G0WZhhl0ox+
	hnIl6q4+h9Q04yr8lTScOS6RznaUdrS1PkOOEh0taT4tQYBzcXmiIAVXew==
X-Google-Smtp-Source: AGHT+IG2CJN8s0Yoj2sWBWjZMNy06g6ZwsdqZX3dd64QpMaXWHRnsoaZVMYKvAuQSn1uB3PMfbaXdw==
X-Received: by 2002:a17:906:2855:b0:a68:a2e7:118b with SMTP id a640c23a62f3a-a68a2e7230bmr645041666b.19.1717517232653;
        Tue, 04 Jun 2024 09:07:12 -0700 (PDT)
Received: from ?IPV6:2a03:a900:1000:7e9:403e:7c8b:351b:f333? ([2a03:a900:1000:7e9:403e:7c8b:351b:f333])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68a4071470sm531995666b.205.2024.06.04.09.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 09:07:12 -0700 (PDT)
Message-ID: <de91140b-d29b-4885-8d1f-be172babb4be@gmail.com>
Date: Tue, 4 Jun 2024 18:07:11 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: lvm2 deadlock
To: Jaco Kroon <jaco@uls.co.za>, Roger Heflin <rogerheflin@gmail.com>
Cc: "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
References: <c828486f-46d1-45b6-8477-ed390553f4dd@uls.co.za>
 <a6c24173-d138-49dc-afb0-f48d41128477@gmail.com>
 <9bac4556-bdf8-4034-9322-522277ff311e@uls.co.za>
 <b77c19de-48b4-4a7d-9174-0d42414ce920@gmail.com>
 <66d9e7cf-b654-4476-b1e2-e3bdf4444280@uls.co.za>
 <CAAMCDed2n+wvQTySx8GRsekfrsdeO+vdwXd289bWZ_sk1WbqXA@mail.gmail.com>
 <5aa7f229-aef5-4f63-acb5-1e130c6c5296@uls.co.za>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <5aa7f229-aef5-4f63-acb5-1e130c6c5296@uls.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 04. 06. 24 v 13:52 Jaco Kroon napsal(a):
> Hi,
> 
> On 2024/06/04 12:48, Roger Heflin wrote:
> 
>> Use the *_bytes values.  If they are non-zero then they are used and
>> that allows setting even below 1% (quite large on anything with a lot
>> of ram).
>>
>> I have been using this for quite a while:
>> vm.dirty_background_bytes = 3000000
>> vm.dirty_bytes = 5000000
> 
> 
> What I am noticing immediately is that the "free" value as per "free -m" is 
> definitely much higher, which to me is indicative that we're not caching as 
> aggressively as can be done.  Will monitor this for the time being:
> 
> crowsnest [13:50:09] ~ # free -m
>                 total        used        free      shared buff/cache available
> Mem:          257661        6911      105313           7 145436      248246
> Swap:              0           0           0
> 
> The Total DISK WRITE and Current DISK Write values in in iotop seems to have a 
> tighter correlation now (no longer seeing constant Total DISK WRITE with 
> spikes in current, seems to be more even now).

Hi

So now while we are solving various system setting - there are more things to 
think through.

The big 'range' of unwritten data may put them in risk for the 'power' failure.
On the other hand large  'dirty pages'  allows system to 'optimize'  and even 
bypass storing them on disk if they are frequently changed - so in this case 
'lower' dirty ration may cause significant performance impact - so please 
check whats the typical workload and what is result...

It's worth to mention lvm2 support  writecache target to kind of offload dirty 
pages to fast storage...

Last but not least -  disk scheduling policies also do have impact - to i.e. 
ensure better fairness - at the prices of lower throughput...

So now let's get back to lvm2  'possible' deadlock - which I'm still not fully 
certain we deciphered in this thread yet.

So if you happen to 'spot' stuck  commands -  do you notice anything strange 
in systemd journal -  usually when  systemd  decides to kill udevd worker task 
- it's briefly stated in journal - with this check we would kind of know that 
reason of your problems was killed worked that was not able to 'finalize' lvm 
command which is waiting for confirmation from udev (currently without any 
timeout limits).

To unstuck such command  'udevcomplete_all' is a cure - but as said - the 
system is already kind of 'damaged' since udev is failing and has 'invalid' 
information about devices...

So maybe you could check whether your journal around date&time of problem has 
some 'interesting'  'killing action' record ?

Regards

Zdenek
