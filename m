Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794B532E142
	for <linux-lvm@lists.linux.dev>; Wed, 19 Nov 2025 09:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763543794; cv=none; b=RsMe/gNlGBXVFD3OFgTM1jLKRSIBS4SxuM0EbOzGZb0zhIdQHR9K1mDSzxJD9PYSg4kM+VZVUMLzr/gjBFeLexL7xCYVb8f9C2maWnIeT6cT1xnnebh8AUxW005KUD8/FsgKWYeqtd2cz+HQN407eA/qyOr5B/+bXoAJL2Ny758=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763543794; c=relaxed/simple;
	bh=uY8IlgsUgTCf3HIv/WyEuojazJ0GyLW08vylMENUWTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=l9P4sq/W/XaD7XjyUE5+SsW/N3bICueWBIZQX2LWTcyyzOAb9fshHlHVzptuIKcnlwlFVX34e1P8QENKyMau4TiuJ3O6UUilM0tTzqHQLgbAf+yxz9bqLUfB3UaptDlBHMN0fS9r3sCfevRCLcKqh1+wCZXdmHKSoeqwsCA4uBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKk9vZmT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKk9vZmT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47796a837c7so26643235e9.0
        for <linux-lvm@lists.linux.dev>; Wed, 19 Nov 2025 01:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763543789; x=1764148589; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=spn6scHPjfFZoS8WnUF+VHjYj+laFqNH7f1pM8MgVm4=;
        b=QKk9vZmTqza2s++9P2+sydQ6tklWKMJZZ8x3u1D8wt/bOjZwnWi1+6tj3hh6U8PN+p
         NY7tBgNJfXFtWc5659LsPCu8JVtRlH8zb5SRkkHPljeX+J72tTOjK5hnIRBrKHMWOf+7
         ceDjJ3B0WVM3FCuymxgUrmldJ1GV3HUDXE1R1Jv4J+OndgDjzBa9lzEHNtnCJRel3UDE
         9m6UeRervOM2a8XdQF+HcHAkvWpz/rropiVni9yAb4xgGI+lgzXxPN4YPW7OfvHC0rPU
         d4ZkeeqYbxvVygL3yqrii7sTcOHLIHjWnnqvmu4P9dZSTEzrNUZqxNiorGRZ33fiJzz7
         ddZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763543789; x=1764148589;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spn6scHPjfFZoS8WnUF+VHjYj+laFqNH7f1pM8MgVm4=;
        b=lI4oT1QS1sBEPZHX69Xx6prd4r3EmjCGcVJLoAfCEyiwh1VeI99r4K7p1mavst897v
         gQb6KEpCNNnFDncelejn5Ul8SpK1sRjdZLY38vjckfvaw3sgYx2sqT3y2GHvCii6gGVF
         7M6zR91mOSq+3xBACFlqrVuJ2IjVx/oMjkEeCh635vfILKkBy9NeiYIntJltJyGXNhu2
         BwfadhwUhrCQe2o+YNjtACfl9fDsPPbnmHPxWeL78QUXpMxKory8yXLG7+Bf5UJjPUXY
         f6aRFx8eOg6vtzlsZ8UThHnrPXaBe51jVc5/3fKH79vwPW/UQ9tTYXIYnh4IHGpXvc6V
         TibA==
X-Forwarded-Encrypted: i=1; AJvYcCU0sdH9Qd+kDZU6/QA6J7hyRKnz+ABIjKUQ78vHA21nmCl2qwPpaHqA0wqzLm8mtgg0hrd8VhfeitY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwclnA3R0UjxNzivmu4Al3FXi2QeWcQDfeQSXsGdN7ybpCkGNp/
	8otIPuWOt45jS7PdsOa2awONO3FqRrBiC6yKUGFL7IXAz5C7akU5w33q
X-Gm-Gg: ASbGncvVJFI2uWpyfq/Z+HeWxtGllNt0Qs2t1xsAOIRaxllHQGqmfMCcv30r32N92OW
	mhaXdo9QbsHOnRPD8qSMp2CnKdegKp+5MH08F4hAlL/FTIzmYXI0YXnZStaGl+DXROqgUpUw7tP
	47XP7CG3RNU2hfP/rzlgcHeqPRcDbQLiwVGX2WucyYr+LuHFmalGx4OU+pWrY3s1MpTjeOdvUGn
	0GV7FZO7fXnDpp7pihEYVqYorzI3upm4Hj73IEFPDOs0wvelwH4viu1XK9h2+/a0G1M+S2lNoGB
	f8A4OtqY1rXfoSp0tvKpXbP8SoZjjd2fEHEHwkL20MohOt7+13SQY3PH/AqWqgPadAHnkGCHZzO
	zPvsTHr1zc7UtbK2MGKWwd7So1JrCqyrWAB5RNxcro6dSpfStV4Bm7PCKoZM5Q5cBt+Mci6OhMq
	EQ7phfNYXtxnP9leLLbV1M7RHppGK9FjtO
X-Google-Smtp-Source: AGHT+IFSST8zNZJNOuBbYB9W6mMGujbPzGp9G40RQFgN3P9qNapX04QYamiHZHLL/hzAivkRW8dPVA==
X-Received: by 2002:a05:600c:5252:b0:46e:506b:20c5 with SMTP id 5b1f17b1804b1-477b19e236amr13737525e9.26.1763543788411;
        Wed, 19 Nov 2025 01:16:28 -0800 (PST)
Received: from [192.168.0.111] ([212.20.115.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e85627sm38722714f8f.16.2025.11.19.01.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 01:16:28 -0800 (PST)
Message-ID: <3620fc27-e54b-472d-bc82-be01f7b2739b@gmail.com>
Date: Wed, 19 Nov 2025 10:16:27 +0100
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
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <81e51a5ad8f9c32610b8262447af635da81d53c3.camel@interlinx.bc.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 19. 11. 25 v 0:14 Brian J. Murrell napsal(a):
> On Tue, 2025-11-18 at 00:37 +0100, Zdenek Kabelac wrote:
>>
>>
>> Hi
> 
> Hi!
> 
>> You can always create 'new LV' on the PV you prefer to use and then
>> with good
>> old 'dd'  command copy deviceA->deviceB - preferably while device
>> your are
>> copying is not in use (i.e. if you are copying LV which holds your
>> filesystem
>> - the partition should not be mounted) - once all your data are
>> copied you
>> just reconfigure fstab to mount different new LV.
> 
> Yes, indeed, of course that is one way.  And I do appreciate the effort
> of you taking the time to suggest that.  But not having to do these
> kinds of off-line bulk data copy operations is one of the major
> attractions of LVM.  Once we have to start reverting back to the more
> cumbersome and interrupting methods the added complexity of LVM starts
> to lose it's attraction and value.
> 
>> lvm2 does not (ATM) support this kind of operation.
> 
> Pity that one has to choose between efficient space use and efficient
> snapshots or being able to migrate data live but cannot have both.  :-(
> 
> Is being able to do this on the roadmap at least or will this always
> remain a fundamental limitation?

Hi

Well AFAIK you are 'lonely' person wanting this.
Usually once user goes with thin-pools - it's decision taken with knowledge 
that the only way out is to take out whole data out of thin-pool and copy them 
to the new place - there is obviously no point on 'picking individual 
thin-chunks out of thin-pool - move them out of thin-pool and reshuffling 
whole thin-pool (and thin-chunks are i.e. 64K while our extents are typical >4M)

So if user wants to 'accelerate' usage of thin-pool (if they still use archaic 
hdd) - they can always cache thin-pool data volume as such on SSD/nvme - 
giving performance boost to the whole thin-pool usage.

So ATM this feature is not really on the roadmap - although there would be 
probably not too complicated path of allowing to 'install' raid on thin LV - 
let the raid do its mirroring and then split raid and eventually drop thinLV 
relaxing the space in thin-pool - I think there was some effort already made 
towards this LV conning support - but it's low on the priority list.


Regards

Zdenek

