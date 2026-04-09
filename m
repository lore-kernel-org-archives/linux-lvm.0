Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928D81A9FB0
	for <linux-lvm@lists.linux.dev>; Thu,  9 Apr 2026 20:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775766780; cv=none; b=J1uvU9CicPrB5ujsTFnmfqfxFC0YLTl5zjmt2afMlGhM2GcEV0CIpJxjwpWr+HgKA1I9nSnrfVihXLiYdM6KCGMvAK5njz6EuixVf2IKl+fNcrxCNnR22dHPHIs6eQr3iZJF0Whqy5002oer/86tlClPQxyqP5UQC3o6nMT347g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775766780; c=relaxed/simple;
	bh=8ZlQPwdknRLWMQ8I1HumputgpNHqfi+oRhQGwcfMTSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dRH/zQdvV/ojD2OfzlhKeYNhzP45KzVmyFM5BpLfm1k9ysnstLa4GmdBwHkld+YADT4DYWHjKY1ReI6BO9tvdrXY6tZjHNpgQh8mBOUXTt3b4JVc6ef1oGYaliHBaBbkSd3ANgmYN9uFQuG6O5hUrQ8dkQz+F+Liu6v38GgyxtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLID335S; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLID335S"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d23305225so926130f8f.2
        for <linux-lvm@lists.linux.dev>; Thu, 09 Apr 2026 13:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775766778; x=1776371578; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:newsgroups:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IzZQABQALC2Sfrx9sRTgGQjK0o4VWwuYfU361wHT9JE=;
        b=lLID335SH3bdaZ/6e+X+2e3IQrUTqzrKYHrU5aN2pWD9B0z0dP6u21lnWArR57ARAr
         1qkHQgUObAJoTQRXovcDpQVsIk90xCMyIn19j96tblPLZftNAH9iIvsjtPfeKQa/EEOI
         bjv4BC6t4EZAyv/oNir+5YLPm4eioW9+jfn5S8h+ef6PKK8qhKvc4/Pbp58Wn97b30zy
         I50l4Mnynij5JxUuc7qf8PpaCbIta9p7YRg2lzWX/zZKkMomHlz96OmOKyIaFxKNfo6z
         J+SSjy/M3T4BrOJ6BCuVs1eQ1BcEqhn6UElp67ZFazqiIkw4MHTuI3nCTyeb/Ug2Nj8u
         URAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775766778; x=1776371578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:newsgroups:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzZQABQALC2Sfrx9sRTgGQjK0o4VWwuYfU361wHT9JE=;
        b=CKsR3B83DGEWG8ZBG1CN5Nrm9GY7nSoV29qZDaylUYaqHfBZD81CXd0KYyOQlN/82/
         yrJiXKxhtzrr1NdLBETAjDUz0IxOrarRxOD6XMtP6FvWrnCBdlAOdaWfeBKlJOzN/ZwS
         P8Il5D5fG3CrCjF7Uv8EihxiAhpgZA0IBmvdi8s2hikvkx1gpdOb+FM1H8ptF17w17M0
         GLPf0YV6tSUG6BSTq/C2v0Y/ky/+ipz3PCQz3p71aNaJDEnNP2XgDIO6lwqXZVIPQSNW
         btTM0rH3c4Wv16ShiKT8GFUILkjT3kgsEYaJtQ0ZcgBn8XThrjmekP+lt57eVpxSUfOr
         EUWg==
X-Forwarded-Encrypted: i=1; AJvYcCVxrlqBcGX5HskDxQMhJYYdEy5QgtTr24xtUaCRZW0l3qFkmKPVC54DcwMK1RI2tixoHQ3JRSWKMTg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpzMgOYjdiAxbJ1qItU2C1chG0rn1QgYe9R3aeOOv1drON1Dko
	Zp2UO/Dk+itxQc4HjEf5N1ZjpY+szRHR+ZwRQY5+HcDyPdyn10rrXVFUp768jg==
X-Gm-Gg: AeBDievdFakohSbuTJStCRotuaLl73ZSdrLVcxqtGSSGIIz8XCsG6dsTWMYOCwW1Us0
	qO2EkuUARvVEzxZ4voDYQXROO7vzWLvTwmhhKzykMW0bdd12AaW78dTL2d3Bl4gbxfwB+5jV+ag
	yWoxH+dwK+R5SM8ehyr9CF59yWec6gk38hnqitqM0mwPqVlPXGCq/VSP/cgC+B20KgqraiNJBhp
	hsFMNscz4l/ygRKc1qaWCd2lLLeNcPIxhMpwepWHXGfaxqHc69vc3GjIgm6GFB2YtaphHz0BRGw
	fsPa0qbT9fT1P9yr20xB6Lu/BEFYLKrSqbbeW78lakOh6QFBWYoXuGjjfEnF9toydiKgvv30JP5
	QlnprLVKz2jvKyjIcB/a2nLNKWGOVApARv8v2LUzMJw0Dk4jmQkUvwQv4HbVfIgB4auYOPV10un
	+8K17ms+YfsCs3WjunDuxKSFYJZYzVhMz06w==
X-Received: by 2002:a5d:64c7:0:b0:43d:500a:1e5b with SMTP id ffacd0b85a97d-43d642da9e2mr629278f8f.27.1775766777651;
        Thu, 09 Apr 2026 13:32:57 -0700 (PDT)
Received: from [192.168.0.216] ([212.20.115.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2e4csm1594447f8f.2.2026.04.09.13.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 13:32:57 -0700 (PDT)
Message-ID: <77f3dec3-7050-4d57-8928-7c7b68a2537e@gmail.com>
Date: Thu, 9 Apr 2026 22:32:56 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_LVM-thin_metadata_corruption_on_Proxmox_after_RAID-?=
 =?UTF-8?Q?5_issues_=E2=80=93_thin=5Frepair/thin=5Fdump_fail?=
To: Ray Davis <ray@carpe.net>, linux-lvm@lists.linux.dev
Newsgroups: gmane.linux.lvm.general
References: <em2752ec1c-6e02-42bf-80e8-bb92f63e8f73@carpe.net>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <em2752ec1c-6e02-42bf-80e8-bb92f63e8f73@carpe.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 09. 04. 26 v 17:55 Ray Davis napsal(a):
> Hello,
> 
> I’m looking for advice on an LVM-thin metadata corruption case on a Proxmox 
> host. I have stopped further repair attempts and preserved the current state 
> for analysis.
> 
> Environment
> 
> * Proxmox VE host
> * Thin pool: `VMDATA0/VMDATA0`
> * Backing storage had RAID-5 issues involving two disks
> * After reseating the disks, the RAID came back online, but the thin pool 
> would no longer activate
>> 
> * Created temporary metadata LVs
> * Used `lvconvert --swapmetadata` to extract the pool metadata
> * Activated the extracted metadata LV
> * Preserved a raw image of the extracted metadata
> * Ran `thin_check`
> * Ran `thin_repair`
> * Ran `thin_dump —repair`
> 
> I can provide access to the full case directory or a tarball over HTTP if 
> someone is willing to look at it. I would prefer to share the link privately 
> with anyone interested.
> 
> My main questions are:
> 
> 1. Is there any remaining offline recovery path worth trying with the standard 
> dm-thin/LVM tools?

Hi

Very extensive report - but it looks like the key element here would be -
what are the versions in use.


Kernel ?

lvm2 ?

thin_repair -V  ?



> 2. Does this failure pattern usually indicate that the mapping metadata is 
> beyond recovery by `thin_repair`/`thin_dump`?
> 3. Would it be useful to inspect the raw metadata image further, and if so, 
> what specific tools or commands would you recommend next?
> 
> I can provide any command output that would be useful.

If you are using latest tools - then authors of this tool will need to have
access to the damaged metadata  whether there is something that can be recovered.

It'd also greatly help knowing what kind of 'damange' may have caused this.

Regards

Zdenek

