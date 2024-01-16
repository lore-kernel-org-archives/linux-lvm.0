Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A691CFA4
	for <linux-lvm@lists.linux.dev>; Tue, 16 Jan 2024 18:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thesusis.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thesusis.net
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705429472; cv=none; b=OussgpG9BQppNNgL6YcDybJ5Rl68H/tW2at4krF8uUAeZBUV07EnzUUaLZN37xRK9Su4hJjGFH8eMZHr3JLiFIAIQx5TGHrFtrNa5hCGS1whPLO1aQ3/Gdg7q7cxK+MoINGKll7KTfCKeF/mTWhhXEIV7XGP1+DpHKMQVbHj79U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705429472; c=relaxed/simple;
	bh=wIY/J03aOQXewOxVGDg3p0Qa6n2VqNEjfiMTQ+QTcbg=;
	h=Received:From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WM7kpd0/OprPS98mjNLr1mdlTty/eL6+mO5dLU4TvNg36yy5QF2QxhbBm+ZtnoWcyFQ16DwCpGQyGRsJ86U6dNY663m7gaPuMTQnt3xchK/YjtiCjSG/tE4Yi+Jrh13FAl71ayhS4Rf8KrVrhF4axMULxlcHrTras7zYkLy5zGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.238.73
Received: by vps.thesusis.net (Postfix, from userid 1000)
	id EBAF415380E; Tue, 16 Jan 2024 13:24:29 -0500 (EST)
From: Phillip Susi <phill@thesusis.net>
To: Andy Smith <andy@strugglers.net>, linux-lvm@lists.linux.dev
Subject: Re: Any way in LVM to deal with 512e vs 4Kn physical devices?
In-Reply-To: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
References: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
Date: Tue, 16 Jan 2024 13:24:29 -0500
Message-ID: <87y1cp9lwi.fsf@vps.thesusis.net>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Andy Smith <andy@strugglers.net> writes:

> The LV there when examined in a partitioning tool such as "fdisk"
> now thinks it has a 3.2TiB partition and it is not usable.
> Correcting the partition sector numbers allows for use of, for
> example, "kpartx", to expose the partition as a loop device but the
> ext4 driver and fsck.ext4 remain unable to detect a superblock.

You mean you put a partition table inside of the logical volume?  Why?
IIRC, the dos partition table uses units of logical sectors, so if the
logical sector size changes, the start sector and length will be off.
You would need to create a new partition table and use the correctly
adjusted numbers when creating the partition, if that is even possible.
In your case, you will need to divide them all by 8, but if any of them
is not an even multiple of 8, you won't be able to do that.

> I have confirmed with sha256sum that the content of the
> image/partition remains the same on source and destination.

If you have already modified the partition table, then how could it
still have the same sha256sum?

> So, clearly the issue is the 512e sector size on source vs 4Kn on
> destination. Is there any way to work around this in LVM? My issue
> is that I would like to be able to move images of disks/filesystems
> around at the block level without mounting/creating filesystem and
> transferring with an fs-level application.

LVM doesn't really know or care about it.

> I don't think the presence of a partition (as opposed to an ext4
> filesystem directly upon the LV) is relevant; I think the same
> issues would occur with a direct filesystem. I mention it only for

No, it wouldn't be a problem without the partition table.  ext4 uses its
own block size, which is pretty much always 4k.  It doesn't know or care
about the underlying disk logical sector size.

If this is the only partition in the LV, then I think the best thing for
you to do is to dd only the partition and don't bother with a partition
table on the new machine.  Otherwise, you might need to manually create
the new partition table, then dd each partition individually.

For that matter, using dd wastes a lot of time and bandwidth copying all
of the unused space in the filesystem.  I'd suggest using e2image
instead.  It's smart enough to skip the unused space.
