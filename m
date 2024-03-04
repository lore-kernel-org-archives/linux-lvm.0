Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4163139FEE
	for <linux-lvm@lists.linux.dev>; Mon,  4 Mar 2024 10:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709549366; cv=none; b=ldrT76XoMwLy3m7rAcuwcN0gRrDnBHlYvzbfMchuoA4ZErY2rQ+DpmG1VJng0fg47F5sn1WKbaeXjn2BrS1QxpccaavUDMWIHf7cynMQVhn+PnzdqfjIfxTNSLOUq532sOLcsh77+0UG8yKabmnIiQclewM1Q4RgoKz+Cx3rytM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709549366; c=relaxed/simple;
	bh=Fk2rr8h9CoKt+fatQaqJ8GInj+bhXPR0RGdYBFjyirE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=boa4cK/V86VBLLdTnzFQgAJJ5+Qo8E03o7Cq45t2XBL4jfIWasSEsBZ3vEJ2Hky6Dgblk+qayLyxXg3vDMYANrjvU21uIRGstDVRUvoorzzZ6urv3Pz6oD+PSjE/B11kH/jwjnl4mTC6fJa6IXqC5dOPhxjlfwxgVFQ5jzjLvZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UPzfAxIV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UPzfAxIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709549363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CRXnW5N0D+T0nFkHtVIwIbsJVLwrkZ4Q+TcKGMJnXn8=;
	b=UPzfAxIVDzAmOnDiBukjiirD02OcTw1ec9Sru5yOqaO4OWMfmouh5k+mO+bWG32uYPL6qx
	POCGbTHyMBUCcdp/W81orqj+nvxy1sxqV8adxYJWT9cXyueQ9O/zCKqiAKRmbpR2iO0HAz
	Y79iu5MUWtWdBQNB+O8xk9B13lCFv2g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-foZhLu3QMsSwohFbMfbamg-1; Mon, 04 Mar 2024 05:49:20 -0500
X-MC-Unique: foZhLu3QMsSwohFbMfbamg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-33e10eda176so1585639f8f.2
        for <linux-lvm@lists.linux.dev>; Mon, 04 Mar 2024 02:49:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709549359; x=1710154159;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CRXnW5N0D+T0nFkHtVIwIbsJVLwrkZ4Q+TcKGMJnXn8=;
        b=HbxDL4pGUqYXGqdwvMVXxqh3keNyA6IZXYfQVJUOBSdXTD/UhfPuPZtympxTsNOZVS
         MnLIx/WaZg2R0CVGle6vhlyxEX6kQCHl9wVcC+zitkB7Sy2afmn/Zd+4cqb9sE253C7U
         duyictcEBs8A4wWAXatWD9piKNDMO7ElxfZ+dk+O9ivs6gGCey7xP1+PEoABcbaFI98k
         yHEn7bK9XHlo7JykSqwL39NNAk8JD50URuk9Z8q9EznGoaIeiQrwes1HO+173Zqj1eTN
         LmrgsRJ+jK2iPEPtQB8E5D4/sBoTKLZ/uvSg15n2X1Czu9e6E8LbEhdPZfwTcqH2GBZ/
         zb+A==
X-Gm-Message-State: AOJu0Yx1epXaHAxYaJDrDfWyIeewyHaJm7b7MIYAzKTfwR9wyL/31X61
	Fy7h9KcBUgjUTFJVcGx4viW6zLRplCv8i0dFlm6rLmI5xENsPMqJEB67HYEemJBX+orl5fbVB9f
	U8SfMlCB6kHhxbyB9oPUTQ74i115Do0dwo9J1caatmSu81gJxlexxR2lJHA==
X-Received: by 2002:a5d:4d87:0:b0:33e:d17:76b with SMTP id b7-20020a5d4d87000000b0033e0d17076bmr6003224wru.7.1709549359476;
        Mon, 04 Mar 2024 02:49:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsjcm7i0vxhvDjGogVIRUa09eFCmwnM4Pyb64wT/VvaTwdRhW8Sf8ecg3iE9LSOLAqMIVeGQ==
X-Received: by 2002:a5d:4d87:0:b0:33e:d17:76b with SMTP id b7-20020a5d4d87000000b0033e0d17076bmr6003209wru.7.1709549359202;
        Mon, 04 Mar 2024 02:49:19 -0800 (PST)
Received: from [10.43.17.192] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id h3-20020adfa4c3000000b0033dd2a7167fsm11986328wrb.29.2024.03.04.02.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 02:49:18 -0800 (PST)
Message-ID: <c19cc76a-96f9-4ffd-8208-0513f000d331@redhat.com>
Date: Mon, 4 Mar 2024 11:49:18 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/7] 10-dm-rules: don't restore
 DM_UDEV_DISABLE_OTHER_RULES_FLAG from db
To: Martin Wilck <martin.wilck@suse.com>, Zdenek Kabelac
 <zkabelac@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>,
 David Teigland <teigland@redhat.com>
Cc: linux-lvm@lists.linux.dev, dm-devel@lists.linux.dev,
 Martin Wilck <mwilck@suse.com>, Hannes Reinecke <hare@suse.de>
References: <20240301224011.11117-1-mwilck@suse.com>
 <20240301224011.11117-4-mwilck@suse.com>
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
In-Reply-To: <20240301224011.11117-4-mwilck@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/1/24 23:40, Martin Wilck wrote:
> We use DM_UDEV_DISABLE_OTHER_RULES_FLAG to tell upper non-DM layers
> to keep their hands off the device in question, for any reason.
> One possible reason is that the device is supended; another is that
> the cookie carries the flag of the same name.
> 
> DM_SUSPENDED is not restored from the db, but evaluated anew for every
> uevent. Therefore DM_UDEV_DISABLE_OTHER_RULES_FLAG shouldn't be
> restored, either. Use a new variable DM_COOKIE_DISABLE_OTHER_RULES_FLAG
> to save and restore the original value from the cookie.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  udev/10-dm.rules.in | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/udev/10-dm.rules.in b/udev/10-dm.rules.in
> index c08d829..ef36209 100644
> --- a/udev/10-dm.rules.in
> +++ b/udev/10-dm.rules.in
> @@ -48,7 +48,14 @@ ACTION!="add|change", GOTO="dm_end"
>  # These flags are encoded in DM_COOKIE variable that was introduced in
>  # kernel version 2.6.31. Therefore, we can use this feature with
>  # kernels >= 2.6.31 only. Cookie is not decoded for remove event.
> -ENV{DM_COOKIE}=="?*", IMPORT{program}="(DM_EXEC)/dmsetup udevflags $env{DM_COOKIE}"
> +ENV{DM_COOKIE}!="?*", GOTO="dm_no_cookie"
> +IMPORT{program}="(DM_EXEC)/dmsetup udevflags $env{DM_COOKIE}"
> +
> +# Store the original flag from the cookie as DM_COOKIE_DISABLE_OTHER_RULES_FLAG
> +# in the udev db. DM_UDEV_DISABLE_OTHER_RULES_FLAG will be or'd with other
> +# conditions for use by upper, non-dm layers.
> +ENV{DM_COOKIE_DISABLE_OTHER_RULES_FLAG}="%E{DM_UDEV_DISABLE_OTHER_RULES_FLAG}"
> +LABEL="dm_no_cookie"
>  
>  # There is no cookie set nor any flags encoded in events not originating
>  # in libdevmapper so we need to detect this and try to behave correctly.
> @@ -58,12 +65,13 @@ ENV{DM_UDEV_PRIMARY_SOURCE_FLAG}=="1", ENV{DM_ACTIVATION}="1", GOTO="dm_flags_do
>  IMPORT{db}="DM_UDEV_DISABLE_DM_RULES_FLAG"
>  IMPORT{db}="DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG"
>  IMPORT{db}="DM_UDEV_DISABLE_DISK_RULES_FLAG"
> -IMPORT{db}="DM_UDEV_DISABLE_OTHER_RULES_FLAG"
> +IMPORT{db}="DM_COOKIE_DISABLE_OTHER_RULES_FLAG"
>  IMPORT{db}="DM_UDEV_LOW_PRIORITY_FLAG"
>  IMPORT{db}="DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG"
>  IMPORT{db}="DM_UDEV_PRIMARY_SOURCE_FLAG"
>  IMPORT{db}="DM_UDEV_FLAG7"
>  IMPORT{db}="DM_UDEV_RULES_VSN"
> +ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}="%E{DM_COOKIE_DISABLE_OTHER_RULES_FLAG}"
>  LABEL="dm_flags_done"
>  
>  # Normally, we operate on "change" events. But when coldplugging, there's an

Looks good...

-- 
Peter

