Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1366CDDA7
	for <linux-lvm@lists.linux.dev>; Tue,  2 Jan 2024 10:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdp3ctKf"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a277339dcf4so344712266b.2
        for <linux-lvm@lists.linux.dev>; Tue, 02 Jan 2024 02:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704192067; x=1704796867; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IYb5oV3LQe5dY7lyT71YJcQ2KvwUXvgBou2a38HUky0=;
        b=fdp3ctKfcm98O8Vc7ChqGkRoKC0InQnMKwHu2vUg29bCY9zPKpr4wjYeQ3dV2/KASM
         lFTw9qlqFYEQpNn7bhKYfZu6j3vnrCaaP8ywLHlya1k97XF3nod6gd4FHmlLi7k08z18
         Xjcmslgm9+1U1T9Uq0HT2He2pY4u1Pj3UA9aDDgu3/gMJbwg9ynS44Ep3WwCWxgngWbX
         n+d2mB3kYcElV8GNgswfQh/SaEm3cli3+Bt+7yAyEcbNyq+zUQop94ElLzIU7SNszGuZ
         Bf/w+2yWGIKRQTHcjFGtzYsVhvcHR0lZ4pJTP1+BM8wN7/kQMFK59hXkimW3CkODKynJ
         t0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704192067; x=1704796867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IYb5oV3LQe5dY7lyT71YJcQ2KvwUXvgBou2a38HUky0=;
        b=neY8xcmuqNhSUmVLVU7WFaInStD0+frbuowcteiY/tOzv33bYRRYieQl85AoRd215M
         7UltyrecqU1ERK+IsUsrYnbJaFJhM/BiA8SSKtRta0bS4No0Y2BHItyT6OSUu+bPKhQc
         3z3RNLY0BkER4Jrce+xBnt5ZzoeZ4KSuHN77o6iiTUk82FSzNwKw7QX2H/+MvxBX6Q9f
         /jCOt8eNjFHEoDHBZrk5yYtvKWKN6IG9QCsWBu8BNyaiSYJBJQ+tQrUONU9n4rvNNJhc
         YeMphW38AeqjyIsOGPHRQAD0BeqgWaQGemRpfLgi0Ao5iK3M8dI27hXcu2ppmA1bn4OL
         sd5g==
X-Gm-Message-State: AOJu0YxrfM1dXjAgbEc8xvi9nwEr51MmqG1Rb+LQOAquYVmofOn8mZcM
	r1hP4ZD2lm9f9QumldKRy1vQZSFivhjISw==
X-Google-Smtp-Source: AGHT+IF3tZZom6jX/vRujb5hC1VuELBkgntZi+12/Ypq5i2PPeS5cHrspm+9gCQ28cuAqJT8Z3iRwA==
X-Received: by 2002:a17:906:14d:b0:a27:3793:7e57 with SMTP id 13-20020a170906014d00b00a2737937e57mr4965944ejh.17.1704192067196;
        Tue, 02 Jan 2024 02:41:07 -0800 (PST)
Received: from [192.168.0.99] ([94.142.239.37])
        by smtp.gmail.com with ESMTPSA id m10-20020a1709062b8a00b00a27a6d59045sm3559168ejg.217.2024.01.02.02.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 02:41:06 -0800 (PST)
Message-ID: <a15677b8-70ef-49a5-98ac-3ccf839fdad7@gmail.com>
Date: Tue, 2 Jan 2024 11:41:05 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Should issue_discards be enabled when e2scrub is used on an SSD?
To: Mikhail Morfikov <mmorfikov@gmail.com>, linux-lvm@lists.linux.dev
References: <5ccac2f3-f554-47fe-bec9-d74b08e85e5e@gmail.com>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <5ccac2f3-f554-47fe-bec9-d74b08e85e5e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 29. 12. 23 v 1:48 Mikhail Morfikov napsal(a):
> I've got the following setup: LUKSv2+LVM on an SSD drive, and I have 
> trim/discad enabled
> for encrypted container. I also use e2scrub for Online ext4 Metadata Check 
> which uses a 4
> GiB LVM snapshot. I currently have 10 logical volumes, which are periodically 
> (once a week)
> scanned for errors. I've got a question concerning the *issue_discards* option 
> that can be
> specified in the /etc/lvm/lvm.conf file. What actually happens when this 
> option is enabled
> and the LVM snapshot is removed after fsck finishes its job? Will the whole 4 
> GiB be erased
> on the flash? Is it safe to enable this option in such case, or is it better 
> to leave it
> disabled?

Hello

issue_discards  is relevant only when you *REMOVE* LVs  - the free space in VG 
  is after such removal 'discarded' - which is only useful in case you i.e. 
pay for 'provisioned' space for your VG (or you have some very very very old 
ssd) - so this will make you VG space consumption smaller - but it will also 
make restoring of accidentally removed LVs impossible as the recovered LV will 
be simply just an empty disk space.

So for 100% you don't need to enabled it for e2scrub as discards are normally 
passed through to your LV device as you may easily check in your sysfs dir:

/sys/block/XXXX/queue/discard_max_bytes

Regards

Zdenek

