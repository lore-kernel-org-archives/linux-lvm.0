Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F41318ED6
	for <linux-lvm@lists.linux.dev>; Fri, 10 Apr 2026 08:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775809889; cv=none; b=qcfD/Q7nUVoAB4QDxTW+jMab8QjyNvOwEyaGqs23JRtEGexyMFbE1UIMEfWUClKUe1519efVvSWTlT70haL49ZCv3QX6Ft3EVERUrUknZgY2ZW2WfAjuv3n/khR5lwg99OI9ssADhcRqSPl6wIvAQNs1t8gEa4/tR9SwY/1silU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775809889; c=relaxed/simple;
	bh=DdGxVptRY309OXD3gZEUGOq4V3hx7qR5NDBPqhK7yA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q9iSlTrt/Du4UV1s2QFc8okE9cxAgENz8UwZZrLvEI1eAW4A9UxhQdT8FrN91bRZ1u/DyOxEHHEwFv2D8SLCuv7T+9MuNYj5JFN6GVnsAFyxPCLf0gMzr6Yxyy69OWT84xVB2hRwASUfOD/M/E5Xp/pMIwMwwRR/UeyTG9TCKo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HaZ/AGkp; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaZ/AGkp"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b8982c2f4so1033903f8f.2
        for <linux-lvm@lists.linux.dev>; Fri, 10 Apr 2026 01:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775809886; x=1776414686; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tkdfjAwN/5I7fvaNH5+f6TjZUAT9ovcAANLkKn1cAKc=;
        b=HaZ/AGkpnIUi7oef+4ccz655+h6MBhkW5I8i18sf74HNoNsypNoNV8+6SF5BX0t9+F
         AhhHIQL7+4xcEZAsdDXjHVQarEPieEv8F5I1oho1uEUt0RAnfp98ugaVnmEoHmzEha5f
         ZM69CVRaccdXD6L9VECI+ByLyupXXrg2gOnKLP8DFzIpzw0iQZNqRLbuD52Xx0RsRl6S
         M7HWJn66hiev/faKwia4szjJqpZh+yh77qSlzLEMHBorrcsBb6Hzc5rv4hMCwEvDnG8X
         lEtLc8itIbSVBkssl/qpwOhQaw6Qf3sk35k7bBQlyLQUFSq7F0QprrCih4HesqwoAS22
         nTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775809886; x=1776414686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tkdfjAwN/5I7fvaNH5+f6TjZUAT9ovcAANLkKn1cAKc=;
        b=C9XUSIWPkRe6K2zSn3sgVMR3ZFOIe+Oxz+crUj+kcXiThh6y6POrkZlgqxjzDRxwSq
         GSEPLgXPAFkqMnJF+VcWN4aZge/VEdaw8MCTqCu/wsOZAwND6a2ZUCP6U9re6d8F2Hbe
         K60BO502/8jShijzwFDBXGL4tNlGiIkc3fVlvkTeYZ2uT2s8OVxhnI9aVIZYMZiriPTR
         ue5MGvuA4gWlvibstnTWLj1VuTvd66NJ05YPbMAvJlNbT3sRkD5HT3XtqPz52uCvhQv/
         8kmIQXAIAYBSxG7gI2d1gOHkULHLrb1mXwX7dhrI33C8GXe+aO7J9tz8ED4KRTOKOW7O
         wekw==
X-Gm-Message-State: AOJu0YzZS1HgzLRV04RbAJA036aN84dA5D3OG+WKtzQkHBxCXipHpmB5
	g4eQlMrZI2dY87vBtr/xMfF53qQOOv2KFgN0qUoFDJQSJt2TkatDL7bH
X-Gm-Gg: AeBDiesk0FC8pyA26ZwPYf9Vf6GzOOWZxa2IapNitG3YYNHD/XzpNvqLYrz+NQ8AEv9
	Z/i7oMEJodavCBLCGRuw9LeOPq7GYMauH8f5qqNjDJprdJFIoRba5AHEcXI1fJ4/rp03Kfm3gzw
	aLKQXsv3zM9x+lseHo/6d2cZN78sSBgf/4jwJEcbv4ii+wlGO5I64qn5zoRQFCx9v7chdzMOop4
	iuz72fACreoROQaT+1MczBuDLlYmL3kKLVnjd7kSbUSA3Tz8C/Qfj3RGa6NHL8y4x+Fv3MIvRo7
	gUjL05ogo7gtespX3YFhuIfheDOqXxAtDdKptj1H8MV13yi0JTnWntVdISkamiaj2j/1wua6YzE
	Tne4nExwr9+BmuKdrj/fzkhYTjN8ZYodBV7KqGh4LwO9qGA4VtnSrR+DK5UV5MEGaTXs+XLWMUr
	N9Y9OP/QJOqqk9ZhP/V5Ki
X-Received: by 2002:a05:6000:2908:b0:43b:8fa4:1937 with SMTP id ffacd0b85a97d-43d64255170mr3182912f8f.5.1775809886246;
        Fri, 10 Apr 2026 01:31:26 -0700 (PDT)
Received: from [10.43.17.48] ([213.175.46.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2a74sm6040910f8f.3.2026.04.10.01.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 01:31:25 -0700 (PDT)
Message-ID: <9d9b7ab8-4c42-4359-8f68-c7076b0c59a5@gmail.com>
Date: Fri, 10 Apr 2026 10:31:25 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_LVM-thin_metadata_corruption_on_Proxmox_after_RAID-?=
 =?UTF-8?Q?5_issues_=E2=80=93_thin=5Frepair/thin=5Fdump_fail?=
To: Ming-Hung Tsai <mingnus@gmail.com>, Ray Davis <ray@carpe.net>
Cc: linux-lvm@lists.linux.dev
References: <em2752ec1c-6e02-42bf-80e8-bb92f63e8f73@carpe.net>
 <CAAYit8T1jQ-35GApTVRiq2wYd5G2R8fXSm1aEjNcgR8Oi=oC7g@mail.gmail.com>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CAAYit8T1jQ-35GApTVRiq2wYd5G2R8fXSm1aEjNcgR8Oi=oC7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 10. 04. 26 v 5:43 Ming-Hung Tsai napsal(a):
> On Fri, Apr 10, 2026 at 12:08 AM Ray Davis <ray@carpe.net> wrote:
>>
>> Hello,
>>

> 
> The specific error you mentioned, "value size mismatch: expected 8,
> but got 24 (block 13182)", suggests it's an older version of
> thin-provisioning-tools. Hopefully, a newer version will help resolve
> this.
> 
> Would you mind providing the raw metadata image for me to look into? Thank you.
> 
> 


Hi

There might be an interesting problem - whether distros like  Debian/Ubuntu 
noticed the switch to:

https://github.com/device-mapper-utils/thin-provisioning-tools


I think you may possibly need to do a gentle ping to maintainers of the 
original tool based on now outdated:

https://github.com/jthornber/thin-provisioning-tools

started to package newer version of these tools.

(Possibly there should be a much much bigger reference to new repo :) if the 
current one is blindly ignored....)


Zdenek

