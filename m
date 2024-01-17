Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD3C208A6
	for <linux-lvm@lists.linux.dev>; Wed, 17 Jan 2024 14:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705501453; cv=none; b=tByZ9vJt2fdNDl9FSKn3ANZXnmD4XqHgFku3Bsv1pJCyIDHwIH7LIaZ4KmwcQCk6AjcShXRNJVwUzhC+VcvQ2QQHA0a4hw+CAAt340eF9M69fxLskrJucPWT/caIqvGA550acaWqNvi8M2lg6hXiIhyXIg1nDAW3UOVxNNOUjgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705501453; c=relaxed/simple;
	bh=nF9BLQG2AiKqGIEVbtrqTLV5bpPzJkOe06cy1vwsP+8=;
	h=Received:From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=b3jeM6QpAkzcAA+5I+Fe/X41BazEUsuywBYCQDpnmHIOCiFW+ok/G1wfnojCqFFC0gaFjs3P5lB8t2vF9Fu7ygj6h1IHh0O+7TUF4BHLJUP1dXC15ht6aJJn/DKERIgYjMVyFGfylTGSaF+6verHjeFZBNWRZHsggeOtuUQUXEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thesusis.net; spf=pass smtp.mailfrom=thesusis.net; arc=none smtp.client-ip=34.202.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thesusis.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thesusis.net
Received: by vps.thesusis.net (Postfix, from userid 1000)
	id F096F153B3B; Wed, 17 Jan 2024 09:24:10 -0500 (EST)
From: Phillip Susi <phill@thesusis.net>
To: Ilia Zykov <mail@service4.ru>, Andy Smith <andy@strugglers.net>,
 linux-lvm@lists.linux.dev
Subject: Re: Any way in LVM to deal with 512e vs 4Kn physical devices?
In-Reply-To: <451707ab-ec8e-8f19-6813-445a184fda3a@service4.ru>
References: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
 <451707ab-ec8e-8f19-6813-445a184fda3a@service4.ru>
Date: Wed, 17 Jan 2024 09:24:10 -0500
Message-ID: <87cyu0ca2d.fsf@vps.thesusis.net>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Ilia Zykov <mail@service4.ru> writes:

> Hello.
>
> Sorry, I could be wrong, but I was encountered this problem a long time ago.
> You cannot transfer ext4 from a device with a phys sector 512 bite to a 
> device with phys 4k sector device.
> As far as I remember, ext4 uses this size to perform atomic operations.
> Because on the new disk it is not possible to perform an atomic 
> operation with data of 512 bytes,
> then it is impossible to transfer such a FS.
> See ENVIROMENTS for mkfs.ext4: "MKE2FS_DEVICE_SECTSIZE", 
> "MKE2FS_DEVICE_PHYS_SECTSIZE".

Ext[234] does IO in units of blocks.  In the days of 80 MB hard disks,
it could use a block size of 1 or 2 KB.  These days it pretty much
always uses 4 KB.  I'm almost certain that those environment variables
are to override what the kernel detects for testing purposes, and the
only thing mkfs does with this information is to force a 4K block size (
when that is the sector size ), even if the fs is small enough that it
otherwise would use 1 or 2.

