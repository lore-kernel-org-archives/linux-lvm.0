Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A0F208A2
	for <linux-lvm@lists.linux.dev>; Wed, 17 Jan 2024 14:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705500422; cv=none; b=rwXiDzf1d8p2UBDUtcnZvFUrnAk/H67Yh+JVqGgmq9ZH7wbij5cA7uNYt01OIrdU922AykXE8fC4PyXJ5q/Cpjf6YBrX4plBJHxHaLf5cKksqkAvsoxreAa0KDj+gFSzH0/luHtcBxAZncV7AQkEVks0eIO3hXadH4HdO9+TEiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705500422; c=relaxed/simple;
	bh=UL32XuR4Zsx/iEMowm6A3awXYyHVnrpwSBAr4Q+dtY8=;
	h=Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type; b=OJ3xCgl4jXM1A9BZzKyiLYDQPBSJDDaNPXl4Rsgq+b5rqapum7EJ7Jwl8z2dJCsBcs6dadauEzFVnZhoSi9hMY+fOaWb7NDBL6z5paP4apImj6YcFJTs5vjaV5wlkhvrklRY6TURbEl8Op/sXfEDDC9UbK4rGHxp5VTO14JQxU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thesusis.net; spf=pass smtp.mailfrom=thesusis.net; arc=none smtp.client-ip=34.202.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thesusis.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thesusis.net
Received: by vps.thesusis.net (Postfix, from userid 1000)
	id 69C0C153B09; Wed, 17 Jan 2024 09:06:57 -0500 (EST)
From: Phillip Susi <phill@thesusis.net>
To: Andy Smith <andy@strugglers.net>
Cc: linux-lvm@lists.linux.dev
Subject: Re: Any way in LVM to deal with 512e vs 4Kn physical devices?
In-Reply-To: <ZabjW4HWOSfy8sRN@mail.bitfolk.com>
References: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
 <87y1cp9lwi.fsf@vps.thesusis.net> <ZabjW4HWOSfy8sRN@mail.bitfolk.com>
Date: Wed, 17 Jan 2024 09:06:57 -0500
Message-ID: <87il3scav2.fsf@vps.thesusis.net>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Andy Smith <andy@strugglers.net> writes:

> It's a disk image for a virtual machine that belongs to someone else
> and I don't have a say in how they choose to lay out their data
> inside of it. If they want to take what appears to them to be a
> plain block device and put a partition table on it, or write their
> own invented fs directly on it, in this case I have no latitude to
> prohibit that.

If it's a VM then IIRC, it should still be presented to the VM as if it
were using 512 byte sectors, no matter what size the storage in the host
system uses.  Did you try just booting the VM or did you decide to use
kpartx to verify the image from the host first?

> Since I don't generally know what is on the disk image as mentioned,
> I can't really do this. Empty space isn't too much of an issue since
> I generally actually use something that does a block-based sync
> without copying matching chunks, so an empty source chunk will match
> with an empty destination chunk and be skipped. But I re-did it with
> plain dd just to be sure it wasn't a tooling issue.

It sounds like you are assuming that the empty space contains all zeros
and so will be de-duplicated with other space that contains all zeros.
Instead it often tends to contain old data that isn't going to match
something else, and so will be sent, even though it isn't needed.
