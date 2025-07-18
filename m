Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5BA1E5718
	for <linux-lvm@lists.linux.dev>; Fri, 18 Jul 2025 18:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752862143; cv=none; b=uygeax3tPIcGnOeD6II0AVzttYYebDJzuBsup6hQPPtxDGp1POxmN+il0xza36YRQVIabmRkvcry+dV6HVyR0oUMcgSjCN1XRL2QzILYnzWLuflEPd5qJcDPPHEK13aprI1WB9sSStK4FKcUsNmr0DNtukM8E2tt3C5FnShvCQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752862143; c=relaxed/simple;
	bh=yHx4/8AZqToPT1SLxXy8MGp0X/zZzRE5QfDsO1xob8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eVZf4FFq48lcZmaUjhwzmaKyht5Ys0Vl0iRbiKgLX7DxxDpEsmYnBC6JOuJPK8GxGW/HnyM6WhDmcsatkh97tUj9ig0/Js9jSd7LdZoHHLDG8Q8k72tBqNgmSY9Ps2LpOTZHBbCX64oEqEcXpcb8b7R3UKBEm4bYg18nOkDaFyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asawsy4x; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asawsy4x"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4555f89b236so21670675e9.1
        for <linux-lvm@lists.linux.dev>; Fri, 18 Jul 2025 11:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752862140; x=1753466940; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G9RdDrjw2TmeQq0DaqVX2NOKkw1FWSWKviHuPl+YowE=;
        b=asawsy4x4GTuovVXqxoaYuuis/DkRK9GkY2/AFjBRpfUi3qvOatiJP280IsQYavm10
         syIh/QZHk9sqDrRpoAqp8t4zRNQp5KiooxO/9M1hl+vIGjGgO+6bfMlXRc8O2JgpXfcQ
         L7n37lapuiO8fpCKTZSEEZs3oMhXZIzps7xX3t90epzN74OWAA3CeJLFsG85kSAOLmhX
         73bSMQurBSsZSYWqys07JXNIeUJoMhf5L0PqXg5aUenK4bDfRVoVaV0QIJH/BVFvXBym
         +6ORGlNLxHL22CnTiY8wV0bBUdE47jCrBkUYBTpzfJCyhascexkNDIu6INA4TSZFI4jU
         nv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752862140; x=1753466940;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9RdDrjw2TmeQq0DaqVX2NOKkw1FWSWKviHuPl+YowE=;
        b=PZ0i/MfswCcCEXJUz40GztwoMIYB0iAxA51IvKaBNayVTkww4bO8krNdg3GJGzX78v
         wt/OPnOjFSEYSJxeLhf9BcxnOVzUCHUokt5R3Ist6URuOb7n7I3ndcDbWIr2zR5vSbz9
         ZtXVd60aTtqrairddWqNlHc3DAz7L0ouzts48uXkZpwSd2Q2QO0U5MyP1aBjExBaAU6Z
         1n7t1hQ5IDJv6gYCM+v9ypST7fOYLbwQ2R4favuRDGzLI4FbDbG233uScXq2FnNE2yWl
         cwjpx+lbNvOfnrkxmM1zVuYOaJdgA2pgAwKdg2+3hIvihoAw8/HX1zABUalZaqdpkEz6
         iMyg==
X-Forwarded-Encrypted: i=1; AJvYcCUOlw6tkRf3Pq67ZXi19b9WEBEJ6c8hcu0aiFt5hPA4/m6jgEMDEffEyi/apWldSeES1oPJe5jeplA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzjb2OuypWfJ6B++M6pDEvmYw1gTpLC8Ot/nCwVXmWp8yRoByL0
	0DrjYKVeRUsoUhn9XFnnBFqZIvpXCTJOo3lJBJwauKxk4JR2zfudRuKdcxYHmLne
X-Gm-Gg: ASbGnctaGBu6H/iYJzTwsrc4E3L6AzpVWQsyGiAgwqndc4LpYOHrDMy2A5909QP7hlH
	92azvxcGZFDYIxmIsz+E0rA/xM4hGNh6QDjxfgJIg8UEsqtOc2JcAcIgL1SV/FrTlq8rhvBTJk9
	JoJbTeQuY6xe/l1zDPz608JljdJ85kUxkOTA7r7HSP0xfBeSzck/MiuVOjlrOa/GePhs+eemyTs
	VX8C+kpGj1Cm+2ZdvdpVS8JuMnbSV1w640rErNyqxIxOaD9h8p4dEd5mVCQZP9C3vLXwRc2114I
	bDJobxxAcvoU8RhJ4cE4HTT6Aw4ImQ5aVadH5ldZgKHn2z68JupfETnq/W96bmrGem07xZeOJ+5
	QqN4FQp34V+lX9owjbwoQ4YifHo9fIEu8pq/bIJh4vpcXfR8yUG+RxQE5M18huoohC18ywog7MM
	uWSw==
X-Google-Smtp-Source: AGHT+IHNTndl1tNFmkirVgL34NYt9UEJjbhs7N0F3/os5wWb1cYEZsg1RuncVvKwYO0yt8B0teaUAw==
X-Received: by 2002:a05:600c:3589:b0:456:1d34:97a with SMTP id 5b1f17b1804b1-456357faf96mr78241335e9.9.1752862139815;
        Fri, 18 Jul 2025 11:08:59 -0700 (PDT)
Received: from ?IPV6:2a03:a900:1000:7e9:c971:864a:7fa9:5c6e? ([2a03:a900:1000:7e9:c971:864a:7fa9:5c6e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e89c87esm84289995e9.33.2025.07.18.11.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 11:08:58 -0700 (PDT)
Message-ID: <630443e7-b5c6-449a-8f6d-402a71967710@gmail.com>
Date: Fri, 18 Jul 2025 20:08:57 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: striped LV and expected performance
To: "Henry, Andrew" <andrew.henry@eon.se>,
 "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
References: <FR6P281MB3672085D192D8BF5CB45CFE4EB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <FR6P281MB36727398D141AD2A1A1E76DAEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <67b28bf7-b862-4878-8434-aaf0d157f2ca@gmail.com>
 <FR6P281MB3672F7D1B62E229AFCD31D0DEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <9f6afc0d-ce58-472a-942b-15527f693d28@gmail.com>
 <FR6P281MB367296DD8DAECAB5633C9BDDEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <FR6P281MB367296DD8DAECAB5633C9BDDEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 18. 07. 25 v 16:46 Henry, Andrew napsal(a):
> Dne 18. 07. 25 v 14:24 Henry, Andrew napsal(a):
>>> Maybe you virtual system does have it self 'a single write pipe' - so any parallelization is stopped right there - so maybe you should start first with bare metal....
>>
>> This is what I suspect is happening, as the back-end storage is very fast.  I'm going to test on a physical server instead.
>>
>> /AH
> 
> It's crucially important to be sure - you have independent drives & controller paths to them.
> 
> It's really pointless trying to setup a 'stripe' on top of 3 drives that are at the end served by a singly physical storage behind the scene - this likely can explain rather horrible numbers you get when you are trying to use stripe
> -  in such case simply join devices 1-by-1....
> 
> Zdenek
> 
> I re-tested this on a consumer PC.
> 
> SATA6 controller, 2 * 1TB Seagate 4ke drives with product spec of ~210MB/s read speed and ~160MB/s write speed.
> 
> Created the lv as follows:
> 
> Plus all these results are sort of inline with the physical characteristics of the drives max R/W speeds.
> 
> When I perform same procedure on a VM using the paravirtualised driver for the 3 controllers, I'm not getting speeds in-line with what I expect from solid state storage.  Obviously, striped LVM in a VM with storage pool connected to the VM host just does not work the way it would with separate physical devices.


So the short answer here can be -  never try to 'stripe' anything you don't 
have direct hardware knowledge & control.

Especially in virtual world you often get already some 'provisioned' space 
which nowhere near to anything physical. Try to stripe such drives makes
no practical sense.

Regard

Zdenek
