Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9E47CF2E
	for <linux-lvm@lists.linux.dev>; Wed, 24 Jan 2024 16:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706113118; cv=none; b=AzTRNIU01Z53GYK0OUujjM5D56xnt/z1nxQSsCmogWoY6uUEwCcWP/uuvds0kpp/oZLUuPKINQzEmx2bBtnw91XCQ5SbQqAII9EP+b2rKpUmW1nb/y7sg0sNX3rgc2yoeSLOZ45WvBx8lygOlVpx9vGS8KtP+eELActw4e1gNxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706113118; c=relaxed/simple;
	bh=YGjxpeeH6pb+CRU3a6zJPM9bowpaqcjYA1tB9MH6rLI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bgcfoqY1ooQAcFmkg/3a+qa/ZvrviWlnOZwb9yGLt5++ot8bXhVtagVfek65gboSFVfqvyd784FoAFhPUTYKN+UzoTZ4h/ZzGVQNfv6Cfw2MElDN2b7XCjllg5xDWMxpcdwI4TJZk4m0S0PqYoxN0loKrk6hz6PLt58jD7zWclo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thesusis.net; spf=pass smtp.mailfrom=thesusis.net; arc=none smtp.client-ip=34.202.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thesusis.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thesusis.net
Received: by vps.thesusis.net (Postfix, from userid 1000)
	id 477B1154C00; Wed, 24 Jan 2024 11:18:36 -0500 (EST)
From: Phillip Susi <phill@thesusis.net>
To: Andy Smith <andy@strugglers.net>
Cc: linux-lvm@lists.linux.dev
Subject: Re: Any way in LVM to deal with 512e vs 4Kn physical devices?
In-Reply-To: <ZawzYqFyvDu8PgZ3@mail.bitfolk.com>
References: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
 <87y1cp9lwi.fsf@vps.thesusis.net> <ZabjW4HWOSfy8sRN@mail.bitfolk.com>
 <ZaeAJtE+0Gmp2b0E@mail.bitfolk.com> <87frywcapk.fsf@vps.thesusis.net>
 <ZatP7wb9k5jzV59y@mail.bitfolk.com> <87v87nnauh.fsf@vps.thesusis.net>
 <ZawzYqFyvDu8PgZ3@mail.bitfolk.com>
Date: Wed, 24 Jan 2024 11:18:36 -0500
Message-ID: <8734umiu1v.fsf@vps.thesusis.net>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Andy Smith <andy@strugglers.net> writes:

>> Try mount -t ext4.  If that doesn't work, see what e2fsck/tune2fs say.
>
> I've not needed that before and my instinct is that if it is needed,
> something has gone wrong. But in any case it did not help:

If the fs is listed in /etc/fstab, then mount finds the fs type from
there.  Otherwise, you have to specify it.  At least, that used to be
the case.  This may have changed at some point and I still do it from
mussle memory.

> Here's the tuen2fs -l again:

If tune2fs recognizes it then it should be fine.  e2fsck -f should be
the final arbiter of whether there is anything wrong with the filesystem
though.  You might check dmesg as mount suggests for any errors from the
kernel explainging why it can't mount the filesystem.

> In a way this is all becoming academic, as it seems very
> filesystem-specific. Given I generally can't poke about inside these
> disk images, it looks like I will never come up with a robust
> procedure for block-wise copying of these LVs.

It is filesystem specific.  I believe FAT won't work right from this
transition because it does embed the sector size in its boot sector.
Due to its backward compatability, NTFS does this as well, though fixing
this to reflect the new size isn't hard.  Possibly HFS and iso9660 as
well, but most common linux filesystems, such as ext4 and btrfs, already
use 4k block sizes and so don't care about the sector size.
