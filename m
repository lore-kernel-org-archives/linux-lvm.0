Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D482F30CDA6
	for <linux-lvm@lists.linux.dev>; Mon, 17 Nov 2025 23:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763422644; cv=none; b=l7s6Jl2D/54rnbjfdx9jTcsWlI9z/suORAHx0xjEimSp89g88zzhyYGdLyyBIZ8KMiOBd7cj78LgV5bNYdWK3cHzfhIE5Vw0lPEmkNZQPhXhpX5xWDwr5wsIQn6hHohs5YxM27Irqq/LNucKkMVFpQ1tJjEF0k4v/kLxY47rDKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763422644; c=relaxed/simple;
	bh=RzgFVxAZ7oVQQoNI9gANoGT8Cv15DDY+etJriswKHKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NDsoFoko4T62xsSJblrfHUS9QIRRId4E9IWiS004xAs9cuiJ/i+v6rZhMAg9RKpkBCsmFIZYq+w6W8JvZClxx96V/mueS2beEoTq2x8abKchgP+rw/QC6VU+TcQrLg51lhtXyKTY91k/FGMzYAwgKP5Z6vWfyxapZuT+vzWvfy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKUbq8ky; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKUbq8ky"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso24792535e9.1
        for <linux-lvm@lists.linux.dev>; Mon, 17 Nov 2025 15:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763422634; x=1764027434; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zmWiXfwWaWNCe9Dqt3DQiLczLwcYD+VbzQsxmLIV/SM=;
        b=PKUbq8ky6HUftcYOR9KdMTlabmyIhYWRswDh/ONlVRSdUF3T1PsHOIOO6btpesXixF
         4EGX6tksxpeH4TTnWQ8tRLpRBWZsULzMXidwmBScZBIfjdEF3MOllTgXdJ3fCHa7H9Ls
         vco2vGtruiHjyVCcLIKyVwkzlip1SeHI5xtu+KeHb7F/hiiKmQ9qTUBiraOpFKqM/S9I
         g+PznvnXPw5TjF20lLgX0oHr8VxVlb343d/oojzwkt0GMlMD8a1MDSaAAXJ+p7gFwALK
         dViVCbIk4BobKFZ6jQcgRudqrHhQmAyXim6gdNV8V/lkT5Zld05ifh61NMZJYe7A/s51
         iLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763422634; x=1764027434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmWiXfwWaWNCe9Dqt3DQiLczLwcYD+VbzQsxmLIV/SM=;
        b=rjfSi9+8RYL50tjP5a4GEe2egtjXWWR9XV5VrJQv+MWTqUxJiz7kHailtbk7PImBu5
         zBqevWU0tErTLNDZeSdpTTmcrb2qLcQvm9MDygv1F55PQBnSRxxBHqDL4gsdwo0PexLo
         8o0XCISWSu/EwQqZI6iHLNu8wARNvqJBOG3AyXSLWs/d7LAmGipn8RzBcik25fXMKdK5
         sMYc7cHu/+NZdNUuiCmtiQSKcWB0PQJDyU/versxvjJnoeSfzOkX56PZf415Bf+GWbE3
         o0o1nPqJzoLbI7r2iHSZtzXehJWTPAu7gZ0sXlxV1sZXK5HnpSueZIh/bpMNQdfVIA/y
         MLMg==
X-Gm-Message-State: AOJu0YycyFf8qtyTL2nxWEqiSVTYwCIb7fr3Ov7nqLuHzd9d5RQ1x8xt
	K2X+EsvUtUMs0qW0P1WFWMu4hlWB5qS5JSLZEJ3rykiBCh86dW5Vu2nZ0BbeUw==
X-Gm-Gg: ASbGncuqX8VRM24eYrq7ZFc0Xd0UQsOUlEB3QbSFGvzqH/C/ctnMehsnC/SYEp/sApk
	KXaiqVIRQANHGq3+W3IpfAyzILSg8sJ225xrE0B77yyrKNf7ga0E+Eih0vkvcB/ca4fPRwqNN0r
	JOybyMEhTbwG7Pqfi9x6hdsgVkuANUJnrujamLH4qONJ9fJLz+7qD9UcjzLbhyezrTqbASZq5Of
	6/NTyAOPBxgbZe77KcCv+xHzLmlcy8WJHHOnbBaWJI4pcflDVsD2aN2lBLH7Q9zvTuMjiEV0+ib
	bJULbkd2zf2eh/AIAZu73Q3UFkmbbEZdV2iV3uKAeKlENqPQ2MZEIKb8EGnGohS0gATd5/+NZX6
	xdz1cjU9rwBW9cKRJhYvMZMCu3dgssh80Dt9hRJbN8gAC6WC36P72Cza7Gc18/c21SweqUlcdjh
	JPJaq9ULzuDwqvMuIWBvGAHr95iP8ILPuP
X-Google-Smtp-Source: AGHT+IEzcExp+fZNhQLRb3ZShSPyhFLxGKdNt40K004bg0MhEGMBJJG8nZi6EAbsQ3ojb8RSopzsXg==
X-Received: by 2002:a05:600c:4452:b0:477:832c:86ae with SMTP id 5b1f17b1804b1-4778fe5c755mr120158735e9.12.1763422633862;
        Mon, 17 Nov 2025 15:37:13 -0800 (PST)
Received: from [192.168.0.111] ([212.20.115.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779a684202sm152646525e9.10.2025.11.17.15.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 15:37:13 -0800 (PST)
Message-ID: <5067ec8d-991b-4b90-ad3b-f9dbbb0472d5@gmail.com>
Date: Tue, 18 Nov 2025 00:37:12 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pvmove thin volume doesn't move
To: "Brian J. Murrell" <brian@interlinx.bc.ca>
Cc: linux-lvm@lists.linux.dev
References: <be9db13beb543be237fa069e3c72e22e1df2446c.camel@interlinx.bc.ca>
 <1b6fb117-7283-4ba9-91ee-7412a2d77b3d@gmail.com>
 <29209080-c09b-40df-86c3-f22c1d7f6520@interlinx.bc.ca>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <29209080-c09b-40df-86c3-f22c1d7f6520@interlinx.bc.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 18. 11. 25 v 0:30 Brian J. Murrell napsal(a):
> Pity.  I don't really want to move all of the LVs in the pool.
> 
> Can I create a new pool on the new PV and move just the one LV from one pre-existing pool to the new pool?
> 
> Cheers,
> b.
> 
> 

Hi

You can always create 'new LV' on the PV you prefer to use and then with good 
old 'dd'  command copy deviceA->deviceB - preferably while device your are 
copying is not in use (i.e. if you are copying LV which holds your filesystem 
- the partition should not be mounted) - once all your data are copied you 
just reconfigure fstab to mount different new LV.

lvm2 does not (ATM) support this kind of operation.

Regards

Zdenek
