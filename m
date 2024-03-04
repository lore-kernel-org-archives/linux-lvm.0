Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB82E3839F
	for <linux-lvm@lists.linux.dev>; Mon,  4 Mar 2024 11:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709550557; cv=none; b=Pb3CJ7x3Sz175Cg6n4DOR//Ytv6zoRxdAsW45izU1m97ttdbPtD3MUJlV0d7lIiOA/KPON6V095f1hW9iI9eCcFj/wPkTUwpG8nzMFS2A7E5DMJXZc6OvK1zpM5XKuY4ZS0fWRx/dXPxHTbs83bVEnz+SdIBN9xazBLM76MpEPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709550557; c=relaxed/simple;
	bh=lueAsQcKG8UfRNxtxUP+9zmS2TUHsMy2QBHurMTRJWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h9qqxyka1faFpgFTZae7zJ4pb+fxBfS2qkmjwnofodQc4A5MVseHTksLP9apbMFy6Fo5enU/+XW8XcPDXgy0UOvPof1sPwCb8IrLLD836GozLO3Y1j48souofWAJRiTsknAntyj9DML2Zb9WM1peEIiUZGvI1DronfPVPooI+58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EYtNYA4U; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EYtNYA4U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709550555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=p9kzpo2kjYUMUH6pId8hoxWi66lb5pSAsecrgkHIxD0=;
	b=EYtNYA4UqmuMQjVDFqWYCz0+zD9HTchZm1jl78R4hMM1j+YhkQA+vCJ72eRztsBrmSCTQU
	K63Je6ASz3CVdB3m4hP0ith58yPTVml0tV7wRw/OhdRiqTfGPZ9iHVRItay/M6lpMu4kcH
	ywTEmxkhLWfBDyDgOSa2OuHei8UkFug=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-KCuWsktJNpS8iZml4buOPg-1; Mon, 04 Mar 2024 06:09:13 -0500
X-MC-Unique: KCuWsktJNpS8iZml4buOPg-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-33dc175ff8fso2355767f8f.0
        for <linux-lvm@lists.linux.dev>; Mon, 04 Mar 2024 03:09:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709550552; x=1710155352;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p9kzpo2kjYUMUH6pId8hoxWi66lb5pSAsecrgkHIxD0=;
        b=N5FZ8DVJr73R+TbkpVXdZKEceWkn7AXBw8tTRvcxdQULS7iXp4ULutr8f/CibAYubQ
         yfTGZu8SCb95xvs0cZic7buRLOj4yhq1TWlRVk87fzhPrGjP7QxbxgWwQ2RLxruU3b9u
         Bn5TjjarZSgcy2OHZp+TKjsGIpsll+DuoGYvmVjHO5M1JH5c7A5l9UTLL2BFr1idrkYG
         32vm5CbP2nxuCRDTMeLAwDb7Yx9iZKtqA4eSv++CVR5geuBrRrPx/nENBc9x6Z7pIoOb
         dUvFdA55VUKTBPfDbVZ3ssZcDt4qSV8yxRU/aUpoPjubkW7hW1LEKH8I6DRjm4IV0tRK
         oNQw==
X-Gm-Message-State: AOJu0YzWr4Kc8v5NQfuto84xsSqu/L0tlEiolDrcKk/F15peQIkhp8M2
	gaTcIlgeYMY112DrkO/iwwrMiVGevepB01HwQfp7Y6SDcAT0t5TXWSixXi3OwOeLZJ1dHz5IdRp
	/Xbwkr3a0Sa7RQ/raJfJU4gyE/v0DcdiVU6OW9sQxwVqR0qRKJLhLZXn1GA==
X-Received: by 2002:adf:f20a:0:b0:33d:2473:4716 with SMTP id p10-20020adff20a000000b0033d24734716mr5810966wro.57.1709550552720;
        Mon, 04 Mar 2024 03:09:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKKvz4i+huyGZEA7QSOGHXNTtRM6ZW2XzxctazKY+MFWZVMG6cXeRJ1h8VEoRWo64oJMJVog==
X-Received: by 2002:adf:f20a:0:b0:33d:2473:4716 with SMTP id p10-20020adff20a000000b0033d24734716mr5810956wro.57.1709550552453;
        Mon, 04 Mar 2024 03:09:12 -0800 (PST)
Received: from [10.43.17.192] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id j11-20020a5d604b000000b0033d9ee09b7asm11903409wrt.107.2024.03.04.03.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 03:09:12 -0800 (PST)
Message-ID: <dfb7c85c-81fb-493b-a897-dae355d22d82@redhat.com>
Date: Mon, 4 Mar 2024 12:09:11 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/7] 10-dm.rules: bump DM_UDEV_RULES_VSN to 3
To: Martin Wilck <martin.wilck@suse.com>, Zdenek Kabelac
 <zkabelac@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>,
 David Teigland <teigland@redhat.com>
Cc: linux-lvm@lists.linux.dev, dm-devel@lists.linux.dev,
 Martin Wilck <mwilck@suse.com>, Hannes Reinecke <hare@suse.de>
References: <20240301224011.11117-1-mwilck@suse.com>
 <20240301224011.11117-8-mwilck@suse.com>
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
In-Reply-To: <20240301224011.11117-8-mwilck@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/1/24 23:40, Martin Wilck wrote:
> Bump the rules version in order to indicate that upper level rules
> should consume DM_UDEV_DISABLE_OTHER_RULES_FLAG rather than DM_NOSCAN
> and DM_SUSPENDED.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  udev/10-dm.rules.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/udev/10-dm.rules.in b/udev/10-dm.rules.in
> index d30f663..21bbcb0 100644
> --- a/udev/10-dm.rules.in
> +++ b/udev/10-dm.rules.in
> @@ -136,7 +136,9 @@ LABEL="dm_suspended_set"
>  # possible future changes.
>  # VSN 1 - original rules
>  # VSN 2 - add support for synthesized events
> -ENV{DM_UDEV_RULES_VSN}="2"
> +# VSN 3 - use DM_UDEV_DISABLE_OTHER_RULES_FLAG as the only "API"
> +#         to be consumed by non-dm rules.
> +ENV{DM_UDEV_RULES_VSN}="3"
>  
>  ENV{DM_UDEV_DISABLE_DM_RULES_FLAG}!="1", ENV{DM_NAME}=="?*", SYMLINK+="(DM_DIR)/$env{DM_NAME}"
>  

One thing that comes to my mind here is cooperation between the rules
from initrd/initramfs and rootfs - the initrd/initramfs can have
different versions of the rules installed. This was actually the
original reason for introducing such versioning so we can still try to
do our best even if the rules are mixed (to not cause a hang at boot
just because a proper symlink was not found undev /dev).

I haven't tested this with the new rules yet...

-- 
Peter

