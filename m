Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A641C6B4
	for <linux-lvm@lists.linux.dev>; Wed, 17 Jan 2024 11:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705489700; cv=none; b=XwxpzCVH8gMjtMd08T2X3RbwdmdDyIwd4iTwjrCy6Y9suIbSePdWy9fYBRp47LJRHlkkznsYewAU0ty7uWPOHaQlxwAiqfRsmLtItDadPhLUnRiykfTk/Yl6u6+cS5oTeeLL/Q5DMnnTtOj41kBBkhLhEt6bg2+zQb+7REgXuYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705489700; c=relaxed/simple;
	bh=4uuwMEBKH/VgS9q96uX3KLMFWJBNIyZJhaf3tAqg0uw=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=J+AA7yrIwzpPNR5lE9NORDmsCx7RoSOVsu1kOyO4DRAPLoSKP4YP3GJo2c5zAlzhqxfJCu0qW0nIJDqQecicGRZeS2Xji4iOhI/AFaBUYZWlTBwnVvsibf2lXs9MHFPkD8q6SXuM8bQBuCsnPNTKHWG5dRBV0KbvoDmZQnNrC64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFFY7KAp; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFFY7KAp"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e76109cdeso32595685e9.0
        for <linux-lvm@lists.linux.dev>; Wed, 17 Jan 2024 03:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705489696; x=1706094496; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jZa9VmuCud4GL0lF2UM61MkoxyHqtRoDOuJUhjqpMJE=;
        b=UFFY7KApvJ2MHrRHBv+ye44+SvEWgxEN1zhfkjwtqpU6dpVSnpQuuvK8BbDrhNmryR
         dCC2MYFhQaTcDTvhLy2pgk5rHOJQL2DG7Ot4nZbsjfXJNBwMIm/BzpypIO8RM8s2yGZc
         kTke/2zAeyVjRaqwRsCcEcCVIvhfTBpyAQaCqbxWSdciNclVBUoZONYAfKV8HETFnAhj
         74FGKIsGkPTEZ9PE3qgQhrq5AetmO/6E1W+ue3OMg9sVjqZXuY8nvOuCMmgNd1+OupiT
         HZt57N3LH3KmYbdb2S8ZfQyEAYmtZZYoKleU3vjOsdLM9WQoCGNE/7GFntNlD5dnN4JA
         Cf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705489696; x=1706094496;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jZa9VmuCud4GL0lF2UM61MkoxyHqtRoDOuJUhjqpMJE=;
        b=TJalUTQRT8rvzFUhFnE1isGBgwr8154mUxXXLM8BI8bsRqnnM/TWMo79skPQzyo53D
         eaUqF4d8qjd14uGPB15vE50i61AfXu3oQ5seHCjMdQy1rObWTSMyWxily+E2F2sB0bVE
         4mxtXf73kvxW9SWSFSW5bLAfLGc1AI7zKqXU7oBImkP67TXZvXva9HbSiD7S8qyPmOpu
         oHjiCbSfVzN4uKpLhqFapK0JgCltUPHoUmeMstna5qDSC7uvWDtmWQDasliec0gbfSxU
         Rr+z//n6wZu1sTzcGXg7T2df5WLp+3QrSBzTRLmYDsv5ttQS6dDaVyC6JTHTj1Vo+J21
         rn9g==
X-Gm-Message-State: AOJu0Yx6e/PjcoVjY1TvFRMyWKtzCIqrxuQLRxrtzr2cEVrFJZv7X+db
	cmRaf2n8uVZz0uHXXzI4sgJtZuoEFPBY9Q==
X-Google-Smtp-Source: AGHT+IE9c98t8G6TdmWbG8PT1EoAr+b0KthwqZWNjaG6hqGdesMpIHKfpN5EVGj89wBnQXHhBYt6eA==
X-Received: by 2002:a05:600c:5398:b0:40e:4a79:865e with SMTP id hg24-20020a05600c539800b0040e4a79865emr4272289wmb.9.1705489696329;
        Wed, 17 Jan 2024 03:08:16 -0800 (PST)
Received: from [10.43.17.38] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c0a0a00b0040e486bc0dfsm26346939wmp.27.2024.01.17.03.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 03:08:15 -0800 (PST)
Message-ID: <5848cefc-bc5e-4f23-8278-d1654607398f@gmail.com>
Date: Wed, 17 Jan 2024 12:08:14 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: add volatile flag to PV/LVs (for cache) to avoid degraded state
 on reboot
Content-Language: en-US, cs
To: lists.linux.dev@frank.fyi, linux-lvm@lists.linux.dev
References: <pyftyueewc6bobclhkb2eqnbjnhsem3fk3euhjmqrxz5d7eevn@ejymv4rlmb5m>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <pyftyueewc6bobclhkb2eqnbjnhsem3fk3euhjmqrxz5d7eevn@ejymv4rlmb5m>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 12. 01. 24 v 19:19 lists.linux.dev@frank.fyi napsal(a):
> Hi,
> 
> at first, a happy new year to everyone.
> 
> I'm currently considering to use dm-cache with a ramdisk/volatile PV for a small project and noticed some usability issues that make using it less appealing.
> 
> 
> Currently this means:
> 1. Adding a cache to a VG will cause the entire VG to depend on the cache. If one of the cache drives fails or is missing it cannot be accessed and even worse if this was the VG containing the root filesystem it also causes the entire system to fail to boot. Even though we may already know that we don't have any dataloss but just degraded access times.
> 2. Requires manual scripting to activate the VG and handle potentially missing/failing cache PVs
> 3. LVM doesn't have a way to clearly indicate that the physical volume is volatile and that dataloss on it is expected. Maybe even including the PV header itself. Or alternatively a way to indicate "if something is wrong with the cache, just forget about it (if possible)".
> 4. Just recreating the 'pvcreate --zero --pvmetadatacopies 0 --norestorefile --uuid' appears to be enough to get a write-through cache and thereby also the associated volume working again. Therefore it doesn't look like LVM cares about the cache data being lost, but only about the PV itself. Therefore failing to activate the VG appears to be a bit too convservative and probably the error handling here could be improved (see above).
> 6. Also as there is currently no place within the LVM metadata to label a PV/VG/LV as "volatile" it is also not clear both to LVM as well as admins looking at output of tools like lvdisplay that a specific LV is volatile. Therefore there will also be no safeguards and warnings against actions that would cause dataloss (like adding a ramdisk to a raid0, or even just adding a write-back instead of a write-through cache).
> 
> 
> Therefore I'd like to ask if it would be possible to make two small improvements:
> 1. Add a "volatile" flag to PVs, LVs, and VGs to allow to clearly indicate that they are non-persistent and that dataloss is expected.
> 2. And one of:
>   a. Change error handling and automatic recovery from missing PVs if the LV or VG has the volatile flag. Like e.g. automatically `--uncache`-ing the volume and mount it without the cache that is missing its PV. This is even more important for boot volumes, where such a configuration would prevent the system from booting at all.
>   b. Alternatively, add native support for ramdisks. This mainly would require extending the VG metadata with an 'is-RAMdisk' flag that causes the lookup for the PV to be skipped and instead a new ramdisk being allocated while the VG is being activated (we know its size from the VG metadata, as we know how much we allocate/use). This could also help with unit tests and CI/CD usages (where currently the PV is manually created with brd before activating/creating the VG). Including our own test/lib/aux.sh, test/shell/devicesfile-misc.sh, test/shell/devicesfile-refresh.sh, test/shell/devicesfile-serial.sh.
>   c. Same as 2a, but instead of automatically uncaching the volume, add a flag to the VG metadata that allows LVM to use the hints file to find the PV and automatically re-initialize it regardless of its header. Maybe together with an additional configuration option to demand the block device being zeroed (I.E. to avoid reading the entire block device, the first 4 sectors) to safeguard against accidental data-loss that we normally get by looking for the correct PV header.
>   d. Same as 2b, but limited to caches only. Considering how caching is currently implemented adding ramdisks with an limitation to caches may cause unecessary additional work and be less useful compared to adding them as a new additional kind of PV. Also it wouldn't help the additional usecase with unit tests and CI/CD pipelines. Additionally it would also simplify "playing with" and learning about LVM.
>   e. Add an option to have lvconvert enable caching but WITHOUT saving it within the VGs metadata. Causing LVM to forget about the case. I.E. next time the system boots LVM would mount the VG normally without the cache. For write-through caches this should always be safe and for write-back it only causes dataloss when the system crashes without flushing it.
> 
> My personal favourite is 2b, followed by 2e.
> 2b basically realizes my entire usecase within LVM natively and 2e at least avoids the need to automating the LVM recovery just to be able to reboot the system and allow me to write a systemd service to add the cache at runtime.



Hi

We do have several such things in our TODO plans - but it's actually way more 
complicated then you might think.  It's also not completely true that even 
'writethrough' cache cannot have dirty-blocks (aka - only present in cache and 
origin had failed writes).

Another important note here is -  the dm-cache target is not intended to be a 
'bigger page-cache' - it has different purpose and different usage.

So using 'ramdisk' for dm-cache is kind of pointless when the same RAM can be 
likely more effectively used by system's page cache logic.

To extend the dirty cached pages - there is  'dm-writecache' target to be used 
that in some way extents amount page cache with the size of your fast NVMe/SSD 
device -  but it's not accelerating 'reads' from hotspots.

Lvm should cope (eventually with --force option) with removal of missing 
devices holding cached blocks - however there can be still some dead spots.
But ATM we are not seeing it as some major trouble.  Hotspot cache is simply 
not supposed to be randomly removed from your systems - as it it's not easy to 
rebuild.

But it might be possible to more easily automate bootup process in case a PV 
with cache is missing (something like for  'raidLVs' with missing legs).

Regards

Zdenek
