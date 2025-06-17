Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F1A1CCEE7
	for <linux-lvm@lists.linux.dev>; Tue, 17 Jun 2025 14:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750170724; cv=none; b=QQBA9k4zB8OoSMqZyXWjg2V5B8y+JA/4K/B0ji0I5pf5jAtq/tDUFsHxxTN2nmBztqO/6Emmr6jTwUwPSl0fTMus9+pvu9poavA0e5KGsrUtdVBIN/7xhW8BcEKN5zLKwFHXFllF4X7KMrB6cd9u/vI+VDtkPbB0WYVlD9FmHQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750170724; c=relaxed/simple;
	bh=nIgBUFo2Igfn/6zl5kYrBWXQbM6gk5AiffS24QRi02g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QVyS7cXk58yVZAXPmNf93WOFec6t7ItFeBR5egd+RnkKCia4zXsjX+k+TfSvIMw8FfQfzjoxCrjXfC78W7ZPEIn3+jrHWAmB6poWVIv0MWsnACjH81YpfM5/xyDZRNgvAFtYtTdiVHSC0+DOHVqVyf0SxSSKNsMFmwc0KKtBvdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2+XhF40; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2+XhF40"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-606b6dbe316so12122011a12.3
        for <linux-lvm@lists.linux.dev>; Tue, 17 Jun 2025 07:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750170721; x=1750775521; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R4d4isbvIyuj0bPMdAeKX7oIPRjX8Z9luBbXE3r6VPU=;
        b=U2+XhF4086jXKAX+77FioI6POinOl/zicHUgqE7w8lsrrb747sUh3qlh5KO4nbDhVf
         JO+nuVgLytzb+ChfeKTDaNsaCxbo+1bmyfcXk8V2Ub0Z5HC+VBDueQ7vrFcjWBk3Q41/
         dC1ZJ4YBNCeOJEoYXwWZgxjbFeYvqYfRJyT8XSCr3qzYgBxI0fBxw204FqGk4oyO9jjh
         aPzfgNflNqTAyoDBjRbYzI4IVZXoxWMinRxGD4iRJQAzrteW2iw7a53lIvRVNA/pw/wg
         DZQG9uTjamRbueEIb2mn4WMXL0ZdyDj0aRa7unfljai6IhC59bXDqPmViWJraKYyPuOA
         1K+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750170721; x=1750775521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R4d4isbvIyuj0bPMdAeKX7oIPRjX8Z9luBbXE3r6VPU=;
        b=CZqIpDhYX0i+hbm/7JokYR5nL6tZcwO5/C519IN6DhZK3EfX+t94XdsZ9oYxATYcop
         8mtdi+emJlgmF9bnDO0JxCYVeWuYLKLlRvv1AretkNo4QNNErAAbSHyL3yRErtl02RLs
         +DUoM1w17ZCkJnJ6HiVL9d9b2jaboozBHjCN4taM3IOYhPOXbgt5GxnayTpOrpZ9560r
         9mqYRVmaAbaJsCUR7Sy4Y/yWA59nrXNpkJuOc7uvaETbYaD7b1Nu9QCQ3KqRywjKfyin
         PAv0gf9Khjx3Dero1pjaczPrsURQ0xwCt7wv9pPqdA+fu7PBBW/4eZNpybhy2vckkr83
         ZM/A==
X-Gm-Message-State: AOJu0YzqL9jFz9enWHiwGlPg6JXSc1wtfGmJVJM6bdoDUUlQ5ePK14LJ
	Vevd0Qfw2GJEqJ9lw3oM1aukJbigEYG6C+7MEvw8Gxp2cUxuo14Rklft
X-Gm-Gg: ASbGnct+aRRjrmm9sPsTf2ROoXyMwGIlaae90KFa/nTRk2ltaF93BQbtp24J5j84PZf
	zwDl/6u/NDtJQdmu6CZizmiCi7xD0d4DgnCq7BETCO+GONEsc4trH8WDSK9yxU4+gmbLBgikkYG
	30O0Rsm27cc516AFGP94Qa47qwB9pCMa7QWb3O3UQquWu4YBcqFVUqL2pNrAMskdgUTSiAdYRoM
	WWZS08AuhlVTrQJqx//imzxYIfxtQorMI86AemS50m7DkHUTB/lzs9mCEzyNSu4qse8LWZ/OXlO
	ctAsLaq/6q+4Ricr6Xq+CiJa+Qsn7CGqYDxUB7k908/sxlUDCYHjmyABmomoJmhD+P6ePQ==
X-Google-Smtp-Source: AGHT+IFthS+8TEylUvXZlzpZHQ9IkSx8KmPZ/AJSvvZsnkszoRrSoxNQstpFJKBSv2gXUTir5l2tHg==
X-Received: by 2002:a05:6402:35c9:b0:608:42f9:a5cb with SMTP id 4fb4d7f45d1cf-608d087a454mr12615471a12.10.1750170721131;
        Tue, 17 Jun 2025 07:32:01 -0700 (PDT)
Received: from [192.168.0.107] ([176.221.170.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a5b65esm8025889a12.50.2025.06.17.07.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 07:32:00 -0700 (PDT)
Message-ID: <83207b9c-7005-4c7c-8b9e-ab55fd9b477c@gmail.com>
Date: Tue, 17 Jun 2025 18:31:59 +0400
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [packaging] Who packages LVM2 for Manjaro
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>, Christian Hesse <list@eworm.de>
Cc: linux-lvm@lists.linux.dev
References: <9322a409-f101-4c81-bade-7ea4700c8379@gmail.com>
 <20250616093724.734b23ab@leda.eworm.net>
 <99dc017e-aef9-47b4-97a6-163d8feb7c30@gmail.com>
 <d85ce5d2-42c4-472d-9b8e-d220bd72e274@gmail.com>
Content-Language: en-US
From: decayhonor@gmail.com
In-Reply-To: <d85ce5d2-42c4-472d-9b8e-d220bd72e274@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Yep, I've already built a version for testing using the 2 flags.

I found that the build process requires python 3+, pyudev and dbus 
python packages.

I guess that runtime deps are the same.

On 6/17/25 4:17 PM, Zdenek Kabelac wrote:
> Dne 16. 06. 25 v 10:13 decayhonor@gmail.com napsal(a):
>> I didn't want anyone to register there, just trying to figure why the 
>> binary isn't there and how to contribute.
>> Anyways, here's the answer: https://www.reddit.com/r/archlinux/ 
>> comments/1lcmw93/comment/my1mxvk
>>
>> Feel free to expand if some vital details are missing.
>>
>>
>
>
> To configure build of lvm2 with DBus & Notify support add these 2 
> configure options:  --enable-dbus-service --enable-notify-dbus
>
> Python is required (and checked for) to build lvmdbusd  (as this 
> daemon is currently written in this language).
>
> Regards
>
> Zdenek
>
