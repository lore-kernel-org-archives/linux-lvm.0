Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4EC10A0D
	for <linux-lvm@lists.linux.dev>; Sat, 20 Jan 2024 18:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705773656; cv=none; b=IEEvsC1jENhxx6wTXPEdGdgjIf9UkGOVfq3kHw0e5EBa2+FrRouGJyFHxhEwIkZj1r+BQyWjDK3oRFbWWRXqCvYiCR15VFWCTfGeboR21qr3VW0LvNKwMcXZXfz01F/aMSUpfRw/9yQYSxhgBF2Uq0phs3UN3OnayNhS5M6BBiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705773656; c=relaxed/simple;
	bh=33y8FeOv3KknneiCHW/sDNxC78JQ2hx7XOLVUW/mPa8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Yr3Yd7Ea4IKYQntq7vliIGfSQnvcXZl3LVXxWSHuAJvWXhARFSUoVQq5pVlsChDXVDsQCVbHh7xnL3E2zjTdlju6IIEKmFVRwUr4ZnByattfxloIfo8Ka/2HNB7x05cUN+lrDqlZhepwe14cbVAC64oPDTpheTPAMswofdPvFFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thesusis.net; spf=pass smtp.mailfrom=thesusis.net; arc=none smtp.client-ip=34.202.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thesusis.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thesusis.net
Received: by vps.thesusis.net (Postfix, from userid 1000)
	id 257F01542C1; Sat, 20 Jan 2024 13:00:54 -0500 (EST)
From: Phillip Susi <phill@thesusis.net>
To: Andy Smith <andy@strugglers.net>
Cc: linux-lvm@lists.linux.dev
Subject: Re: Any way in LVM to deal with 512e vs 4Kn physical devices?
In-Reply-To: <ZatP7wb9k5jzV59y@mail.bitfolk.com>
References: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
 <87y1cp9lwi.fsf@vps.thesusis.net> <ZabjW4HWOSfy8sRN@mail.bitfolk.com>
 <ZaeAJtE+0Gmp2b0E@mail.bitfolk.com> <87frywcapk.fsf@vps.thesusis.net>
 <ZatP7wb9k5jzV59y@mail.bitfolk.com>
Date: Sat, 20 Jan 2024 13:00:54 -0500
Message-ID: <87v87nnauh.fsf@vps.thesusis.net>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Andy Smith <andy@strugglers.net> writes:

> Created a new partition 1 of type 'Linux' and of size 127 MiB.
> Partition #1 contains a ext4 signature.
>
> Do you want to remove the signature? [Y]es/[N]o: n

fdisk sees the filesystem.  So far, everything looks perfect.

> Failed to remove partition 1 from system: No such device or address
> Failed to add partition 1 to system: Invalid argument

This is just because device-mapper doesn't support partitions, so fdisk
couldn't get the kernel to re-read the partition table.

> dsthost$ sudo mount /dev/mapper/slowvg-4ksectortest1 /mnt
> mount: /mnt: wrong fs type, bad option, bad superblock on /dev/mapper/slowvg-4ksectortest1, missing codepage or helper program, or other error.
>
> So at the end here, despite msdos partition table looking correct,
> sha256sum matching and kpartx appearing to work, dsthost can't mount
> this filesystem. Did I miss a step or misunderstand?

Try mount -t ext4.  If that doesn't work, see what e2fsck/tune2fs say.

