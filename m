Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320BC1DF992
	for <linux-lvm@lists.linux.dev>; Tue, 17 Dec 2024 10:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734430891; cv=none; b=G+eEtY/tPWzBdFqODTYF5w5u6QxCxnNwKvkiWxSFATK7D0wLPfcGf8OetGFKh2r/hlD1dQHK+ucx6283iqLwdYbtGqaToTxbDOqaChTfLPmbI4lk5pwNpwb7H2kFGaWlyUwMhMwImMxUmcbU6tZYgsP+zxh12KRzw2xG6C0fkU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734430891; c=relaxed/simple;
	bh=4AQp6Vg+AXvM0u6WOXxJK8S0+wcswVaIsGy0lMPR0MI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KIJFeFXt/pLOPhAmH949hltJLr2Dq5HQiZ8lOVxLCqRYfJIKnO2lyyNMllEt5ESUwZ/o9aZJUlfwuiFtJ2XMoyLAr1GInfmnxJa92bhBUmEH/OSHr/v6temI46nTdjsMO92WEYmSQBdwfOy5Z/XXJpzddLf9p9B5/nb3ljKkIpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eK07RMl7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eK07RMl7"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361a50e337so35585695e9.0
        for <linux-lvm@lists.linux.dev>; Tue, 17 Dec 2024 02:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734430888; x=1735035688; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bBIlBfb4EFSVfIGl1b/hj6kFg7hYVxGCzH0y0auCe7w=;
        b=eK07RMl7ClwSqLSz4MBrPfi3pp3kKNJ7nPAMWwXBSrjnwqVWct3cwqKyO9Iw2uBQUV
         oVa6UJwYAvxaKp+T9D0ZoLEAG5eYFN/HKbn0uvd8P17cY/kXTPzYGbCm5q1ORIJewFAO
         5f52hTA1eCO/hdJUrRVzGiQkjwWsaTA5uY5fiVXKDVn+CQWtKD2UWirrlNRyMoHzia49
         kQnoymnzI7ieHSVBh1W86jHLwKcdrJqxEpuGONwyN0I0MLJEsaiL19CB83O9HCg7DHko
         C2gyhAOs1aDPn69z90mHRRlHxH3PbyFt5ISjmhRWVzMB1YphZOZmFK6AlP8nUB+PxkAT
         xdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734430888; x=1735035688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bBIlBfb4EFSVfIGl1b/hj6kFg7hYVxGCzH0y0auCe7w=;
        b=psd2AinYWEklFOnunSHI0tKAYx0T48lrVGTW9uX4H9MFTYLtgZsM4BfZI4BUuzO7D3
         nksyGv2r1AWirBszuIqC41XZaSKX1Xmp8qSBNaCtJLcOm0F/gY0k7kbd06rB791ok6NJ
         ozKzm87wC8M75MRzf+LyuFEfGOtP9RsE1waADuYQvwuoVHoXkGlmxehOY1P1+Uif19zV
         +/HFhGqRBFsFKwfV6asDTnFxhtMg2hWDHWqrbUM7Naq4jpEGISJ1Nxh4kNtrQMyH0mra
         CDPkv+ClGaX3/fIBdvrIPuzpElJTe4XkMGVsCt0YESiOfTqvGgwVfcAOoexArZDiRMx7
         H55w==
X-Gm-Message-State: AOJu0Yz2ohtfyQdgFfZX1WvPlU3k1lmkI2y4chm1oIPA8wFQ3mQ/JE9s
	ER4LSGBN+1DnZhDU3lrmbycKIuseE7tUyC5pxvM9ZPUNA9A1z5eK
X-Gm-Gg: ASbGncvYpYSewMXJ7SBhftDvVKFPmTldM+VEbABqLXmm/aQLTftXODaKioPQ9mXjWBl
	Cu7M7k8WgecU6YtIrBbIDCoU1LXtKyQvUsn2pypU1+vK/G9Xq2rdrwdGb0+MTm4b46kYb9T8DLQ
	9aQyQwvGBnZ3Y3AsyyTopSsTzyTWc5gk538B/ePbdxEv7n9b37J6GXcL4WUKWsyQ2Jx3eZSmbaa
	x0Gm3OiBhHdcJzs+YZI3/G7Z7ykyLRBK+Z5iVKjrI0goLQsTs7ZH45C5q+7Eh1LlqoXHWgJ5SMy
	kiXUdELisDxDwA==
X-Google-Smtp-Source: AGHT+IH9CftQqkJrpJh5Jo4Q3meQJz56Dslt97zvVxG6Ps41w313C/cTfNJXPEj1UrFhnnxZd9VZww==
X-Received: by 2002:a05:600c:3b9c:b0:42c:c401:6d8b with SMTP id 5b1f17b1804b1-4362aa2deaemr135600015e9.7.1734430888093;
        Tue, 17 Dec 2024 02:21:28 -0800 (PST)
Received: from [10.43.17.62] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436362b64a5sm114620265e9.29.2024.12.17.02.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 02:21:27 -0800 (PST)
Message-ID: <ec0d03c0-40b0-4719-a020-9bae7a3241ec@gmail.com>
Date: Tue, 17 Dec 2024 11:21:26 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: is it possible to add a new filter to detect unusable partition
 types
To: Glass Su <glass.su@suse.com>, Heming Zhao <heming.zhao@suse.com>
Cc: "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>, mchang@suse.com,
 grub-devel@gnu.org, util-linux@vger.kernel.org
References: <826b5136-7ee1-4664-98d6-a3441883f53e@suse.com>
 <43D73CB9-32E4-405E-93A9-E985C94F4A9E__33327.0934455626$1734427189$gmane$org@suse.com>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <43D73CB9-32E4-405E-93A9-E985C94F4A9E__33327.0934455626$1734427189$gmane$org@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 17. 12. 24 v 10:13 Glass Su napsal(a):
> 
>> On Dec 17, 2024, at 16:34, Heming Zhao <heming.zhao@suse.com> wrote:
>>
>> Hi LVM2 maintainers,
>>
>> One of SUSE's customers encountered an issue with LVM2. The user created several partitions, one of which was marked as "BIOS boot" (4) instead of "LINUX LVM" (8E). Subsequently, the user ran pvcreate/vgcreate/lvcreate on this partition. During a system update, grub2-install installed GRUB2 in the "BIOS boot" partition, resulting in LVM2 metadata corruption.
>>
>> The root cause of this issue is that grub2-install targets the "BIOS boot" partition when this lvm2 device is specified for installation. If the user had initially marked the partition as "LINUX LVM", grub2-install would not have chosen this partition.
>>
>> On the other hand, it would be beneficial if LVM2 could implement a new filter or a filter function to detect and exclude the "BIOS boot" partition from being considered a valid target for LVM2 device creation. This could involve issuing a warning or error message to alert the user of the potential conflict. This may also help user to notice the issue more easily.

Hi

lvm2 is using  blkid to detect 'present' signature on a block device - and 
normally prompt to confirm wiping such signature.

We may possibly add similar logic for 'partition signatures'.

However there is still the plain fact that lvm2  with  --force  or even just 
'--yes' option is assumed to simply proceed  and clean&clear such conflicting 
signatures and simply makes the block device to be a PV.

All that said IMHO primary bug here is within  'grub2-install'  which simply 
should not be blindingly overwriting  block device which is in use - this 
should be fixed ASAP as there is the biggest risk of data loss, although I 
guess everyone is using  'grub2-install --force'  - as without this option 
(even in my personal experience) is typically refusing to do any work....

And same applies to most UI tools I've seen that use lvm2 - all seem to be 
pushing  '--force & --yes' with each it emitted lvm2 command...

Regards

Zdenek

