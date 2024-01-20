Received: from mx01.frank.fyi (mx01.frank.fyi [5.189.178.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EB814278
	for <linux-lvm@lists.linux.dev>; Sat, 20 Jan 2024 20:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.189.178.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705782920; cv=none; b=Z5GFRddGeYWqXgq1j8Z2b0+7pDNdgR4kG7nO5oTKvnmjwqK1BAUYUaKI6oAqsAr+PYU/0E4ZhHYY3CUy5yn9FKqrCtCqlsfwaHrnyDG0wo4YlClRQrWk8FaOHgllVt3IvvpXmLY/kHM3TlS1mnzp3XyD2xPb64oN5MWjaRl608I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705782920; c=relaxed/simple;
	bh=/XezYnLcLcyyWarv0nyd+TDrkiL7Oy/0VRszMtTu8Tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5vG/+/qErHdLXPY3FPOU0iN6LBN6shAOD3UKqxNcMNqx4un94WWnGRCw2Pm4PJDHMtTiJu/wTZQn4bxaYgujKdAuzcuYVckNPJhLNDxMx0JTcIWjM19CFF14AC+q6ZsKqF2hE0Z8fq+ORmCvCInpBWVo4/mKmEGJnd0ad/1uMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=frank.fyi; spf=pass smtp.mailfrom=frank.fyi; arc=none smtp.client-ip=5.189.178.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=frank.fyi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frank.fyi
Received: by mx01.frank.fyi (Postfix, from userid 1001)
	id 8A81D112025F; Sat, 20 Jan 2024 21:29:40 +0100 (CET)
Date: Sat, 20 Jan 2024 20:29:40 +0000
From: lists.linux.dev@frank.fyi
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: linux-lvm@lists.linux.dev
Subject: Re: add volatile flag to PV/LVs (for cache) to avoid degraded state
 on reboot
Message-ID: <jtvhdzv3dcpbqlbatkhkzruedmc3tfa3vv6h54pvw4dayrnj6s@v2u63oe75k5z>
References: <pyftyueewc6bobclhkb2eqnbjnhsem3fk3euhjmqrxz5d7eevn@ejymv4rlmb5m>
 <5848cefc-bc5e-4f23-8278-d1654607398f@gmail.com>
 <498260979ce52ebe20da0c0a36a4342e@assyoma.it>
 <3d1e18f3-a79f-4e0d-8b6c-7f10e5c8debf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d1e18f3-a79f-4e0d-8b6c-7f10e5c8debf@gmail.com>

On Thu, Jan 18, 2024 at 04:40:47PM +0100, Zdenek Kabelac wrote:
> Cache can contain blocks that are still being 'synchronized' to the cache
> origin. So while the 'writing' process doesn't get ACK for writes - the
> cache
> may have valid blocks that are 'dirty' in terms of being synchronized to
> origin device.
> 
> And while this is usually not a problem when system works properly,
> it's getting into weird 'state machine' model when i.e. origin device has
> errors - which might be even 'transient' with all the variety of storage
> types and raid arrays with integrity and self-healing and so on...
> 
> So while it's usually not a problem for a laptop with 2 disks, the world is
> more complex...

Ehm, but wouldn't anything other than discarding that block from the cache and using whatever is on the backing storage introduce unpredictable errors?
As like you already said it was never ACKed, so the software that tried to write it never expected it to be written.
Why exactly are we allowed to use the data from the write-through cache to modify the data on the backing storage in such cases?
I.E. Why can we safely consider it as valid data?

> metadata - so if there is again some 'reboot' and PV with cache appears back
> - it will not interfere with the system (aka providing some historical
> cached blocks,  so just like mirrored leg needs some care...)

Same here, why do we have to consider these blocks at all and can't discard them? We know when a drive re-appears, so we could just not use it without validation, or in the case the volatile flag I suggested would be used, just wipe it and start over...

After all I don't know anyone that designs their storage systems with the assumption that the write-through cache has to be redundant.
Even more, I know enough people in data center environments that reuse their "failing but still kinda good" SSDs and NVMEs for write-through caches using the assumption that them failing at most impacts read performance but not data security.

Is there some common missconception at play? Or what exaclty am I missing here?

Sincerely,
Klaus Frank
