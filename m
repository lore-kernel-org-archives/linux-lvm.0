Received: from mail.service4.ru (mail.service4.ru [95.213.196.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F491D525
	for <linux-lvm@lists.linux.dev>; Tue, 16 Jan 2024 19:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=service4.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=service4.ru
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.213.196.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705433850; cv=none; b=fl8b4HQKOcMw/gqeCJ9r4c2TmUNhzys8e1TbnisfM1ztScQ/OIlpGhDo6Y6wvWb2J8O11zXG9TRNA2kmYi2RyAiZASHCJkEmA1YZbgyxwesxQxONhB4c3V3wjrPI4mJG8JwDfrXTvnD8ZoOmMsTDPLaZtrPKVqscStxry4dv9FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705433850; c=relaxed/simple;
	bh=bHpEnI7ppmdsnbG+rySs61f7EnUQSMUGDKhaI/aZIyw=;
	h=Received:DKIM-Signature:X-Amavis-Modified:X-Virus-Scanned:
	 Received:Received:Message-ID:Date:MIME-Version:Subject:
	 Content-Language:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=C3XEPBFkG1+nIzAOdOUEOCQgaBuWcgmjDzlhslEgOquX+cZcqbQvmK0VI/s4x0gZ1edaBvj0Ze+8V+nzdpus+6NzE8+S/SdkjVOlXLDYXGBwphDKxOht+G3eQDfpaqBUwJfK8PD2AWHmOI3CXSw7Luo2ffyhCgtA/ZOhTtQc6ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=service4.ru header.i=@service4.ru header.b=TNNwl7YR; arc=none smtp.client-ip=95.213.196.244
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=service4.ru header.i=@service4.ru header.b="TNNwl7YR"
Received: from mail.service4.ru (localhost [127.0.0.1])
	by mail.service4.ru (Postfix) with ESMTP id C523B40D33
	for <linux-lvm@lists.linux.dev>; Tue, 16 Jan 2024 22:30:39 +0300 (MSK)
Authentication-Results: mail.service4.ru (amavisd-new);
	dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
	header.d=service4.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=service4.ru; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:references:to:content-language:subject:subject
	:mime-version:date:date:message-id; s=dkim; t=1705433438; x=
	1706297439; bh=bHpEnI7ppmdsnbG+rySs61f7EnUQSMUGDKhaI/aZIyw=; b=T
	NNwl7YRMC2eGqS7Qvl4xH8Q+hdDL1qLj3K2fWS27pZugOZPFtg1GGgRMJJ6fAhXr
	SWOV3AQF6o0ha4qj2ZZh0mtqMgZ7Q74KPOm4ae2t1fHiQeZlx5j93NBktLjQ5mq1
	D/QYs2UtbTJlBAk0rrVs+EmQR/XJFYGpetk0l8Lwtc=
X-Amavis-Modified: Mail body modified (using disclaimer) - mail.service4.ru
X-Virus-Scanned: amavisd-new at mail.service4.ru
Received: from mail.service4.ru ([127.0.0.1])
	by mail.service4.ru (mail.service4.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0P9nX2_E1Js7 for <linux-lvm@lists.linux.dev>;
	Tue, 16 Jan 2024 22:30:38 +0300 (MSK)
Received: from ilia (beriz.izyk.ru [95.213.196.242])
	by mail.service4.ru (Postfix) with ESMTPSA id 7E48740CC0;
	Tue, 16 Jan 2024 22:30:37 +0300 (MSK)
Message-ID: <451707ab-ec8e-8f19-6813-445a184fda3a@service4.ru>
Date: Tue, 16 Jan 2024 22:30:36 +0300
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: Any way in LVM to deal with 512e vs 4Kn physical devices?
Content-Language: en-US
To: Andy Smith <andy@strugglers.net>, linux-lvm@lists.linux.dev
References: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
From: Ilia Zykov <mail@service4.ru>
In-Reply-To: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello.

Sorry, I could be wrong, but I was encountered this problem a long time ago.
You cannot transfer ext4 from a device with a phys sector 512 bite to a 
device with phys 4k sector device.
As far as I remember, ext4 uses this size to perform atomic operations.
Because on the new disk it is not possible to perform an atomic 
operation with data of 512 bytes,
then it is impossible to transfer such a FS.
See ENVIROMENTS for mkfs.ext4: "MKE2FS_DEVICE_SECTSIZE", 
"MKE2FS_DEVICE_PHYS_SECTSIZE".

In datasheet for you model tells:
* 512e models can be converted to 4Kn format and
vice versa.
I don't understand what is it mean, but maybe you can try convert to 
512e if possible.


----
