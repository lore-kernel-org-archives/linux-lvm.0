Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010C0205E24
	for <linux-lvm@lists.linux.dev>; Tue,  4 Mar 2025 14:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741098329; cv=none; b=nlVOdFs5hkSXvCK8bnK/Bb3Y31x8G8CCEnqhe8Mnk76uXZsZ+fM/9Qp8Gl04KkXbRD/Qvl726qOfsAE20EicOYrGDIdf4jp7ngb2f+XtK2ojs3zuQr+R/cVOdJCyJmTuIAgYzxD15DEJh0eP/RhAVLw0twqqF5FywrSLGQgrswI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741098329; c=relaxed/simple;
	bh=OEuIdqh67f0QdhgCMS2iVt8oq9pqoUCrvbphdfdhQO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uYBPT2nXQ7XeaSr7HWOQOYEyC1k86/Kci3YQqcw3CxZT7sWG/p6dfoYq0ropuAvpb0l8NXZ6D/bTNoqwkH1Mj9eTJK6xuQju5ARvCrsgzVW0szT8dVCTIzJSSrryj76WZOZPZovLEVje1VOUgnE+fXTVr9Fny16qzB05O5mGNYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4zsYixB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4zsYixB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43995b907cfso36880015e9.3
        for <linux-lvm@lists.linux.dev>; Tue, 04 Mar 2025 06:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741098326; x=1741703126; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cxH2HaYGTL1V6CDyXgT2GpOyEzctYZ+xoIMbvTWsm3M=;
        b=F4zsYixB523jdOHb27xbjV3QL00XEINWeWQDf0zTw7bYscsnGEXPPw49FnVC4rx/aP
         80sGPvJbErUY8cOsfpvdG0VNdDQSrC+I7A1hHrn793xaTa+uU/liAndCh1qTcCStDWmE
         PTpznEgSUmJQ+rxEQpSR+/mExXW341xC6PlDapi1SsN5ce++RPWBo8eKv+NOO0KN/jSs
         gyGEb0vCJpkf8mESizCZHP7ZEi3godnyy3iKJlRSOyj1Y7FtqYiEZP/9NrqHGWnnRl9j
         HlVVH8vfbRUOgmLB+TQdgew7g9cv4R4ZFNti5le4j3M7VDFOLyl2pNqnqZp/m3cEp8d1
         QhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741098326; x=1741703126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cxH2HaYGTL1V6CDyXgT2GpOyEzctYZ+xoIMbvTWsm3M=;
        b=swwDlNrlgSnINZayQpZzZvjnnlcXwMeKgj6kv2dmmdCfLdTVdYfmHxN+YBYAbl7sb5
         2awro1MRNHF4H/sh0cN+zk0PMu+V2Urix/ugevVPUpCUoJneqMNVoXIcSg4ERl3840tV
         QJyqtiSwkFegJPwyluP0mM+qsvD8a8Wf+yQbEp3ncmj5SdxLhLFAAGSmCnJ1Mv4G6VRW
         7/LCGaeepI9zQQgDywFxq37XE+fYGt2UB7Jd8wbIKR2dOB6fVgM1D6FQ1zhDAlR6AtPc
         jybGE+LweFErr6kIK/PLWoTcg2DNfveB7fXWAzKoFL/7JyckWs/4Dd3rin7DhVNCk8vX
         Kx8A==
X-Forwarded-Encrypted: i=1; AJvYcCUGE6M5bsGtQwRMW7iKw+LmFVIsAHaaRQvRd/HdC/3J2tNr8AL051vxqrHUuQZjbIXJJxtmzAZEol0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYoyZBSOhqIQjk4ZUchJXjWMMc2aGG1bmm7l7cqn/mG5nkRizy
	dtLyIOzwE5x0m+8vAs5ovsA5wJ4mMztf0bdyO6zZlfGC0rCK4FCT
X-Gm-Gg: ASbGncs4OQbBJkbxkSKdHVKq37kwyZosH2mdmbErCH+nC5zCqGmk/umsKSp4feO6eG6
	jzyCKPtkT5sla8bl9XRftRCCp1XvUICR7OHHMAt0AaBUvZiZKIBXfLWcXiAIs5/7WA6PgYxES5o
	TwKmAYaQtzUvXLzjyA0Q1QL7fHjoKGeTt15HWPLDJwMV48Uu8A+Fl2SESXd1ufOsWEwTAvynimq
	6Rk01PmpIgZHyCLFaAZsyTjI4VzNY8luu1ey0ED90EPp7SxnAaR4VRan9kdfcgjxmtx7LKOznEz
	J9/ilF7RizIjsChrEChR2cXTyVG5zRRb4cQZVQHZm4WutqueKOLkYlGab83IIkea3Ur6sFndoWj
	x1pld15poEWryay0UF1YdMNk=
X-Google-Smtp-Source: AGHT+IEEPgePiau9SQTt7ipex2hJPAHttWyYa5YsQ2iXg6CffKENaiZuFDK5A1WOFebdj3SMDu4FLA==
X-Received: by 2002:a05:6000:4029:b0:38f:2726:bc0e with SMTP id ffacd0b85a97d-390eca138d2mr16407606f8f.44.1741098326022;
        Tue, 04 Mar 2025 06:25:26 -0800 (PST)
Received: from ?IPV6:2a03:a900:1000:7e9:403e:7c8b:351b:f333? ([2a03:a900:1000:7e9:403e:7c8b:351b:f333])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b6ddesm17820543f8f.41.2025.03.04.06.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 06:25:25 -0800 (PST)
Message-ID: <0755fea5-22f3-4a90-aec7-07ddb88c2253@gmail.com>
Date: Tue, 4 Mar 2025 15:25:24 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: LVM2 headers
To: DeCay <decayhonor@gmail.com>, linux-lvm@lists.linux.dev
References: <825942ec-5b4f-48aa-bac2-02198d2a2733@gmail.com>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <825942ec-5b4f-48aa-bac2-02198d2a2733@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 04. 03. 25 v 9:29 DeCay napsal(a):
> Hello!
> 
> I came across a rust library (https://crates.io/crates/lvm-sys) which depends 
> on lvm2app.h. This header doesn't exist anymore, as far as I was able to find.
> 
> What's the right way to interact with LVM2 programmatically at the moment ?
> 

There is either DBus API or just simple good old fashioned  'exec(lvm)' of 
lvm2 command.

We were unable to provide and maintain the C API - as there are simply too 
many restriction which cannot be easily satisfied with any random binary.

So easiest is to simply run lvm2 command or if you are able to consume DBus 
API - you can try to go this path - however than there are many limitations.

Regards

Zdenek

