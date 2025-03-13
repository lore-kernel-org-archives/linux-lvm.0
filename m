Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73701CAA6E
	for <linux-lvm@lists.linux.dev>; Thu, 13 Mar 2025 18:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741892099; cv=none; b=KoKL+hmS5JtLcRCnbZmNBhJ6EAzjnyqawXp6tC9hJlxUMiBu5YTL+b8VtUMDe/UB75Q5K6SQo+dSlzAQ5t/vKuawAdjKZUzo8QHZMtF8Ne1F8g0GXe4KuM+fice3qC7yZJBex30CDWX3/d8AtnBmhcM36cchtosHCx7gp3dfVYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741892099; c=relaxed/simple;
	bh=dcjnzWPw1+wTxdFNEwgj4acTqkR6TfPwefRhgiqJP/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HwxIFOOhgjghjNtbI4n/pl46rN+NxSlt6XsL9LE2+aZK36z+q/i+jqJhv+v/aShDZCRUTmvCNvyqEbWpgm3sUw8MBBvwg0dmndfMToyRI7724eXo1Bh0WsSApRgEsWK1Jld6Lc7T7RhEBuMZWt44KU7qlqG6KcC2gVp6wQCWZng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlVfiXu6; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlVfiXu6"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-390cf7458f5so1057088f8f.2
        for <linux-lvm@lists.linux.dev>; Thu, 13 Mar 2025 11:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741892096; x=1742496896; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b6ABEft/5A9JjODU62XvAX40j1Yrra7xRrcYnYA3N3Q=;
        b=QlVfiXu67WXn+EmTgmLlP4GS+D+3y0YOp5bm+JaVRPb7OPT48XPJ5E5GhyNWq6ur+G
         NXirsqn0ZRRRs0nr+yKTAb0Oyn/clqsM8Csgjch0kkfV81usWquq2WjgqeL46R9RxHqF
         wUIkw8MW2X9etk6s6Io4e9j+/ojpXyM+TugYY4sME32ATsKxnenIrDe65B7GhD2JH8GT
         RlcOa12uPQnnC6ObrOONhfd3ypMKxmkDEvbxfVNMtcVkWfn2+LI8+mHJP0FUaZPr+kzH
         6LIteuFlMarUMrIn8tG2jup/J/t1Incy0opQMg5BdoDQQm8/At0zAEbf9n9s6+ph8B6J
         T6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741892096; x=1742496896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b6ABEft/5A9JjODU62XvAX40j1Yrra7xRrcYnYA3N3Q=;
        b=d7klsSCJeW+ReNba/9zSwv2OdANz6zWRulZQoV6I/ahKUD710xGVY8Yu7LynwOJ9bD
         BBodHlDjHfiWeBzgIi+b8iVpgSmXYrCJEXxaJFU0+myl8r1HPEOqj3yXKtil+x9ag9y/
         lL+SZ4hKlwW5DFVlBbp8AchvqNDt1tcRlnjv1QEX7oAQnNAOHijo4rnq+A2+zys+u9HZ
         DsRInoaCh9PEToR9u6UDEVs+wgsDePcK9K8LMzY7Dec/shdBVcEv/o5Yu/P+YFEHTLtE
         ysbYWbmbH8hD6N8nt0KJFZxV6BIH2R5yTauYrSJuJCkYwJK6uOT3mhgekjZ5n9el3+SL
         MgSA==
X-Forwarded-Encrypted: i=1; AJvYcCVXFuMSzUlb8dpJQWC6bU17zf6iHVOW8+X/nbNr2S7uL8JgqFYWy0bJh5SMbtqFNjuE/jpxRqO2hRA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0NhAaFW4gf21GrhLYH17KUrxLfK81P16uvRx/I1z8yIm4SNK3
	2RRorQNUj6dQ/LZWFroEPRkuu2xQkwjVKKttrH65YsP/XKh7J0vDT0iF5EsS
X-Gm-Gg: ASbGncvQev2SLzjEDFWGlE9MhJEgVHYyt+KwQXLbTraW7dyTYi8LZkt1B5cGWixMJq+
	Ft6nKXU3ao/c9a/8Jg7HPokTB/XzijQNlosHJ2xVeCG2v/P9sRQYT+Nm64zHto2FIjpbUZbL7gq
	oBwhppXW2gEmKYD0qXb2RtXVyd9L9AXvyDSoInWwLoaKYqYOp3GZNcB/W4pJNhTrbILDkPNIwWf
	FCvoKqTkGDupt19+Jwjjhtr7RhQqftIynRkH4JBixj/dZeNy0z1cZl3sdTm/HcIN+OXCvdqtPlD
	0aS2+At73+SPzg0B2cdOgjF3N3DeRkIYOsu71qtlLUxlWwSHxKZPCJ8Xcd5yOxE/lkp52YacjWX
	ZnV6HuwzZrtRb5EAA+dVeR2I=
X-Google-Smtp-Source: AGHT+IG/vFhvF8iXaDPjVHYlYhUztSEiY5cp/40fHbR3CjmOl9McKo90CfQZfVvBAY4lLBpxQfNNaw==
X-Received: by 2002:a5d:6d04:0:b0:391:487f:27e7 with SMTP id ffacd0b85a97d-396c4102e64mr653493f8f.55.1741892095979;
        Thu, 13 Mar 2025 11:54:55 -0700 (PDT)
Received: from ?IPV6:2a03:a900:1000:7e9:403e:7c8b:351b:f333? ([2a03:a900:1000:7e9:403e:7c8b:351b:f333])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6a5esm2928645f8f.27.2025.03.13.11.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 11:54:55 -0700 (PDT)
Message-ID: <c75b67e6-fff1-4a06-8abb-e0501bb039c3@gmail.com>
Date: Thu, 13 Mar 2025 19:54:54 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Converting thin stripe volume to linear
To: Patrick Hemmer <phemmer+lvm@stormcloud9.net>, linux-lvm@lists.linux.dev
References: <0eb680b5-ad45-45e6-bc17-de052aa583a1@app.fastmail.com>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <0eb680b5-ad45-45e6-bc17-de052aa583a1@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 13. 03. 25 v 1:38 Patrick Hemmer napsal(a):
> I've got a LVM thin stripe volume across 2 drives that I'm trying to migrate to a new larger single drive (getting rid of the old drives). Following various information on the subject, it seems the procedure here is to first convert from stripe to mirror, and then from mirror to linear. While attempting this, I seem to have hit an issue on the second part of that process, and am not having much luck resolving it.

Hi

Likely you can convert your nearly full thin-pool with a single thin volume to 
a linear  LV by just taking  'dd' copy of  if=/dev/thin of=/dev/linear - using 
direct io option (and this can be actually faster then raid mirroring).

If you are converting _tdata - you are basically using raid1 for _tdata - but 
that is no help to convert anything to linear - _tdata holds 'chunks' and how 
these chunks are 'mapped' to 'create' your thinLV looking like a 'linear block 
device' is fully in control by a thin-pool target and the use of _tmeta content.

While lvm2 could eventually add support doing a raid for thinLV - so you can 
have your duplicate made while your device is online and in-use - currently 
there is no such variant support - so you need to  'activate'  thinLV
and without any use/mounting take a  'dd' copy.

> 
> Any idea how I get past this point? I could just build a completely new logical volume and manually copy the data, but there's around 40 logical volumes on this thin pool, many of which are snapshots, so would be much easier to just convert it if possible.

Well once you go to thin-pool, there is no other route to go back to linear 
other then 'manual copy' (and no one has even requested such feature).

Regards

Zdenek

