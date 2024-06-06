Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166434CB4B
	for <linux-lvm@lists.linux.dev>; Thu,  6 Jun 2024 22:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717712062; cv=none; b=q0Uq+wsTIt+ZFpK1fCKoqTqDucBhzjzchDuIn6/8e38HnuZiQTgBnxOwyeosQnY0Fa8eKpQ9QnWH6Y9f6J81u9hdvRELRYW62I729724LciogaYNiov5/kst/G2sy1TA12xPnNpgL2HS2vJpw4FmHGHDOr8fssKn/pGVX+y44zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717712062; c=relaxed/simple;
	bh=STiW/Hvx3LikUjo4iiVwfTIdIHLfKRIrs8S4HtSzgoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sj484k6JLgxBVVkCToEEPO9/xbP2ichYQEIccjJuZMKZhg9K0dZsV53SNLP9tNOLI5VwVc36qkDgulm6hvfIJldewVVCl/2o0/6nKKiIwv5o4DBgAMe16T7gbXNUGR46Ly/8gP8YavWFHMZ5JO57zCLLC6SVBN6sdB7bWZusUeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrZcmysK; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrZcmysK"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a68ca4d6545so270546366b.0
        for <linux-lvm@lists.linux.dev>; Thu, 06 Jun 2024 15:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717712059; x=1718316859; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kj33XILugs+ya4QlFl2qwuRqX3gTHr/hlsmWKFpf9JQ=;
        b=RrZcmysKTbJ2iEnVF+Kvpd6Hgy6japFxgXkk0wdGQxiAlP1vcrAE4ReVp2dXTomvjl
         56CUJFydV15kxNQbDUPR8Lo+ddkGLb3ObUxTiJQKTUwfguFqT0SuHGFHKgw6agSlHNTE
         PrrYnyS1VUH/JJeRfE3S4rEQbyL9CvihqZ04b9CVpC2f10mqa43M8eZCRRp4Bk5qTzYk
         bYT457BUpxnL65yVocBkAGFOk+M1X8pWFcxRCzEe63tyWDy/X6RpaSYjQYmetiD28ucx
         lUEYqTIeJ9Z03ZXDEa2rpuFj8lmJ2nx6Uhc17/F5l6g8AQ18RtVvcxMyRvzvTLlDGFDw
         oQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717712059; x=1718316859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kj33XILugs+ya4QlFl2qwuRqX3gTHr/hlsmWKFpf9JQ=;
        b=GTSHvXUSHSJRZ5DJG1rbglN6uji3r7nEW6SsVzuwzQmxI6O/DpxURR70fwaWTeaBGh
         UpJMoyAs7xRbg8vnJDceLepHDhb2aGI620d9+uiJK2IRKWncCVvrVOAj/MSdwSZC6p6/
         QkpwGyru6iZJahl7MRDVstJ3RcOC7jxitEWuLgoe/zxIrjdyIuYxIb4R2wjIXRh2YMJk
         i5Qs6PAeBiqlNVlppJDSTcQPhfR2M9gsuT2vt8L+4iWYSvGYk2b12wZlktyrDae96OWZ
         zyUK7YAJH6jeur/V5e/4acz5mucNKqdW5RKlX7nNDek+PbosW8YOfip7XQd8dTbpT7Sg
         G5mw==
X-Gm-Message-State: AOJu0YyAehmYDsCCEhnHrERYH02uUvvIaKczs5h+xDboEi4vtMAP43Ka
	TWmCVVKEzKgsDJDyBH+7ghP9Vfw56lH52PxD71Y8uz91/+GdqvZL
X-Google-Smtp-Source: AGHT+IF1UZWkv/vubMne1+LgvWdjHMCJz52FNOHgWOSDqcZozBtZ9i+QW4hVlxjTr0+u3KZ4eu10Gw==
X-Received: by 2002:a17:906:3996:b0:a68:e560:cb33 with SMTP id a640c23a62f3a-a6c7650aa8amr315322766b.28.1717712058939;
        Thu, 06 Jun 2024 15:14:18 -0700 (PDT)
Received: from ?IPV6:2a03:a900:1000:7e9:403e:7c8b:351b:f333? ([2a03:a900:1000:7e9:403e:7c8b:351b:f333])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c805c4d97sm149887166b.47.2024.06.06.15.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 15:14:18 -0700 (PDT)
Message-ID: <67629722-b281-4ee9-b832-08e85c09efd5@gmail.com>
Date: Fri, 7 Jun 2024 00:14:17 +0200
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
 <de91140b-d29b-4885-8d1f-be172babb4be@gmail.com>
 <77882d4d-91e4-4625-ab98-97738d13da8b@uls.co.za>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <77882d4d-91e4-4625-ab98-97738d13da8b@uls.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 05. 06. 24 v 10:59 Jaco Kroon napsal(a):
> Hi,
> 
> On 2024/06/04 18:07, Zdenek Kabelac wrote:
>> Dne 04. 06. 24 v 13:52 Jaco Kroon napsal(a):
>> Last but not least -  disk scheduling policies also do have impact - to i.e. 
>> ensure better fairness - at the prices of lower throughput...
> We normally use mq-deadline, in this setup I notice this has been updated to 
> "none", the plan was to revert, this was done in collaboration with a 
> discussion with Bart van Assche.  Happy to revert this to be honest. 
> https://lore.kernel.org/all/07d8b189-9379-560b-3291-3feb66d98e5c@acm.org/ 
> relates.

Hi

So I guess we can tell the store like this -

When you've created your 'snapshot' of a thin-volume - this enforces full 
flush (& fsfreeze) of a thin volume - so any dirty pages need to written in 
thin pool before snapshot could be taken (and thin pool should not run out of 
space) - this CAN potentially hold your system running for a long time 
(depending on performance of your storage) and may cause various lock-ups 
states of your system if you are using this 'snapshoted' volume for anything 
else - as the volume is suspended - so it blocks further operations on this 
device  - eventually causing full system circular deadlock  (catch 22) - this 
is hard to analyze without whole picture of the system.

We may eventually think whether we can somehow minimize the amount of holding
vglock and suspending with flush & fsfreeze -  but it's about some future 
possible enhancement and flush disk upfront to minimize dirty size.

For now reducing dirty page queue to minize the blocking time associated with 
snapshoting is a right choice  (although 500M is probably unnecessarily low...)


Regards

Zdenek

