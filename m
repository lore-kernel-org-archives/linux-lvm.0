Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FD61DFC8
	for <linux-lvm@lists.linux.dev>; Wed, 17 Jan 2024 11:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705492118; cv=none; b=ARvB0dHr6VhhKLhzjAlAt0sKmkdm9/ep+XoGK6BZcqFo7syF6Uf5PhTXzNEXheGa9zIKSeQGK6ZHb5TdiIdouCDeBvT2eNfMmYr+KtSzIS32cRow5dQqIoKB1fW+tRI8+0H9aZyscMeF7bvLbzXXYZhufg71v3DLlrqC7RcwZX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705492118; c=relaxed/simple;
	bh=ZgTOIV9vnM3jxcwimycJ7OsZxpbT0b2afrbVZM4J9pk=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=ZCchfZAzqX32wOYUglXUshwHCGwMYSsTqfCyHXqgoa1EYbe4pCD7OjpW3ndSb+vetKD0i6uNt06ncgp2Z2oWQTuMIziFJMVsV8+mlVHUdKtbnG36wZWEr9ru4OY+3B5xvbwO1x44Xe1Xb+qV9affyNBn9xeMAat/MeCkKs7zixI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/16PfMf; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/16PfMf"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40e8ca16511so2107225e9.2
        for <linux-lvm@lists.linux.dev>; Wed, 17 Jan 2024 03:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705492115; x=1706096915; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OjrLntDp2sIWIhfkzVJ+8DzVY38Cmsm9xWCyp3hKGbk=;
        b=g/16PfMfpf9eeduQhq4RZsfcudp8DV3lKt9LDtYb8PH/IrEdGHh54oDmBB+3mJn8AZ
         I5/CvLxJ9iYERKROVIk8R76BPjaaoB10Quw46ulVGcQZppkjUadP4IAsYpHYqxV7sAz+
         ze7buuxrIN61ZOvvQSTtRK1+yyUH85lhntzG8HP6EFXIOPeRufzbYulFNTtWjzKqPDVz
         IvFV8pJVbYiisJSRiV9nnbUvkSz4IHUrqfHoiIsaFy+E1FIv1HPiqADqmaY7qNkGLNVi
         c0mN5HTuSRizbz5xojOYej/j9ApSmFcuzgwBZvRLx3olu+9AKP5Rr3U+Qb2RsZo7/VnR
         3y6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705492115; x=1706096915;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OjrLntDp2sIWIhfkzVJ+8DzVY38Cmsm9xWCyp3hKGbk=;
        b=IvK9PZriUR6iKk9p8jB1qlBJP2syZfJg0KtwyXdkICTMuprTT37XRwELJQWzL8Nzd0
         22ZQpU2T/HABSkJCoKynj9SoNVynTPKIR08A+hAjdwiIqP3fbGL+bqRfw0SuMj5yH+P8
         YFsU68Nb8lAf10u0scFSSpjmZV+mKVfU3WFHdVjYuYqayd2A8h/7zPY6oPkExS16hJoZ
         JcmoGhTx1qy36cUyPaB80DPafGato25MWgQ3bVbbPJa8jR7WXD25kxEvyfcWoqzAHxxP
         qhQYRY36WNuix2W7ynhsQXuNLW5SbzLqGukjjHHNymcmms72v9N0qTNphzscoPfCD3C/
         1GsQ==
X-Gm-Message-State: AOJu0Yz/tlnMi9eq1P2ILEXpkg6nQV8VkH9MV2lQPSOSMYJOMnv/HO5e
	r+DMrB3gNN9vPppH6IR3fi4=
X-Google-Smtp-Source: AGHT+IELtH4hLToRzlr90z3LheKsEOHngi5o7uVBdz2TddAwVteAyAG/7zzniivS3tYcHSJ+D2EUqg==
X-Received: by 2002:a05:600c:5122:b0:40e:5cf9:ef92 with SMTP id o34-20020a05600c512200b0040e5cf9ef92mr5620799wms.105.1705492115193;
        Wed, 17 Jan 2024 03:48:35 -0800 (PST)
Received: from [10.43.17.38] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id n15-20020a05600c3b8f00b0040d5a5c523csm26360396wms.1.2024.01.17.03.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 03:48:34 -0800 (PST)
Message-ID: <b8913e84-6ec1-4c79-9ba7-baa7783c46ef@gmail.com>
Date: Wed, 17 Jan 2024 12:48:32 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Any way in LVM to deal with 512e vs 4Kn physical devices?
Content-Language: en-US, cs
To: Andy Smith <andy@strugglers.net>
Cc: linux-lvm@lists.linux.dev
References: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
 <451707ab-ec8e-8f19-6813-445a184fda3a@service4.ru>
 <ZabkWx401gDBehBZ@mail.bitfolk.com>
 <fbaf0486-790a-48a2-b9f3-f7a1c8e30952@gmail.com>
 <Zae4RzvB2EJxLf2W@mail.bitfolk.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <Zae4RzvB2EJxLf2W@mail.bitfolk.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 17. 01. 24 v 12:21 Andy Smith napsal(a):
> Hi Zdenek,
> 
> On Wed, Jan 17, 2024 at 11:36:24AM +0100, Zdenek Kabelac wrote:
>> Lvm tool as such doesn't really have any problems with mixing 4K and 512b
>> disks within a single VG
> 
> That's interesting, though in my case I have done a block-based
> copy of an LV from a system where all PVs are 512b to one where all
> PVs are 4K.
> 
> So out of interest, what does LVM do when one PV within same VG says
> 512b and another says 4K - just pass on 512b for every LV I assume,
> unless allow_mixed_block_size is set as you mention?

lvm2 does nothing with disks.
How they are configured, that way they work.

There is nothing that would try to make 4K disks to be like 512b.

Although I believe there were some DM targets for such emulation built, but 
they are not upstream.

So if user had an old VG with mixed blocks created before protection was added 
to lvm2 -- they will continue to work with all the 'risks' - and lvm2 will 
show up some warnings here and there.

With new disks users are not allowed (by default) to mix them together with 
one VG.

Regards

Zdenek



