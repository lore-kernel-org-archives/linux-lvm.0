Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68641246795
	for <linux-lvm@lists.linux.dev>; Fri, 19 Sep 2025 11:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758281146; cv=none; b=rSf+PmMjH4vDnHPHvb3SDtzFrbjchbq06oV1bR4lCnkDHgs/HgOLL+Jvzu+XBT8RJRA43g1U+a31XBGdcD6jDqmw/+PX/dlqrfOxCcgSufYeiTOBsYOvRpkL+4BsIxmL7z+yR+D1UOqugTPZoUTQak6VzfLCUpu68gfI/lCJEMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758281146; c=relaxed/simple;
	bh=z603xIuabTFtZKxP58z0+yNCoAxgQKVaDIWat8EqfV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Er27varReOys89Pb04bAq90sc8E5Ym4v96uAADd3usqfjVrBXa+oF02pSdM8mUInW5Wr2a7tUUYJoyQErqYwdLynn+m44qfxftOAlYEK45si3wPDGehxPuS46vqamb0NeBDUrnlWqxBptT9Tz5DhPO1SLzOLXlTSqEyeaXief0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDSobjXs; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDSobjXs"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45dfb8e986aso17394925e9.0
        for <linux-lvm@lists.linux.dev>; Fri, 19 Sep 2025 04:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758281143; x=1758885943; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=48PSny75aHp/go75kIvQ39kGTcOXo68gwbpXWLdokjU=;
        b=PDSobjXsqQb+U6mHvqPRyE+R7scY49yL4odNtbs5ign9afEOe5c0OEG2uy0Cj6oRl3
         P4GUPXIaGPWtP0r3BLhtMzkoYqsr0y2DRP3WBoGcwWVuW96NeFq/iipOHdTPaoXJx8hG
         I88Y6DqEkhKF/qHX4FTuuThF6lL2vIzoKp57YG31xNMH0lEt5ARRMmeN7hiQPidfPO4p
         YIk9LQurEfPwP9/zsJQWfwZD4tIe91Tkf1GWRQD4bT2GAJgzKnkgeuAeRViVqhry97IM
         hFES6ZNvT7BKfoIvKnfd4rz1oMkFXTwt3Nsxgdu2VM44OmHCTcGa70+z+5QYgphXIYBd
         4H/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758281143; x=1758885943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=48PSny75aHp/go75kIvQ39kGTcOXo68gwbpXWLdokjU=;
        b=k9xYxNy5XIVw3om6DqAybAqKacG60n9i6KRwqsCywXL66MJY/GDKAEwfGnV3pHeX+Q
         5P85IbgcEvUKcH4bOOb89dktuQ9F8MPXJy46ZoWasAEDpCOO752Xl7pawPFZmUvW6AUf
         3OQ/f97y1Jc8+Sen0dsELRI6RuXMmfAIuA+N2rDIvI2Sp972XSCFnblLEAX8RQjd22FR
         w98N3ymRiCCqmLKtjVQJNBMygvlC79vYPUoo9W2sVCxgEpezEpih+2VJNCzyMCkGoctu
         R4hga1rc/0pkyhvegVHBhfejmoYR3Cc1wlpcNReA+s/gZCldkez2y5Mpxi4vRXhuABE7
         QkRA==
X-Forwarded-Encrypted: i=1; AJvYcCXy8FqQlnx3EuerRR/OiTPozTbOK2aHWfWScTa4xmFDR+TscvZVlTWpF535mhieYYU8lgFrzC191ro=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxy3W/DWdR44JzUbtQnOXX90PyjVeLPIoJxtITmI15IBKHNN4bi
	/iIp2wKtjebMzr5jQNsrOU5AGDxqS/mavyzPd/3qjUc7+whHSgQTtfz8
X-Gm-Gg: ASbGncvwo+V6cc8Udj2nze48/3ubXSo/5/wN9seAWDZjZAkVCqFwbKLhbTeBv9HJma2
	pygKOaWToQAK2qTAYvWRr5fxnvEmnK14NCxAbFBM3leVYABvwWUADNASCTZukfXtovoJFS0jW5o
	JGhAu0H6zj+qgLHFbR1hZVl/sNQ6zEKFiCQFU5Em3QLiMrd3gTd6J9kI8BR5B5OjgSfg4UjwLag
	UaEEZ/0mxeDo5UlTxWFlIFzydMJN6kLSrO8hZO/JEOSYApSXIlh7zMwNpC74J6f73+GuUe0QA4E
	l7Xijhf0rVRMJLveXMPnkhK/OSk16zJ5CxV5uds1wMWoKfgPhk+4ejswLHPqG585b8BD3ze/mp0
	jj5XeQOR3DPulknKIyiceyxLgHDgp
X-Google-Smtp-Source: AGHT+IGWqoreUnSn1JMU9MSWp+yVmDj9e5Dm7ia2fSpOvCU4ACHDU9Hs4G6mvraRYYz6mK45d4yWUw==
X-Received: by 2002:a05:600c:c178:b0:45b:9906:e1cd with SMTP id 5b1f17b1804b1-467e6f360afmr23882815e9.13.1758281142291;
        Fri, 19 Sep 2025 04:25:42 -0700 (PDT)
Received: from [10.43.17.5] ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f5a285efsm94673625e9.18.2025.09.19.04.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 04:25:41 -0700 (PDT)
Message-ID: <bafce088-45f1-4145-9d7e-9f5d2463876f@gmail.com>
Date: Fri, 19 Sep 2025 13:25:41 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_LVM_RAID1_thin-pool_shows_=E2=80=9Calignment_incons?=
 =?UTF-8?Q?istency=E2=80=9D_warnings?=
To: Alessandro Brega <alessandro.brega1@gmail.com>, linux-lvm@lists.linux.dev
References: <CALAmg3ZyCczjzovtB9LwWgo265JDwjzNbfGGnTT4Kq4XdDuFvA@mail.gmail.com>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CALAmg3ZyCczjzovtB9LwWgo265JDwjzNbfGGnTT4Kq4XdDuFvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 18. 09. 25 v 21:07 Alessandro Brega napsal(a):
> Hello everyone,
> 
> on a new debian trixie server (kernel 6.12.43-1, lvm2 2.03.31-2) I’m
> trying to set up an LVM RAID-1 thin-pool with these commands:
> 
> pvcreate /dev/nvme0n1p5
> pvcreate /dev/nvme1n1p5
> vgcreate nvme /dev/nvme0n1p5 /dev/nvme1n1p5
> lvcreate --type raid1 --mirrors 1 --name thin_raid1_data --size 100G nvme
> lvcreate --type raid1 --mirrors 1 --name thin_raid1_metadata --size 100MiB nvme
> lvconvert --yes --thin-pool nvme/thin_raid1_data --poolmetadata
> nvme/thin_raid1_metadata
> lvrename nvme/thin_raid1_data nvme/thin_raid1
> 
> The thin pool is created successfully and works as expected, but the
> kernel logs warnings such as:
> 
> device-mapper: table: 253:4: adding target device (start sect 0 len
> 209715200) caused an alignment inconsistency


Hi

Recently solved in kernel - see this patch:

"dm-raid: don't set io_min and io_opt for raid1"

https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux.git/+/a86556264696b797d94238d99d8284d0d34ed960


Regards


Zdenek

