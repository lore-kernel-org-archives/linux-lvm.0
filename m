Received: from mail.bitfolk.com (use.bitfolk.com [85.119.80.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC1B9467
	for <linux-lvm@lists.linux.dev>; Wed, 17 Jan 2024 07:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.119.80.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705476138; cv=none; b=I/aBTV4aaPy7iXt+4HQhMc8XnesmOqRpVXLbn7CkWkkRk0gxE8acFCxuTJa5xrVzHfAB/pRJAgoaBcZ8ibNTTlWUag6Xh0KdvFXQ2RAxVbtRhP19lEV4ijrwDBgDIx0LDX7FzEvaQjLG3c0lAUXVoiDe/myVAt4Qaeamf9lY5bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705476138; c=relaxed/simple;
	bh=C2PEAY8eLlLF4JF97SjDORLQoQ5nl5iTx0JzHfMJW38=;
	h=DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:OpenPGP:X-URL:
	 X-SA-Exim-Connect-IP:X-SA-Exim-Mail-From:X-SA-Exim-Scanned; b=hhaZCLBDbK4l7Au8O8xoJ+t9frKsRkrhQ+E90Vb3J76LWYWhLk9W9NT/pUXGI7LYIY2Q91ym7fBT7t6gcQMp2XiBk1HxBMRzOrpNK4HgnNnjm6uS/KwIHmItt1lCqpL5z04hLE3VEu7i/qbHuIZJt+0A0ivv3/cKQaOSDeqPtws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=strugglers.net; spf=pass smtp.mailfrom=strugglers.net; dkim=pass (2048-bit key) header.d=strugglers.net header.i=@strugglers.net header.b=BYyvaUiO; arc=none smtp.client-ip=85.119.80.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=strugglers.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strugglers.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=strugglers.net header.i=@strugglers.net header.b="BYyvaUiO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=strugglers.net; s=alpha; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description:Resent-To;
	bh=4zIm/NOpJHsE36PFI+4FBgAucEZZ/gjegG2/sXl5BjA=; b=BYyvaUiO+MVlMSQeoE+st683Z0
	FSTmCh4UopNASoYZy6caW8W6rB+0AZvMjPbQpEYkevCeYNKeaIE8zbOalwkC3+jwt3j4WBXBjVZR5
	HRHIGrTHxf6KEbu7yvCvNPwdj/xhwsBj9lMw2BFCtLIFGmsVdyK7AahQzolZgSE+pcqm+JhmNa+iD
	7bEMTCvhuix+0UcnUAZosKXvtxbUVr7BwIls5NT3n7JxewWe55eqqXlwzS28Vyk4uLWTk1X6TqpWn
	GxnRWrtrF84iL9ybuIUpwuZXwKFH1ErD7OYEGnoceiQhhP4bOWhdnqXsYVHXu8ctKU1HObKZzZgZy
	6e+ucbaQ==;
Received: from andy by mail.bitfolk.com with local (Exim 4.94.2)
	(envelope-from <andy@strugglers.net>)
	id 1rQ0Fa-0006Zc-5Q; Wed, 17 Jan 2024 07:22:14 +0000
Date: Wed, 17 Jan 2024 07:22:14 +0000
From: Andy Smith <andy@strugglers.net>
To: Phillip Susi <phill@thesusis.net>
Cc: linux-lvm@lists.linux.dev
Subject: Re: Any way in LVM to deal with 512e vs 4Kn physical devices?
Message-ID: <ZaeAJtE+0Gmp2b0E@mail.bitfolk.com>
References: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
 <87y1cp9lwi.fsf@vps.thesusis.net>
 <ZabjW4HWOSfy8sRN@mail.bitfolk.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZabjW4HWOSfy8sRN@mail.bitfolk.com>
OpenPGP: id=BF15490B; url=http://strugglers.net/~andy/pubkey.asc
X-URL: http://strugglers.net/wiki/User:Andy
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: andy@strugglers.net
X-SA-Exim-Scanned: No (on mail.bitfolk.com); SAEximRunCond expanded to false

Hi Phillip,

On Tue, Jan 16, 2024 at 08:13:15PM +0000, Andy Smith wrote:
> On Tue, Jan 16, 2024 at 01:24:29PM -0500, Phillip Susi wrote:
> > No, it wouldn't be a problem without the partition table.  ext4 uses its
> > own block size, which is pretty much always 4k.  It doesn't know or care
> > about the underlying disk logical sector size.
> 
> I've found quite a few people having similar problems to me so I'm
> not sure about this, but I haven't had chance to test it yet. I
> will try it out before I explore hdparm.

I've tested ext4 directly on the LV with no partition table now and
you're correct - no issues there! Apologies for doubting you - so
many different vague accounts of issues out there.

So, the actual problem here is something about the MBR partition
table. Off-topic now for this list but I wonder if there is a safe
and reliable way to modify such a partition table after sync to
allow this to work…

Thanks,
Andy
