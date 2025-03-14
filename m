Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81055BA27
	for <linux-lvm@lists.linux.dev>; Fri, 14 Mar 2025 00:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741910749; cv=none; b=m1Dk/r4nnp018e/Byi7tebmn3D3c/9hGlavsTof8YkmTq8KQ+e7GBV6DQyr0l1P9I6Rbv5gD4tUIEd25YY5oHjFuXcI9Jn2Bh/iC25fcb454XrAnNATAsSoCzGgP4953qO525sJDe1F0dT3qixTgGoEtJKI/nplW7/QSRv0jiw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741910749; c=relaxed/simple;
	bh=xwpIuC0Dpr6l4q5P8qAi4g6WeDp8ftdwMXVO4WMa18U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RYLknnuIoQc70rpCD+L1RkDdVxK2iIxR7xIfKkO4B1zp7SkZF6muaZQ+ddXZ7iQoDLD7TAYNgLtJtG17YpzEdJ6VrETzS1QKS9GLdA2uqfjOkdFGUQtFl9j1zncy0aIHuC0xI9QXhY78IocK3vJzjUVcmgjUUzb6VWxOz3ZzW1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCI7qfcI; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCI7qfcI"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfe574976so9918755e9.1
        for <linux-lvm@lists.linux.dev>; Thu, 13 Mar 2025 17:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741910746; x=1742515546; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NDQDniKG5MXMcQByHt0gQ2WEW8Nw4H8IYUZWRNjNDiE=;
        b=TCI7qfcIllAh5vmcLiCVnca21ncJyHt/pNeZjyWta/8P5P3tlCF/9GFEgni5zOlBEo
         5jdKqM5AcNJDfOMgbEWElHW2n0lGR8BEvvb1b3pc5uOO6BI1foXavhpFsrUU21tvka5w
         tNf/gg6kWwO1DydR5Gyfvw76gQ4vnG1/hKRP9pTOO8KTlr6orxLmiI10wWQZCPKbAAfR
         Yhs6r30lWuNAUfzO0gublLlkvyCLrOHsh3Tzd9INcWASjoH9CdyCJINBf4CgdbGpkFJD
         D5xyxXeE/AuX/4PXLMMzCezwya+INIoVz5byM4bi6i6HTpLLKKDca+Pn/iqhozutBdwn
         kH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741910746; x=1742515546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NDQDniKG5MXMcQByHt0gQ2WEW8Nw4H8IYUZWRNjNDiE=;
        b=ryHgJYiha79sHua86DM8kORE/MyIWICTDaxNfSg1LOCeGi5WxoKOrsgFvqc/j/FW76
         y6WkoETcgh6pDIntJKAJSV6J8g4fN3LQJc95bd/n0et5M1hsjlT0e/O4m2EzbTO2glF0
         pfIxKhmil+HY9m07CXL2rWz2QSER6HWssu4Yb01WsA0+qxphDT1osHU+9T1J34QXH3Hy
         drV3dOiNxKhGMhkHDneLYJKpzPuGx+KXRCKPHEYL2VhZPJY2gpe3uDpfxlohsF91NCKy
         d4f5Qk4ofG5V5UBiFrMJ232oHIhHW4p9+y3zGOG11b0PY7U7OpG3xh2PFzybCzaM1gGo
         TZxA==
X-Forwarded-Encrypted: i=1; AJvYcCWserkcsNtAGV8wUDqKbOrLI8QmPpQM2cWw2R/afuOR1z8WlV2uWRJP8L81b9ubpn9oWWbXvAXXYMo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLuojAKwxpjzv8JAyDwfMZcas4Ya2Xl7mIOJ3SNZSB1hwcnflp
	/HvGcXga9KYR13gQNLuH9/jhs+ncGsGQEj1o49Pt2O73SKBVzFRubqlrLqNG
X-Gm-Gg: ASbGnct38KAFeMUJyb7InTv30zu1bMuKsPxP6f2jy0GkzpLZHQqr4bNyWpDJlIs3fcm
	dsGSGh/6At6fk4b3J2ERgqkhOceYOPEinBOQTkTgNUK6KSsPmJ+a1cU1BmUNwYZUCvwwBXCHAwG
	q/9XpzYPocLZ8jkGPKf+dfc1axwzuvNDnXzu6eFgtfxc09NSvp1Wc7KpLxFSHwrpsmTnjO0EuSf
	oHcUac7yu3sl1gitMb87myHDC7JbrtlwRyrMgRl++fTh5rhbMCOmhq0eOn2vp7KWltkY9+e5eG5
	61artHybHTqp4QEpA+MP/2NuXataHptZSMFj7LTqtv9vXyC0TkBU23MP+bdsytycxk20PLqka00
	Z5IstCVaQBSnkUiNxPgyJovg=
X-Google-Smtp-Source: AGHT+IHEqhgdaL/NJnpGmVX/Tazm+YCKIBCNFdEc5NUg4FFBL2iyNYi7hseRqaS45vQUd8cGS5r9ag==
X-Received: by 2002:a05:6000:1448:b0:391:13ef:1b1b with SMTP id ffacd0b85a97d-3971e0bdc02mr240227f8f.30.1741910745501;
        Thu, 13 Mar 2025 17:05:45 -0700 (PDT)
Received: from ?IPV6:2a03:a900:1000:7e9:403e:7c8b:351b:f333? ([2a03:a900:1000:7e9:403e:7c8b:351b:f333])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318aa1sm3781291f8f.64.2025.03.13.17.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 17:05:44 -0700 (PDT)
Message-ID: <c6889d49-e07b-4452-bcb9-f800087b9e90@gmail.com>
Date: Fri, 14 Mar 2025 01:05:43 +0100
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
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <a6386aa0-4eba-4a29-b737-aa93aa2232ff@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 14. 03. 25 v 0:14 Patrick Hemmer napsal(a):
> On Thu, Mar 13, 2025, at 14:54, Zdenek Kabelac wrote:
>> Dne 13. 03. 25 v 1:38 Patrick Hemmer napsal(a):
>>> I've got a LVM thin stripe volume across 2 drives that I'm trying to migrate to a new larger single drive (getting rid of the old drives). Following various information on the subject, it seems the procedure here is to first convert from stripe to mirror, and then from mirror to linear. While attempting this, I seem to have hit an issue on the second part of that process, and am not having much luck resolving it.
>>
>> Hi
>>
>> Likely you can convert your nearly full thin-pool with a single thin volume to
>> a linear  LV by just taking  'dd' copy of  if=/dev/thin of=/dev/linear - using
>> direct io option (and this can be actually faster then raid mirroring).
> 
> I assume I need to copy both the tdata and tmeta volumes to their new linear counterparts. Did this, but now I assume I need to do something to get lvm to rescan the new linear thin volume to pick up the logical volumes that are now on it. And also stop LVM from picking them up off the old thin volume. I deactivated the old thin volume, but LVM is still recognizing up all the logical volumes inside it. I could completely delete the old thin volume, but I'd prefer to get the new volume online before doing that.
> 

Hi

Thin volume is using thin pool that is using data & metadata.

Thus thin-pool can remain active even when thin LV is already deactivated, 
depends on the use case - and you can obviously deactivate also your thin-pool.

In your case you need to 'forget' copying thin_tdata or thin_tmeta or even 
thin-pool ssd/thin itself.
Your 'lvs -a'  you've shown unfortunately  lists *ONLY* thin-pool  (ssd/thin)
but not a single thin LV  (with letter 'V' in attributes and using 'ssd/thin' 
as Poll volume)

Once you know which thinLV you want to copy - simply use 'dd' to copy data 
from a thinLV to your new storage.

dd if=/dev/ssd/your_thin_lv of=/dev/new_block_dev bs=1M \
    iflag=direct oflag=direct status=progress...

Your new blockdev/LV must have at least the size of your thin_lv!!!
(thin-pool has 930.59g but thinLV could be possibly much bigger - so be sure 
you know what you are copying and where!

I'd highly recommend to check at least  'man lvmthin'  before you will try to 
follow any googled advice.

Regards

Zdenek

