Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CD0EEBB
	for <linux-lvm@lists.linux.dev>; Fri, 18 Jul 2025 13:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752846414; cv=none; b=mmvgZiKcymeqEVDM48SSYAajVj3O62qmZ/CvJ/WzrM2Q6mxb/3yep2o5wreVeAXxImzOc3ngLXx9lCcjlhfrYtjpI4/GDyk5Fah3NCPNEl1JIX5mydG4EHRX5ardr/DztMDdr2mOS8EFrKeBVeRZlNG5Udc9wcoZQJtJI8Bb1IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752846414; c=relaxed/simple;
	bh=cSbHr+pqc8kGdP4ldRrtvVQvDyWZBQegLfAYpJitLMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bpgs8ZVqOjy2OfwLfBFEJplVz9FDMO8g2SyuvPF2SZt0u5Z+DB/83RxMFHhO5QpYLaBsqh0xXRM58LO7Jf0UFk4un7HkO+gMRjQ4CJcCQFvnh+2EzueVSCquQvZ4HopXAMccjVtRPiShCzXaJEOrHPoq550PGKkJnOqbnW+7kdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFaKjKQ7; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFaKjKQ7"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae0de1c378fso311510866b.3
        for <linux-lvm@lists.linux.dev>; Fri, 18 Jul 2025 06:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752846411; x=1753451211; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qgp6DveXP4kf661CkjCA5Mzd1JO7eHaY1VJQN/D8+/g=;
        b=SFaKjKQ712q9qNRqZpqjz9X7ifGMs4LTKKsE6yYMmZjwzvvOMxmzjJ2rYeCs6iOYVh
         VuIQHxPCtAF4cSE8mBNbhnA9o1tY1qlkRQ78xroy1dMHp40aBKrt7Oh3aP1S7y5iKCa9
         Im22P0/GX0B+UxOBZXFYeDAB/JykV7ByEDuZHCINvNFLZGrNzYleCaolXi5xx0rJRG3w
         Ri9b3oUFbTS1kpr6rf/GV8uZqfYQOl/ufzYV153NoUom4IWhgcn12IZrS2b6sP/GNVx9
         qCcSr9BvM24BMhOeW0ClFij4S9L9+80Hka3LbRTT9dhIG01XlpK7Q6jHB9wx+ErZMACD
         uxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752846411; x=1753451211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qgp6DveXP4kf661CkjCA5Mzd1JO7eHaY1VJQN/D8+/g=;
        b=h8LVJIfsuzndelpgm7Cg0Xi3ujeIuKNGQzAAfXKtCMcb8zJcT0sWwX0atNhEO4WvVH
         DVMho/fzGtwftmbLsJG5SLhFOx2jTcOUvL+LjvHUH3EwofRMkvrqh4+/n+2/nYtmSmyx
         PuHvDT64ocVI9uXZ/NtNIqkYt9NtKp03/ikBrkIlyDl5hSoHNQNmo/N3vMftOVLYBbbe
         gN1sTNwcSM7zdN0uDbvy7C7Euup76cdqD898uBFcMuHRkYoshTvSyEEce4u4rnWFeFkv
         0XrcYWRt3E602V6kRqF+3/JBFFk2nj7dlebece4Li8pn1e5kz/dhAaKSz/qdNAlDsb9R
         ovVw==
X-Forwarded-Encrypted: i=1; AJvYcCXdPd5a3RUrM+8NR3XyZ3vUxCAV1TNF2KOLk5QtqOr7XsiiSMaLtlb3gJSZrmCo51bssDLTb+Nx6Rc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7UQftUmWkqmLfIG/wPzhVjaBmjqgDfV1HSQMDNb/ehjDsChQ3
	FTAbp7rzXXM3SDB7MWALUmVOjcf7UcuVkp9e3a+5O0TIUPPDo63bAZqAooddVDCa
X-Gm-Gg: ASbGncttGAPlVp7iAY/ZkoF9PkAFDRZ0X277zp1LAPS1c9QNe1sfNmwHQ9ySB51Is2j
	Mvhinj6l2bDB5xuq1O2Trjmlo6ztvSUZrXEaXx6mNdeSTiPOFTTMdlhPL44nvbJahL6JHutwtrc
	oPvdCRHJnrmGy/IuQCZd0FyXHUzVLo2yACKjZhxeDXUhEjm3ItDIrgWy85JBMUi1DSoU/ujyZJK
	n+D+N86EdZyYNOj8FKpxlIRBacwvII7GqfZtY5maoIGJXOjRgS4fxUciNZuC0RL88UZeWDxEeS+
	euuwVniNtHJ4l8gzc1U+/2WoRneb9bi1YyvlkfSJxOA+bEGwHuDbaSXKlxQlU4GYDUdEiYPzSgH
	JxidFdiqEBDEcqUfMPCxNXO7lECqXGA==
X-Google-Smtp-Source: AGHT+IEzA5cGKt7y0nmx2uFckGw8DlEha8aLZjSJCxAWovy4as1wzxdr6xv+IkVjc3Edh+sj80rwlA==
X-Received: by 2002:a17:907:f1e9:b0:ae0:635c:a400 with SMTP id a640c23a62f3a-ae9ce196c5fmr964873366b.51.1752846410593;
        Fri, 18 Jul 2025 06:46:50 -0700 (PDT)
Received: from [10.43.17.17] ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79b8bcsm125768466b.13.2025.07.18.06.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 06:46:50 -0700 (PDT)
Message-ID: <9f6afc0d-ce58-472a-942b-15527f693d28@gmail.com>
Date: Fri, 18 Jul 2025 15:46:49 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: striped LV and expected performance
To: "Henry, Andrew" <andrew.henry@eon.se>,
 "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
References: <FR6P281MB3672085D192D8BF5CB45CFE4EB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <FR6P281MB36727398D141AD2A1A1E76DAEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <67b28bf7-b862-4878-8434-aaf0d157f2ca@gmail.com>
 <FR6P281MB3672F7D1B62E229AFCD31D0DEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <FR6P281MB3672F7D1B62E229AFCD31D0DEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 18. 07. 25 v 14:24 Henry, Andrew napsal(a):
>> Maybe you virtual system does have it self 'a single write pipe' - so any parallelization is stopped right there - so maybe you should start first with bare metal....
> 
> This is what I suspect is happening, as the back-end storage is very fast.  I'm going to test on a physical server instead.
> 
> /AH

It's crucially important to be sure - you have independent drives & controller 
paths to them.

It's really pointless trying to setup a 'stripe' on top of 3 drives that are 
at the end served by a singly physical storage behind the scene - this likely 
can explain rather horrible numbers you get when you are trying to use stripe 
-  in such case simply join devices 1-by-1....

Zdenek

