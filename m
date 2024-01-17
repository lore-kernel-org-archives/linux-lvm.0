Received: from mail.bitfolk.com (use.bitfolk.com [85.119.80.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9FD1DDCB
	for <linux-lvm@lists.linux.dev>; Wed, 17 Jan 2024 11:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.119.80.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705490508; cv=none; b=AejNGALLPyFytF3OQ2Dw/UKNQuWKUNXAhG7rZwFZeKaG0dQJUhaepRXmU1w2HJemE2GSEBHN9DvaKMR/hKtFopM0Gwcy9CQdL+9cB5iJPHQq0M/OdvLiEKFACcjAlSQ20iL69ySCcukH+deb+ZvpoU5F6shooRaTlEZGLZjFYlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705490508; c=relaxed/simple;
	bh=xjWGMTYlXhi9lFHtHRJV22aJcSv77hCIte7ymeyEKmA=;
	h=DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:OpenPGP:X-URL:X-SA-Exim-Connect-IP:X-SA-Exim-Mail-From:
	 X-SA-Exim-Scanned; b=CxX7Vp8ekprjlWtUON3CMFFDiKZ9BmwwZNDUYiyI6cp1pG8tJJfRQKbBVLIaBcCtEe5kjuBuB2QKX4iPo/yLMLaXd63ZhXOPGnHGoNxLcN8aDPCR6Es9uB7dSoO9zdTwG3Y351ekRDYG9inCGxAOiBqHxJTQ+nN158aJV5jeTE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=strugglers.net; spf=pass smtp.mailfrom=strugglers.net; dkim=pass (2048-bit key) header.d=strugglers.net header.i=@strugglers.net header.b=U83tJv4E; arc=none smtp.client-ip=85.119.80.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=strugglers.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strugglers.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=strugglers.net header.i=@strugglers.net header.b="U83tJv4E"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=strugglers.net; s=alpha; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:Sender:Reply-To
	:Content-ID:Content-Description:Resent-To;
	bh=xjWGMTYlXhi9lFHtHRJV22aJcSv77hCIte7ymeyEKmA=; b=U83tJv4E+l70gbKvG9R2+t8C2X
	iXPiwTjzbbFyiGnnwM9Nh4rrSeLhlVKKv839aox05M6gH+dcYDu0yZ1rGlxDpG2+yuXooYPBPobsT
	lKc5l6dlDA6krED3ZIhh3CJeI3rzRb0qsqQvIHJ1kCXuTz8sLATB0MRWiIpqelIgkRoRiR5f4DSCR
	bdJLHIMBbMftcec+bIvXUO0z/e5d/SVk+T4ZuoeFfO0gKMZisiM29VFEHq3RcibMd1wnKtJsIgico
	230E8O2lH1B1il/5bl+CNH7NFDfGCWPux0i5OSK9iTkpRKRTYxbr/tDuo/g6+kPH+XPMTaT9aKS0e
	nCzabwag==;
Received: from andy by mail.bitfolk.com with local (Exim 4.94.2)
	(envelope-from <andy@strugglers.net>)
	id 1rQ3zL-0004gp-BI; Wed, 17 Jan 2024 11:21:43 +0000
Date: Wed, 17 Jan 2024 11:21:43 +0000
From: Andy Smith <andy@strugglers.net>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: linux-lvm@lists.linux.dev
Subject: Re: Any way in LVM to deal with 512e vs 4Kn physical devices?
Message-ID: <Zae4RzvB2EJxLf2W@mail.bitfolk.com>
References: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
 <451707ab-ec8e-8f19-6813-445a184fda3a@service4.ru>
 <ZabkWx401gDBehBZ@mail.bitfolk.com>
 <fbaf0486-790a-48a2-b9f3-f7a1c8e30952@gmail.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbaf0486-790a-48a2-b9f3-f7a1c8e30952@gmail.com>
OpenPGP: id=BF15490B; url=http://strugglers.net/~andy/pubkey.asc
X-URL: http://strugglers.net/wiki/User:Andy
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: andy@strugglers.net
X-SA-Exim-Scanned: No (on mail.bitfolk.com); SAEximRunCond expanded to false

Hi Zdenek,

On Wed, Jan 17, 2024 at 11:36:24AM +0100, Zdenek Kabelac wrote:
> Lvm tool as such doesn't really have any problems with mixing 4K and 512b
> disks within a single VG

That's interesting, though in my case I have done a block-based
copy of an LV from a system where all PVs are 512b to one where all
PVs are 4K.

So out of interest, what does LVM do when one PV within same VG says
512b and another says 4K - just pass on 512b for every LV I assume,
unless allow_mixed_block_size is set as you mention?

Thanks,
Andy
