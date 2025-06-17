Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBB62DE1FC
	for <linux-lvm@lists.linux.dev>; Tue, 17 Jun 2025 12:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750162648; cv=none; b=MaIQfHLmm6awwGJpQxi3i+T7Lls7xS+WdFcxYKsgIhdUp3SEQceOEj6oihm3meaMzAs0p1GJv3JLk8em8nmA3np9kjsj6Si/hfYCufB3a8FuXla0RRf1K5MSTYm6FRAZjyoFk7sqxqdbq0rW+di50I0QAOydrWc04a3PkJS2LSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750162648; c=relaxed/simple;
	bh=8UUK7Q10BWLPdMJhZfucsIFmkgVpN7F+d/ZJ9gc6Azc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QfmubhM28vAyA5tbLSeGLHiJY2kMKL7an5qATd15ZC83c2n1XPBgroRacv1skkukkYplJGspdITNKG34ZbPiWB1+AsSEx3zcJN66wxmYIlsZK2tALX5PFDrEENFkb2Dh3yHuOexF34cj12HH85VIepufTCb4db+P5M2ADs11afo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ef2H+pR9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ef2H+pR9"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-441ab63a415so65001225e9.3
        for <linux-lvm@lists.linux.dev>; Tue, 17 Jun 2025 05:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750162645; x=1750767445; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:newsgroups:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N6byZTNrg7dOTu4sGVjkqdOuPO4EpsVBpyGk5EsIrUc=;
        b=Ef2H+pR9P+lLNhrFTNhJHo94yGOO/InEKiAHdOn++eL4WhHGJE3yUmX0NzkrG2XiBu
         W8IfTy4vCxXpsi5KvMOcDPrI1A2vP18XLuwZ3/vVQqfUZ/vcGIBZ7gWzUJAbvlLlHJLY
         8IX51lTfkpQBFcjpje90DBonX92fcaLaaX2/KDdHPoIdOIOZtXtuxsLIY8/Y0W/DjOFG
         L6CH8xqEJNSK2xFQ9Qg4ITKH2hkhteHlVEbCX+E170CdaKw4ubZseTJ8nN8KtIEoiFAk
         v/XAl+qoRD0VmIpO5fQ+xiyV4Jk/4sn4MPRZ7c7Kqb8g6/JtWz6yHU8rJ6uQH9shrCdV
         JNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750162645; x=1750767445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:newsgroups:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6byZTNrg7dOTu4sGVjkqdOuPO4EpsVBpyGk5EsIrUc=;
        b=kv2rEWh0ijRLLy/Fpr5k7aXmx7RDyzMvw+N7ebHFuTs0Gmeqrhtr53uLz3fY/qZ/bB
         ANfjYcH2G/KEN28vcOmSv9mM9gycByW6jX+eemVYXQjogCqClfvy5iTEpethLiX6LXZE
         R8aqsqAG9oZDsTYqJ0IhlL9uwNXjBtHWDAFSHMNvROWBisdOMm6RtFs0nswMMKBa936r
         tehya3WN5DRmluqOaKjP03dpWsXHD+8KIGw6XP12ObK9jZTcTXEbDBhtTmcA9MKz0ORd
         TCnm4vHVUU7pOGDmKY/8U48H/DnswN7nbyTiCAZgKxaM3rKIpym3o9XHuPFDgmgNeo0Q
         TwRg==
X-Gm-Message-State: AOJu0YzIrOvNnNdGR2T47IVVmRG/Sr8FhWf8S8RQZjYXfV3XB2DnXcYp
	aOKfGbrktC54FalzZzEFoS9/HIYQgvgf/TsLwTrIU1KTdMjwuJezhF8u
X-Gm-Gg: ASbGncuz1Ns9956GvLl7Zx+x+vNKbe7B7htS8HqTl5JSVxXNkIaAWmyAuF7t5LHJsCD
	hsmL8OWuToDzCsGa3JeN9exWvXg9xz11qYl1WhCNd1w9boVBeiNuGUVX346JbLrmUZj/FnCKIyu
	y7ecTJPt7gXBRSQcIryTBTSBagjc4XY5ol1DISVf3mS0xfxbZDAheerE6+5sANoVJDUU0urpn9e
	wsgGidXNQLRg2a+i+n7P4KeJMm7q9tSdLo5IVXB3pAoTLxJL1tcN7YTGmMPayI4mfXQzO0I6nXf
	HZoguIOme/PXEREfX2HWZiZMU3jkM3jOHjGGTEznKxPDA/d2csHEyDtMs+frwm23wQjvmr/eWil
	GuJrjxwdI5H7YfoxVs2dujgRIf1GGQ64WKXCtIchr
X-Google-Smtp-Source: AGHT+IG3Q31GIEn3Bphyvr3zgZwJWtc0MaiOEYynzMTdNGE1Hpc9oK2YKNs7H5ojPCbu3LbQ20PdtQ==
X-Received: by 2002:a05:600c:4f54:b0:43c:e7a7:aea0 with SMTP id 5b1f17b1804b1-4533cab5428mr93980795e9.26.1750162644689;
        Tue, 17 Jun 2025 05:17:24 -0700 (PDT)
Received: from ?IPV6:2a03:a900:1000:7e9:403e:7c8b:351b:f333? ([2a03:a900:1000:7e9:403e:7c8b:351b:f333])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a60afasm13860358f8f.23.2025.06.17.05.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 05:17:24 -0700 (PDT)
Message-ID: <d85ce5d2-42c4-472d-9b8e-d220bd72e274@gmail.com>
Date: Tue, 17 Jun 2025 14:17:23 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [packaging] Who packages LVM2 for Manjaro
To: decayhonor@gmail.com, Christian Hesse <list@eworm.de>
Cc: linux-lvm@lists.linux.dev
Newsgroups: gmane.linux.lvm.general
References: <9322a409-f101-4c81-bade-7ea4700c8379@gmail.com>
 <20250616093724.734b23ab@leda.eworm.net>
 <99dc017e-aef9-47b4-97a6-163d8feb7c30@gmail.com>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <99dc017e-aef9-47b4-97a6-163d8feb7c30@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 16. 06. 25 v 10:13 decayhonor@gmail.com napsal(a):
> I didn't want anyone to register there, just trying to figure why the binary 
> isn't there and how to contribute.
> Anyways, here's the answer: https://www.reddit.com/r/archlinux/ 
> comments/1lcmw93/comment/my1mxvk
> 
> Feel free to expand if some vital details are missing.
>
> 


To configure build of lvm2 with DBus & Notify support add these 2 configure 
options:  --enable-dbus-service --enable-notify-dbus

Python is required (and checked for) to build lvmdbusd  (as this daemon is 
currently written in this language).

Regards

Zdenek

