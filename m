Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E339E624
	for <linux-lvm@lists.linux.dev>; Thu,  6 Jun 2024 22:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717712284; cv=none; b=tCCCOVsO44tORfETRuHBFQGPoOoC/q0zCjpTW64B6MTM0iRsWFmiqCfS4hpYRHXbzcP843oJxB8RaeIYOj41uo1MCpO9DFOuBO5DJIg2RBYlKikEZyXaoQpLDnG3vsXYFIIp74h7nVdhIeQnivetkY0ttYioB+ua9Va2AjQ0aQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717712284; c=relaxed/simple;
	bh=jo4UZTCf9krZJXqLoI/Hd+8hGxyEulp6w0s/S7zrqIc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VCXZaWRK/bFaYWtsZDqvCanMh+z9BjnPljEwdUMy30SfxmRd24G+FasSR76poTFxV9Dsa7I7UDCos10s2/0fRtDNJk8ATcO60H3qmQrTMwYPmT/m1Nrpaia7ldFqYf/esBkWj58L9XLjFISPcOU9Lm58jvhQCXAEjuZ0wmi1jWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrX4xKg/; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrX4xKg/"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-35ef1e928c9so1734366f8f.3
        for <linux-lvm@lists.linux.dev>; Thu, 06 Jun 2024 15:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717712281; x=1718317081; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uYbFxXqYc7d+CcIOo1riJpn61HP1XpY4dObKYJ5PBXY=;
        b=nrX4xKg/QUGB6iB8SEQ0gKn6dELT1gMONTVxtR2qATF40mLfSoyJPkmZLm8LKqAprs
         KKOwBbA1tT5j/ssndXb+k66V/NfI2T38ecM/pZsOlzStDZo9Qs5hMJ2QM0O9ZqNberbx
         ZAvIpmsiuMfHQ6Y1bsdRW6v2Cmapfutj5YcjEvm3ad+npxEcUF9Q4eQV7yLAY4+ZA/09
         t9qVQSa39yvOlAyWRRgbWtpQaPFFd2r6k8WJ3ifvPfAtZAV3Gt4jpNCEYWJ7RmDBJ22b
         0shUVHkBKK+9I7TGPBaWf/yYIYu68Nn6vMU7rHaG0S95+Rsvrlcv31EGDAyJzORVJttJ
         JXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717712281; x=1718317081;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uYbFxXqYc7d+CcIOo1riJpn61HP1XpY4dObKYJ5PBXY=;
        b=VRT2ivhYb7uxNp6PrbE+EBeXdFuMABEPSeQ7k/0eRICAVB0AAfA6bwHi2/H7OdzFo4
         c3H/A3osACFyos8ypjxf5YhvWKEULMVxGIEG6TaeThDGVfSkG0eCoGj4eQ0po6EEDVeq
         A354vfNTILzZdITfnLAjZmZCvSiaf21mcLr9ydgLb+PQVLTaxqhTcyjY1yJoFrozGgWH
         EMEvt+M8hsD4Uw59S30MtPB/4G02bIdRpB6Glm74zDFBvI6B4q6BGRfR7u0sNImhDPtk
         pVkHavpuOZLY9Sy4K49cuajHZzOp1MiDRRFxvJiuYU4cgidoHWjliNFb+rLsaUoK5/7A
         HxFg==
X-Gm-Message-State: AOJu0YxMeW53Sybje6Zl/JeftG4HuFzWgEFO3fpO+44+SoxozjyglJZb
	iVHtmVnMvaX3PBr4AX/iKZPx0s0pBl8zclQSeRNjpqFeKkwnFaQB
X-Google-Smtp-Source: AGHT+IHqqmcRQyiwTrhIqepS43zdk0s9GUWuH1mwj9Kx42OdbrHSkq84sjfofQiuvFeeoZ2WL62JqA==
X-Received: by 2002:a5d:60c7:0:b0:34d:9456:b8d6 with SMTP id ffacd0b85a97d-35efed60e2bmr722331f8f.42.1717712281048;
        Thu, 06 Jun 2024 15:18:01 -0700 (PDT)
Received: from ?IPV6:2a03:a900:1000:7e9:403e:7c8b:351b:f333? ([2a03:a900:1000:7e9:403e:7c8b:351b:f333])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c8070e82esm148278266b.161.2024.06.06.15.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 15:18:00 -0700 (PDT)
Message-ID: <e15546bf-dd1c-4a54-92bc-b9604194ffcd@gmail.com>
Date: Fri, 7 Jun 2024 00:17:59 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: lvm2 deadlock
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
To: Jaco Kroon <jaco@uls.co.za>, Roger Heflin <rogerheflin@gmail.com>
Cc: "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
References: <c828486f-46d1-45b6-8477-ed390553f4dd@uls.co.za>
 <a6c24173-d138-49dc-afb0-f48d41128477@gmail.com>
 <9bac4556-bdf8-4034-9322-522277ff311e@uls.co.za>
 <b77c19de-48b4-4a7d-9174-0d42414ce920@gmail.com>
 <66d9e7cf-b654-4476-b1e2-e3bdf4444280@uls.co.za>
 <CAAMCDed2n+wvQTySx8GRsekfrsdeO+vdwXd289bWZ_sk1WbqXA@mail.gmail.com>
 <5aa7f229-aef5-4f63-acb5-1e130c6c5296@uls.co.za>
 <de91140b-d29b-4885-8d1f-be172babb4be@gmail.com>
 <77882d4d-91e4-4625-ab98-97738d13da8b@uls.co.za>
 <67629722-b281-4ee9-b832-08e85c09efd5@gmail.com>
Content-Language: en-US, cs
In-Reply-To: <67629722-b281-4ee9-b832-08e85c09efd5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 07. 06. 24 v 0:14 Zdenek Kabelac napsal(a):
> Dne 05. 06. 24 v 10:59 Jaco Kroon napsal(a):
>> Hi,
>>
>> On 2024/06/04 18:07, Zdenek Kabelac wrote:
>>> Dne 04. 06. 24 v 13:52 Jaco Kroon napsal(a):
>>> Last but not least -  disk scheduling policies also do have impact - to 
>>> i.e. ensure better fairness - at the prices of lower throughput...
>> We normally use mq-deadline, in this setup I notice this has been updated to 
>> "none", the plan was to revert, this was done in collaboration with a 
>> discussion with Bart van Assche.  Happy to revert this to be honest. 
>> https://lore.kernel.org/all/07d8b189-9379-560b-3291-3feb66d98e5c@acm.org/ 
>> relates.
> 
> Hi
> 
> So I guess we can tell the store like this -
> 
> When you've created your 'snapshot' of a thin-volume - this enforces full 
> flush (& fsfreeze) of a thin volume - so any dirty pages need to written in 
> thin pool before snapshot could be taken (and thin pool should not run out of 
> space) - this CAN potentially hold your system running for a long time 
> (depending on performance of your storage) and may cause various lock-ups 
> states of your system if you are using this 'snapshoted' volume for anything 
> else - as the volume is suspended - so it blocks further operations on this 
> device  - eventually causing full system circular deadlock  (catch 22) - this 
> is hard to analyze without whole picture of the system.
> 
> We may eventually think whether we can somehow minimize the amount of holding
> vglock and suspending with flush & fsfreeze -  but it's about some future 
> possible enhancement and flush disk upfront to minimize dirty size.

I've forget to mention that a 'simplest' way is just to run  'sync' before 
running 'lvcreate -s...' command...

Regards

Zdenek


