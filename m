Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8ED374F8
	for <linux-lvm@lists.linux.dev>; Mon,  4 Mar 2024 10:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709549477; cv=none; b=XQDzZLpHsDlgL68afwaiEocnOuZ/C48BFm+s8z8nUUFSqzmt1bWgWP0O4oJgGAJ/PnOOIbawswP6ie8C1u9UGZ3VANETJcd3R0L1z3yTMgWBItY9NFYBxApX072XgOrRNtldDhgS7oQRLscWdhgZ5JQpwVEc0/M1F+69qfDWVXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709549477; c=relaxed/simple;
	bh=G5qdXNWJfm76Kuer0eXMvAOiFncjdKz/Sanj8UxgAFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yn/M0AgHARc2eOpLzUGHU5sLYyjrAAiowF1zKZeicASPJ6j6mmFjJNvrf4lL6rJvwu1ZnFfmsx/IFJCbE9lhiYV4LR6XDDLLZGyAiTdYXdcN0vA2Ee0340C8l1yrtVsDpeveKQjLSO5b5QFXYXzZna74JfYqrsOJZebqmOtmQCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=POFPs0t5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="POFPs0t5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709549475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=toAyuXu2S6CgVoq3Un4sPVqZGdfvRFwnzITpd/M0Y1g=;
	b=POFPs0t5L8va19pCvVVmIE3A1xhLyMB1//COlLvhenpNvqjoLcFENSH1n5TWfqZPWXfzL1
	0qnweEvYd/4X5q8q7ysKhx7BwOcdG7YOGOLALd7LNrpuzEgbvo/HeM3ZVdwM8teOagwEme
	LFpEFcBPN8k6HCXxcvyrJEU7wub+oJY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-TuNnTuM6PmOQe0pnTAiBHg-1; Mon, 04 Mar 2024 05:51:11 -0500
X-MC-Unique: TuNnTuM6PmOQe0pnTAiBHg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-412de139895so4804665e9.0
        for <linux-lvm@lists.linux.dev>; Mon, 04 Mar 2024 02:51:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709549470; x=1710154270;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=toAyuXu2S6CgVoq3Un4sPVqZGdfvRFwnzITpd/M0Y1g=;
        b=KeGpt8eC/mP3p2gPxDtUDzlxAbgAcQQymwrm4n9gxlmwx7u2VkeVDUfSkwGFeq1Inh
         QxD2lachAmj9lLoVelMPHHFjjYwTzGog1KJ887ePab79n9sj27k02DWsx7FlqxS7vNss
         cl/j+tx7SAzCeQGUGlrL+7zmxEcGrMVHjGZPVs8rqGIGrSfSdUaChf8vj5Kt7Bk8p+Y3
         viT0euAs+l0Qe+mwXrWB0pkZCrf6pLaKfZ2jC1FMmLEaRa5SDjaIjEU0hgww++rw91vH
         t7EpNmEON+QUJ1VwR+X2DjkHmNhQGT15RN+6sqrb9RqLdj/nGUl8gMRkfp2OVatC+8aO
         LT1g==
X-Gm-Message-State: AOJu0YwfLcGCrUKl09d7yXdC+OxhX8Oqngp6EaoJlW2o//5PetRNWPZA
	8zCDPTuJU3oLOejk0bTp23f5tAkzE6BDTGXZk9A4huQqjBKbvFvK2HlGe8rDESHGDBXhc0F08lC
	s0AN1lpSPG22Ycz/NClFocKi5HTpFWeTNeQQ9mgB6V6NW+IUagQmrZ8K9BA==
X-Received: by 2002:a05:600c:1d21:b0:412:bcca:751d with SMTP id l33-20020a05600c1d2100b00412bcca751dmr8958820wms.11.1709549470135;
        Mon, 04 Mar 2024 02:51:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOHQjTOBiSqRW7b2TNI23Ou60XT7MZHAdqcoyrcPqsr/bLkDeGgrDyD9yk4ezddu7P+UrSJA==
X-Received: by 2002:a05:600c:1d21:b0:412:bcca:751d with SMTP id l33-20020a05600c1d2100b00412bcca751dmr8958799wms.11.1709549469806;
        Mon, 04 Mar 2024 02:51:09 -0800 (PST)
Received: from [10.43.17.192] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c4ec900b00412e0e899a7sm3925816wmq.27.2024.03.04.02.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 02:51:09 -0800 (PST)
Message-ID: <e767b926-133f-4591-9f41-f586799d721b@redhat.com>
Date: Mon, 4 Mar 2024 11:51:08 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/7] 11-dm-lvm.rules: don't restore
 DM_UDEV_DISABLE_OTHER_RULES_FLAG from db
To: Martin Wilck <martin.wilck@suse.com>, Zdenek Kabelac
 <zkabelac@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>,
 David Teigland <teigland@redhat.com>
Cc: linux-lvm@lists.linux.dev, dm-devel@lists.linux.dev,
 Martin Wilck <mwilck@suse.com>, Hannes Reinecke <hare@suse.de>
References: <20240301224011.11117-1-mwilck@suse.com>
 <20240301224011.11117-5-mwilck@suse.com>
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
In-Reply-To: <20240301224011.11117-5-mwilck@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/1/24 23:40, Martin Wilck wrote:
> DM_UDEV_DISABLE_OTHER_RULES_FLAG is used as the "output" flag of the
> device-mapper rules, to be consumed by non-dm rules. It is a logical OR of
> several conditions that might make dm devices inaccessible. 10-dm.rules
> calculates it for every uevent, whether it's genuine or spurious.
> 
> DM_SUBSYSTEM_UDEV_FLAG0 is just another flag that needs to be or'd in. We
> don't need to restore the previous state of DM_UDEV_DISABLE_OTHER_RULES_FLAG.
> Actually, doing so is wrong if the flag has previously been set because the
> device was suspended, and the device isn't suspended anymore.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  udev/11-dm-lvm.rules.in | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/udev/11-dm-lvm.rules.in b/udev/11-dm-lvm.rules.in
> index 7c58994..0b77fe2 100644
> --- a/udev/11-dm-lvm.rules.in
> +++ b/udev/11-dm-lvm.rules.in
> @@ -26,14 +26,11 @@ IMPORT{program}="(DM_EXEC)/dmsetup splitname --nameprefixes --noheadings --rows
>  # to zero any stale metadata found within the LV data area. Such stale
>  # metadata could cause false claim of the LV device, keeping it open etc.
>  #
> -# If the NOSCAN flag is present, backup selected existing flags used to
> -# disable rules, then set them firmly so those selected rules are surely skipped.
> -# Restore these flags once the NOSCAN flag is dropped (which is normally any
> -# uevent that follows for this LV, even an artificially generated one).
> -ENV{DM_SUBSYSTEM_UDEV_FLAG0}=="1", ENV{DM_NOSCAN}="1", ENV{DM_DISABLE_OTHER_RULES_FLAG_OLD}="$env{DM_UDEV_DISABLE_OTHER_RULES_FLAG}", ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}="1"
> -ENV{DM_SUBSYSTEM_UDEV_FLAG0}!="1", IMPORT{db}="DM_NOSCAN", IMPORT{db}="DM_DISABLE_OTHER_RULES_FLAG_OLD"
> -ENV{DM_SUBSYSTEM_UDEV_FLAG0}!="1", ENV{DM_NOSCAN}=="1", ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}="$env{DM_DISABLE_OTHER_RULES_FLAG_OLD}", \
> -				   ENV{DM_DISABLE_OTHER_RULES_FLAG_OLD}="", ENV{DM_NOSCAN}=""
> +# If the NOSCAN flag is present, set DM_UDEV_DISABLE_OTHER_RULES_FLAG
> +# so those selected rules are surely skipped.
> +# We don't need to save and restore the previous of DM_UDEV_DISABLE_OTHER_RULES_FLAG,
> +# that's taken care of in 10-dm.rules.
> +ENV{DM_SUBSYSTEM_UDEV_FLAG0}=="1", ENV{DM_NOSCAN}="1", ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}="1"
>  
>  ENV{DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG}=="1", GOTO="lvm_end"
>  

Looks good too, I gave it a quick test run and haven't noticed an issue
so far. Nice cleanup!

-- 
Peter

