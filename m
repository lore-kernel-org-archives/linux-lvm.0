Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE05191461
	for <linux-lvm@lists.linux.dev>; Wed,  9 Oct 2024 11:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728474331; cv=none; b=Ohb65pzho04nsygv+ZHtQpchZJgqv/w7PQ/vj77nWoesd4Cl0UvpWk744sEMLZlddLayWC0vF3NQHzcxxshtqg0Tjf3wtfNIk2zOHJcsNS21K8mJqIp2VP6d6TolcNULDa1T96wUkgNtzhapFZxvMA8OZudMXt5LE74yI7Q7r+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728474331; c=relaxed/simple;
	bh=Athsg1GUiAiedEvyoNTPkOtzx73fMbVnTd9jYlMy2vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hq1twQ1I32gdAtepUuSfgY/X098CgSBrXlF6CrSvV2pJHCnsrGgmoCBMh9PbcWGdXCtnlWyGh9kS/2Nv66VCbYLQUrWfTl+e4z7sabM4NQBmqFRcbyYAQ3uKspEltJ3VkAZRjJ/4fqcr2tnXulfaLUzDfSX1c9nqZEfzna7IKOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLHZSYeF; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLHZSYeF"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d41894a32so280799f8f.1
        for <linux-lvm@lists.linux.dev>; Wed, 09 Oct 2024 04:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728474328; x=1729079128; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oQpw17KlpFBGC9hQjiLxMQKc1kAuz6yqrbO1P/pdruk=;
        b=kLHZSYeFigwhaQXlk7TanJMKf4hGffj18/sqN2LPHJ6XQNm3fHbMHbGRr4iaMv05+7
         QPoPqf9kQw4Q9icFRH9cr5wpIDCPlvAOWs8zdeaoEBXXzldLB2psWErTgVX4NLwDq3Qm
         Rr2EouU2Y4E4wRU6Rznkzx83gZhDNixXzoBoFxkN0wQgKHZhE6dXToz1uoJIQZ0mcruT
         Kro/RHWxtYbdSuQOM6y9KcvzjAc77DKF6x/ipQHqJBY5PCMOV6QYKDTMa/Ep3VhzZpVP
         OMl8L5jy1Q0GAbX7lGAHPkK9IMZxuPzqpq4d89PfpGdFk9SXO8ilgDznSwolDtU0LvhK
         M4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728474328; x=1729079128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oQpw17KlpFBGC9hQjiLxMQKc1kAuz6yqrbO1P/pdruk=;
        b=QJYikp7+qlcZEfA43f6G0X1lTVVU4Q94pt2fi/EHlouHYJwBJhywcE1q6LSIXbvpvN
         e9CEMDq++7XT0qTrnSPF9NeKLufBG6QflljudEyi+VV3zA2kLIcT10Ciuv5u1iffq+oE
         CJs0q84DMYLCXgXSuuh2NvmyUR612Z95SX15qZMa2F8knXQzMr5IOnfb+NiINSFdcjAk
         NcGxtRqPaGKrD5jaCsvZdTGqskosLPUlZ1x7Er4gNI+cMWctQYCFCZRF9yGle8cQclOF
         bTFx+VbHE7EkmllUh10RvOj1rpBElysa6F+ZDMlxmBeBMizdzyIyb2zRZt58IX9Y0mRn
         izFA==
X-Forwarded-Encrypted: i=1; AJvYcCXGOsupxFMx2KftmJbwFrqfGr9vmt9f3xzsydS8khh6er9Qqr2QAUYD6ea0NJjIW0LkJ4E+kKDROns=@lists.linux.dev
X-Gm-Message-State: AOJu0YybUT7mqGa+5pwFWvny2S+hwwTe2FXLxwDQTL97HTzh2DJpIxV2
	2Hs3UZpesKRv8b/ayK93XpQbVPYBgP1IkkOxI+JKpjMvZk6znAPo
X-Google-Smtp-Source: AGHT+IGEIpRNcds/MlWfqhlMPH1+hBnEuXxf1soXD8Y8Ziepngb1VQJCtYkpGQuG+o6qu0wGm8s6HA==
X-Received: by 2002:a05:6000:18a8:b0:37d:39ff:a9cf with SMTP id ffacd0b85a97d-37d39ffae1emr1886022f8f.5.1728474328204;
        Wed, 09 Oct 2024 04:45:28 -0700 (PDT)
Received: from [10.43.17.8] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf6095esm17691205e9.30.2024.10.09.04.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 04:45:27 -0700 (PDT)
Message-ID: <5413ba5f-0ad5-4285-b37b-19515ae98f75@gmail.com>
Date: Wed, 9 Oct 2024 13:45:26 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Help diagnosing lvm ioctl log spam
To: Fabricio Winter <admin@notfab.net>, linux-lvm@lists.linux.dev
References: <CAKP6pzFDt42gCDjwg7m_o5YRh7MGCSfxrXkNt=nPV_B=-pRAQw@mail.gmail.com>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CAKP6pzFDt42gCDjwg7m_o5YRh7MGCSfxrXkNt=nPV_B=-pRAQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 09. 10. 24 v 11:28 Fabricio Winter napsal(a):
> Hello people, we have been experiencing an issue with lvm2-thin on
> _some_ of our production servers where out of nowhere
> lvm2/device-mapper starts spamming error logs and I can't really seem
> to trace down the root cause.
> 
> This is what the logs look like;
> Oct  9 06:25:02 U5bW8JT7 lvm[8020]: device-mapper: waitevent ioctl on
> LVM-CP5Gw8QrWLqwhBcJL87R1mc9Q9KTBtQQmOowipTAFuM7hqzHz6pRVvUaNO9FGzeq-tpool
> failed: Inappropriate ioctl for device
> Oct  9 06:25:02 U5bW8JT7 lvm[8020]: waitevent: dm_task_run failed:
> Inappropriate ioctl for device

Hi

Have you considered to try using kernel & lvm2 from the more modern age where
the 'nvme' storage actually become a regularly available commodity hw ?

I'd have guess your issue likely already has been solved.

Otherwise if you do want to do a hunt for a particular IO - use 'blktrace' 
tool - likely on tpool_tdata (or tpool_tmeta) volume.

Regards

Zdenek

