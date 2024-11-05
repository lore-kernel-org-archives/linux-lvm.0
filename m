Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553123D81
	for <linux-lvm@lists.linux.dev>; Tue,  5 Nov 2024 21:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730841331; cv=none; b=Njla0k3ve0GPUlYHx5lYgCta9De83LjesEtO69KXsffC44jiT59RXnZ8LkkS9Mf1Zdg2VcjS6m7HrymD9FKA0ZqxekbiXUIehoK7pTIp0Awll7PeHynEHnYaS/uaz+isVWEw4a9vKACE6mOFlN+giBPWZxiMCihOBMySbA72y9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730841331; c=relaxed/simple;
	bh=tTwiCoJF2RoG2SLIBXxOBtJGfzpUkad5jAD8VfsNu0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qYlVY/j6ABImdOehdeJIVQWWSFAqhjDoWSxZ7aJuUQW/DE1CELIGT9qLT61K0tHgfZYK8Q0ZNYA5d8VQCMbmPTc6GmXOXpe28wbyxZu5MoZrUXYUM2GZYrnfW9kkehWHQyUtGrGYmWvtgttyWhTmCq9cd3e2Ti3mSGjBNsicueg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQwVPzmE; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQwVPzmE"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37f52925fc8so3755245f8f.1
        for <linux-lvm@lists.linux.dev>; Tue, 05 Nov 2024 13:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730841327; x=1731446127; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AsA+FMhGlJnpt64e9y1aX1EbhgK8NYTE53XI7o9Xcrs=;
        b=LQwVPzmEaBuE8TnmkAs2CMI+9dPi/yHE1tm9po7r4qsBAZEia1XGiqki91hbYV+ZbI
         mh297NPsn3R+p6DQk4WEtwVd0H8ye/J3X2xFF7rPvCrRmiycMJVKhXhef97BYA8WviEF
         mNHV7nmYMFZEQBa6wlf5UIqeAk/1P/KgZ/OPSHsAZRLU1DCtCfuSQZtjAkBase9uAvd+
         DyrIwP7DeA/l6GfHQAH2hoRUOshoU4pcSnAKMp9vg5gZly1Yk2P2yA8I3OVvVAKVav6v
         J9Z02ITqh2H1cGCTX6e/GK0OdtVuNi77/tGpgJYI4wU02+cY58O+/xarDHzpsPx7rpKr
         oTwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730841327; x=1731446127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AsA+FMhGlJnpt64e9y1aX1EbhgK8NYTE53XI7o9Xcrs=;
        b=IkYZab3A6gPcL3cWi1XYozdY2ZE3GOF5SxjFXH/sJCLi4mgSd5WhbdVSO1UeACSakX
         wE90YMBhvmBd2bMk1Ge+96734jbHJ+9QP+rI591kmHdFCgTBQpEB1UWFFiIa2vogNkHj
         6o4GI13GVI3PSo82wPihOmdnwokrTueQc0ZPrfzgd/ssv3ysuASdd16sI5rqyte+Ii2m
         qqJli+Zec2hLvY89qz3Vtl2U5d8leWs6D3UvCxd6jPGhzKs2w2ORUwauiTKFCDFzY6IL
         FGRu7tgr7GihKPPIKKVHK7nE7MPFvlfq8rysAieSuoICSF6zribf8e8ee+/3xLUGWjAe
         H6zw==
X-Forwarded-Encrypted: i=1; AJvYcCU3W5etDLbPm7sEXMg5nrIVBM7zJOaiQ600XF5nqcIu/vfSbq6TEsm+v70TGKjmbYafTwIUVIOufnk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMWXiyH6OxWjLKnqBdlRiAAV/Ta5LRJiNIDEqbxYvbRiJCMsoc
	1Gzfd4otkfSOHM3SQ6RCT88cR93DZipNZLfwR07ipYShMbNM8ImJtpOAwA==
X-Google-Smtp-Source: AGHT+IF10FDgkafYO17ryWhp8cHLnh1n0DEYWdqKbxtjjy5P++5i8AVajcQxuFbUvwOpa2pi4PG5xw==
X-Received: by 2002:a5d:6da6:0:b0:37d:501f:483f with SMTP id ffacd0b85a97d-381c7ab2fb6mr13543017f8f.44.1730841327334;
        Tue, 05 Nov 2024 13:15:27 -0800 (PST)
Received: from ?IPV6:2a03:a900:1000:7e9:403e:7c8b:351b:f333? ([2a03:a900:1000:7e9:403e:7c8b:351b:f333])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116ad6fsm17114355f8f.98.2024.11.05.13.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 13:15:27 -0800 (PST)
Message-ID: <cef4164c-1aa4-48ba-b220-f2b1b2ad03fe@gmail.com>
Date: Tue, 5 Nov 2024 22:15:25 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hungtask in dm code raised by concurrent run refresh and remove
 command
To: "wangzhiqiang (Q)" <wangzhiqiang95@huawei.com>, linux-lvm@lists.linux.dev
References: <5d723c3e-9437-5006-4891-1ba659de30a1@huawei.com>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <5d723c3e-9437-5006-4891-1ba659de30a1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 05. 11. 24 v 13:27 wangzhiqiang (Q) napsal(a):
> Hi Team,
> Here's a hungtask issue occurs in the dm-snapshot scenario，
> reproduce by concurrent run vgchange --refresh and dmsetup -f remove vg-snap.
> 
>              vgchange                   dmsetup                dmsetup
>       table_load (load snapshot)
>                               table_load snapshot to error
>                                      remove snapshot
>       suspend origin/cow/real
> table_load(snapshot already remove)
> take type_lock and issue io to cow in snapshot_ctr
>                                                        table_load (wait type_lock)
> 
> [root@localhost ~]# ps aux | grep D
> USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
> root     1818066  0.0  0.0      0     0 ?        D    Nov04   0:03 [kworker/3:2+ksnaphd]
> root     2972729  0.5  2.1  87256 73032 pts/1    D<L  20:17   0:00 vgchange --refresh vg
> root     2972761  0.0  0.3  23464 10636 pts/1    D    20:17   0:00 dmsetup -f remove vg-snap
> 
> Snapshot has remove after suspend origin/cow/real during vgchange --refresh, and then load
> snapshot will take type_lock and issue io to cow in snapshot_ctr, the io process by kworker
> but cow has suspend lead to hungtask in kernel.
> 
> Does we have some way to fix it?

It's like guessing from crystal ball what you were doing and what is the state 
of the system in use.

Usually the most info you will get from 'dmsetup info -c'

If you have there any device in suspend - it's likely blocking the progress of 
other commands which might be waiting on device resume.

In practice you are doing something which is not supportable in any way - you 
can't interfere with DM tables of those device which are being manipulated by 
lvm2 command  (there is a good reason we use locked sections to ensure 
exclusive access to those devices).

To recover from case you would need to know where the lvm2 command was 
interfered and reaload & resume those device that are already expected to be 
there and funcional - and this might be non-trivial operation if you have not 
grabbed  'dmsetup table'  state prior your interfering manipulation command - 
which in practice is 'replacing' any existing target with 'error' target - 
this can possibly create even a combination of devices that were not tested 
before - thus causing some unexpected code flow.

It's also good to know which kernel version you are working with - over the 
time many DM kernel bugs where fixed - so please make sure you are testing on 
6.11 kernel.

Regards

Zdenek

