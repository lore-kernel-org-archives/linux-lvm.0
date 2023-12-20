Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D5E3FE44
	for <linux-lvm@lists.linux.dev>; Wed, 20 Dec 2023 15:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLH8hh/X"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a235500d0e1so438786966b.2
        for <linux-lvm@lists.linux.dev>; Wed, 20 Dec 2023 07:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703086976; x=1703691776; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LmgitgpBmVdPCijSuVmMm96uQ0dADaJ9SPy7dWm8gww=;
        b=TLH8hh/XKeCs4qxmF7aIR5fzqwvO4utV6rvouZ6Y8EXNdoL9qE1YU0VL20dBcuciMh
         Tu1YL9B1/89Iei5GgLeuj/X9UVz+37xlxgAVPAJLx7OLXmOmaiXUdTA5H2gaKiB17jRJ
         plxGn/+8xhCtEAe+pJHQDhIGeWDb40xt+OVQRHo54auTEadfjwp9k1x12QBZYc87tRmB
         tdL8XiO2IRFgUKNUDsnyqcnR9FWXvBYxkxQQ3qEDDxa1Re6eV/j2U3COMRFNlrdSzZfz
         KrX4z87O0BRQkbP5eCiQNNHz9OGcgpNBb8zyjL6p9uAkDb8/W17lHw5yNpEO0ypr+bF2
         5rwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703086976; x=1703691776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LmgitgpBmVdPCijSuVmMm96uQ0dADaJ9SPy7dWm8gww=;
        b=XQxf+bfltzUSedN5ewzEXhvBRHektMxCZLsqLxd73QGSgdyvvYY4owXro6NZWOi/Ep
         ogLiyV/0u0+6EfOr2hPyiBfi1vH+qLadR1QfcvraTuOAqxCoRvKyJAM/iC6GGs6+gk0t
         gh3lpOlX4XVsjZGDdFJLkbciBIvsKbzPhzOLH6k7wzVL8doYI5PUALe4IfyDFATQQUpY
         MFPjl9cbQL85j9r6Fu8wIj0z3e7gnfBZKjzhTRy+1rQKdA5L2Cw/b/6W/V8J9PZkK28x
         8M5t6J9U+XD9KRz39WL7yTw+wxeI+cFMWpVpIdMYCgfHeHmGT430fJN46pjMrHXqyS9c
         JriA==
X-Gm-Message-State: AOJu0YwcSTW3UYN4mWpC1Huedltb2+7eFDpyi0NkRZ/o3B2n3XNTe4Zd
	PqRsrcFVNYoGAxJFmYWvvBxVgyv52hgwdA==
X-Google-Smtp-Source: AGHT+IEQFJodwMdED29Twtco2FwDR8PAz8cTaeU18Aj+A3WeBr9iR2oFNP8Ajhblmuvk7jh/UVlIvw==
X-Received: by 2002:a17:906:11a:b0:a26:8c3a:5133 with SMTP id 26-20020a170906011a00b00a268c3a5133mr923765eje.99.1703086976132;
        Wed, 20 Dec 2023 07:42:56 -0800 (PST)
Received: from [192.168.0.99] ([94.142.239.37])
        by smtp.gmail.com with ESMTPSA id tz9-20020a170907c78900b00a19afc16d23sm16769534ejc.104.2023.12.20.07.42.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 07:42:55 -0800 (PST)
Message-ID: <1c2a0807-848d-4c2f-89b7-04b28b4031dc@gmail.com>
Date: Wed, 20 Dec 2023 16:42:54 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: lvmcache not promoting blocks when there's free RAM
To: Wolf480pl <wolf480@interia.pl>, linux-lvm@lists.linux.dev
References: <cd95e52c-1f72-4dd3-b7b1-3581fb76a7b3@interia.pl>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <cd95e52c-1f72-4dd3-b7b1-3581fb76a7b3@interia.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 19. 12. 23 v 23:28 Wolf480pl napsal(a):
> Hello,
> 
> I have an x86-64 PC acting as a NAS, it has 2x 3TB HDDs in md(4) RAID1,
> with LVM on top, and LVs for various types of data. It also has
> an NVME SSD with rootfs and 16GB of RAM. I spin down the HDDs to
> minimize idle power draw, and to make them spin up less often I tried
> to use lvmcache for one of the LVs, with cache volume on the SSD.
> 
> However, barely anything gets cached in the lvmcache. Blocks aren't
> getting promoted (based on dmsetup status), despite the cache volume
> being mostly empty.

Hi


dm-cache target (ATM) is focusing on figuring out 'hotspot' areas of your disk 
readings.

So it doesn't cache what is currently 'present' and satisfied from page-cache.

So normally to promote the disk area (cache chunk) to be promoted to the cache 
it needs to be repeatedly physically accessed from your origin device.

So on a 'naive' example - if you read file A - and then such file is being 
held by page cache and you just read data from this file while page cache 
still keeps it in RAM - this will not 'rise' access counter on block level.

There are some 'requests' to accelerate a promotion of blocks to the empty 
cache where some of them have been upstream - but overal the 'dm-cache'
is not designed as  'page-cache' like layer on top of your HDD - it really is 
focusing on getting there blocks frequently accessed and it take some time to 
populate the cache with 'worthy' content.

> 
> When a file is read for the first time, it gets cached in RAM
> by page cache, but not on SSD by lvmcache. Subsequent reads never hit
> the block layer, because the data is already in RAM, until I need to
> reboot the machine. After a reboot, when something tries to read
> that file again, HDDs will have to be spun up again, because it never
> got promoted to SSD by lvmcache.
> 
> I looked into dm-cache's smq policy code[1], and it looks like
> for a block to be promoted to the cache volume, it needs to be read
> at least twice:
> 
> - first read - block gets added to the bottom of the hotspot queue
> - some time passes, queue tick triggers a redistribute, some blocks
>    get moved to the top of the queue
> - second read - block is found to be on top of the queue, gets promoted
> 
> Unfortunately in my case the second read never comes.

As said - the dm-cache is not targeted to solve this problem.

> I have a few ideas on how this could be fixed in the kernel, but
> I don't know if such patches would be welcome or where to reach
> device-mapper developers to ask them about it.

It would be more like a new target.

It might be worth to check  dm-writecache - which is solving opposite issue - 
how to efficiently writeback dirty pagecache.

Regards

Zdenek

