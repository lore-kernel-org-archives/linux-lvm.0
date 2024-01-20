Received: from mail.bitfolk.com (use.bitfolk.com [85.119.80.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB514FBEB
	for <linux-lvm@lists.linux.dev>; Sat, 20 Jan 2024 20:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.119.80.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705784172; cv=none; b=pJaJ49Fv3BOY+ietdFpYrch7l1QoMlENY86GRKlsNbla+B55ZL90SyWWTOf+8dP9W0CPSUMGplfNEAYl/9bWLWgHLqxU0zFiqBbQQd5glD0sPtO0WK5FGYAcHFKmWqXom1ZvhKp1MzQGhNm8qr1VLS+MlkZdi+GxBsvoW5qxBrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705784172; c=relaxed/simple;
	bh=VskkSkjge/1iiRCX4K0DWHDfJDAQN5gyF1cVoxUPdvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fg45kgLv3CRPS7W2btMOEQ6C+fzmEiGaUJZ6RdirfhclaZp6OYfJqW7HvQqQcQpxm78MklmtojVYxq/0QJt3hANW6Wa1i71jrYREwnDyozpOhNaMUxQE/Fy17FF5NW/VVv/8hsOQZetIeEdlT99fTkbiV9SN517kwe6GkVBs4mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=strugglers.net; spf=pass smtp.mailfrom=strugglers.net; dkim=pass (2048-bit key) header.d=strugglers.net header.i=@strugglers.net header.b=OtcstQwJ; arc=none smtp.client-ip=85.119.80.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=strugglers.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strugglers.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=strugglers.net header.i=@strugglers.net header.b="OtcstQwJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=strugglers.net; s=alpha; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:Sender:Reply-To
	:Content-ID:Content-Description:Resent-To;
	bh=SHR39M0M2Hv6ZeVllRD6RyaMnHPthbJclRAmFWqtr64=; b=OtcstQwJvnMiHd8GHrix8JkN3u
	GxJwhRA+CiG2+TvIbWdAEYuC4iln7PEM+le4ZRK/7SPSKTfe8A6CBWzpcJmsu7P2KVgSINDI9v1Gp
	VXR+Np21tcRMQZgMiM3pZ28MvpsXX0pzS6PhWouX319P9Z0TZbhT5l5Tv5yjg1xRfxdIqv4Hy3LrN
	WWPwfOnbJFdSJaW6e7KpriWb7yLU0YiiUFQi9ROP0LL9CKuE6BQdArqq4eP26dWo7SONVvfUGZun2
	0PgGARAzBLQAl0Cbv6jbSlVM3i+uoK0u4IdQB2d3DPP0Z4ui/Xg+WAKeuIX9tKoyFcQB8LlGptD8a
	FKEG2wkg==;
Received: from andy by mail.bitfolk.com with local (Exim 4.94.2)
	(envelope-from <andy@strugglers.net>)
	id 1rRINm-0007KY-Kw; Sat, 20 Jan 2024 20:56:02 +0000
Date: Sat, 20 Jan 2024 20:56:02 +0000
From: Andy Smith <andy@strugglers.net>
To: Phillip Susi <phill@thesusis.net>
Cc: linux-lvm@lists.linux.dev
Subject: Re: Any way in LVM to deal with 512e vs 4Kn physical devices?
Message-ID: <ZawzYqFyvDu8PgZ3@mail.bitfolk.com>
References: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
 <87y1cp9lwi.fsf@vps.thesusis.net>
 <ZabjW4HWOSfy8sRN@mail.bitfolk.com>
 <ZaeAJtE+0Gmp2b0E@mail.bitfolk.com>
 <87frywcapk.fsf@vps.thesusis.net>
 <ZatP7wb9k5jzV59y@mail.bitfolk.com>
 <87v87nnauh.fsf@vps.thesusis.net>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v87nnauh.fsf@vps.thesusis.net>
OpenPGP: id=BF15490B; url=http://strugglers.net/~andy/pubkey.asc
X-URL: http://strugglers.net/wiki/User:Andy
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: andy@strugglers.net
X-SA-Exim-Scanned: No (on mail.bitfolk.com); SAEximRunCond expanded to false

Hi Phillip,

On Sat, Jan 20, 2024 at 01:00:54PM -0500, Phillip Susi wrote:
> Andy Smith <andy@strugglers.net> writes:
> > dsthost$ sudo mount /dev/mapper/slowvg-4ksectortest1 /mnt
> > mount: /mnt: wrong fs type, bad option, bad superblock on /dev/mapper/slowvg-4ksectortest1, missing codepage or helper program, or other error.
> >
> > So at the end here, despite msdos partition table looking correct,
> > sha256sum matching and kpartx appearing to work, dsthost can't mount
> > this filesystem. Did I miss a step or misunderstand?
> 
> Try mount -t ext4.  If that doesn't work, see what e2fsck/tune2fs say.

I've not needed that before and my instinct is that if it is needed,
something has gone wrong. But in any case it did not help:

$ sudo mount -t ext4 /dev/mapper/slowvg-4ksectortest1 /mnt
mount: /mnt: wrong fs type, bad option, bad superblock on /dev/mapper/slowvg-4ksectortest1, missing codepage or helper program, or other error.

I had posted tune2fs -l at the end of the email you're replying to;
it was from dsthost, after the move. It looks pretty normal. And as
I say, the sha256sum of the partition matches on both sides.

Here's the tuen2fs -l again:

$ sudo tune2fs -l /dev/mapper/slowvg-4ksectortest1
tune2fs 1.44.5 (15-Dec-2018)
Filesystem volume name:   4ksectortest
Last mounted on:          <not available>
Filesystem UUID:          c39bf28a-c432-4a2a-9545-5da13b8574f2
Filesystem magic number:  0xEF53
Filesystem revision #:    1 (dynamic)
Filesystem features:      has_journal ext_attr resize_inode dir_index filetype extent 64bit flex_bg sparse_super large_file huge_file dir_nlink extra_isize metadata_csum
Filesystem flags:         signed_directory_hash
Default mount options:    user_xattr acl
Filesystem state:         clean
Errors behavior:          Continue
Filesystem OS type:       Linux
Inode count:              32512
Block count:              130048
Reserved block count:     6502
Free blocks:              120293
Free inodes:              32501
First block:              1
Block size:               1024
Fragment size:            1024
Group descriptor size:    64
Reserved GDT blocks:      256
Blocks per group:         8192
Fragments per group:      8192
Inodes per group:         2032
Inode blocks per group:   254
Flex block group size:    16
Filesystem created:       Sat Jan 20 04:03:42 2024
Last mount time:          n/a
Last write time:          Sat Jan 20 04:03:42 2024
Mount count:              0
Maximum mount count:      -1
Last checked:             Sat Jan 20 04:03:42 2024
Check interval:           0 (<none>)
Lifetime writes:          4441 kB
Reserved blocks uid:      0 (user root)
Reserved blocks gid:      0 (group root)
First inode:              11
Inode size:               128
Journal inode:            8
Default directory hash:   half_md4
Directory Hash Seed:      2a074d90-0ade-4dfb-b8f2-3588ffa56cf6
Journal backup:           inode blocks
Checksum type:            crc32c
Checksum:                 0xc7322510

In a way this is all becoming academic, as it seems very
filesystem-specific. Given I generally can't poke about inside these
disk images, it looks like I will never come up with a robust
procedure for block-wise copying of these LVs.

Using hdparm to set a 512b sector may be my only way forward.

I am interested in personally knowing more though, so am happy to
try out any ideas anyone has for a while.

Thanks,
Andy
