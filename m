Received: from mail.service4.ru (mail.service4.ru [95.213.196.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAFA241E0
	for <linux-lvm@lists.linux.dev>; Wed, 17 Jan 2024 19:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.213.196.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705518314; cv=none; b=jMoqikLPLDiNS/jFUFM8YDmVRan/wPZFhcFKzn5dTuXs5MlIsp8lWgk2Lh3IAnVSRb9qp0tQuyYHvsCrSdvFfI8Iv6xV2QPQA2cSBQL/g64xNDMhqi3VVs4yAhiLkU0GjX1VCAcamFo4P1+zagGamTXw87OKnk+8p2QrFaKPFYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705518314; c=relaxed/simple;
	bh=7gOUYn/nmE2Ou6hf2LTaeO6XJ8jfBJBzA2BiHXZG+iw=;
	h=Received:DKIM-Signature:X-Amavis-Modified:X-Virus-Scanned:
	 Received:Received:Message-ID:Date:MIME-Version:Subject:
	 Content-Language:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=pNI7Aoszez8HONzOK7dDQlXDzByR3l2FgP0bMpYP8dsOKYSpS5utYZNDWNLQYRogWTE1MCAw18sY9yXMIdg20YChWJCr1WY3v5sWIfv/mHhYn2i0MG2ZGIu5CfXZPbRf0SR2R3iuiLlFbLXCIKW99YH0BpQ4Sc5gufNK1QREPzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=service4.ru; spf=pass smtp.mailfrom=service4.ru; dkim=pass (1024-bit key) header.d=service4.ru header.i=@service4.ru header.b=EGdiNS73; arc=none smtp.client-ip=95.213.196.244
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=service4.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=service4.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=service4.ru header.i=@service4.ru header.b="EGdiNS73"
Received: from mail.service4.ru (localhost [127.0.0.1])
	by mail.service4.ru (Postfix) with ESMTP id 52B8C40D6E
	for <linux-lvm@lists.linux.dev>; Wed, 17 Jan 2024 22:05:06 +0300 (MSK)
Authentication-Results: mail.service4.ru (amavisd-new);
	dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
	header.d=service4.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=service4.ru; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:references:to:content-language:subject:subject
	:mime-version:date:date:message-id; s=dkim; t=1705518304; x=
	1706382305; bh=7gOUYn/nmE2Ou6hf2LTaeO6XJ8jfBJBzA2BiHXZG+iw=; b=E
	GdiNS73FhwBDkMEf+N2HOaeezapkMydWV8D2jIHmhlmN+wRsEZAJkB9Zm2ELnqrr
	2ERWhi4InlBh2ifeXBLGk754CNwPAVlFLQwATJBWDUbCDYq/44Rl+xjXhm0DY+UP
	ZV8khVgAqwAs1iQDfbPmTb/MHt1hOJSvAftuw8WMjc=
X-Amavis-Modified: Mail body modified (using disclaimer) - mail.service4.ru
X-Virus-Scanned: amavisd-new at mail.service4.ru
Received: from mail.service4.ru ([127.0.0.1])
	by mail.service4.ru (mail.service4.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 5xACe_fKfoFJ for <linux-lvm@lists.linux.dev>;
	Wed, 17 Jan 2024 22:05:04 +0300 (MSK)
Received: from ilia (beriz.izyk.ru [95.213.196.242])
	by mail.service4.ru (Postfix) with ESMTPSA id AEE0A4091A;
	Wed, 17 Jan 2024 22:05:03 +0300 (MSK)
Message-ID: <9322d044-faff-597d-8cab-bf71ed7e9c74@service4.ru>
Date: Wed, 17 Jan 2024 22:05:02 +0300
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: Any way in LVM to deal with 512e vs 4Kn physical devices?
Content-Language: en-US
To: Phillip Susi <phill@thesusis.net>, Andy Smith <andy@strugglers.net>,
 linux-lvm@lists.linux.dev
References: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
 <451707ab-ec8e-8f19-6813-445a184fda3a@service4.ru>
 <87cyu0ca2d.fsf@vps.thesusis.net>
From: Ilia Zykov <mail@service4.ru>
In-Reply-To: <87cyu0ca2d.fsf@vps.thesusis.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.01.2024 17:24, Phillip Susi wrote:
> Ilia Zykov <mail@service4.ru> writes:
> 
>> Hello.
>>
>> Sorry, I could be wrong, but I was encountered this problem a long time ago.
>> You cannot transfer ext4 from a device with a phys sector 512 bite to a
>> device with phys 4k sector device.
>> As far as I remember, ext4 uses this size to perform atomic operations.
>> Because on the new disk it is not possible to perform an atomic
>> operation with data of 512 bytes,
>> then it is impossible to transfer such a FS.
>> See ENVIROMENTS for mkfs.ext4: "MKE2FS_DEVICE_SECTSIZE",
>> "MKE2FS_DEVICE_PHYS_SECTSIZE".
> 
> Ext[234] does IO in units of blocks.  In the days of 80 MB hard disks,
> it could use a block size of 1 or 2 KB.  These days it pretty much
> always uses 4 KB.  I'm almost certain that those environment variables
> are to override what the kernel detects for testing purposes, and the
> only thing mkfs does with this information is to force a 4K block size (
> when that is the sector size ), even if the fs is small enough that it
> otherwise would use 1 or 2.
> 
> 

Yes, Andy confirmed that there are no problems with 4k blocks, without 
partition tables. And now I think so too )
Thank you.

----
