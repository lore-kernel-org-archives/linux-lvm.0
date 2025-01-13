Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319361CAA87
	for <linux-lvm@lists.linux.dev>; Mon, 13 Jan 2025 13:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736776020; cv=none; b=QD23CRVjdXOfczt2QWpWxuIH2KBn+9rN8FaXZZRv0LoHy8YeBaG7ZpxOKSANNzau+bQtWdKBDMZLkxPZXvu24c7M4FLyB+I98uH6joTZAasDnE1OQIrvQkIFaHaL07xYvWmtYpffNPD0YklSlaZWKhJUmwtMD6W69bDlndEIdPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736776020; c=relaxed/simple;
	bh=UqzX8omYAI+TC+KIaanR/SX09FZcVtisBscg9EwB6gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DV4bAwh4rjSdsQR8qaBNcqZaMtubXrQ6/HIxvgHW91cOb0aTvEg1VnGtHZfC6O4RO5ymG3Y2ZjmGbjS5pg/cPCehiy/wDHCwlvme9vSnNGHGTXtRbNIOoK8aVpB5KtnFjDp1E90UnB/cv0S2J1QV7Daz0JPwL6iFCwiCVwwgZGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFECj2zy; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFECj2zy"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385df53e559so3473151f8f.3
        for <linux-lvm@lists.linux.dev>; Mon, 13 Jan 2025 05:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736776015; x=1737380815; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:newsgroups:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ROC9t7h9P6i0wSw+6w4CzyZftSGrGb9ttI75MJ/Z7mU=;
        b=cFECj2zyOluCq3gfOm9LX9n4fhfCqv5Z3PS6U1iA3fKdAw4H3tsPUAm9IsUpuLTQhu
         P9BkPm9aYFl+3W6W8aHWcFQFBrfCPO8E8JC21c/BeiJ+NGAL9BDpZxzm51aJO6wfbFEN
         guwtCniLPOxmwMko7r5GGBX7/OAH1g4LVTRAHN3shDC7jWjLrTsdcT8QRj18dn1IS1+G
         tLDsiMU7tnBKOzp/FTswbLFCmVVNP5jweRBFoV84fAqyjKsLMARsbeG9NHFhj906jHqk
         GsGIn8BYDUb1AgC+93/uF57PpAjBh1N3XCBCNH4gwz2KnT7YJl/D+i/5FZ269w0RRZIw
         IZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736776015; x=1737380815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:newsgroups:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROC9t7h9P6i0wSw+6w4CzyZftSGrGb9ttI75MJ/Z7mU=;
        b=mXRt5sN7q8REYFYV/tXByNrVLRxJ71TRgxujIF/Gw4O1BDCcAVKGI5r5ELXcILpAWC
         p3qtHQIZ/iuz0YyeMjirI7GQFi51IQPpRg0eS68JTXnMOgLNnNRGXYQo45JlAZB8xJ+J
         h0qjEvFOe+/XzywlB1azqK7hUxRUYDvWghjFzit+1N8GFJLamv5EA0Zms5UxeiFZRqur
         rTjiL5pPKp47ajHKWyTC+mBx7udLYrv2irEBHVymFrJwsxAYn/D8U7Xc8gene5O2wLZm
         6jAeQgbAR3BWAKFxcT6jn14iU0pZ/E2BZgndhZRTMemoYIbGlU8M3ACZ5ENAJJTgATdL
         miFg==
X-Forwarded-Encrypted: i=1; AJvYcCXVFLmF56jVhTe/CbrruZYNcs+x8PnTxu8SsffAJ/ReAcvRi7ZnRUOjzX+bjPo83HdV4xvd4QwiVSQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyETQpv5SsZmSvsdciqnxAjjxGTDU72jh6GG1DSXnLrRlOZ6/sJ
	4rAXsE2Epv0M54SJ9ay1R5Fh1lP/KAfPxQ/uRuDKqsHyImgyBUkk
X-Gm-Gg: ASbGncs9JtvHe+Qk3lXR0R42Rb/OYsrvOgj8kmLTlBZ0tCLUCcatXioGeVRO037ODZs
	2OMs/SQuqi6do/8/q7SMZnycgJTWtNUcTRgmDeDty023cWm7ElMFgs7VuQavl4TTIYsjZXaS3sx
	HRQb9h/lUtyzQqkzI/XztwZKemNpR0vo5930JiZsnj1GdR+LCJA3Nkv96W+8Q8SsuH0TSH8u26w
	BkyPwqWF5UCVaBmGwVITPPUFpXi3f+GIU/2GEaLG0mpUlGO3Tr/OFlr8ofcUIP/349rc03a1Z6R
	lscC3YEuyAmUiQ==
X-Google-Smtp-Source: AGHT+IGPZSbGPRAEpAkMltoADJbVRXPIl+UHa1PLnBMNbpyOwQlZQKd3dM0IHS7ccVTOBY7So/i9pA==
X-Received: by 2002:a05:6000:1a85:b0:38a:4184:1520 with SMTP id ffacd0b85a97d-38a872eb1eamr17205198f8f.27.1736776015356;
        Mon, 13 Jan 2025 05:46:55 -0800 (PST)
Received: from [10.43.17.62] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37e36asm11972270f8f.5.2025.01.13.05.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 05:46:54 -0800 (PST)
Message-ID: <47cbadf5-fa07-4e9d-8bd2-9cf969777f4e@gmail.com>
Date: Mon, 13 Jan 2025 14:46:53 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pvresize after pvcreate changes PV size: expected?
To: Tilman Vogel <tilman.vogel@gmail.com>, linux-lvm@lists.linux.dev
Newsgroups: gmane.linux.lvm.general
References: <CAAbQbbCN-=DDSerkOoKHCHxwA9gu32HvsCezOHU4NhR0cByKpA@mail.gmail.com>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CAAbQbbCN-=DDSerkOoKHCHxwA9gu32HvsCezOHU4NhR0cByKpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 11. 01. 25 v 23:21 Tilman Vogel napsal(a):
> Hi!
> 
> I just encountered the following and do not understand it. The confusing part 
> is that when I run pvresize without size parameter directly after pvcreate, 
> the size still seems to change even though pvcreate of course also uses the 
> underlying device size just as pvresize should.
> 
> I am attaching the test.sh for your reference.
> 
> What am I missing?
> 

Hi

You are missing that the actual size of usable count of PV extents  is not 
changed by a single bit.

The surrounding accounting changes with the lvm2 metadata content size accounting.

For a user of a PV it's important there is 24 free extents of 4MiB each in 
this case and this gives a usable size for LVs.

Rest is either unused alignment space or space dedicated to PV header & lvm2 
metadata.  This space is accounted a  bit differently when you create a new PV
or you work with already existing PV with already existing lvm2 metadata area.
Yeah - it might be possibly 'addressed' better and PV could be readjusted 
after initial create - but it's not a bug - so it avoids 'extra' clutering
of PV header space when it's not really necessary  (as unlike lvm2 metadata, 
PV header space is not using any backups - so the less it's touched, the 
better....)

Regards

Zdenek


PS: for small PV sizes like in this case - using smaller  extent size  (i.e. 
256K, and reducing metadata size to i.e. 192K) may  'boost' usable  space for LVs.

