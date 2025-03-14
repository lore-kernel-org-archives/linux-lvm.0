Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40AC1DF98D
	for <linux-lvm@lists.linux.dev>; Fri, 14 Mar 2025 11:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741951527; cv=none; b=UElDrHCMaP11EyVKB1MJwUfC5cbnGdevhn+3u0cLak8JL5fY7nxbZARh799fKpWppcRK+5hpFdDYgnPyHXHVWjPm5zFfGtNenkdrgHKav44/SYjVaQSqHIUokoBvd3ir7OcmyKsEKvErLnNojqXopAUWtfxEhKSG0ECow5ZFBwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741951527; c=relaxed/simple;
	bh=A39itIqEab19QT1bSAgobjlckU/TKeckXUh8iuof4jE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tpfSNesIC391+t48auy3Po7zOOOrLxeqYj6rAxCGe2BYy4+cJY9QqBDf9FW1M1Typrc6vJ2ingWJTJL4OR6SiQtIA8bu7usF/ewjLwuLJmqRN0gSHw8SW3z48790mPNUIFEAY6HehT5XE4SovHAR0DGkgAGdNYDV+sof0YYqXA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1KlqPsg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1KlqPsg"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso18436845e9.1
        for <linux-lvm@lists.linux.dev>; Fri, 14 Mar 2025 04:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741951524; x=1742556324; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dK8JodAKUeDlYUytyNdh66vkf+ISbwHOc+X3lbyFOT8=;
        b=R1KlqPsgG1kGVVc+wsuIyXo707fJfyZS2B9jEZMO20qzvCmLwdcCCbhB2t0dw6YIY6
         +ZDw2CROcJnt/3DIS9p4Jxi3Ab4HDG0wx/EB654UY2LiMHY9JiRuwrHeaQBlPXYC73gx
         VU35muTwJBn4ANGJk4ynW1Iy8qRk/gkvp17n6wUSD1ud8AIJrG1HGW5M4CyEnX6dihlG
         uP90pIkZu1ElUYZzg5TQGnzCtPtRYSoETg3Xs8CFoIHolSQZHzV1PQzbSsB39JFg/cg+
         iL4ocL6yUBRGc9/tO4IcpQ2O1xsK87ffww2VmyXIpuSUzIE1dPdUME5B9hSnS22WRGXH
         pN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741951524; x=1742556324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dK8JodAKUeDlYUytyNdh66vkf+ISbwHOc+X3lbyFOT8=;
        b=XfZ/GiUmazKvU0TfX6q9IWvvSOlB0i2SJyd/lLNNRLiTpyTR4f+VBeXSB2jvfQZSXR
         r47ZwU+1rd/cVlNdAYeGhXY4gosW+pJVujUA6iFtxGsHteM1PhFXcyI20hROtn1ulHB2
         +gmboGHv69qPHsz98DPI5Yail5Gaj91aeKV3rAzvyOg4CMqeGyZF1FRSx3a2+8L3ooH5
         1YcNbUKqhQN/dJDyGbjYJQSejussGDVRrAV2X0wauV7ZbZ0vImk982jaYr2EN7P84gDT
         X8CCAna1QOtwlTsRlv9MZoUjUJ1QR11GbIQNSMYoPtK3D/BYgZMTc7ZRPR4OKTU7GsRC
         tfrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuG8mgpIM8Tir33f8X8cjERoWz0qW9hp0BebEs0mKMdeXYOgDfl2bOGGq8nYM6Uk1koF7MOv16VLs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEzElnBFB/s2Ite21vj47VZNJol7Hx309n5fXeWqxYrg7VdnRJ
	d3+071OcNKcyW+X6E0AJl6TpQxODV4QraRqZ/k8sHbhIfagcnL9XfOKziKRe
X-Gm-Gg: ASbGnctXdWzFbONtYyJbJufzil7Z+DS/GQkuJ9ZeUQrycEXXDV/uSvs5ppNLCaTi+kv
	2bYVHGyZ8nbubNfuVOhXgKcEBndHvdjgiMako5imwTb7NoU9rd1i2ubptEdctvQXe4gweo3ARAG
	hV3lY6Wbf3Styj0/l/xir7Fuwc44RM9e4dNvtKyRUAUo40B1u8K9+JHAzWPEa63UR+ZIzMgeQYc
	hU4fvQLb/LKDrmXd2WENvBspTyqi/fp6nGW9g0ysrlz8HuE0xT4KQe/MsmWari4Lbw7OBGN6bha
	1eltXR2An72g0MZ9bK9ToYC4MkIYNsGYsYeWglmsYVuzGRpJWmY=
X-Google-Smtp-Source: AGHT+IGx3lRUzJGj1sVkzvgCPe1MbmWcFzuZMb4ppgdcBl6Z61n6QpVaNJC2LDPL9W09apKfQoIG8g==
X-Received: by 2002:a05:600c:1c9f:b0:43c:fa0e:471a with SMTP id 5b1f17b1804b1-43d1ec72c5dmr31051895e9.5.1741951523702;
        Fri, 14 Mar 2025 04:25:23 -0700 (PDT)
Received: from [10.43.17.62] ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe152ffsm14361335e9.13.2025.03.14.04.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 04:25:23 -0700 (PDT)
Message-ID: <a0feed8f-0582-445a-9244-75e61caa2ff8@gmail.com>
Date: Fri, 14 Mar 2025 12:25:22 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Converting thin stripe volume to linear
To: Patrick Hemmer <phemmer+lvm@stormcloud9.net>, linux-lvm@lists.linux.dev
References: <0eb680b5-ad45-45e6-bc17-de052aa583a1@app.fastmail.com>
 <c75b67e6-fff1-4a06-8abb-e0501bb039c3@gmail.com>
 <a6386aa0-4eba-4a29-b737-aa93aa2232ff@app.fastmail.com>
 <c6889d49-e07b-4452-bcb9-f800087b9e90@gmail.com>
 <9cc24dd9-9589-42fc-85e0-620996523cc8@app.fastmail.com>
 <7a5b8bb3-d413-4804-9a50-7f2874a93dfd@gmail.com>
 <a5e7c616-70d5-4108-a963-b298ce317163@app.fastmail.com>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <a5e7c616-70d5-4108-a963-b298ce317163@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 14. 03. 25 v 2:30 Patrick Hemmer napsal(a):
> On Thu, Mar 13, 2025, at 20:27, Zdenek Kabelac wrote:
>> Dne 14. 03. 25 v 1:17 Patrick Hemmer napsal(a):

> I'm describing exactly what I want. To convert a thin striped volume to linear.

Hi

Unfortunately you were using misleading terms but we are almost getting to the 
right point  -  as you were like talking  about volume named  'thin_tdata' 
which was striped LV and now is raid5 LV - but it's not 'thin' volume.

You want to preserve thin-pool functionality, you just want to relocate _tdata 
to the new drive and drop 'striped' functionality out of it.

ATM your thin_tdata volume is already raid5_n and conversion to 'raid1'  type 
is not supported ATM as lvm2 rejects this conversion for stacked LV.

So for quickest results I'd recommend these steps:
(Assuming you are 'brave enough to make them)

- Extend your 'ssd' VG with your new drive

- Create new LV (in the same VG) on new storage with the size matching _tdata 
volume size.
   # lvs -a --units b
   # lvcreate  -Lsamesizesize --name new_data_lv ssd  /dev/newpv

- Do an 'component' activation of _tdata - for this whole thin-pool and all 
it's thin volumes must be inactivate.

   # lvchange -ay ssd/thin_tdata
  This will activate volume in read-only mode.

- Then do a  'dd' copy of this _tdata volume to new destination.
   # dd   /dev/ssd/thin_tdata  ->  /dev/ssd/new_data_lv

Now 'tricky' part:

- Take a 'vgcfgbackup -f backup ssd' of current VG

- After all data have been copied make sure LVs are INACTIVE
   lvchange -an ssd/....  or simply  vgchange -an ssd

- Edit 'ascii' metadata format in your text editor - i.e.: 'vim  backup'
   look for section with LV name "thin_tdata"
   Rename this LV to some other unused name i.e. "thin_Xdata".

   Than look for the LV section with newly created LV and rename
   this LV to the name:  "thin_tdata"

   write lvm2 metadata and exit editor

- Now restore lvm2 metadata with 'vgcfgrestore --force -f backup ssd'

- check with  'lvs -ao+seg_pe_ranges'  that are all desired changes are in effect

- you now should be able to activate pool and use data from new location.

- lvremove now unused  thin_Xdata volume - evetually you should be able to 
vgremove unused  PVs from 'ssd' VG.

- You may apply similar workflow to _tmeta  - although there should work pvmove.

Regards

Zdenek

PS: Let me know if find some step unclear - it's better to ask instead of 
causing data lose.

PPS: - yeah we will need to figure out how to enable this missing workflow 
within the lvm2 - so the user does not need to do above step in such manual way.

