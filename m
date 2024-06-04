Received: from uriel.iewc.co.za (uriel.iewc.co.za [154.73.34.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932C7145350
	for <linux-lvm@lists.linux.dev>; Tue,  4 Jun 2024 11:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.73.34.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717501954; cv=none; b=TVt9qgy2BTkbUPY4w6tB7DJ8zCvXSygMl0K4KlxsTqaVDm1PAVWPYruKKxX4QHGVCV/TUR7yik0lhVvzHyGSnbe1nOGZEA77Ndf+VMBDAlZZy23dDA5ffnFv44AbmqKHTWR8hTQr3k7scu/Q1IVXwMjGJ7JV2/vI82dJUr/U5tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717501954; c=relaxed/simple;
	bh=m7mB3CUQkvP9SIrz/euZNvfbizFfdthU7wyMSNJNgTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jLf3rgyJc48Nmj++80jLWt8zBprcDBG+ucSqQ1UCCrv5WdfOgTtc/WYV2/Ts8pKKbvPEqH1DsTalwvVyAJWQahHIcD4f9XJDe9SKOWVVjwNPiyUVqur4wPNFesvdEFKkMtFQkTCmZL39LUOSVI81qGZxsZogyW7qbGPh0WX/i+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uls.co.za; spf=pass smtp.mailfrom=uls.co.za; dkim=pass (2048-bit key) header.d=uls.co.za header.i=@uls.co.za header.b=W0G4fYbQ; arc=none smtp.client-ip=154.73.34.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uls.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uls.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uls.co.za header.i=@uls.co.za header.b="W0G4fYbQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uls.co.za;
	s=20240522.iewc; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ojxSNxhpO6Nk0kSxRVYSn2/sQVUleByZ/jL6vtG2rSA=; b=W0G4fYbQ3xIlCHArCgJQDE9Ndl
	2+bcsKJr52fZXzeF2XVOmv2bKACW/JPO/59udCikYCPRTlunIUWvhQAf/Rdbj4LBWhA9SZ7pv4SES
	Ko1BBKqsqu1Z3d8Ya3e5yR7vzWLFIp8Gxl1Wg5bmvlPGso6w8v52c69yafrLGuD/mWZNufBrDX9dt
	JbwaDuaNTijRaf1AOcrUTK5lB+Y2wBDZd4cKsU94hId77vCZnTzwCtjgr+GhyPwSBFxnZQaLt2Wu/
	TA6CphemqFlarWVQzvUw8G1NPk2S7Fq4ldqepVjDGDro7zYPmwYuq0aNGndXeVgIAnm8sS6hBGvo4
	AZT1/i8w==;
Received: from [154.73.32.4] (helo=tauri.dyndns.uls.co.za)
	by uriel.iewc.co.za with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <jaco@uls.co.za>)
	id 1sESiI-0000000086i-0xWV;
	Tue, 04 Jun 2024 13:52:26 +0200
Received: from [192.168.42.21]
	by tauri.dyndns.uls.co.za with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.97.1)
	(envelope-from <jaco@uls.co.za>)
	id 1sESiG-000000000tt-2gso;
	Tue, 04 Jun 2024 13:52:24 +0200
Message-ID: <5aa7f229-aef5-4f63-acb5-1e130c6c5296@uls.co.za>
Date: Tue, 4 Jun 2024 13:52:22 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: lvm2 deadlock
To: Roger Heflin <rogerheflin@gmail.com>
Cc: Zdenek Kabelac <zdenek.kabelac@gmail.com>,
 "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
References: <c828486f-46d1-45b6-8477-ed390553f4dd@uls.co.za>
 <a6c24173-d138-49dc-afb0-f48d41128477@gmail.com>
 <9bac4556-bdf8-4034-9322-522277ff311e@uls.co.za>
 <b77c19de-48b4-4a7d-9174-0d42414ce920@gmail.com>
 <66d9e7cf-b654-4476-b1e2-e3bdf4444280@uls.co.za>
 <CAAMCDed2n+wvQTySx8GRsekfrsdeO+vdwXd289bWZ_sk1WbqXA@mail.gmail.com>
Content-Language: en-GB
From: Jaco Kroon <jaco@uls.co.za>
Autocrypt: addr=jaco@uls.co.za; keydata=
 xsBNBFXtplYBCADM6RTLCOSPiclevkn/gdf8h9l+kKA6N+WGIIFuUtoc9Gaf8QhXWW/fvUq2
 a3eo4ULVFT1jJ56Vfm4MssGA97NZtlOe3cg8QJMZZhsoN5wetG9SrJvT9Rlltwo5nFmXY3ZY
 gXsdwkpDr9Y5TqBizx7DGxMd/mrOfXeql57FWFeOc2GuJBnHPZQMJsQ66l2obPn36hWEtHYN
 gcUSPH3OOusSEGZg/oX/8WSDQ/b8xz1JKTEgcnu/JR0FxzjY19zSHmbnyVU+/gF3oeJFcEUk
 HvZu776LRVdcZ0lb1bHQB2K9rTZBVeZLitgAefPVH2uERVSO8EZO1I5M7afV0Kd/Vyn9ABEB
 AAHNG0phY28gS3Jvb24gPGphY29AdWxzLmNvLnphPsLAdwQTAQgAIQUCVe2mVgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAILcSxr/fungCPB/sHrfufpRbrVTtHUjpbY4bTQLQE
 bVrh4/yMiKprALRYy0nsMivl16Q/3rNWXJuQ0gR/faC3yNlDgtEoXx8noXOhva9GGHPGTaPT
 hhpcp/1E4C9Ghcaxw3MRapVnSKnSYL+zOOpkGwye2+fbqwCkCYCM7Vu6ws3+pMzJNFK/UOgW
 Tj8O5eBa3DiU4U26/jUHEIg74U+ypYPcj5qXG0xNXmmoDpZweW41Cfo6FMmgjQBTEGzo9e5R
 kjc7MH3+IyJvP4bzE5Paq0q0b5zZ8DUJFtT7pVb3FQTz1v3CutLlF1elFZzd9sZrg+mLA5PM
 o8PG9FLw9ZtTE314vgMWJ+TTYX0kzsBNBFXtplYBCADedX9HSSJozh4YIBT+PuLWCTJRLTLu
 jXU7HobdK1EljPAi1ahCUXJR+NHvpJLSq/N5rtL12ejJJ4EMMp2UUK0IHz4kx26FeAJuOQMe
 GEzoEkiiR15ufkApBCRssIj5B8OA/351Y9PFore5KJzQf1psrCnMSZoJ89KLfU7C5S+ooX9e
 re2aWgu5jqKgKDLa07/UVHyxDTtQKRZSFibFCHbMELYKDr3tUdUfCDqVjipCzHmLZ+xMisfn
 yX9aTVI3FUIs8UiqM5xlxqfuCnDrKBJjQs3uvmd6cyhPRmnsjase48RoO84Ckjbp/HVu0+1+
 6vgiPjbe4xk7Ehkw1mfSxb79ABEBAAHCwF8EGAEIAAkFAlXtplYCGwwACgkQCC3Esa/37p7u
 XwgAjpFzUj+GMmo8ZeYwHH6YfNZQV+hfesr7tqlZn5DhQXJgT2NF6qh5Vn8TcFPR4JZiVIkF
 o0je7c8FJe34Aqex/H9R8LxvhENX/YOtq5+PqZj59y9G9+0FFZ1CyguTDC845zuJnnR5A0lw
 FARZaL8T7e6UGphtiT0NdR7EXnJ/alvtsnsNudtvFnKtigYvtw2wthW6CLvwrFjsuiXPjVUX
 825zQUnBHnrED6vG67UG4z5cQ4uY/LcSNsqBsoj6/wsT0pnqdibhCWmgFimOsSRgaF7qsVtg
 TWyQDTjH643+qYbJJdH91LASRLrenRCgpCXgzNWAMX6PJlqLrNX1Ye4CQw==
Organization: Ultimate Linux Solutions (Pty) Ltd
In-Reply-To: <CAAMCDed2n+wvQTySx8GRsekfrsdeO+vdwXd289bWZ_sk1WbqXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-report: Relay access (uriel.iewc.co.za).

Hi,

On 2024/06/04 12:48, Roger Heflin wrote:

> Use the *_bytes values.  If they are non-zero then they are used and
> that allows setting even below 1% (quite large on anything with a lot
> of ram).
>
> I have been using this for quite a while:
> vm.dirty_background_bytes = 3000000
> vm.dirty_bytes = 5000000


crowsnest [13:32:48] ~ # sysctl vm.dirty_background_bytes=3000000
vm.dirty_background_bytes = 3000000
crowsnest [13:32:59] ~ # sysctl vm.dirty_bytes=500000000
vm.dirty_bytes = 500000000

And persisted via /etc/sysctl.conf

Thank you.  Must be noted this host doesn't do much else other than disk 
IO, so I'm hoping the 500MB value will be OK, this is just so IO won't 
block CPU heavy-at-the-time tasks.

The purpose of 256GB RAM was so that we could have ~250GB worth of disk 
cache (obviously we don't want all of that to be dirty, OS and "used" 
used to be below 4GB, now generally around 8-12GB, currently it's in 
"quiet" time, so a bit lower, just busy running some background 
compression).  As per iostat:

avg-cpu:  %user   %nice %system %iowait %steal   %idle
            7.73   18.43   18.96   37.86    0.00   17.01

Device             tps    MB_read/s    MB_wrtn/s    MB_dscd/s MB_read    
MB_wrtn    MB_dscd
md2             392.13        10.00         5.11         0.00 4244888    
2167644          0
md3            2270.12        43.88        56.82         0.00 18626309   
24120982          0
md4            1406.06        30.47        16.83         0.00 
12934654    7143330          0

That's total 35805851 MB (34.1B) read and 33431956 MB (31.9TB) written 
in just under 5 days.

What I am noticing immediately is that the "free" value as per "free -m" 
is definitely much higher, which to me is indicative that we're not 
caching as aggressively as can be done.  Will monitor this for the time 
being:

crowsnest [13:50:09] ~ # free -m
                total        used        free      shared buff/cache   
available
Mem:          257661        6911      105313           7 145436      248246
Swap:              0           0           0

The Total DISK WRITE and Current DISK Write values in in iotop seems to 
have a tighter correlation now (no longer seeing constant Total DISK 
WRITE with spikes in current, seems to be more even now).

Kind regards,
Jaco
