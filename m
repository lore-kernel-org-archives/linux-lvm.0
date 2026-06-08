Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B343128D4
	for <linux-lvm@lists.linux.dev>; Mon,  8 Jun 2026 14:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929485; cv=none; b=QYYZkM/CEabcnpwpGkwD/8UfINsYwuCFZKNcihX4fbcHwrJDKkC5NSjzYmgKfgTdYs4jTfU1WtgPr37DvQIkoq/LZZpV7Ab5Rk33VZW7rR0sMIIBDup99/BSIrIHz3yoBNUq0bYTDxvYa/Ufjop4s9UCjFVqcRre9OrZDsszrXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929485; c=relaxed/simple;
	bh=RpQ1Hn+BKhFB1/Zshy3aGSxLvRCO7aMyq5luTZXl47I=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=achqBGLDX7PhoO96e77L8Tm27FN23gPwxkoPz/8zxnOU45HyZBiyicQyu9LZujHLHe6L0HqnfC/9sN3Vat8zZjvr+a6JlRR+PAoQeogQ/ejoleF3rwRT7K13xkxE1/GfZXQWe5mNZ82DoqqRFGtur4zzYCRKeY8/c+Oi5Cia58s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dGrnB2A+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dGrnB2A+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780929481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X5lgDg697N+xA2/J2FHBBJ4OtUS7k15l2yomn8rv0zs=;
	b=dGrnB2A+3vkSlCaxqzMG+PjJpLCZEiWxbxFQYig+ZovlhMH2RpsyE8wyOiTSxEmtV2pv4X
	Fe13uK5INfZfJUcWHAMRlrPd7g50TywxqDGdBTiLzkdBHl8qIC/CIOP4CRJWAd0EgqhTqa
	wJoO4FqZvP80KYmFhZv6jbTfryTJQl0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-wpheHVQ5NLu2TswqL_ikdw-1; Mon, 08 Jun 2026 10:37:50 -0400
X-MC-Unique: wpheHVQ5NLu2TswqL_ikdw-1
X-Mimecast-MFC-AGG-ID: wpheHVQ5NLu2TswqL_ikdw_1780929469
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-490ae461f8dso32848435e9.1
        for <linux-lvm@lists.linux.dev>; Mon, 08 Jun 2026 07:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929469; x=1781534269;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5lgDg697N+xA2/J2FHBBJ4OtUS7k15l2yomn8rv0zs=;
        b=mnN2EN0HgvAANGv7e6HZEGE93A7YOurBXOdfNMwTEFjqq7ukCL/SPPRb+dHwoSJzRm
         u9gsVR+NSVcCn7X66B6PpmcuOy5wdTreVAanFk3TkJ4EGZzUF/Q2UnUmRrso11kWrzlH
         yVc4HlJ018XmtpiCgNLMzSaY3yzD6gv4Tic2/10BfUs6yxttYASwgjxCIPWjLx6BEwGC
         bX1i4lPQuIcWUj1yBuHmuBIEBy/253YnUJGD8fL65LlHKmNSdulwDBBLI0jnl6eD0PpW
         4PoeqnE7WNX+AyLabYH6R9FRih8OzHfck/Fqsd17sAOKF/AD0HHtGJXbVvilWxiVJg09
         m89Q==
X-Forwarded-Encrypted: i=1; AFNElJ932rXlqh8QXjv/vVcpaiWxbfyo3UnTLPMCYrRUt4wjg5FQsBhioIOSMn39gimiLYbVadVuvaiSios=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxj4kMcI8yyiicfiYl2qGWP5mhinX+HMp4OLfSLx9HTxWhYC5Kx
	kqF20EfjkFDbOX0deaMb0UyqAv9lQW4QEg/mEDL+mCxZRVufOaOzue3+KEp8xFIpUTn/1qJ3wfk
	82c9bf4tjfsf6xw1fwq1uKx+QZjxvl/XIhZgy/BiKVGmk+okf7RaLMxDabXFk6+rM1KmSXw==
X-Gm-Gg: Acq92OEmUdaCMtaV3CWBKAJswNTkKx31lhrUBj84HFRLx+Fs9F4je+oEYw9oIiBlriC
	NgiScqrhvS8zsVS9jM/5QqkZBPZbeiyy9mLg+QFQaMo7AKV1UPmHC6WRNNDRo/Sx1hyd7HJ+wuO
	WW4XDKbVNThKG9Wd5fTg3d7cj5n0Ga67d4hWN3mhMn1xqMTH127mv+o0re65XAHjjKNtaBpHfUi
	zVRwxw5Mc2KDQoqxrn3CK48r36kp9cgop/rQMJDwstPH5Xz2yzuCWx8vdjrcTljwzNITJrM243m
	ZjSzh0XH0Pb9Fjd2b6DCh2yMaZL5QeMFw+kQ1KbliV6Fe3uXj+14az0XYVLc+xjks7CSkMevSl6
	6W2Tp9Zh2m2LY3+/aNQetlyQ=
X-Received: by 2002:a05:600c:34c3:b0:490:5e2a:f924 with SMTP id 5b1f17b1804b1-490c2599e11mr290780305e9.7.1780929468715;
        Mon, 08 Jun 2026 07:37:48 -0700 (PDT)
X-Received: by 2002:a05:600c:34c3:b0:490:5e2a:f924 with SMTP id 5b1f17b1804b1-490c2599e11mr290779665e9.7.1780929468266;
        Mon, 08 Jun 2026 07:37:48 -0700 (PDT)
Received: from [10.43.17.48] ([213.175.37.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b06sm366518585e9.3.2026.06.08.07.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 07:37:47 -0700 (PDT)
Message-ID: <81b8a5ae-050f-4e8d-bf22-551d959174c3@redhat.com>
Date: Mon, 8 Jun 2026 16:37:47 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Reg thin pool chunk size and its impact on discard granularity
To: Lakshmi Narasimhan Sundararajan <lsundararajan@everpuredata.com>,
 linux-lvm@lists.linux.dev
References: <CAFe+wq0JxH3_GZUdoKhxLM7RxbWphNs6fj0aetQ-VY4H3MXe_w@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Organization: RedHat
In-Reply-To: <CAFe+wq0JxH3_GZUdoKhxLM7RxbWphNs6fj0aetQ-VY4H3MXe_w@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Zr6sQivM6GtHr5KdqlFOTFh6DCY67th1T0WM14bmjkA_1780929469
X-Mimecast-Originator: redhat.com
Content-Language: en-US, cs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 04. 06. 26 v 7:00 Lakshmi Narasimhan Sundararajan napsal(a):
> Hi LVM Team! A very good day to you.
> 
> I have a question about the chunk size configuration supported on a
> thin pool and its relation to the exported discard_granularity on the
> many thin volumes from that pool.
> 
> Per the docs, chunk sizes range from 64K to 2M and must be a multiple of 64K.
> So I assume , any integral units of  64K, for example, 192K (which is
> three times 64K, is also supported, even though it's not a power of
> 2).
> 
> Now, I need confirmation on the correct behavior: I've observed that
> thin volumes from a thin pool use the chunk size as the discard
> granularity. To my understanding, the block layer code heavily assumes
> that the discard granularity is a power of 2.
> 
> In this case, this is not honoured, and I do not fully understand the
> reason for or the impact of this behavior. Can you please help me
> understand what this setting means?

Hi

You need to see a difference between released space in thin-pool itself,
and sending TRIM request to underlying storage used for holding data chunks.

Those are 2 'different' operations.

Also typically TRIM is block based aka 4K - so the kernel can send TRIM to 
individual blocks - and then it depends how the storage itself works with this 
- it may need whole internal stripe - i.e. 128K or 256K to be trimmed to have 
some real usefulness.

As you can already see there are several variables which needs to be meet 
together to make TRIM full passing down through whole stack to the core drive 
logic and releasing 'area' within storage.

> a) thin pools can safely support any integral multiple of 64K chunk size
> b) thin volumes always export chunk size as discard granularity
> c) thin volumes exporting a non power of 2 discard granularity implies what?
> d) what else is impacted here outside discard - and its behavior in this case.
> Regular IO activity is fine, as discard granularity do not impact it.
> e) anything else surrounding this context that is relevant to support
> this configuration.
> 
> As always, thank you so much for your inputs.

You are possibly overestimating the need of 'trim'  - modern drives usually do 
not need it - so you may only need this - when thin-pool itself runs on top of 
another 'provisioned' space - where the TRIM might have some sensitivity.

There is 'thin_trim'  currently only 'offline' - which is capable for inactive 
thin-pool to run through and send large 'trims' - essentially equivalence of 
'fstrim' logic - and there is some work being done to make this tool online as 
need this for proper THIN+VDO integration.

On fast modern nvme you might get possibly better performance with disabled 
trim pass-through...

Regards

Zdenek

