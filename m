Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E9436E573
	for <linux-lvm@lists.linux.dev>; Wed, 19 Nov 2025 16:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763568415; cv=none; b=cKhQR5fA+26qWwu2ud7Caxgj83Lo1zCiXUCatk4c+yAa2VociVJPDTMUrF6Q/h94wd41hBWv6v5V+k14pJa/fSJ1w9O5sNzMJnb5Id7J4+mEpJFJrpXkRVyFzv3/Sj2AbwfFWbCBDTexiGlHazpfXJN7LmbUvDaIQ+cNvj3Eqx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763568415; c=relaxed/simple;
	bh=NJfiqqOgTqRFN7a5/9YUQ5pjHyucR2noQhURNd/aXRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SEpsx5tD6s1qSb9m7UwJSHoOcZq+o6IMTLn63G08HGzzoCjpjcXDIsZiaLRN2+S1BuiAZjvWO8DSXH9Tns3/dqL211oL4yXYSpFoMdcEr5I3vgIynhkFJQpUMhxLbadxN9OCF56aEb3Pf744ic4Alids9uoZ8iNrdhFKV6hmg/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEc+8fPz; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEc+8fPz"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so36964215e9.2
        for <linux-lvm@lists.linux.dev>; Wed, 19 Nov 2025 08:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763568410; x=1764173210; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZRcKblCKJhlGTZLZyN668uLYMuyU/oJRmrnRws+OGxE=;
        b=iEc+8fPzOSWBkQ6GZP4FZH0NxyK9DB6iOvKCR2PkFMf3XEyPHEFjbSkpghV4IatoLt
         mxYjuPnuG4cmEtafVtvWQ6GVuxPhvGdYs+Rrlyub5H01ebbqzxSPidRvj0mUI6vbfJI1
         D68gZU0ivF1rDKXvGKpzXvFje8pAfDQGiprN7ytWS/M/TnnpAegDfZyzB2+3KWSkJNyu
         HmRjbRnsnZSuO7C3b7+yXD+zdReZn+9Z54Z2VSfSTd+ALLCFGetdcUbVfxCxRklin+DW
         XIvrVW2JGwVdeRuqGaEIWXZXshKRMzmnSWddZ7Hdxjv7BICLw/EiL/uvGwVw8hP3Zduo
         urRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763568410; x=1764173210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRcKblCKJhlGTZLZyN668uLYMuyU/oJRmrnRws+OGxE=;
        b=FyQsFc3vRhR/8SoLq9FyMKRhW7toag+2ryu7x60V99CBhq6A6yeQEOktnUVPvi2JKh
         icrTApFPKkgCfJiaMycioTsppvq65tmenA86wgDczeN1KUG0gQ5hOZnf+SyTr8OjqENw
         t1sImWILjEdW/cX2jPey4hSrXZ7oMsjO67f3gANGHYxbu/TCylqyo2YLGDPzml5kE67V
         kh/D3h9OknTr9lgWwZRWGDEtHVQU2sDYn9BzPu3TEHD5/YSMuyQC0pNgn1c+Xv50CDYE
         v8PcLoaKt5ne+TFJbBuY98o6yd8jHwsYvw6H6yjUvmCZEyMQm2k9iZac3zX2gTK/cK3P
         SAzw==
X-Forwarded-Encrypted: i=1; AJvYcCVGoeTZc9hjTJjX6OaDlYnTJXftO86D1w5Rq4b76qr/IT0DDVeLHRDHsF85A2i6pmfzWzCJFFRUpIM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwM9HDY4+ljQlABCEde7p8aYV1RIQup9iqtoabPlUo1C0ShKIF7
	BPVlASkR4Pxq0yGp+s5fhLSHZ6PzOndkzWwHa8jDTPkQVQww2lEnNy+V
X-Gm-Gg: ASbGncuqQcxRp4NahAH7wVYP1iNu4qmFulbO+5L4z5wXhb34KI6HoiIlf49zoqsq6dN
	iDnc11e7SR7W/QZh04I1cby+m8c8JmAriq0oqeOkLXFXv7M8SOgSQDzLCicTZOB5Q2GKvdrdxbs
	KcIOAUaZBkvFMboPt1DOwIdTbR3yOoMJgcSLBb2n/veSOW5ih7au6k1h0xdCG2fX8q7tQsCf7Mv
	gEhpFt10PexQ+CH7EkmB3fofeYlSKhSq+mh1VLZ5+Wzy1Tk2Mg96sJ9rq3ebfFGbwNgT5ytJVUx
	W+YkMrnHqTCZ9EswSy96YUgtb6flcQWoT0LYAiwhMj5cjOB1JmDdPREX+dqgvJ5XYIyLznzWiEG
	cnrDHVJHm8OgGnBPf9Fz1rujl0uTBPJ3I/sJYcFaIs6exSRiIe5fcYUJefL07L7+lbkz1Pb3E2p
	Aqp+Vxw2OrJfxobiuXxYMlkw==
X-Google-Smtp-Source: AGHT+IET1e348UV5/u8AKbuZ03QvbTRM8YDlNJtW1eGhHtPeCHanDa8iH8pJRCMAGptayNNP3nn/vw==
X-Received: by 2002:a05:600c:4452:b0:477:641a:1402 with SMTP id 5b1f17b1804b1-4778fe5ff35mr170368155e9.4.1763568409664;
        Wed, 19 Nov 2025 08:06:49 -0800 (PST)
Received: from [192.168.0.111] ([212.20.115.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b1013edcsm54586215e9.4.2025.11.19.08.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 08:06:49 -0800 (PST)
Message-ID: <9c2a15d0-0d7d-4462-af43-83221c2ecbdd@gmail.com>
Date: Wed, 19 Nov 2025 17:06:47 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pvmove thin volume doesn't move
To: Matthew Patton <pattonme@yahoo.com>,
 "Brian J. Murrell" <brian@interlinx.bc.ca>, linux-lvm@lists.linux.dev
References: <be9db13beb543be237fa069e3c72e22e1df2446c.camel@interlinx.bc.ca>
 <1b6fb117-7283-4ba9-91ee-7412a2d77b3d@gmail.com>
 <29209080-c09b-40df-86c3-f22c1d7f6520@interlinx.bc.ca>
 <5067ec8d-991b-4b90-ad3b-f9dbbb0472d5@gmail.com>
 <81e51a5ad8f9c32610b8262447af635da81d53c3.camel@interlinx.bc.ca>
 <3620fc27-e54b-472d-bc82-be01f7b2739b@gmail.com>
 <6D706D06-AB0F-4C55-9F68-E8E07926A511@yahoo.com>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <6D706D06-AB0F-4C55-9F68-E8E07926A511@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 19. 11. 25 v 15:07 Matthew Patton napsal(a):
> <quote>
> Usually once user goes with thin-pools - it's decision taken with knowledge that the only way out is to take out whole data out of thin-pool and copy them to the new place
> </quote>
> 
> That is one hell of a wild and unsupported assumption. Practically nobody , even seasoned sysadmins would know of this deficiency. Does the lvm(1) manage splatter this warning prominently?
> 
> Pretty sure the HP/ux and IBM implementations support thin movement.

Well I've no idea which volume managers you are talking about, all I say is - 
lvm2  ATM does not support any sort of 'extraction' of a thinLV out of the 
thin-pool. The main benefit of using 'thin-pool' is the you share storage 
between volumes.

As far as for documentation - I'm pretty sure we never mentioned any support 
of such operation within our lvm2 man pages.

And the initial lines in our 'man lvmthin' explicitly states this:

----
Blocks in a standard LV are allocated (during creation) from the Volume Group 
(VG), but blocks in a thin LV  are  allocated  (during  use)
from a "thin pool".  The thin pool contains blocks of physical storage, and 
thin LV blocks reference blocks in the thin pool.

----

Thin-pool is some sort of a black box from lvm2's POV - it serves volumes - 
and lvm2 knows how to make those volumes available on the system - but the 
mapping of chunks to make a thin LV as fully in hands of thin-pool target.
lvm2 has 'no idea'  which disk space is in-use for any individual thin LV.
(there are tools like 'thin_ls/thin_rmap' for that)


Regards

Zdenek

