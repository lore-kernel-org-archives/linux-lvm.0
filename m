Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A4E86AC2
	for <linux-lvm@lists.linux.dev>; Tue,  5 Mar 2024 14:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709649752; cv=none; b=kRa0RbU9VqmcE8FEPVVhyjJmX4da8N8m/XpOJfJvaDmduQI47uDm/rEJkQvkIM6UhCjEyNQWD9W3bcvtWFyyPDtIcijoCgVA5ekONlvzqNOVRIicmf7emjTa772QuT4QZ8MsxCQmj8wW1Kfm+zL3GGrQ8NPVCk+/MXsqi6tcoFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709649752; c=relaxed/simple;
	bh=rrUs/1+bDGj9wKgLjOjtYbA9vOHJh6dgN224Vnn0njY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XF2jBczzAniLEpbdgXhilelTWuF+ifAdo6xrLueeXUbCwOzqMVLourqmemPB6HQLkpbhn2eZlKiGlwi9eOYRSN5kcuHpoHvjnbd8OxcCwnRtVhwxcJXa8XUn5YbRwu5ZeZeU9K5zFXymXJUDfT35LSRuU4fFgM8P/MqaBFXVKnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f3ShgMe7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f3ShgMe7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709649749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hkCvxYrhFUqX5aN39YiixsoelylphZU5rJpwKC/MjcA=;
	b=f3ShgMe7cLaTD62DJyKcyja6/wXdKMLCukQq4hcS8/QEhxs/ZW7zT46Moie4tb9Hjws3xz
	Sp0oQUvdzKY89YpNxOa54SJdn71osgM/dXhz8/jt+tPlCEe4VNKPA9EYxX+QfjGo0DnHED
	gOQ6TJWk8DXvTf287GoWdXU8eDkgDHM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-QowQYvz-NUe0m-mLRyrNuQ-1; Tue, 05 Mar 2024 09:42:26 -0500
X-MC-Unique: QowQYvz-NUe0m-mLRyrNuQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-412db67aa46so16118425e9.3
        for <linux-lvm@lists.linux.dev>; Tue, 05 Mar 2024 06:42:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709649746; x=1710254546;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkCvxYrhFUqX5aN39YiixsoelylphZU5rJpwKC/MjcA=;
        b=NuK2CflFnFvXWWupLPsDsjmE9VmfzTkQftgDbX0Dxk+TIswk7i2wiYUFYm6tx9/hgu
         NpF+TxUSR2DaGv9fyaH4d2nwSNDc2ERZ0Bt3l3Y0tOEDezFCFMNaCfrCAOgeOYcMvuCn
         vt81bs1KHofLRswLhct1VB2E64razZT+FXcVlrS8P1SDrzf86BIxyhTritOPg80TYyM0
         UFpu0yTGzU7T+Nx/6PsWiZ0JjBQQ73lppwlYBKKXGN9uUJcOn7955zl4QMqEOL1T2OFI
         NhkXpES4geMWPvqxsVTI2QPqzaR8vDMI3ZMDAGrvX4X+Ct4SPXjJhlAzYjhWGHpDIHLF
         He5g==
X-Gm-Message-State: AOJu0YxInWyFqGo4ErV31J4E+E8xNm4JtQDDy41NnICKqxfcaQydtqHc
	5A2B545yRkfRcc3e4mH8DC5OzaV2dTgy/6STJO2XpX0OKrUBGpk6gV3LZyKmn/31CKInIgC8Vum
	PfH6gh3v5bKAQosliFY6h7SHr31NrtXnFyuIAUArddM+D/me51j8OJ+wOUw==
X-Received: by 2002:a05:600c:a005:b0:412:ef3c:f86e with SMTP id jg5-20020a05600ca00500b00412ef3cf86emr922920wmb.17.1709649745909;
        Tue, 05 Mar 2024 06:42:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPVzy8OkYU7nRb4Y8+l1K6zVEUAa+oC3MfrE/SSQxotu9ySbkUW0fORvZTSTjjdOe1mYkPww==
X-Received: by 2002:a05:600c:a005:b0:412:ef3c:f86e with SMTP id jg5-20020a05600ca00500b00412ef3cf86emr922901wmb.17.1709649745613;
        Tue, 05 Mar 2024 06:42:25 -0800 (PST)
Received: from [10.43.17.192] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id d8-20020a05600c3ac800b00412e84e59d8sm4217354wms.44.2024.03.05.06.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 06:42:25 -0800 (PST)
Message-ID: <b605f50c-700a-40a7-b8a0-f5c05400161c@redhat.com>
Date: Tue, 5 Mar 2024 15:42:24 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] device mapper udev rules rework
To: Martin Wilck <martin.wilck@suse.com>, Zdenek Kabelac
 <zkabelac@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>,
 David Teigland <teigland@redhat.com>
Cc: linux-lvm@lists.linux.dev, dm-devel@lists.linux.dev,
 Martin Wilck <mwilck@suse.com>, Hannes Reinecke <hare@suse.de>
References: <20240305120550.11617-1-mwilck@suse.com>
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
In-Reply-To: <20240305120550.11617-1-mwilck@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/5/24 13:05, Martin Wilck wrote:
> Martin Wilck (7):
>   13-dm-disk.rules: import ID_FS_TYPE
>   10-dm.rules: test DISK_RO after importing properties
>   10-dm-rules: don't restore DM_UDEV_DISABLE_OTHER_RULES_FLAG from db
>   11-dm-lvm.rules: don't restore DM_UDEV_DISABLE_OTHER_RULES_FLAG from
>     db
>   dm udev rules: don't export and save DM_SUSPENDED
>   dm udev rules: don't export and save DM_NOSCAN
>   10-dm.rules: bump DM_UDEV_RULES_VSN to 3
> 
>  udev/10-dm.rules.in          | 43 +++++++++++++++++++++++++++---------
>  udev/11-dm-lvm.rules.in      | 13 +++++------
>  udev/12-dm-permissions.rules |  2 +-
>  udev/13-dm-disk.rules.in     |  9 ++++----
>  4 files changed, 43 insertions(+), 24 deletions(-)
> 

Only really minor and cosmetic things:
  - we're using $env instead of %E to reference the variables,
  - maybe let's dump the mention about DM_SUSPENDED in
12-dm-permissions.rules if we're at it

But functionality-wise looks good as already discussed in the RFC
version of the patchset. Thank you!

(You can also create an MR in lvm2's gitlab upstream repo
https://gitlab.com/lvmteam/lvm2 if you have an account there.)

For the whole patchset:
Reviewed-by: Peter Rajnoha <prajnoha@redhat.com>

-- 
Peter

