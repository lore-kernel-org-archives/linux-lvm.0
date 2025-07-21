Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38F72D63FA
	for <linux-lvm@lists.linux.dev>; Mon, 21 Jul 2025 16:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753116785; cv=none; b=UkcxUGyA4rkEi1lqpquHrJhKEyoSrK3jynfH+0M41uEvTLrHlieWktTaaKGECi6aTp0vU2itVdTQ9Gc94h/EVihcjK4ANLyBEWB6S5wswzkeoY3Y1l2XFhTgCRkhsq3ELVTXc2EM4yN6ZGlMOFKR0+Fjdqf0H1mbQrABEmub5fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753116785; c=relaxed/simple;
	bh=VEiVljFpTT6TOPuk4oolvFjLzDivJ/uxlVzgLNF8uPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VnbUrahSar4VQpSCh23SiEvaxnrJLiZuCqfz96ZmNwkz7dzegf9yLTKfapDLUYIzFtGEyXKKQd5LxDVkKDY6fLHHtZ9Gh06XtakhwcsSnGZinqHIRU1kHPSPMNIX/LwREAJ4ol757KGCdScpNKc2N6aZmtjjIRzUCx6iTNmbbwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBnVN8Fw; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBnVN8Fw"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4560d176f97so49468335e9.0
        for <linux-lvm@lists.linux.dev>; Mon, 21 Jul 2025 09:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753116782; x=1753721582; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PXpXYnUnC7BptZme0fi8EzsfuKmzbShD/qx9Q4Yzl80=;
        b=eBnVN8Fw+MvqCuwpQKw85Z6cakTHBOniCSiI0PUiLk0EgMc0t5+xFG+SsStv9IV8Iz
         A4n7JyscTlzIYlweACZzKia5QgRO6wxJtSpKWXB7IGI4gZSMYckZFAyNCT6OTRhnppXo
         VmYaMjuQBecPeKNmGSW3ZM+I/hYdixJcqVZlia+aBxkX2yLWoIzGyeVU1o4GFYqisXUA
         sJr1gigRLlATsFCb8K2wYDEKUDrN11r9zOqrVKUB6sP3D5RXuUy4XxA7RRxCuP0hpmxc
         TC1tuZaqBlKP8px2g6UluxVq2lmKL0T3mEZHotrDQfdBdYCC+PNNu6pD6ALVdLhQfk54
         5zmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753116782; x=1753721582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PXpXYnUnC7BptZme0fi8EzsfuKmzbShD/qx9Q4Yzl80=;
        b=JKKWPGMsC1n6uPo8oQIO5TNf771dWCE/umQx8Aj+RwQTrb0RGSMQjhmLGDoFj+HQR9
         ZOA9mqV8bJEUFojpJDKY/DCwmYkFkbKDh6FQA0LMgP4PhdfwD7/rBGYdkXkPIeW1iDQ0
         jaxeEzaXpr3RWU8/jv/kWRjegMQhUx3Lbad0nG6WUVx9Uco66whcp9pc8sBjD+r7YVVo
         JwcvbgLsHnwqtzKsBY/viQnkmrTidBaraGFdLHTywbm0bAeSlUVdqXA9ySm58mCmiada
         Favs068U0NX8Evv0daTR5jE/uSiYBjZu/Ks5ZNh/wHACbOqhzkmiISjPyjMEoUnt0+Ll
         nAsw==
X-Forwarded-Encrypted: i=1; AJvYcCWmhCi+3Ecr59QX5pqONlU/k1J9BORm5wRLHqK1nBy3ZfSzS3f9XK1EtUnQoB/4cap750/CcwxLjWY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIQ2S4aIB//CLitexccf7g+VO+1GQIJIfM4M9MnU3x54e2oHcT
	z1hbiRUUW+euZQjXNN8hkC+L+8482PbEZwegL60Nrkl+8UADRYVLj1Ic
X-Gm-Gg: ASbGnctDxWjWvx1Dk1w2N6lzxHZw5n7eV8SR+CGwWxk+Vc5gH1lG47YFRcbjJpfbBzX
	EkjK3chVcE16Wnj4eRoa17/ULc8jzdRymQSjA4I4NbJDfkuSwGZtr8eq1fmPAKuULDQDO6qWqat
	ppVJ3ehC0EGZyeGbDXxJO/2kQFHX5W79pGkUOO+FV1kG2TH7ap0vfdCe/XA8t6BSfuzf4xGJqWE
	65exPXhgEhnL3J68qgRpyeiKwJ9Wpqnfthh526slSS2osPTXRFTgT3MbkaH8PXQhJsN06fbz3KX
	ubNtZH6RsEcXUCcICdsYsRMkG8tjpWI2QAhmSZxr7TtyT6HuBeitcNJZnXfL1IpNV8hkdIwpSsf
	Q/3RR/E62rlWxVBWTURbFTHhdE/xiPZ9w0KAMRG85JLjyoByZ+24dLZzcGhm9ewMeF3xitllqrW
	Ms+g==
X-Google-Smtp-Source: AGHT+IFTSNCUW2bX0nOGlpXHl0Cot6MJeQb0l9OzZiz6lPE47fyDk+XvMFMsRSPYDaFVO4cCqOWH0g==
X-Received: by 2002:a05:600c:4709:b0:456:f1e:205c with SMTP id 5b1f17b1804b1-4562e32e598mr186319555e9.4.1753116781857;
        Mon, 21 Jul 2025 09:53:01 -0700 (PDT)
Received: from ?IPV6:2a03:a900:1000:7e9:c971:864a:7fa9:5c6e? ([2a03:a900:1000:7e9:c971:864a:7fa9:5c6e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e89bfecsm167478425e9.27.2025.07.21.09.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 09:53:01 -0700 (PDT)
Message-ID: <d935e1ae-9e0c-4b9c-ac3c-9a8e080ae16e@gmail.com>
Date: Mon, 21 Jul 2025 18:53:00 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: striped LV and expected performance
To: matthew patton <pattonme@yahoo.com>, "Henry, Andrew"
 <andrew.henry@eon.se>, "linux-lvm@lists.linux.dev"
 <linux-lvm@lists.linux.dev>, Erwin van Londen <erwin@erwinvanlonden.net>
References: <FR6P281MB3672085D192D8BF5CB45CFE4EB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <FR6P281MB36727398D141AD2A1A1E76DAEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <67b28bf7-b862-4878-8434-aaf0d157f2ca@gmail.com>
 <FR6P281MB3672F7D1B62E229AFCD31D0DEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <9f6afc0d-ce58-472a-942b-15527f693d28@gmail.com>
 <FR6P281MB367296DD8DAECAB5633C9BDDEB50A@FR6P281MB3672.DEUP281.PROD.OUTLOOK.COM>
 <630443e7-b5c6-449a-8f6d-402a71967710@gmail.com>
 <46e3e8c3-429f-4ffc-a710-5d8d585fbd1a@erwinvanlonden.net>
 <2047613453.835684.1753116128145@mail.yahoo.com>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <2047613453.835684.1753116128145@mail.yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 21. 07. 25 v 18:42 matthew patton napsal(a):
> don't use LVM striping. Use MD/DM striping. Better yet, stripe at the hardware 

lvm handles both --type striped, type raid0

> controller level if you can. Generally speaking a 32kb or 64kb interleave or 
> "strip size" is ~optimal for any use case (yes, even SSD) that isn't LARGE 

Many/most SSDs do internal striping - thus they go with relatively large 
optimal io sizes (256K, 512K)

> streaming reads. If the hypervisor is VMware, it allocates in 1MB extents and 
> it will also interfere with I/O scheduling.
> 
> If you want to cut the hypervisor out of the loop, PCIe pass-thru is your only 
> recourse. And again, you can attach no less than 3 up to about 5 (SSD) drives 

This purely depends on individual hw capabilities.

> to a controller before you saturate the PCIe bus. Also consumer-grade (aka 
> junk) SSDs have miserable write endurance and write speed after a preliminary 
> (ie fake) boost. If you care about your data and speed that doesn't go to zero 
> ONLY buy enterprise grade SSDs and if you're doing a lot of writes, minimum 3x 
> DWPD class though if you're going to attempt parity-RAID, you'll want 10x DWPD 
> disks.

For boosting write performance there is probably a better option to simply use 
some nvme caching with  dm writecache or something like that.

But as said - trying to do any kind of storage optimization inside VM is 
largely destined to fail - as there is not good enough knowledge about disk 
topology - since VM fakes whatever it can...

Regards

Zdenek

