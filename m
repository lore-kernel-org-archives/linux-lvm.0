Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7FB6A005
	for <linux-lvm@lists.linux.dev>; Thu, 25 Jan 2024 19:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706209534; cv=none; b=TRV1EvgQ5/60oS1DbCjd8f1PQPF5kVmziurivtVUvIJ4/AVADvH49VVx9uv0ILfa7BGEQQ6bYFC0JL2YUA0cYoY+q2XfZhTGVjlcHCtDXcrtk/0b8fh3O25dd62AA4cxvBxNdR7V0v101/UGWcQLwLTUU2AVHB+MY/K10b0eDrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706209534; c=relaxed/simple;
	bh=Dai3SGKPWC0PaZAoJw8Ec9qDbrWlC3bKqX7oVs+gOjY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ii31iz3fANRY1KDTnOsn8nPz4tAW4Hd5vWRiWvOYP4LSvFYOCvl+xQcKG2SdNKjULJ+abD/i64lshhgXTLFBDjYVGw9F0LBrSWfmISDW+CKpLNJR1K4oUE9eojw9XGpCWuL9F384dulnwkI3g9DiTEJgtXdLYDnbg5MfXpk6J7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thesusis.net; spf=pass smtp.mailfrom=thesusis.net; arc=none smtp.client-ip=34.202.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thesusis.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thesusis.net
Received: by vps.thesusis.net (Postfix, from userid 1000)
	id 2B98E154F89; Thu, 25 Jan 2024 14:05:26 -0500 (EST)
From: Phillip Susi <phill@thesusis.net>
To: Roger Heflin <rogerheflin@gmail.com>
Cc: Andy Smith <andy@strugglers.net>, linux-lvm@lists.linux.dev
Subject: Re: Any way in LVM to deal with 512e vs 4Kn physical devices?
In-Reply-To: <CAAMCDed_g0Hy2gTaAwo=PrH6dMoxo9=p1LwReWvU6CHbdxo-TA@mail.gmail.com>
References: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
 <87y1cp9lwi.fsf@vps.thesusis.net> <ZabjW4HWOSfy8sRN@mail.bitfolk.com>
 <ZaeAJtE+0Gmp2b0E@mail.bitfolk.com> <87frywcapk.fsf@vps.thesusis.net>
 <ZatP7wb9k5jzV59y@mail.bitfolk.com> <87v87nnauh.fsf@vps.thesusis.net>
 <ZawzYqFyvDu8PgZ3@mail.bitfolk.com> <8734umiu1v.fsf@vps.thesusis.net>
 <CAAMCDed_g0Hy2gTaAwo=PrH6dMoxo9=p1LwReWvU6CHbdxo-TA@mail.gmail.com>
Date: Thu, 25 Jan 2024 14:05:26 -0500
Message-ID: <87il3hxmh5.fsf@vps.thesusis.net>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Roger Heflin <rogerheflin@gmail.com> writes:

> The mount program seems to find the type of fs (from the first few
> bytes on the fs) and handle it, and if it does not mount, then adding

I'm pretty sure that has to do with libblkid and if if that's been
around for 15 years already I feel old indeed.

> You might do a "dmsetup table" and specify what the lv names is and
> maybe a ls -l /dev/mapper so we can see what the partitioned lv dm
> mapping looks like.  and a fdisk -l against the partitioned lv, and a
> ls -l /dev/<vgname>/

He posted the dm table and partition table and they looked fine.  He
also showed tune2fs showing the superblock info like nothing was wrong,
so at least the superblock appears to be in the right place.
