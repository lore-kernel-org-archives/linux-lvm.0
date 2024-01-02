Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4F5EADC
	for <linux-lvm@lists.linux.dev>; Tue,  2 Jan 2024 12:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzKgPdcA"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cce6bb9b48so38963921fa.1
        for <linux-lvm@lists.linux.dev>; Tue, 02 Jan 2024 04:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704196897; x=1704801697; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:disposition-notification-to
         :autocrypt:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5V21Tz0hsXRyeq2qnimgJuXx1wcJCqwak/9+g35cUo=;
        b=jzKgPdcAxSkgOGoSsNicz8GDxBpfG4GvR0hnN5OQ+RpGe865FcpIXTowOgnCEsgjhP
         K5YaVRimXwBbuo/d4H7f0ueqqFGhEJV0Szd3Nzf0de8WMDZPK6UsgXIyG1N3ZLHap73v
         gsnyoFvRnDy/xuddR1QygkutB3kKYRKtNWFOybRnfdPKjAC4jsu5RZGvf1sqeDS1g/3u
         Nz0PnCXn52SKZwjtcOnCYsen7EcHTUKWmFNZwMN3Bv6XdJ7jBLoRvyDK/UB1Xsb/eR2v
         HGNEczvGnSMpwCWY7rY4i4Qq+Rtfgnclxv/VZqbkRbmxtlbIUoxVtZ1ZttfxoWuN+lzf
         6T6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704196897; x=1704801697;
        h=content-transfer-encoding:in-reply-to:disposition-notification-to
         :autocrypt:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C5V21Tz0hsXRyeq2qnimgJuXx1wcJCqwak/9+g35cUo=;
        b=SZElIU1h9dCAsaeb9EVrxxVxeQF46mwPZjf6IBe+doLzEf/BXlIHly4tUXCPbtUNvQ
         cVi8g87EgB4OMfef9/Tq2H7QQegUCBjb/JmRbgGO6TXTzJfgCo6QxEbePsoXKRDMJ29S
         qRayS4gu1aKPSh17FdmUFsuGqfL7oUIIpzxd6dHkXUeN8dJ1FywGJ3dpU9W/Jn8fPqAw
         MTSAKUdUAhtN83DM4hzI1S1cilqLRn3hAdPEMadCSyfXSKpAiJ9NT0wMiEvKDGWwHVwT
         15aPcIDFalEgvYLIDkHrDT74o5OASJ0kU9CXQjcQbvwXjt+DuFxlP02e9Ld1Ue3VmNVc
         sMEg==
X-Gm-Message-State: AOJu0Yxdw8iIxQNnJA1v18uupSYw+iuKo3Emrbv+SLjtCP8CxgUZpI+v
	jytKPpSucN+CEksEOjU6xVc=
X-Google-Smtp-Source: AGHT+IEVHZdSTOVBUyFqM6Ib0fwoyZ8qFLlG1bOr8xVkGykI6OWIipU2ndSwhPZgcfXn4e9aVCmIzA==
X-Received: by 2002:a05:651c:509:b0:2cc:de75:71b4 with SMTP id o9-20020a05651c050900b002ccde7571b4mr2383976ljp.188.1704196897261;
        Tue, 02 Jan 2024 04:01:37 -0800 (PST)
Received: from localhost ([5.172.255.220])
        by smtp.gmail.com with ESMTPSA id eg14-20020a056402288e00b00556aa0b342csm196315edb.55.2024.01.02.04.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 04:01:36 -0800 (PST)
Message-ID: <0de39daf-ab95-46d8-a057-c62e9dea8b48@gmail.com>
Date: Tue, 2 Jan 2024 13:01:35 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Should issue_discards be enabled when e2scrub is used on an SSD?
Content-Language: en-US, pl-PL
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>, linux-lvm@lists.linux.dev
References: <5ccac2f3-f554-47fe-bec9-d74b08e85e5e@gmail.com>
 <a15677b8-70ef-49a5-98ac-3ccf839fdad7@gmail.com>
 <fc9e7a1e-a566-4a5c-8a4a-9e26a5651b65@gmail.com>
 <d635d089-eb5c-4d51-b41f-f4c61b1aa77c@gmail.com>
From: Mikhail Morfikov <mmorfikov@gmail.com>
Autocrypt: addr=mmorfikov@gmail.com; keydata=
 xjMEXRaE+hYJKwYBBAHaRw8BAQdADVtvGNnC7y4y14i2IuxupgValXBb5YBbzeymUVfQEQvN
 L01pa2hhaWwgTW9yZmlrb3YgKE1vcmZpaykgPG1tb3JmaWtvdkBnbWFpbC5jb20+wpYEExYK
 AD4CGwMFCwkIBwMFFQoJCAsFFgIDAQACHgECF4AWIQR1ZhNYxftXAnkWpwEy2ctjR5bMoQUC
 Y2+BTgUJChtjVAAKCRAy2ctjR5bMocamAP9IDZfiCI48rykaKOsSWTn5WLKb+Fok6YK+s8xN
 v9sBJAEA/y9e22B2q9vkY5o37G/hpbz7UhvrXA1JxKpiSpjzRgLOOARdFoT6EgorBgEEAZdV
 AQUBAQdA1vPaWR/g6H2DzFqi6zjEBCqEv6bOg+N6lahCEuhLc24DAQgHwn4EGBYKACYCGwwW
 IQR1ZhNYxftXAnkWpwEy2ctjR5bMoQUCY2+BXwUJChtjZQAKCRAy2ctjR5bMobgPAP9pJvfy
 NkYiTStwBu26LeHT35XZJaYAOmcYWCwItr40iQEA5LlzxZn4r/d70X6pCQuH1FWmuxtMIxEb
 ROnRLyiuVgQ=
In-Reply-To: <d635d089-eb5c-4d51-b41f-f4c61b1aa77c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/01/2024 12.45, Zdenek Kabelac wrote:
> Dne 02. 01. 24 v 12:13 Mikhail Morfikov napsal(a):
>> On 02/01/2024 11.41, Zdenek Kabelac wrote:
>>> Dne 29. 12. 23 v 1:48 Mikhail Morfikov napsal(a):
>>>> I've got the following setup: LUKSv2+LVM on an SSD drive, and I
>>>> have trim/discad enabled for encrypted container. I also use
>>>> e2scrub for Online ext4 Metadata Check which uses a 4 GiB LVM
>>>> snapshot. I currently have 10 logical volumes, which are
>>>> periodically (once a week) scanned for errors. I've got a question
>>>> concerning the *issue_discards* option that can be specified in the
>>>> /etc/lvm/lvm.conf file. What actually happens when this option is
>>>> enabled and the LVM snapshot is removed after fsck finishes its
>>>> job? Will the whole 4 GiB be erased on the flash? Is it safe to
>>>> enable this option in such case, or is it better to leave it disabled?
>>>
>>> Hello
>>>
>>> issue_discards  is relevant only when you *REMOVE* LVs  - the free
>>> space in VG  is after such removal 'discarded' - which is only useful
>>> in case you i.e. pay for 'provisioned' space for your VG (or you have
>>> some very very very old ssd) - so this will make you VG space
>>> consumption smaller - but it will also make restoring of accidentally
>>> removed LVs impossible as the recovered LV will be simply just an
>>> empty disk space.
>>>
>>> So for 100% you don't need to enabled it for e2scrub as discards are
>>> normally passed through to your LV device as you may easily check in
>>> your sysfs dir:
>>>
>>> /sys/block/XXXX/queue/discard_max_bytes
>>>
>>> Regards
>>>
>>> Zdenek
>>>
>>
>> I understand, but the question concerns rather the amount of data written
>> to the SSD disk. So I have a 4 GiB LVM snapshot, which will be removed
>> after fsck. Will the whole 4 GiB be written to the disk when issue_discards
>> is set in the /etc/lvm/lvm.conf file?
> 
> The whole size of removed LV will be discard.
> 
> It's mostly equivalent of using  'blkdiscard /dev/vg/lv' just before calling lvremove vg/lv.
> 
> lvm2 doesn't interpret in any way what has been used physically used within the LV.
> 
> 
> Regards
> 
> Zdenek
> 

I see, thanks for the info.
