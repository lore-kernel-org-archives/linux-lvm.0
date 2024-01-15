Received: from mail.bitfolk.com (use.bitfolk.com [85.119.80.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B433D62
	for <linux-lvm@lists.linux.dev>; Mon, 15 Jan 2024 07:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=strugglers.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strugglers.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=strugglers.net header.i=@strugglers.net header.b="m9yYFjQV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=strugglers.net; s=alpha; h=Content-Type:MIME-Version:Message-ID:Subject:To:
	From:Date:In-Reply-To:Content-Transfer-Encoding:References:Sender:Reply-To:Cc
	:Content-ID:Content-Description:Resent-To;
	bh=eOptipfjYeGtIAtX/glLbn1ft2RkJ5KLTtY9ctpksjg=; b=m9yYFjQVMeGR78mV8CUEW/DjoG
	xvlrvwRMG75qCVi9rWg4v5+M70vjSd6AlKZ/intHNvn+hvj0+8xvPMSf1ha22RN05Z8mTS2QB5htF
	ig5i+LeA+Mo9WZGi9GvEyoCW4raQ244pXBH2/4VNgH/1yIVyvVlI5pIZ6ckEEdoU0fCYmGJ4BNRPe
	Cj9iBKKaKm0OGj9Js9soHYxkqAU1TgMTih2ObMCPQUb6lj7crxhtHzXuKCez5p9mOHoSRQlfkrPh7
	R2KQ6A9c7kdXxEv9F0K8vVbNq85Yu+AG6hXR16h4YI9uSbTwNqu5T0Tx14PkCfVu96jZULDp3KWPL
	ZAR8b/Jg==;
Received: from andy by mail.bitfolk.com with local (Exim 4.94.2)
	(envelope-from <andy@strugglers.net>)
	id 1rPHQp-0001Xk-NB
	for linux-lvm@lists.linux.dev; Mon, 15 Jan 2024 07:30:51 +0000
Date: Mon, 15 Jan 2024 07:30:51 +0000
From: Andy Smith <andy@strugglers.net>
To: linux-lvm@lists.linux.dev
Subject: Any way in LVM to deal with 512e vs 4Kn physical devices?
Message-ID: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
OpenPGP: id=BF15490B; url=http://strugglers.net/~andy/pubkey.asc
X-URL: http://strugglers.net/wiki/User:Andy
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: andy@strugglers.net
X-SA-Exim-Scanned: No (on mail.bitfolk.com); SAEximRunCond expanded to false

Hi,

On machine 'A' I have a pair of:

Device Model:     Samsung SSD 870 EVO 4TB
Sector Size:      512 bytes logical/physical

on top of this is an mdadm RAID-1 and that is an LVM PV.

One of the LVs has been partitioned with an MBR and a single
partition spanning the whole of the 400GiB LV.

I took a dd of this LV and transferred it to an identically-sized
LV on machine 'B' which has a pair of:

Device Model:     HGST HUS726T6TALN6L4
Sector Size:      4096 bytes logical/physical

The LV there when examined in a partitioning tool such as "fdisk"
now thinks it has a 3.2TiB partition and it is not usable.
Correcting the partition sector numbers allows for use of, for
example, "kpartx", to expose the partition as a loop device but the
ext4 driver and fsck.ext4 remain unable to detect a superblock.

I have confirmed with sha256sum that the content of the
image/partition remains the same on source and destination.

So, clearly the issue is the 512e sector size on source vs 4Kn on
destination. Is there any way to work around this in LVM? My issue
is that I would like to be able to move images of disks/filesystems
around at the block level without mounting/creating filesystem and
transferring with an fs-level application.

If not, then possibly I can use hdparm to set the 4Kn drives to 512,
which will obviously involve destroying their contents, but that is
fine at this stage.

I don't think the presence of a partition (as opposed to an ext4
filesystem directly upon the LV) is relevant; I think the same
issues would occur with a direct filesystem. I mention it only for
completeness. Also, I realise that the problems would also happen
without LVM. I just wonder if there is any workaround at the LVM
layer, since that is already used here.

Thanks,
Andy
