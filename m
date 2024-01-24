Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BA113340F
	for <linux-lvm@lists.linux.dev>; Wed, 24 Jan 2024 23:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706138284; cv=none; b=FdZKGDq7EBv3iimwAMz8M2P9xS1P8rfrAmlX4tvWn4/tpHOWm5kcnZ1s/7XaRq+DVrMvtxnvUpOErUJVJSs6gyFCEQFwBRacYyBHLCl+RmaTCHYMnwhQP918Zv6CrBTldVYQBHFltWNQz2Zj1i7uNg5SD8mXT6ctm4kotcee41U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706138284; c=relaxed/simple;
	bh=Px1aomZHFnlrfx43fMQQd88iYlsegsYvpNz+o+6UCeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HDLP0AWtOtb1Ddy792DpQCPG3/GmhPgKoE0sxSjULNoPgs1aPfTKhbDliiwlnIoqpmfeX7DwCTlXc9RSuE1844ZLvAeMuJrxQjSgYjHN2AFPSNVvx7vm8FBOJao0A70lqwfM6hB8BODEzMq18OUbR24nrcp14QWESm3K3yp438Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Wvzlv3+1; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Wvzlv3+1"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3387ef9fc62so5559712f8f.2
        for <linux-lvm@lists.linux.dev>; Wed, 24 Jan 2024 15:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706138278; x=1706743078; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ia2qsyJNL7up8fByJtf3EBc4CDwvZTmlObK/Frp5Cvc=;
        b=Wvzlv3+1e3eThZzb1K4onCLNg2I2gvJeqEZnOR7cWhGNP7QyTPv5M4WQy1Oz20f/Lj
         yh4JZJYs+c7fYlV1rcx7Oky2qsCbAGDx7gNwKrGUg+VQWHnCHJqxa3pvMozts1Y5GiNY
         03ekJoI/Ke8T1vaQtLYR1GYSkrvty9vMM4JDdcdtipHtIwciVzdR0y+mS8T/yziFKNV4
         q+u/inp31i//hfmsB2E2qHeugKxCCYxc4hxvEAOBSZIlPs51IyyDUvTpIU9gg+9DzrMD
         pxWiQr/gPafx8dI070JFhblvCE81UZYYWCRwi0qxXGfFARjlZn2XD5UXv7ApEEMMPdjN
         GqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706138278; x=1706743078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ia2qsyJNL7up8fByJtf3EBc4CDwvZTmlObK/Frp5Cvc=;
        b=PUEdPoLT6DjkXerpVBSXDfjRLI8/On1aBdw4WpeA3I7nyQxjphn/xEAnpLNV9DdkSm
         vBBf4IHLL2/79/7Usk8115M+JWMrV6uPJzyxnxR+TGM06iiaNNETO3c5toG5w7aOQEHv
         3ugUFfTECcjDXstXxOKtZtvHJrPk70X0d8ESc4M/y/VaQackOjjgGi4sFvbk5gwjTtQN
         FSn2YIvpUo/F4ZyT6MKWStnW5LHaGe27lkaOCOft8qCDI9pBQEhn79uGQ1xBh4I6Ovi8
         AqNQADvOJEmELA3DvqzGp6PXOgkINJwIztkU3blfJMXo4iFUsKRdU5ivfHJ+qyanENvK
         i4wg==
X-Gm-Message-State: AOJu0Ywd5+9zQZX8cxUlYRhEagyIDogrtVE+LPzgem+zhplSThSbjwBu
	hIbZhuySOWTfCixn0mo4XmijbfJXgiYX5M1g1F4x1k8Nel5hQH6QD6KzdhqhFCc=
X-Google-Smtp-Source: AGHT+IF+stgD7ki6Yr6p25NUERsvrpNt5useWzjnmae5JHEgg/lCjcHSHE4SXIac4J8v6gpAyHW75g==
X-Received: by 2002:a5d:614c:0:b0:337:c2fa:c710 with SMTP id y12-20020a5d614c000000b00337c2fac710mr33808wrt.133.1706138278370;
        Wed, 24 Jan 2024 15:17:58 -0800 (PST)
Received: from [10.202.0.23] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id c16-20020a5d4f10000000b003393592ef8dsm9065119wru.54.2024.01.24.15.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 15:17:58 -0800 (PST)
Message-ID: <ce7d5d40-027a-4119-b6ad-9ce7d04aa81a@suse.com>
Date: Thu, 25 Jan 2024 07:17:51 +0800
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Question] why not flush device cache at _vg_commit_raw
To: Anthony Iliopoulos <ailiop@suse.com>,
 Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Su Yue <glass.su@suse.com>, linux-lvm@lists.linux.dev,
 Lidong Zhong <lidong.zhong@suse.com>, martin.wilck@suse.com
References: <A4568496-76AE-479C-8B80-F27D7EBC1DEB@suse.com>
 <eb604d09-a713-4d61-a155-8e289cc5328a@gmail.com> <Za5xpeEStkITRMtc@technoir>
 <16a16fd6-d15d-4f92-bb79-fe3a4006258e@gmail.com> <Za_swUm-PGHoaf1X@itl-email>
 <e36e85b4-4f4f-4638-81ae-0980b32e69d2@gmail.com> <ZbD7ddzZQqjTC5eB@technoir>
 <0072b514-1201-4f7b-b328-303c42d037c0@gmail.com> <ZbEM7Ri0_30DYHh6@technoir>
Content-Language: en-US
From: Heming Zhao <heming.zhao@suse.com>
In-Reply-To: <ZbEM7Ri0_30DYHh6@technoir>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/24/24 21:13, Anthony Iliopoulos wrote:
> On Wed, Jan 24, 2024 at 01:35:49PM +0100, Zdenek Kabelac wrote:
>> I guess our dev_flush() function is mostly handling all those cases properly
>> with the use of  ioctl(BLKFLSBUF).
> 
> This ioctl by itself will only flush the page cache and not device
> caches, but it is indeed followed by a fsync on the blockdev which is
> basically the only way for userspace to trigger a device cache flush
> when operating directly on a block device.
> 
>> The only problem is - it's usage somehow vanished - and even in the past
>> it's been  basically used only for non-direct usage so likely still not
>> correct.
> 
> Indeed, the device cache flushing is required for data integrity
> irrespective of the io mode (unless O_DSYNC/RWF_DSYNC), direct-io only
> obviates the need for flushing the page cache.
> 

In my view, vg_commit() is a good place to call dev_flush(). This could
only affect (important) metadata IOs, make all write IOs to persistent
storage ASAP.

Thanks,
Heming
