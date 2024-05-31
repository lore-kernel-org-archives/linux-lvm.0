Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94099156C47
	for <linux-lvm@lists.linux.dev>; Fri, 31 May 2024 12:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717158847; cv=none; b=WijepBRWLiIXI5zc9d30Xa5/XsJ7XnXCyrq+KQYE4AWB2rVka0+RIb4HWfsLm/xNlK1D4lkdTuJy+oNY6IS5wyrmQnc7fyD/rS4NyVkxVxlQS5WH5y/F6cLHtcCbefJjG2fJ72BKq+ZAlzmtdWfpH9xJlexZf3CwMCG1EMveifE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717158847; c=relaxed/simple;
	bh=CUdGnQ+H+r+4Xlm79h0DFocXdueIJEcpnRDatmu4Y0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lT+yOFI49HHNgWg5D9ruhP761n/A2+3qMeHYnBU2oVEnET/QwtrkPSRtBnSE4FVt0sD/ASs9UmTiIk/XZuci+sQRz6mOMIDkVpOe1dNFQEZmYm1cWwR4h4k5p7Ch4qUgVNTVypDOQg+QqMLmMa5yfsRDqek4z0b1Be1OLFGVErI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqLf7LhJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqLf7LhJ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4202ca70289so9596605e9.1
        for <linux-lvm@lists.linux.dev>; Fri, 31 May 2024 05:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717158844; x=1717763644; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XvlD5wdKyPymthhmAwEMQSAR+M4d5dFZf5MtL2h/LN4=;
        b=XqLf7LhJE8rsLU1l86Sny5kJMvdbgEltvDO53tCaD3C0kh1E2HaD7hki3D364Xi02r
         8ONqQOHsGVgN+PWFydwXYMxWJAhVkbSB2Glr0wh/b68w4YxKqEg7N1uFQ4RDE/jE+F9I
         DbA+55yxFmXN+8OOAegRnPpZK/MZv/9hEfgnYgIQspvYvfgODtjuXRdKrnqNBd14tcC6
         Xkz2IOi1mJpWI9PwcqJd5///ReYGf4qC9D013JsBZlfGOLdmG2igw6fHG3TcC2sfIL3O
         /5KbfwCqUs+j+lbK+ImY+T/wQI92jhbyWbkQerR20gKkeMnkER5tJDgFos0EZCxrurBq
         Xl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717158844; x=1717763644;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XvlD5wdKyPymthhmAwEMQSAR+M4d5dFZf5MtL2h/LN4=;
        b=evagfeJCijukmDsk/Ut8r3gdUlFt2tNZ3aoJtIlMlkZVxuzIpmdu7AxtyreH8xodGh
         25fhs020Qi5G7Xrj1jJ5DLdypEmHjZ7jq3dCJUre/QZHK8rAE3gfzEP93W8gcCj7+lRF
         CC6pdeLTCW6I9/o/bs2M/1b3n+vlvaBitLBqJ2OI3rF096jQU5NvYPXGefx4ZmIpbZgY
         bkeb8xnQuA/3zIrUHsTHGDkqJu4Mu/MFXhOssW1CwnVJFYRiGo0Su4CtIBJ/s5Cd0Mvf
         X5qBSHCSeiquadkKQvDWzH2VRqj3yatgzDyTWeU0GlvyFpPKRZOmFdCSiV+EW4HKq2UI
         qyvw==
X-Forwarded-Encrypted: i=1; AJvYcCUvxxtojVwZuFkLCkDAe7zXJ2NSgrY+UlLn4Aw0oX4CkU8pG0tD9cmrAI2nbhO7Xl963Lh4as4BiH1QU2zHVUY97t2T2WzJKACK
X-Gm-Message-State: AOJu0Yxef+SLrCJj3VqofpE9GYUH0s/hRM8pSGKGmQ9hMqxrsTXM4JKa
	ZnQh68aLB9/8gL7rP+WISMAIrHNlpJE5RCvKY+Cl8c6TXNeYOxC02dqCKQ==
X-Google-Smtp-Source: AGHT+IFKAFHLouyg8vyhWRORhPUcHxzhXUqlDm5VVxkScTmRvvF0qquaKzFgikXVV3p1vEYC9WOeBQ==
X-Received: by 2002:a05:600c:3c98:b0:41f:3ee0:a302 with SMTP id 5b1f17b1804b1-4212e0ae746mr14938295e9.30.1717158843680;
        Fri, 31 May 2024 05:34:03 -0700 (PDT)
Received: from ?IPV6:2a03:a900:1000:7e9:403e:7c8b:351b:f333? ([2a03:a900:1000:7e9:403e:7c8b:351b:f333])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b8b1439sm23968775e9.43.2024.05.31.05.34.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 05:34:03 -0700 (PDT)
Message-ID: <a6c24173-d138-49dc-afb0-f48d41128477@gmail.com>
Date: Fri, 31 May 2024 14:34:01 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: lvm2 deadlock
To: Jaco Kroon <jaco@uls.co.za>, linux-lvm@lists.linux.dev
References: <c828486f-46d1-45b6-8477-ed390553f4dd@uls.co.za>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <c828486f-46d1-45b6-8477-ed390553f4dd@uls.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 30. 05. 24 v 12:21 Jaco Kroon napsal(a):
> Hi,
> 
> Possible lvm2 command deadlock scenario:
> 
> crowsnest [12:15:47] /run/lvm # fuser //run/lock/lvm/*
> /run/lock/lvm/P_global: 17231
> /run/lock/lvm/V_lvm: 16087 17231
> 
> crowsnest [12:15:54] /run/lvm # ps axf | grep -E '16087|17231'
> 24437 pts/1    S+     0:00  |       \_ grep --colour=auto -E 16087|17231
> 16087 ?        S      0:00  |       |       \_ /sbin/lvcreate -kn -An -s -n 
> fsck_cerberus /dev/lvm/backup_cerberus
> 17231 ?        S      0:00  |           \_ /sbin/lvs --noheadings --nameprefixes
> 
> crowsnest [12:17:40] /run/lvm # dmsetup udevcookies
> Cookie       Semid      Value      Last semop time           Last change time
> 0xd4d2051    10         1          Thu May 30 02:34:05 2024  Thu May 30 
> 02:32:22 2024
> 
> This was almost 10 hours ago.
> 
> crowsnest [12:17:44] /run/lvm # dmsetup udevcomplete 0xd4d2051
> DM_COOKIE_COMPLETED=0xd4d2051
> crowsnest [12:18:43] /run/lvm # ps axf | grep -E '16087|17231'
> 27252 pts/1    S+     0:00  |       \_ grep --colour=auto -E 16087|17231
> crowsnest [12:18:45] /run/lvm #
> 
> Allows progress again.

Hi

I'm kind of missing here to see your 'deadlock' scenario from this description.

Lvm2 takes the VG lock - creates LV - waits for udev till it's finished with 
its job and confirms all the udev work with dmsetup udevcomplete.

If something 'kills'  your udev worker  (which may eventually happen on some 
'very very very' busy system - you may need to set up longer timeout for 
systemd to kill udev worker (I believe it's just 30seconds by default).

If it happens your cookies blocks your lvm2 command - you can 'unblock' them 
with  'dmsetup udevcomplete_all'  -  but that's a sign your system is already 
in very bad state.

It's also unclear which OS are you using - Debian, Fedora, ???
Version of your packages ?

Regards

Zdenek

