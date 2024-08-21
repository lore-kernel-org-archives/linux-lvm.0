Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B841BFE05
	for <linux-lvm@lists.linux.dev>; Wed, 21 Aug 2024 11:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724239390; cv=none; b=QrC3vdL0n1fGVYkYT9YZ8P669eunmkzyssq6yuybvKH9vLdDBGbJHUEOoJ5kZ4TEPzSkVlnCAvghXFj30rGXV0MOwLqNLVQAT6jnWEdVj/XQlX3tZqejmzzndT2v4H13acq5wy8Mx3Tfu0TjDOOZoRfE2o1OrzNfRXj6KYxFb0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724239390; c=relaxed/simple;
	bh=oTv6yjgg2zUt1hZj/5rbcRhzlsiMI6ZV6L/il6Ydr0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HTDGkek13AuAieOupa7LaTASVB9B0YKwQkz2GEFMfPXiI8vsSSDIlAuWXETC0s11kzHIG6Xi/rQy6ipNujPA0N15H2QcD/wWLgLcm78zMiUaljbefTH+JS6Wud7vRtT3Vh66fX+U+PrvpWazgRBAK52CHIpfe0fnZvsNgExaFFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nwjqf3Dg; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nwjqf3Dg"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-428243f928cso53076115e9.3
        for <linux-lvm@lists.linux.dev>; Wed, 21 Aug 2024 04:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724239387; x=1724844187; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ec0GwJNs1BX+QZeIRlm0Bfphm2SRwV1yoMMOymHir/M=;
        b=Nwjqf3Dgp1gnm26rSUI/3ZgNIe2Yeg4XbxvrkCdsqU9H32xBOaW1I6bFOcu7OTPf5u
         UiMblbGIDcSCpJhDIq4zFEO18ZHux4r+cctf2TLHUSsM1EajPlG+XssXbeLsHUMldVqD
         CcHjZEdqxdz2BtDhbzZHAUqZMGAWnkHlrR7Cpoc9W51VuomUMwvnPzEqVOiyDVdVAiqA
         1r8c6KrK2HHwBQiqj7luL9TFWWzPlyzYR6fvc3EzjnJZsdP2A41GQRVKU46HDJ88QiDc
         9Ji82lkEPOm94iGtLQywFt45j+TbRwv+o3iuob7m1kBIzBuIcCRaGTsQI6dHAPzOhAJv
         mTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724239387; x=1724844187;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ec0GwJNs1BX+QZeIRlm0Bfphm2SRwV1yoMMOymHir/M=;
        b=ay1GAmuUnKGiJC0v3BWsqwGGPhZjQQS3DUI8hPej3sZlpVCrGsvW3xvjf/etEadc+X
         FePlHmQmAEH0AzwcLNC3qvQXypBEUn/iuZl5zPrEHbVtKXQbC4AhtOlXFaI5v7O6bzfn
         dNM/boRLNJz2i0CH5iUIqW3Z/1DZjCOezVCXmU7kA/0Wz8wv0MjIGDG7V0dONt7gieyB
         coRpykW5duNsgxkJYMNjYkUi/GyJSeOwYCglsyYeiAudFsEkJd8fLauMEsAcfBFLC/Jc
         YLi4phZB0nUN5b/CahD+DK14xrURrZSeyVEyzOiQMX3dGstIp7wRYZPZl7sRRLjWLkE5
         d1nA==
X-Forwarded-Encrypted: i=1; AJvYcCVVNzqVxCGx4sLjSl74YU+kkQaCyqJi9ukcL3id+GoulYbtSYnKnBRJJr6/LCFmv2XUSySST/HgphM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPhRAKG8RRvnnyoe3zK80LkkpnlrYvOwoRaSuVRtbc6S4nk6gO
	HKGbdnOHtW2a+OYRpO/xzock2oNb/IUrNpPTnPPGVbo1qDUduWDfj4oD8b1K
X-Google-Smtp-Source: AGHT+IEddwGF6q3UNNGJdFWOZfaizJOz2feZOdvIQJA4BMUpOgbe8GcU4rw1O4Na8pHyytTl9Ibs5Q==
X-Received: by 2002:a05:6000:1050:b0:371:8e61:23a7 with SMTP id ffacd0b85a97d-372fd599755mr1585873f8f.16.1724239386789;
        Wed, 21 Aug 2024 04:23:06 -0700 (PDT)
Received: from [10.43.17.8] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abee8d1c9sm22420605e9.23.2024.08.21.04.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 04:23:06 -0700 (PDT)
Message-ID: <ff0c96cd-72e2-491e-9286-85c6ce604f2d@gmail.com>
Date: Wed, 21 Aug 2024 13:23:05 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: --autobackup option
To: debian@good-with-numbers.com, linux-lvm@lists.linux.dev
References: <ZsAIwPIPOs36xR4R@70-36-235-101.dsl.static.fusionbroadband.com>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <ZsAIwPIPOs36xR4R@70-36-235-101.dsl.static.fusionbroadband.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 17. 08. 24 v 4:19 debian@good-with-numbers.com napsal(a):
> There's a --autobackup option on many of the LVM commands, e.g., lvcreate.
> What does it do?  Does it set a flag on the LV so that all future operations
> backup the metadata?  Or does it cause a one-off backup just for that
> command?  The man page is ambiguous.  And vgcfgbackup(8) doesn't actually
> describe it.
> 

Hi

This option (--autobackup)  is per command.

If you want to disable backups for all commands - you need to do it in 
lvm.conf   (  backup/backup=0 }

In general in most cases this option should be left in its 'default' enabled 
setting - unless you are doint too many changes too frequently and backup do 
consume too many resources...

Regards

Zdenek

