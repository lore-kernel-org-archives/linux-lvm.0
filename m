Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85793374C1
	for <linux-lvm@lists.linux.dev>; Mon,  4 Mar 2024 10:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709549328; cv=none; b=JNNEyJsTC7FrtHkLvJVwr2kN0n7bUCd4ydtsEHupJXjbV2Nl/ddTgxnDAZMftpVaNJ626UOuV/HZwkF34iASocvzjHBGlAx+CX9L37hBJ9dRJoPoR7PyPF+bCvPLss7EuIAsG1KlyiYWD0uhHl5hITb56Yayw23RH3FltPipe/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709549328; c=relaxed/simple;
	bh=rs5c5gUSE8KV2XuJLccIkY0DJ8SZjI7k11wY1yxHta4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XonRajnsbyZpi3Wy0x94l48h5WRV4OCsuM91v/2RJF+54TfuH35MD9SD8OP9NMlBPinYL6umcH6QFJ+YSlvBD/va6gsKrfkFlJ3H1QH5MHv5cZYeiqN3m83kwc1vtJSluMzndoxpOncl3VHpW1esN8y6tw0/ChPOOxqx29aH9Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Raic6pB5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Raic6pB5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709549325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3gUEurLCpK+XUtHXbDAJMvFenxi62C2CyM3ErT9O9Gk=;
	b=Raic6pB5Uzocu9kEioqzekVyHVBPwb9hzOUAA8DffIWv8q6znN8BhOqQnWYu+2q9H+f1UH
	4oqdKQ7k0bteXL72GMyZs4OZ+2As6qtyGyUIqvQ0PbvbQPn+44gXAC9Z0AWJQh/dK0aJuD
	RNLXOv5rSdeqYsDOPpGekPHjBxlECpk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-klgCJi5RPIK1H_G9RIgIEg-1; Mon, 04 Mar 2024 05:48:41 -0500
X-MC-Unique: klgCJi5RPIK1H_G9RIgIEg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-33e4397540bso260705f8f.3
        for <linux-lvm@lists.linux.dev>; Mon, 04 Mar 2024 02:48:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709549320; x=1710154120;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3gUEurLCpK+XUtHXbDAJMvFenxi62C2CyM3ErT9O9Gk=;
        b=Qejjb/34fdlFeYfql++WSw2onxmwgRD4yCCZcKwgDyF6FrpBheNfIEfb5pIf9PRrLJ
         R2aZByPFcdfjVNBVBuh2fV3H/TrBDyjfwJSOrLWUtyJ+0AUnf4hKgOz5LXALecAvGSFy
         F8/72HeKjCVro3COWUpPdEbrZI8Y4Yjfhpjm7lc6wToN2Ln+Hm+kApoG3QRyWYIKoGIO
         83xQS7discEEcYjfdr1GxxzZgXl540iu3T4JLfUcljxNArggWpeUE7aw6GD/17LO0Lxo
         XWQgBwBlc/+pKTcgodprvLnASkjN4+y1J7s0wEf9PYdufd3Gb44t3EOTcInldIRSIXPT
         CHKA==
X-Gm-Message-State: AOJu0Ywu8lcN7icy6Tp9SgiegMlhajRCXiOWBDLaeTR6qt6kfv2HrjLd
	v9AMtRvKJSxeEE9NOQqMLF74Vq3mfOKMzShj3CBMtKJ5Hd1hfucJd44IE+GGpxppX74/Vb/lpZI
	rc5MOxKP+Flg7TKkblNlXLgshf9HzJb3yOYuPTJkrGH7NBJFsyW5ZnSihQg==
X-Received: by 2002:a5d:570e:0:b0:33e:1650:d55e with SMTP id a14-20020a5d570e000000b0033e1650d55emr6363234wrv.50.1709549320292;
        Mon, 04 Mar 2024 02:48:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwKDxqKkDS13pTt2Wxt0eKVeqtNRB0xJqQ8+BwXEvQqt/TIiQwtKOXETdlea3tafCqWHosXg==
X-Received: by 2002:a5d:570e:0:b0:33e:1650:d55e with SMTP id a14-20020a5d570e000000b0033e1650d55emr6363216wrv.50.1709549319931;
        Mon, 04 Mar 2024 02:48:39 -0800 (PST)
Received: from [10.43.17.192] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id h3-20020adfa4c3000000b0033dd2a7167fsm11986328wrb.29.2024.03.04.02.48.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 02:48:39 -0800 (PST)
Message-ID: <b884374b-2f6f-4c7f-acba-b4c730ae03ff@redhat.com>
Date: Mon, 4 Mar 2024 11:48:38 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/7] 10-dm.rules: don't deactivate devices for
 DISK_RO=1
To: Martin Wilck <martin.wilck@suse.com>, Zdenek Kabelac
 <zkabelac@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>,
 David Teigland <teigland@redhat.com>
Cc: linux-lvm@lists.linux.dev, dm-devel@lists.linux.dev,
 Martin Wilck <mwilck@suse.com>, Hannes Reinecke <hare@suse.de>
References: <20240301224011.11117-1-mwilck@suse.com>
 <20240301224011.11117-3-mwilck@suse.com>
From: Peter Rajnoha <prajnoha@redhat.com>
Autocrypt: addr=prajnoha@redhat.com; keydata=
 xjMEY7QY9hYJKwYBBAHaRw8BAQdADIHZn5yeZYFV18ewwf4iudpl1ARfj4rnxX5xiSoJ15vN
 I1BldGVyIFJham5vaGEgPHByYWpub2hhQHJlZGhhdC5jb20+wpYEExYKAD4CGwMFCwkIBwIC
 IgIGFQoJCAsCBBYCAwECHgcCF4AWIQQhe3cZL8e9dSzFIwXndmZANt+EqwUCY7QZ9wIZAQAK
 CRDndmZANt+EqzosAQDXhWudIjLSGoWGPKgluEWw5B5LtAX+kW2OG7loCDzI2AD/fp3Xec8K
 JY7HrSqO98YMPbT98+YRjiopJSk75TcAogzOOARjtBj2EgorBgEEAZdVAQUBAQdALfG8fuls
 uqLPtrJ5tYb36UtqNlu6Bw9ME/Ou+FRGG1cDAQgHwngEGBYKACAWIQQhe3cZL8e9dSzFIwXn
 dmZANt+EqwUCY7QY9gIbDAAKCRDndmZANt+Eq22lAQDXlKMGQxkD0FZes94uihIZlhFwGjrX
 dVfZsxfwEvuJfAD/XLGDegnKVERbF6YTfdsbVngSlOX/Tu/fxAFTg0JfdQU=
In-Reply-To: <20240301224011.11117-3-mwilck@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/1/24 23:40, Martin Wilck wrote:
> DISK_RO=1 is set in the environment of a block-device uevent if and only if
> the device has just been set read-only by a driver by calling set_disk_ro().
> It is not synoymous with the "ro" sysfs attribute; the device could very well
> be write-protected if DISK_RO is not set. Probing should be possible even if
> this flag is set, because blkid and friends usually don't write to the
> device. Upper-layer subsystems that do need to write would need to check the
> "ro" sysfs attribute rather than DISK_RO.
> 
> Skip the DISK_RO check in 10-dm.rules.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  udev/10-dm.rules.in | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/udev/10-dm.rules.in b/udev/10-dm.rules.in
> index 4ffd3e2..c08d829 100644
> --- a/udev/10-dm.rules.in
> +++ b/udev/10-dm.rules.in
> @@ -50,9 +50,6 @@ ACTION!="add|change", GOTO="dm_end"
>  # kernels >= 2.6.31 only. Cookie is not decoded for remove event.
>  ENV{DM_COOKIE}=="?*", IMPORT{program}="(DM_EXEC)/dmsetup udevflags $env{DM_COOKIE}"
>  
> -# Rule out easy-to-detect inappropriate events first.
> -ENV{DISK_RO}=="1", GOTO="dm_disable"
> -
>  # There is no cookie set nor any flags encoded in events not originating
>  # in libdevmapper so we need to detect this and try to behave correctly.
>  # For such spurious events, regenerate all flags from current udev database content


Yes, I'd like to get rid of this rule, but, unfortunately, there's one
issue during the DM device creation/activation.

For example, if I try:

  dmsetup create --readonly --table "0 1 zero"

Then I get these uevents:

1)
ACTION=add
DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
SYSTEMD_READY=0


2)
ACTION=change
DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
DM_UDEV_DISABLE_DISK_RULES_FLAG=1
DM_UDEV_DISABLE_OTHER_RULES_FLAG=


3)
ACTION=change
DM_COOKIE=6335392
DM_COOKIE_DISABLE_OTHER_RULES_FLAG=


The uevent 3) coming with the DM_COOKIE is the actual event when the
device is ready for use (that's the uevent notifying the DM device
resume/activation).

If we remove the DISK_RO rule, then the DM_UDEV_DISABLE_OTHER_RULES_FLAG
is unset for uevent 2), which in turn causes the SYSTEMD_READY=0 to get
dropped, which in turn will start all the systemd hooks because the
device is considered "ready" for systemd then.

But the DM dev is ready only after uevent 3) that comes with the
DM_COOKIE. So we still need to cover this scenario.

-- 
Peter

