Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C16D22DA0B
	for <linux-lvm@lists.linux.dev>; Mon, 16 Jun 2025 08:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750061592; cv=none; b=C/ySCd/caWKN1zwvEg8W9CKbftYY7DKR0ekCR+Vg4wVsrAM3rEUOxeYeX7VYV+lSEkCPCBT43P9kcexin5vU/ixoaDIKU6mgfJToFV73DHL9Rwz/h6xJ6ORQVyVCwc75eMXNntB6iB9xe5bzDMmDvenmlZZE6mshSA9+E+UitDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750061592; c=relaxed/simple;
	bh=jwhEmFu4LkD8SCP+L0kHfKVl21myaA6jT5elKdlPIL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jze1gLAo6VKeIaKgtJxHkcBBffrqgu5EVdzEUvXOEcfAvVopktPVMRbTawXyQkg4RjcOtQSn/bBJ+BRP0qnEgPexWHAaG+omBaHOvD/B3Qr2x7cFmfzLXASUwLv3MfIlIuuvl2iaku9h5rxCEstwrjwnChuLlewxvieixXZ4R7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JsYd838k; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JsYd838k"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-606fdbd20afso8564973a12.1
        for <linux-lvm@lists.linux.dev>; Mon, 16 Jun 2025 01:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750061588; x=1750666388; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pF7kQZ1KWmtOVQSxHXc4Mi6TK5ONBlOpT0ZwaNNspoU=;
        b=JsYd838kURSxTCSVlrYD7V31ejPabfcE/PIf9ffYKJZE0Z7CCghTFud5fryOQpY3eI
         HLu23PAm0gWUSKBP/x63aj38bTy6dKmnK1OWaSldcUKDSDfBQ1Ah2yiPe8dHwrh4cTQt
         EtA+LrrMFvjiLmLPNehtnpMOfYrbN94M7k0j5R+ynVaZiSYtFkMx5nxQxEmluhO3Syyv
         d9lGsSgwkLBl1wY/BOOfrunZHFH6k05JUgbmw8UUFoYc/UmbYHLx4Y54L9j42iu0bLD9
         yZ0FJ3PesikJSdJ/I/txJZRnvjGutpdLNuXNoYW/xLmBWRMIce6IFrunlkw3wjrqCker
         NQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750061588; x=1750666388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pF7kQZ1KWmtOVQSxHXc4Mi6TK5ONBlOpT0ZwaNNspoU=;
        b=JPlaGjgclIZQAymyoN7kr+wJCfqUj4a9myoi5+oMOli1L1wyUg1uOX8tCcFWsYZtDy
         1m4Gjdnf9qOAVpRNVJAQ2JumYczZjem49KzW9x0PoF+Vts55Yj92Lr67STjaiejFeggC
         D/dkEBnmwfJKl8Lp7uqdKYc9YuFIUygqgqVPf29wEdzfxeJJundfNoLX7cw1RKQPVsm4
         NbRIm0ftsCIIeJUCGcfe0p+CCJ55DzoyUxnVzv8nyiYBus+FH5kb6QJEB76YNtrHUAxH
         zgExq3TEcGHOviqSahKaAilJwsAhJ8J41m9DYCX5WntJggrh7xCgWOlPmMqiifAD4sN3
         dP8Q==
X-Gm-Message-State: AOJu0YyzXcRSv9lq46OE72VFrAqZQhgEWhaWCgHmp0gu9fyFmcQ8+U4z
	7ijGjlCG8JEjIRgyPbrFkKnKTyeAicL/mGx999pasfWKkHZpJOLpwgLrBRFjCvxt
X-Gm-Gg: ASbGncvnmuK8QwX4Fr+reIvHJ5c1lrOYwGtW8hsVTD84qQOhpnqPrmL1rBPRs3mPVm1
	Yz2ffcgND95nT7dQ2Z5IQywT26qYZmt8Z3XQM+DbSVR+ckmTWIIIHDVBMH3B3BX7qfX8jEipImv
	nXWjRm6Rz2154a1OpVw0g+6kp42UDJKZymMTE8SJmuJxkz736gVHFLQVbXMWIAFcbz5l7ncZbz3
	jYuWii5KvUSAdp8Fs+w/VSSjPgE2811zd4mL3GiA28hYWaMuyrMvU/pETagjT9FxTaoNhYDacUl
	mUVRf77DYcywbPeRkPXJV1h1u2nBVLSkE2psfRIx7d0KHxjPrkT/CsntF2GtBgu854dzHA==
X-Google-Smtp-Source: AGHT+IGesnwqhHpajFTD1fn/OYyG0Zpbch4XV9+c6S5GuR9XSa2LXgKWcUfjr1FF0NYBh8X15vNcVA==
X-Received: by 2002:a50:9318:0:b0:608:f493:871e with SMTP id 4fb4d7f45d1cf-608f4938fc4mr4626785a12.14.1750061587496;
        Mon, 16 Jun 2025 01:13:07 -0700 (PDT)
Received: from [192.168.0.107] ([176.221.170.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a5b65esm5637987a12.50.2025.06.16.01.13.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 01:13:07 -0700 (PDT)
Message-ID: <99dc017e-aef9-47b4-97a6-163d8feb7c30@gmail.com>
Date: Mon, 16 Jun 2025 12:13:06 +0400
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [packaging] Who packages LVM2 for Manjaro
To: Christian Hesse <list@eworm.de>
Cc: linux-lvm@lists.linux.dev
References: <9322a409-f101-4c81-bade-7ea4700c8379@gmail.com>
 <20250616093724.734b23ab@leda.eworm.net>
Content-Language: en-US
From: decayhonor@gmail.com
In-Reply-To: <20250616093724.734b23ab@leda.eworm.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I didn't want anyone to register there, just trying to figure why the 
binary isn't there and how to contribute.
Anyways, here's the answer: 
https://www.reddit.com/r/archlinux/comments/1lcmw93/comment/my1mxvk

Feel free to expand if some vital details are missing.

The thread isn't for the mailing list from this point, I think.

On 6/16/25 11:37 AM, Christian Hesse wrote:
> DeCay <decayhonor@gmail.com> on Mon, 2025/06/16 11:08:
>>       I have a question regarding LVM package for Manjaro Linux. Are you
>> involved in packaging ?
>>
>>       lvmdbusd is missing on my system and I want to understand why. I
>> started from the Manjaro forum:
>> https://forum.manjaro.org/t/no-lvmdbusd-binary-in-lvm2-package/175096
>>
>>       I was told to look at the package's URL, which is
>> https://sourceware.org/lvm2/. I think that it's just a project's site
>> and it's not related to the packaging process in any way.
>>
>>       The packager (Christian Hesse <eworm@archlinux.org>) doesn't
>> response either.
> The packager is Arch Linux developer and not involved with Manjaro,
> thus not interested in registering in that forum to discuss.
