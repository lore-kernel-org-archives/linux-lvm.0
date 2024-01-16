Received: from mail.bitfolk.com (use.bitfolk.com [85.119.80.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE10458ADD
	for <linux-lvm@lists.linux.dev>; Tue, 16 Jan 2024 20:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.119.80.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705436006; cv=none; b=D8iCA6igRG70PgQIRDhpxe3ye7CebTPplvQrYmuDmqOUgtghC/ztwLpxrRwiupP3jYy6Lrm/z5HLpprCxZ70rMtolRmVrIK2v5d+BhByeyMiJrSis3p8AHbUmPZUhbpzFBjarGifPq8s6+BhSoWi2GQWw/o3l2biGUUWsHFfIfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705436006; c=relaxed/simple;
	bh=Ze8PLtA9vkZky/1NfjtvJ9KNnrghkCMm6Y+7I8s8TSk=;
	h=DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:OpenPGP:X-URL:X-SA-Exim-Connect-IP:X-SA-Exim-Mail-From:
	 X-SA-Exim-Scanned; b=uinT/zimFTVVk4yM+II2at/fg/P89Lb2ERhGwHJheqreEgNlAcNZw7NGEJf4+Beg7rNqIhXqYNaPpxccvFxlreZ1XgEGzckAKnNjXlW6mXYe7M5RJ6naKZUk2TXNJaLgvx3iL4K0mop83PuIyuDOpEdeux9IB3MM9BmWn3ktvvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=strugglers.net; spf=pass smtp.mailfrom=strugglers.net; dkim=pass (2048-bit key) header.d=strugglers.net header.i=@strugglers.net header.b=sePEMcdS; arc=none smtp.client-ip=85.119.80.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=strugglers.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strugglers.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=strugglers.net header.i=@strugglers.net header.b="sePEMcdS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=strugglers.net; s=alpha; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:Sender:Reply-To
	:Content-ID:Content-Description:Resent-To;
	bh=Bx/5rdS4uwW3G80H3uqWqeAXe5Q7+yijs5XQp01EAog=; b=sePEMcdSMydGlCRgAhbC/bIq6c
	kk4s3oRcv6LHbDkL0ka4MP9wu7nUlg/UQB3kzTC7qxhiwNBiKC+/RXe39S4NrcJxnLvaRDlyl5Uri
	b+fOOau7FurrSfc91ogUJbnhAazubNa8eozJRMoC39rXi8p9UlQ9E957mpWbMlkuuiSF/w5dETVCY
	0s9+myfrARibWQx18qPS9DLZ/Sm+PcvOomgJ1Cefeq889Ih0ireFvBfOGMNrK0JTcFa9iE9CEhET7
	yli1RBCDVUsx1yR46/qNryp+It6ePgoA7EowC20QhsV6OmUFucNRhRI28ikV9WsUM0xIr5XxiVuyP
	XgTjiGWQ==;
Received: from andy by mail.bitfolk.com with local (Exim 4.94.2)
	(envelope-from <andy@strugglers.net>)
	id 1rPpoB-0007p3-Mo; Tue, 16 Jan 2024 20:13:15 +0000
Date: Tue, 16 Jan 2024 20:13:15 +0000
From: Andy Smith <andy@strugglers.net>
To: Phillip Susi <phill@thesusis.net>
Cc: linux-lvm@lists.linux.dev
Subject: Re: Any way in LVM to deal with 512e vs 4Kn physical devices?
Message-ID: <ZabjW4HWOSfy8sRN@mail.bitfolk.com>
References: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
 <87y1cp9lwi.fsf@vps.thesusis.net>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y1cp9lwi.fsf@vps.thesusis.net>
OpenPGP: id=BF15490B; url=http://strugglers.net/~andy/pubkey.asc
X-URL: http://strugglers.net/wiki/User:Andy
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: andy@strugglers.net
X-SA-Exim-Scanned: No (on mail.bitfolk.com); SAEximRunCond expanded to false

Hi,

On Tue, Jan 16, 2024 at 01:24:29PM -0500, Phillip Susi wrote:
> Andy Smith <andy@strugglers.net> writes:
> 
> > The LV there when examined in a partitioning tool such as "fdisk"
> > now thinks it has a 3.2TiB partition and it is not usable.
> > Correcting the partition sector numbers allows for use of, for
> > example, "kpartx", to expose the partition as a loop device but the
> > ext4 driver and fsck.ext4 remain unable to detect a superblock.
> 
> You mean you put a partition table inside of the logical volume?  Why?

It's a disk image for a virtual machine that belongs to someone else
and I don't have a say in how they choose to lay out their data
inside of it. If they want to take what appears to them to be a
plain block device and put a partition table on it, or write their
own invented fs directly on it, in this case I have no latitude to
prohibit that.

It hasn't been an issue before.

> > I have confirmed with sha256sum that the content of the
> > image/partition remains the same on source and destination.
> 
> If you have already modified the partition table, then how could it
> still have the same sha256sum?

I did a sha256sum of the image before I tampered with it and it
matched.

I then recreated the partition table, which allowed me to use
"kpartx" to expose the first partition as a loop device. A sha256sum
of this first partition matches a sha256sum of the first partition
on the source disk image.

> > So, clearly the issue is the 512e sector size on source vs 4Kn on
> > destination. Is there any way to work around this in LVM? My issue
> > is that I would like to be able to move images of disks/filesystems
> > around at the block level without mounting/creating filesystem and
> > transferring with an fs-level application.
> 
> LVM doesn't really know or care about it.

I agree, but I was wondering if it would allow me some way around
the issue, and it's what I have as "my" top layer anyway.

> No, it wouldn't be a problem without the partition table.  ext4 uses its
> own block size, which is pretty much always 4k.  It doesn't know or care
> about the underlying disk logical sector size.

I've found quite a few people having similar problems to me so I'm
not sure about this, but I haven't had chance to test it yet. I
will try it out before I explore hdparm.

> For that matter, using dd wastes a lot of time and bandwidth copying all
> of the unused space in the filesystem.  I'd suggest using e2image
> instead.  It's smart enough to skip the unused space.

Since I don't generally know what is on the disk image as mentioned,
I can't really do this. Empty space isn't too much of an issue since
I generally actually use something that does a block-based sync
without copying matching chunks, so an empty source chunk will match
with an empty destination chunk and be skipped. But I re-did it with
plain dd just to be sure it wasn't a tooling issue.

This is getting a bit off track though, as the issue appears to be
the 512e vs 4Kn nature of the underlying drives, which I can't
sidestep by using fs-level tools.

Thanks,
Andy
