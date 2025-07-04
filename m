Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2EE298CA4
	for <linux-lvm@lists.linux.dev>; Fri,  4 Jul 2025 12:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751631853; cv=none; b=fAp0XLMeyx1kBc31s9/khqDmHFKTtPllOSXPy+zDr+S/gqSJahbawuIb8CTSDV0WX2fcJV9SHbCUkWGTu6M8YO7p86HWhXK1n/SPbrO3ReIaS1iZgKRSXT0oB10g8L+MY3gdXrPHdvasjfgtHADQkZHuLqmhL8VeU2PE1lQsbdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751631853; c=relaxed/simple;
	bh=xgib102KwNOhrFTosoHPqahbKWgItNXZ3lAZsvsjFKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=m2psuv4BpYgzjCBFc5Mom7NnU0ppwxRr9uvzK+WVOoMxRQ7/p+UM5S73BMAtTVbf1A5xMdIlBZtOvDDxHDR312dZroNZnoP4ry5K8yVbRuaqdVxHFLO0/3CNG68T2EXBTH44KUhid4uXF58stUimAPTKiinFlKDK6lYPCKW0sGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=if91e7mZ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="if91e7mZ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ab112dea41so439465f8f.1
        for <linux-lvm@lists.linux.dev>; Fri, 04 Jul 2025 05:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751631849; x=1752236649; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TOG0EXu1KAd17pECL9e9Rv49dEwngJw/nFmJwG2uAHA=;
        b=if91e7mZVTklvdwX7XiwhVu98leXsUCCSx5ZAxc/XhCOn36KEu8+gAxLj7ggr1xmUC
         QHpBupvBMd0X7XV/sR1htmOiq8UpIlm6Kxc19Qudg4zlIt3VNVjMs3mMSnRIVWzOKWQq
         1kju92YMgqgokqYqv036z9ffyAofCDxEsjvouU2/IBl+O7+c8Qbl+QKZogsA7rKgKNnS
         qgc95NwZNW/RyK1BP0nJ1OYe2m/uVChYHiFAYaIOOwgapsKaaBJakaAhD/kWanYaEw7p
         1Ytmru+cSPXXm7PCTJoax4UlZPAXJvWGfZYJYMpt7GlW19FsIN5CVGiW9EIAiUPhMajY
         WOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751631849; x=1752236649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TOG0EXu1KAd17pECL9e9Rv49dEwngJw/nFmJwG2uAHA=;
        b=XjEaTZ8In47VNuuI+HduYJEq03/lMrEoJdVfnCft7FgXowneyXgv4gQSBNqGeGB6Xs
         b3cPmxRTGtyc+JjlvXV63eyCPYfeM+WQmBQB9mo4kxjxWVXbepr/2M6bSH1BHWaMM86K
         3GyTrgUG68MKxRWBPVNMM4/e8ttEEsFzaZT0uoMTOixDCLOCBowVoJQ14wtV87EWLNdS
         UOvcvANRL7wHlnwW0WfWz9hPRJR92Xu49zI+C+K/meSHWpJGr3dzJrkHuxUq7zy3zn/t
         2G03zT9F2HodET3vVryBnFJveHvLJbxvrhKD7bFlGAs/mMeOyD2kdihqbGlzmTo5UNcV
         seuw==
X-Forwarded-Encrypted: i=1; AJvYcCW/XZPsJBbuNKlnuDKL5vll1RMXK9Ljzi9ihQuBa9aQf1Te3b05/jNxnNPKkex/4A2XyTYd/GaEcKo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyoE2EYIebvbGAmSTQiUxDgUUmIi4LdE+L4yiBnbKjc3dnYQeKW
	FErp/3L+DwB1GekyvjA5sBoXW6/+YRSTRpuIKGxSnuK2LFeXnegBGdZu8uJnlplX
X-Gm-Gg: ASbGncu/fpd3+H+cTDDDUHGu3JNNLajygHDT+gdTvlH6nxUMlT/d0KxGIefXd/9xR8N
	IoUudRUOUdsFRf3arb0u17QQ7LlC634i1ma93CoaPkU6ONVOu5zs3m4LRprgTLqDBnAmxAkdfkN
	y65LSsU55ZF5YmTtttILMZN7LmgtCiPqaufsqMiys2qQSaIMx1XGu1RSd7wvJ1zfqsPup5kqWo1
	BupVHChWIqpCtimjW1VfJt28cY0dxhmOhr0YiISCNJblv0gnFWY9re3FWm9if8iTlnF8o5+kLN8
	liIodrR696fBS9YmfprkFXLvxd0JnpvQVpRrrS9x3JfcBZ9RwazTP2cdqmmMqfE1bn8s
X-Google-Smtp-Source: AGHT+IFXhkwtn0xl7ZWbfn1XFoEgOU8dFKSI4rS9Y/xbYaiIH1AVuf/Pv9XOWMkwjpYDwGtlA9MqNQ==
X-Received: by 2002:a05:6000:2413:b0:3a4:e672:deef with SMTP id ffacd0b85a97d-3b4965fa485mr2014706f8f.36.1751631846273;
        Fri, 04 Jul 2025 05:24:06 -0700 (PDT)
Received: from [10.43.17.42] ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b188e84dsm24801815e9.38.2025.07.04.05.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 05:24:05 -0700 (PDT)
Message-ID: <06810757-4033-4ca5-9e48-5f5375477689@gmail.com>
Date: Fri, 4 Jul 2025 14:24:05 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question regarding use of nosync with LVM mirrors/raid1 resizing
To: Andrew Johnson <the.undercover.platypus@gmail.com>,
 linux-lvm@lists.linux.dev
References: <CALX6RmYqj5ECZFJR3mtHVzKj1wiepfBDFChy9HKSg2_hCtXpoQ@mail.gmail.com>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CALX6RmYqj5ECZFJR3mtHVzKj1wiepfBDFChy9HKSg2_hCtXpoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 03. 07. 25 v 11:02 Andrew Johnson napsal(a):
> Hello,
> 
> I have a script which handles the setup of mirror/raid1 volumes with
> LVM. My understanding is that the initial creation of the LV with
> nosync is perfectly acceptable if there's no data to sync (In this
> case there isn't as we haven't created the filesystem yet). However if
> I were to resize these later, suppose I resized the first PV and then
> the second and then the LV, would it be fine to set nosync when I
> resize the LV as there should be no data used on the new blocks of
> either of the resized PVs?
> 

Hi

lvm2 may possibly has some  'missing' corners here.

Main problem with 'nosync' is -  when you run synaction check|repair
you would get tons of problem - as the raid device itself does not keep any 
'map' about what was written or not - but many filesystems do have this info - 
so a filesystem may be quite well usable with such arrays.

So to create  'nosync'  arrays is rather for 'well informed' users who 
basically know what they are doing and what are the limitations -  normal 
users should stay with synchronized arrays to stay away of troubles.

lvm2 does support  'lvextend --nosync'  - however if you find some case where 
you would want to see different/better support - you need to prepare some bash 
example, where you explain, what is being done by upstream  'lvm2'  and what 
should/could be changed.

Your current description is kind of mixing  PVs  & LVs - so I'm not sure what 
they mean by 'resized first PV' -  as lvm2 is using  PVs - but never resizes 
them with lvresize command - we resize  raid leg LVs.  But I think we can 
figure this out from some 'bash'  example....

Regards

Zdenek

