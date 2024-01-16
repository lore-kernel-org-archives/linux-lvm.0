Received: from mail.bitfolk.com (use.bitfolk.com [85.119.80.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DDD210EC
	for <linux-lvm@lists.linux.dev>; Tue, 16 Jan 2024 20:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.119.80.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705436256; cv=none; b=IFM1Nv6VuZmhiZe7P1Kg17kSUiVQT2RGXCceGc+GzQMzvyYNx/vpeEqDwxPdNSuvETsEA9w+N4ia6GStFzrUpKvnMB0p1i4fBJIH5gen6gvqgMiOfdPhYcQZv3Npbrl8Jughblf0wNInV/Ka7BpsEhbL2nHLu4wBmVD364+L6E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705436256; c=relaxed/simple;
	bh=tF9ANrY0TnGT2Qcj26+p5OZdNTgVLAOGOZ7qrpHU/Zo=;
	h=DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:OpenPGP:X-URL:X-SA-Exim-Connect-IP:X-SA-Exim-Mail-From:
	 X-SA-Exim-Scanned; b=L0VWF+XbN9oIuGf/GzDX67P4FTKiu0YymrDRNZIhMYN7+2TBNUr4Zc7WKXhamGjLQ6bPXT9tmlqVoI/5Q7UqAmLudnR3rdk74Zl8lCfPPnSM77QG0akwHbbGxvQdWpbFJl6XwzZM8TM76otwAMCWo0gTlGh6iQAtytc5nU8mMX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=strugglers.net; spf=pass smtp.mailfrom=strugglers.net; dkim=pass (2048-bit key) header.d=strugglers.net header.i=@strugglers.net header.b=MirajKNY; arc=none smtp.client-ip=85.119.80.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=strugglers.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strugglers.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=strugglers.net header.i=@strugglers.net header.b="MirajKNY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=strugglers.net; s=alpha; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:Sender:Reply-To
	:Content-ID:Content-Description:Resent-To;
	bh=tF9ANrY0TnGT2Qcj26+p5OZdNTgVLAOGOZ7qrpHU/Zo=; b=MirajKNYpGGarm8hMDluNqpCzh
	rvX/tUYdPSXrMzuz4M7IdOFMM+FqkA8Eat0qTmRwi1FRiZru01CNVbZnY7E+2zgvzi8Qs/+lh2+pI
	sR4hAhYirFhZNlEeyJMiKaRWqpE6sDs2QuFrEb7h7k6j3EJBalUS+0ixVzEf0nHd0jshck3jhUsZX
	dm0WpemTAovEXpJYK2Yg9pRzFcLs+l1M2CbuEyQn+MqpkP89sTj739pPkpwDP1mhvstYeuAv1oOsG
	XSKe55r/ynorR/X+wmMIPCmeo4RleLtzQ419mwRQN0JeJkxQpgUH8rlRIw+vBVY5j6uzXvRdYUE9Z
	cSZ5lJ+w==;
Received: from andy by mail.bitfolk.com with local (Exim 4.94.2)
	(envelope-from <andy@strugglers.net>)
	id 1rPpsJ-0000RO-UE; Tue, 16 Jan 2024 20:17:31 +0000
Date: Tue, 16 Jan 2024 20:17:31 +0000
From: Andy Smith <andy@strugglers.net>
To: Ilia Zykov <mail@service4.ru>
Cc: linux-lvm@lists.linux.dev
Subject: Re: Any way in LVM to deal with 512e vs 4Kn physical devices?
Message-ID: <ZabkWx401gDBehBZ@mail.bitfolk.com>
References: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
 <451707ab-ec8e-8f19-6813-445a184fda3a@service4.ru>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <451707ab-ec8e-8f19-6813-445a184fda3a@service4.ru>
OpenPGP: id=BF15490B; url=http://strugglers.net/~andy/pubkey.asc
X-URL: http://strugglers.net/wiki/User:Andy
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: andy@strugglers.net
X-SA-Exim-Scanned: No (on mail.bitfolk.com); SAEximRunCond expanded to false

Hi,

On Tue, Jan 16, 2024 at 10:30:36PM +0300, Ilia Zykov wrote:
> Sorry, I could be wrong, but I was encountered this problem a long time ago.
> You cannot transfer ext4 from a device with a phys sector 512 bite to a
> device with phys 4k sector device.

I have read several other accounts which agree with this. I will
test just directly putting an ext4 fs on an LV that's backed by 512e
drives and then copying an image of that to an LV that is backed by
4Kn drives, just to see what happens, though.

> In datasheet for you model tells:
> * 512e models can be converted to 4Kn format and
> vice versa.
> I don't understand what is it mean, but maybe you can try convert to 512e if
> possible.

I think it means that using hdparm to set its sector size to 512 is
possible, though that would invalidate all the data currently on
the drive (which is fine in this case).

There would of course also be vendor tools to change the sector
size, but I think hdparm should work if the data sheet says the
procedure is possible.

I'll let you know!

Thanks,
Andy
