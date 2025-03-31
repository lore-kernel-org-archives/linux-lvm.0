Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1220B1E32B9
	for <linux-lvm@lists.linux.dev>; Mon, 31 Mar 2025 12:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743425580; cv=none; b=U/2vjvDEeZKLy2CXvLYSnAMse83US3t1dO0pr8yCtmt1mBpFZuo/8FVG7DIdzGLKHe114wzNzlOPd58pbRUujUg2nf0S69ipB20+p15TL/yNINbKbPQo1aQP6xrICrTERnG8R6v82bI8q9sIBAatQ3BBTHVWPVVtj/jtt5n6iVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743425580; c=relaxed/simple;
	bh=fQ5lan0efj9bK3e9ecqatU42ZB3trOnFu6K0d11QkC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LaQhxAz7LwrGN+uUE0302xbQphHPQz2K60CqDnK55/qeI+cs0Pc/+YGbheKmuOafiDhr7lRUR97juiU5jqgtXzw2tKEQxxfZkTKm77aT3+dHriWdkDGaioJOdZMfwv4F3KmQrX1/vBrwa1U81JYq685aZWLRk0zBf4oYLZBlKN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXJlBDz5; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXJlBDz5"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so30063615e9.1
        for <linux-lvm@lists.linux.dev>; Mon, 31 Mar 2025 05:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743425577; x=1744030377; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ANz0Kjq9vuwFHQGJ0njE5nSl2zmmEEkqZ19kLu2IfzY=;
        b=jXJlBDz5TFjtaLqbuEokO2q8TM1fBbu0MJZ4OXV41UxdcvyhPUQ+aKnUltJbCS7O4p
         +ZLDPifNoNTrTFnp9RKZVlyqn1txm8ouentMTScVdm4A0pfit6lrS00WQ6aE/P2QBj0E
         J0Q/P5D246Ws1fFw66rDo57jiHcO9hTHBoDUMVRLAtg1rfRWnxxi0Y7QHO0nx2Zu1QxD
         11uKQ13brFBV7IssA4qpkgmuMczAuwYxIKEuXSVJ46uqj+bx14Bu6rzZwjFl/zSDy1GD
         KlkfIbgXGdpHekqUZz1j5EwsF6x35Zcev1T9hnqja9cJ9dP7+wgy3vyJKcYl85xvgUHt
         wfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743425577; x=1744030377;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ANz0Kjq9vuwFHQGJ0njE5nSl2zmmEEkqZ19kLu2IfzY=;
        b=Cv3aSt08el5s79ON1QKrQf/AcxKY/7DHNNl7FraK8g5FH7zGa9Yd3avtAcoc5T1MsL
         4uKdVScXPQUdZA0iQx9llSiEG8KlDpHEQj7dtVHNWUlVf4XZGDWb7NB2Bx2NcwNY9sUi
         3owrWT3aYqoUSixZJt5nXpUIT2Day3A8msbep1TDA5Vnho5bcpElyYuuea4WyAoLGXkU
         JjTtHgvS9PF+kwJZpB6os56kZuIU4k+KFaEQkbtQRsNLVqLzV9biEBiSEq1QKf1Hy07f
         3RCAhV1TddDVcrXhLS+Gq6DkdDhUDN3ni0xkvlTNmdUpQ3auHM0SbauUuTNXns2dRsCV
         ndmA==
X-Forwarded-Encrypted: i=1; AJvYcCUWOJCTEQWi6PnGGzDUEOcMTPw5cejADPKkhjd8588s/KMo7mXmj2uuzBJRetCMrYHet1amjfbTXsU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn3zgQldnJ8J040zUJ6Qh2MrgucvAKQk+xXMJA4TnW58PVb2jC
	4pHFjvEI6EaHx6kXHRNZAGG6lvraKp0gdnTHvhc5YrsSp+IlFpBFr7g1y4kx
X-Gm-Gg: ASbGncuGkDQxVegYEsLL0zv7FoW7AFtyWtpv+10GJ9ioB8gAhuHpVz1le5zjDz6zm2V
	l2JM3SHfBQDDF4zQ2e9Ya3kWMTfvrQdrd/KYXOLwadvFUU4ALrIxgyIDO+2Fys99HO89ofUGvro
	TS7rksaJQc6jiDfzJQAVR8AQCMW92Dp7m7ePYBR//jiaP2W5dLTzc8Oe/hkSTxmu2CUD6Ac1HHN
	NCXfL/kD8HinBiLu8SEwkEdnrCxf6rlcL6zshWSdeD9XQvJeXIWDKRFgGFtzrBhLQICoLQ4pJkE
	48B3u4PqUb+r8XnWLNyz9oXVgVeYQpBv1P4soxA5argKt7zvF4dk7E9Wn3Xzeb0PtfuBdRhmmKH
	ZvQKtXkHMDIo3hX8eeZGcDOE=
X-Google-Smtp-Source: AGHT+IEkowqhhR9xUKvlUY1jiWLol1FWR4gOk7R8uTLoJi25qt9gK8VckRaoRtLwx5nVRy9ayP22ZA==
X-Received: by 2002:a05:600c:4705:b0:43d:79:ae1b with SMTP id 5b1f17b1804b1-43db6247e03mr87773475e9.14.1743425577117;
        Mon, 31 Mar 2025 05:52:57 -0700 (PDT)
Received: from ?IPV6:2a03:a900:1000:7e9:403e:7c8b:351b:f333? ([2a03:a900:1000:7e9:403e:7c8b:351b:f333])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe966sm168911285e9.21.2025.03.31.05.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 05:52:56 -0700 (PDT)
Message-ID: <6b90d809-e886-4367-b1b8-243712fa184a@gmail.com>
Date: Mon, 31 Mar 2025 14:52:54 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Duplicate pv, vg, lv after copying disk
To: Dominic Raferd <dominic@timedicer.co.uk>, linux-lvm@lists.linux.dev
References: <896f5f69-58a7-4b9f-a9b8-62a65f3f13a2@timedicer.co.uk>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <896f5f69-58a7-4b9f-a9b8-62a65f3f13a2@timedicer.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 30. 03. 25 v 18:28 Dominic Raferd napsal(a):
> My LVM is working great but lvm utilities show - only, when using -o devices, 
> that I have multiple copies of the same pv, vg and lvs. See below, the first 
> invocation is what I would expect (one PV 'nvme0n1p2', one VG 'vg1', four LVs 
> 'home' 'log' 'rootfs' and 'swap') but in each case the second invocation (i.e. 
> with -o +devices) shows multiple versions of the same thing.
> 
> This may be because I copied my disk to another using clonezilla and 
> subsequently copied the new disk back to the original using dd. I'm now only 
> using the original disk. Although I am also seeing (not shown below) duplicate 
> devices for a 2nd PV and VG and LVs which are on a second disk on the same 
> machine - and this second disk was unchanged throughout the process.
> 
> # pvs|grep -F nvme
> # lvs -o +devices|grep -F vg1
>    home   vg1 -wi-ao---- 600.00g /dev/nvme0n1p2(2048)
>    home   vg1 -wi-ao---- 600.00g /dev/nvme0n1p2(91136)
>    log    vg1 -wi-ao---- 4.00g /dev/nvme0n1p2(1024)
>    rootfs vg1 -wi-ao---- 24.00g /dev/nvme0n1p2(78848)
>    rootfs vg1 -wi-ao---- 24.00g /dev/nvme0n1p2(173056)
>    swap   vg1 -wc-ao---- 32.00g /dev/nvme0n1p2(82944)
> 
> As I say, this has not caused a problem so far, but it is certainly ugly and 
> looks like it might cause problems in the future. Should I ignore it or any 
> ideas how I can fix it?

Hi

When you use '-o+devices' - you are asking for 'segmented' properties of your 
LV. Every LV is composed for segments i.e. depends on how the allocation 
engine manage to satisfy allocation request for physical size.

In your case  'roorfs' is composed from 2 segments - one starts @78848 extent
and second @173056 extens -  every extent has 4MiB in size.

You can get more details with  'lvs -o+seg_le_ranges'
that will show you extent layout and assignment in more details.

If you want to just see a 'single line' per LV - avoid adding 'segmented' 
properties to your 'lvs -o' command.

Regards

Zdenek

