Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06099256C7C
	for <linux-lvm@lists.linux.dev>; Tue, 24 Jun 2025 08:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750752545; cv=none; b=WBAubgqDsREAPFq8NmkSsPUFvwJd7sJJ5pScusdGAhtAp5qC5VXyvW8ZJtOSCl+gewTfu5JVn6h9AcxaOX8lG84iwug8/qkdzm9dM9U7UUFd2Kx26pg6K2+rnq07sMbK6BqiFwq641DqE4plElcZBEJRE4XinUlELrUYPV8dtjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750752545; c=relaxed/simple;
	bh=0rgk26ilf+hrsCVREnCEw+C/vg6zVywXMf7weanqs5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Z7D6Ruw/Br7Ckcdnn4nTzeeaXt1Qgex1Y+fy4fvumssFr4+9S/mTYOtCFDYBrF982s/4mYc7mOzA2Izh/j2ZhaCwtgHxUIrGKNi/jjEfhxBmdYaDPz1puXhZO8gYx/WiV4fjU9GH3Zw4wHusyS914xvPxjiA+jFTtVy8d851UJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmNJSax9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmNJSax9"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-453066fad06so948975e9.2
        for <linux-lvm@lists.linux.dev>; Tue, 24 Jun 2025 01:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750752542; x=1751357342; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+M6uYcX5KehXCfPviAbraSWw077184Oft4jgDuG5iqs=;
        b=jmNJSax9mdyWzP7xRzH3ksOMjL+kryZIPoX1vmafdrYEBg6TVRL81n+ppved5h+03K
         AHhDIlPC9AkXypEWeCuV/uC0W0fLTZFJCJ3bWs+xCLwUEIlV79uBPnSGwoLZRBlHg2uK
         9hxhr17y/1/DoAUurv2PtHJehDFCH/XhzyvOROHlOEXqEIwIOxh/hiKJsUGb/Cd7G2dD
         I5W9mdcCfLuMmsMqy4/8OHRbNmd2RHPuRhHqu7yvVRpAenTOto2kwl6E1Wh3pw1JDXBi
         agm5QA0N+0IF+qJzeg14jQtjebYJgb0bJgrPHYTUoYPDAoDUW88vRj5ySngB2Whj7N2i
         N6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750752542; x=1751357342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+M6uYcX5KehXCfPviAbraSWw077184Oft4jgDuG5iqs=;
        b=JQAdC8dDudrNqeFDsvqB+qCeOpC9NzxRmmKH3vMErB3y4SfwHCfgwEz8YoP7C5eYeL
         RSzq1NFmf0OIpVDI704cjRuMtlW69OxvwRZOXIZgTtiV69oTfxctdp11gCtARuCwEscA
         88/J99gi4m4XbwqSiLLVAutTvejRD9ouf2m1YqDpdWmWbc2m8MWbFbmLqagzdtXVLVvb
         PX3fFvJedmxO0Qo/RVDH6z4oF/kB0SbRuN2l29BsYq6QTxagXML1f2RntFim1NJN03k8
         HA3YDiDNN4KGBKwG6UhBmagG2BaK38FuSwFW9Cgi9Npwvj8WP6bPf8IoP9sFe0txv4eJ
         8/nQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2sAmN7pzPqAM8ux4xhcnQX22fgLLVGcGA1UccpQGjAtH9vu6EesrfV7nHCqlzx/184TkCGyR9Wb0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1EBw4WW7JQHyP/FbCXUXKvlxCxWkVUlakvYAtxljsxvb65PU4
	/aoGGj7HTOkcgth2dJKNYm8n8+cCD2pRi5NVuvxxJ3I66b4DM32iwvxxCMUgWTBU
X-Gm-Gg: ASbGncvHFQN4fFWZn2i5nreLfd+rk6vk92wY5RRPaZj8g/4Bpe8VJzTutUAMQxkQFcs
	mtpGdm3N08lLh69Ep8cZKtkK4Q4a2Wk6W2AsY00nBwUnSqGoXivp2sE9QnMpQtr2sCK9Mid7jmm
	c96rp3SPr3ebEnObjINl4++wFeSeIUZnKCnaGDOkn6xoq5gbZn6HZKA87ATP81M1UVb4xdAFRsI
	pXAIX8qPqW5pdbhaokeIcJBifs6e2yOCCf8ImRKg/hR+M2vhZM/jx9vB9UfkfY3iOocyL2C3spe
	xqO4IGIdw5wT/YZbbgUJs3Da7VuuqLOaJ1eMCkMKkDPtFAM3FId2OdiNzINzob8mlFa8ZQ==
X-Google-Smtp-Source: AGHT+IF93JZuAZ00ivEAjEMSjvkYDJ8wudlyfIYqxfmvF4M1e6K8qh1Kd3LOuoDcorvfh5Os1PxZcg==
X-Received: by 2002:a05:600c:870b:b0:43c:fe90:1282 with SMTP id 5b1f17b1804b1-4537bcd6ce9mr14832705e9.7.1750752542112;
        Tue, 24 Jun 2025 01:09:02 -0700 (PDT)
Received: from [192.168.0.107] ([176.221.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45361461375sm151034955e9.14.2025.06.24.01.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 01:09:01 -0700 (PDT)
Message-ID: <c2160f08-bd22-4a79-9202-26c10cb26674@gmail.com>
Date: Tue, 24 Jun 2025 12:09:00 +0400
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to detect when LVM RAID1 is in sync for write mostly?
To: Pickles Creator <picklesthecreator@gmail.com>, linux-lvm@lists.linux.dev
References: <CAF2YDE7-qsKbpexT+GkiMr8_YtRdnV1N2p0JVWOyEPXSS-xjqA@mail.gmail.com>
Content-Language: en-US
From: decayhonor@gmail.com
In-Reply-To: <CAF2YDE7-qsKbpexT+GkiMr8_YtRdnV1N2p0JVWOyEPXSS-xjqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello!

     I have RAID1 configured on my home system. I replaced 2 disks there 
and usually use lvs to see if it's in sync:

[root@srv ~]# lvs

       LV       VG          Attr          LSize  Pool Origin Data%  
Meta%  Move Log Cpy%Sync Convert
   storage  kurisu rwi-aor--- <3,64t                                     
             100,00

AFAIU, writes are syncronious. So if the number is 100, you're good.

Also, there's an integrity check command.


On 6/24/25 11:34 AM, Pickles Creator wrote:
> Hello,
>
> Is there any mechanism for automatically detecting when a RAID1 LV is
> fully in sync such that I can enable write mostly? I could do this
> with a timer or continuously poll to check the status but I'm trying
> to understand if there's an event driven way to do this or if there's
> any file I could watch with systemd?
>
> Thanks
>
