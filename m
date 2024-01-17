Received: from plutone.assyoma.it (cloud.assyoma.it [212.237.56.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCF225635
	for <linux-lvm@lists.linux.dev>; Wed, 17 Jan 2024 22:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.237.56.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705529177; cv=none; b=B+3TamkZx1PnneGdKHUfcXH7W3VJfFMY2rMBVuyYSRFU45pnTFxgp37MjlAYdY1zGpHyZMbAdCJFuFN1m64uVXKCR9DTfR/YB88Hk3711TCVES+fOgDNu8tCjEhek6RdDlcDvoGCPG8eAg4WN9ib0Pe5NQRVdQXOpIBOIjBbvmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705529177; c=relaxed/simple;
	bh=S/oKtBxiW7v+g9ZT+A+u9lxCbsnefY/y8UpQGtwsKsk=;
	h=Received:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding; b=Y/3wgYzr8VY+u5keVjJQxbIKWPvWsmBVogVwBtfr31qIOh0D7bw+Qj2upKs1RNEMqmizfrgQ1YbWQvAUtZ5s4FqiI4+dnhsxYzgzM4ucTjmbrFz26rK7ZQzW2bR6fE5RcOgLxSw4GatrhEWod6BBOTGFBUrj+oEzMKwmIi3WHyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=assyoma.it; spf=pass smtp.mailfrom=assyoma.it; arc=none smtp.client-ip=212.237.56.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=assyoma.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=assyoma.it
Received: from webmail.assyoma.it (localhost [IPv6:::1])
	by plutone.assyoma.it (Postfix) with ESMTPSA id 510CFBC0C4A;
	Wed, 17 Jan 2024 23:00:08 +0100 (CET)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 17 Jan 2024 23:00:08 +0100
From: Gionatan Danti <g.danti@assyoma.it>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: lists.linux.dev@frank.fyi, linux-lvm@lists.linux.dev
Subject: Re: add volatile flag to PV/LVs (for cache) to avoid degraded state
 on reboot
In-Reply-To: <5848cefc-bc5e-4f23-8278-d1654607398f@gmail.com>
References: <pyftyueewc6bobclhkb2eqnbjnhsem3fk3euhjmqrxz5d7eevn@ejymv4rlmb5m>
 <5848cefc-bc5e-4f23-8278-d1654607398f@gmail.com>
Message-ID: <498260979ce52ebe20da0c0a36a4342e@assyoma.it>
X-Sender: g.danti@assyoma.it
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Il 2024-01-17 12:08 Zdenek Kabelac ha scritto:
> It's also not completely
> true that even 'writethrough' cache cannot have dirty-blocks (aka -
> only present in cache and origin had failed writes).

Hi, really? From dm-cache docs:

"If writethrough is selected then a write to a cached block will not
complete until it has hit both the origin and cache devices.  Clean
blocks should remain clean."

So I would not expect to see dirty blocks on write-through cache, unless 
the origin device is unable to write at all - which means that removing 
the cache device would be no worse that not having it at all in the 
first place.

What am I missing?

> But ATM we are not seeing it as some major trouble.  Hotspot cache is
> simply not supposed to be randomly removed from your systems - as it
> it's not easy to rebuild.

As a write-through cache should not contain dirty data, using a single 
SSD for caching should be OK. I think that if such expendable (and 
write-through) SSD fails, one should be able to boot without issues.

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
