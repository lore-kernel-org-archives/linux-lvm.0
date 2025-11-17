Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6421DF247
	for <linux-lvm@lists.linux.dev>; Mon, 17 Nov 2025 15:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763391703; cv=none; b=aBqSArFqaQJDERbfZvHWncafbhiPDTmJNGlIyLoNQdd9bCm1IrzxsnWHuHRSSRiGtuIUH2SHR4VKuntWiZHtd/DoSb3ElKkNwocAkrtDmNntmhx2XZnP+OroPTsWYyoY57AQkPW4gG2/PF3ND7N6xVJfGMrXybmzJi5XQoAmCxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763391703; c=relaxed/simple;
	bh=2ogGgnCumPfWerIN2DgW5cioUODwpuyGtkrgtq/T00c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ul5oCVNQJiaqOFXmtvGfLgKH4PbiXDJ1FYTch/Ao4f9EHDhgy0uWszsEKgnyrSBV6NjT98oFMPMp+5nZwr59D2I7qQOa30H63f7f+l9qYhWHJKZ+wnVRp3m1DxPimp2saHdFMHinFmes2ORul6qQdubhdfgDni20A5TrIy0TAQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPgkOvxP; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPgkOvxP"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47778b23f64so30597355e9.0
        for <linux-lvm@lists.linux.dev>; Mon, 17 Nov 2025 07:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763391700; x=1763996500; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8ycEqsO0slGn3JlkyqE3Tkt3s3YmrFU4OSwHMij6TPs=;
        b=VPgkOvxPs0rDIvYDdWhzXX6y4pworrTcdLmWRybQcZZJzT6vhmkZYAmr0yJBqtiBOT
         qki7msmSvzfuwQoPykWTf4AlemiHbR6rTiHYXGRGhueBAhRt5fMJ8o7RMU12QqxorzgN
         AAHz6QovuWJkR1EzmTiyYxA8k2yq/bspSHZxDM74XgTNhjKysvmwhwpDEbhed+ELLXhl
         nU3xamKMCg3bLYTUeICQmzNsu6B+doWIElMKtGt4p9bphMSc37ZyB8kfHAYnj5gNgzq5
         TErSTeG04CX3YghxuX1OXUN1gwnTWo1tec+Xqpjp08BjYRHfpbJY83LDN7hune7oIgyt
         LvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763391700; x=1763996500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ycEqsO0slGn3JlkyqE3Tkt3s3YmrFU4OSwHMij6TPs=;
        b=htDKb1xVa6HEAwI2iuc0dg6+4kJnLTZiSIMccXuB55ZyEcVEVzFjbQVe9hK0/D36Jv
         3XEbEiN/V41edyhct3HYgIAMBXaOwNLgdv5gtfqK8V558RIJaDlXF2WPLjQ2jy98dIKd
         013d854n2n109DMHo73TdT4/0X0esEOWwfacVByxr0oegyK3EDEhxMQeYce0wATExB5T
         SHEty+hnRu2fHahh0DMdMDgOTrxf04/sc/b6EauxOAz137eej5jjSYOu209wV3Li1Ims
         k7TGmyFUwtPkD4LhGCvgxcolw0Zg7F60yKab6SdjvdiL7fzcQ5/ZVNFn4VpPUYeTLBj3
         df9w==
X-Forwarded-Encrypted: i=1; AJvYcCUiL5onMuCJPXqkT20/wsqywMz25mKtslKiXbD7kMxSjV9aSmm++1VVNVQ3G6EE6FRkiZ369m2FP5s=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNPKnC0Ue9w/j12W/HuFGZLP4l1tzvi7O+tE8DrcQBGXWXTO1C
	kVnZ0kzMa/hHrdCRAzY3/HlLXKOXNG+08Hz7OybgNKTiI+ZjsHjk60cY
X-Gm-Gg: ASbGncvNXsUcT8J8W5jpGeEufhNOAkuyiMVqSDxeZeeTZzXciyj2MXlNaF7rKkybrjO
	MXp7hlVs1muDf0UbXGcfSVOfDgmLq/SFZm8KqyDloRQM48xNhVST0vPY4OVbL/tmXTZsVJAF43J
	aZSVpR4ZUjQ45feeefHPvPeFxbuXyegyKGeRfHUU4+xQ3Nffjx5Qhq1xs+Jj4+3k0HZnYzoVm3Q
	JsBcrQmGYfUX6cvlJxov61iGmp67U2D+eU1nBdvIP3SinB0FaHFoxfKdNFY3P6WZ9qVb/g8a2WV
	r/s8I0I9EEpPEyF5BvA0E3seZJMde3A71Jv2vPPZam9u/d7BX2Kntjsmp2ZFzPQ0tFaqmwkdpMz
	s/m3fNhq4ITDdSSAiegKDPnpLOlVRArYF9HmGmLKI7bpOaeJi2ep8h3OoZpkNrnp3wSkP15TEqn
	q5qpouJ34sR6Gq7F+g1S9/hajpyVz0xWWX
X-Google-Smtp-Source: AGHT+IHNFVk+n9MBft598TCjtr9fUae/wukwKMp3RW3B8xdrsZCLB+tbR0MSmSrDE05vEcZ+jMVjuw==
X-Received: by 2002:a05:600c:4f93:b0:45d:f81d:eae7 with SMTP id 5b1f17b1804b1-4778fea6decmr116874635e9.28.1763391700221;
        Mon, 17 Nov 2025 07:01:40 -0800 (PST)
Received: from [192.168.0.111] ([212.20.115.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477969b3c12sm146277985e9.13.2025.11.17.07.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 07:01:39 -0800 (PST)
Message-ID: <1b6fb117-7283-4ba9-91ee-7412a2d77b3d@gmail.com>
Date: Mon, 17 Nov 2025 16:01:38 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pvmove thin volume doesn't move
To: "Brian J. Murrell" <brian@interlinx.bc.ca>, linux-lvm@lists.linux.dev
References: <be9db13beb543be237fa069e3c72e22e1df2446c.camel@interlinx.bc.ca>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <be9db13beb543be237fa069e3c72e22e1df2446c.camel@interlinx.bc.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 16. 11. 25 v 14:27 Brian J. Murrell napsal(a):
> Hi.
> 
> I've added a new (faster) disk to a VG and now want to move a thinly
> provisioned LV to the new PV.  When I try it doesn't find any data to
> move though:
> 
> # pvmove -n /dev/rootvol_tmp/var /dev/sda7 /dev/sdc
>    No data to move for rootvol_tmp.
> 
> both disks are in the VG though:


Hi

lvm2 cannot move 'individual' thin volume as this volume is 'just virtual' and 
uses chunks from the thin-pool.

So if you want use thinLV from a new faster storage - then whole thin-pool 
must be moved to the faster storage.

And when you will be doing this - move the also _tmeta volume.

(See 'lvs -a'  output for volumes you can move)

Regards

Zdenek

