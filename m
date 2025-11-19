Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551B742AA9
	for <linux-lvm@lists.linux.dev>; Wed, 19 Nov 2025 18:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763575923; cv=none; b=UoH5tjXxzXYZFbMNvW3mhi3iNnDM4O/3OrkDia4iKP6UpxUG5tvlsa8ZSw2mYXYfeEWcW7s46fJYygVLIL2MNrWTwj/VGW5thE5cepmhNe2mQMGuGgrNuuH2iQ+kWtgZ8cTDe29cBcFQtRD5M3VjcQDMe4+XOmj7qF0e5y+TCBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763575923; c=relaxed/simple;
	bh=90rmO7iuM1rizlzgSgBJC565MiDCJu7n6O8qbI0h8Dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ceQTw6385F6PlUB9ckZW7dVBlXe4mAOmlZAK1qqnVu5O0Wck8/LcIKsOcz5qYkoze7Eqnr/XU1R4Zu9y04J0JoaVMuQycLeLC1MCf+qrRzQ2QW3kOH/sVMQXyHXLU/ALpR9uKIWd6bcmPQcGsxVVVAGdwG3V2V8WE6VYsy8GMAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ry0YeStk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ry0YeStk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47789cd2083so377775e9.2
        for <linux-lvm@lists.linux.dev>; Wed, 19 Nov 2025 10:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763575914; x=1764180714; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JHlCVtyHYa11JZ/5cEm9yq5x6frrqZR4DX9py0JzQlc=;
        b=Ry0YeStkT/pVF0tm/dcALQKkxSgjdPcWcx5eraiW5Y5eID8L8C/U4BCUTJ9coCbII2
         XDnouyZWdzw1GidvjDBPgW12MpoNwamzRt6oYaHK+iIhQWVnNTFPbFi6notNFJNJW4og
         zy2u1RKkwRVFJZ9NQaKoH6X7jbrD8Ct528zStq8i04WjhXJ7XqFKhxIPp/mRrGMJlm5V
         BdvBHyV1AsqBE5kwvPvfRg2BM9+dCMqDobZ5c+c9t0GuwE/ITh31OVyjzDUqwvdAVD+j
         l/WDzGDGoY7eWRCzG6SSGSYhfVZj8A2EBD1N7st6pHjNWvE+VPEPwtxAY54SqULCeR3s
         gh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763575914; x=1764180714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHlCVtyHYa11JZ/5cEm9yq5x6frrqZR4DX9py0JzQlc=;
        b=XDebQurru6NFyu4Guu0fAmEyDJSr6ykW8c0FBfFE0Lzk3/3aq+Icg1edw78GUx9n77
         w41JOsgUbtZkBBxEr6Hl1Bxl+FCbdWW+IfCVgqYqYweeFPzgDk/JiergiHQNgE0ghl0r
         XRDkrLekAxL2+AEbO+EK9JRr0h3HD3x3OG5xLjAv05lNktmJyn8CplTNk0QZIEMeK/PR
         9Zni0YbdFiZreGEKsQGv99VhkCOgEKopL9+TaO7WxCQ1CZ7Kp7wP8SuR9MH0HdyXq6ni
         Rz3/MkTLJcnPjlfqk/yspZ5QW8Ajy/PoIFlQJ790oPs+s70TxIkNLD5eDPBZ4jvZSzsV
         SLzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjCc+eu0Rxojvj3UdehOtb9easIGWYxOC9TRXADnPAsn95smMX7CDguoVUJ33ZsViGVMZDzIyyV4I=@lists.linux.dev
X-Gm-Message-State: AOJu0YztHkbzzwYMK/YGwF4Lu+mZ5yRTe5kqaZgdsIlxna/e0RWqP/0L
	ViCyy3t5qOEr0wPixjEM2AKTHoErMODroTljHhlN12KE9noOATqzYm+Xz4GJRg==
X-Gm-Gg: ASbGncsDqjSthpR0+Pw1MssUBER6qRjfG3BDxfBXsrCkpjQ852Gyf+Jf0vf7yU7mOCk
	t7mXK6dBqRksZubV8BN2ncZQE6LWmkE3i0xHspzVFFvN/YQPe0h2pf2O7YKwMYKeoObnOjUPwuY
	uytz2Vsvid9ELHba/I6iQQ/smW9JQoqu9Zm/U/dhWOsmZb/V+NoKAbZ5OVTYhh9PQ86ER2cFMqs
	HRSetxUeCr5HS588PsR0AePuobWFhzknzkThZhLhvpbKi2O2JHa3OVAaWzi78aYMrJkAah+7uC3
	wDFiZ9Q1KrU6t1jsL6i7PNxuPm3L0SrLcNOhrMuYcCQhgcHee1DUJZ1yPaV4Bw1D+DhQR4Qm2h6
	hpBW2/jz4CdNRZUCkJfYJVrIJQWAlkqbV9Ecq+zWbTE9sm1V9LTsM5sPWE0PT1KLssSFsYh+z3e
	mKribZmKr6hgojGJ2ykOTHWlJ2ISHX2i5wk+t6WEVkY8I=
X-Google-Smtp-Source: AGHT+IGH4TvZkkgiwsUOqg03tnSWXnekka4OM2WkbVw/yHdFtNIeEYdK0c6T1DGMMYEe12kbfwydrA==
X-Received: by 2002:a05:600c:46d0:b0:477:aed0:f403 with SMTP id 5b1f17b1804b1-477b8a64734mr1651665e9.8.1763575913370;
        Wed, 19 Nov 2025 10:11:53 -0800 (PST)
Received: from [192.168.0.111] ([212.20.115.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9e19875sm44432885e9.16.2025.11.19.10.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 10:11:52 -0800 (PST)
Message-ID: <51838d90-cdd7-4e1d-bc9c-9f1ae0e29caf@gmail.com>
Date: Wed, 19 Nov 2025 19:11:52 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pvmove thin volume doesn't move
To: "Brian J. Murrell" <brian@interlinx.bc.ca>,
 "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
References: <be9db13beb543be237fa069e3c72e22e1df2446c.camel@interlinx.bc.ca>
 <1b6fb117-7283-4ba9-91ee-7412a2d77b3d@gmail.com>
 <29209080-c09b-40df-86c3-f22c1d7f6520@interlinx.bc.ca>
 <5067ec8d-991b-4b90-ad3b-f9dbbb0472d5@gmail.com>
 <81e51a5ad8f9c32610b8262447af635da81d53c3.camel@interlinx.bc.ca>
 <3620fc27-e54b-472d-bc82-be01f7b2739b@gmail.com>
 <6D706D06-AB0F-4C55-9F68-E8E07926A511@yahoo.com>
 <9c2a15d0-0d7d-4462-af43-83221c2ecbdd@gmail.com>
 <94679191.5310372.1763572932545@mail.yahoo.com>
 <42516759-f09a-407a-9c2d-1f82d0db19af@gmail.com>
 <cd5a3a1b5560f8634b434220a828b535c7a5ebe6.camel@interlinx.bc.ca>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <cd5a3a1b5560f8634b434220a828b535c7a5ebe6.camel@interlinx.bc.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 19. 11. 25 v 18:38 Brian J. Murrell napsal(a):
> On Wed, 2025-11-19 at 18:31 +0100, Zdenek Kabelac wrote:
>>
>> I've been also thinking - that adding support of 'dumb' mirroring of
>> thinLV
>> into pvmove - isn't a very difficult request - so we will see -
>> although
>> obviously copying  10TiB empty thin volume isn't going to be 'a fast
>> operation' this way - but it's not any worse then a 'dd'.
> 
> Not any worse than 'dd' would be more than acceptable.  How can
> anything be faster at physically moving data than dd as it is usually
> only slowed by the speed of the storage in any case?

If the tool would have known 'which areas' are  mapped  (which knows thin-pool 
target internally) then it would need to copy only those blocks.
(this can be just small fraction of the hole volume size)

On a device level - we see 'just' zero areas - but those need to be mirrored - 
as on this level there no difference between 'zero' and 'unwritten' data.

(Btw with this knowledge the Joe's  blk-archive tools is working)

Zdenek
