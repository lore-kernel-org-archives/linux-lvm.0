Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD95338DDD
	for <linux-lvm@lists.linux.dev>; Mon,  4 Mar 2024 11:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709550032; cv=none; b=C0Y3rWD/HgjV5G5M24QxT2rQ0iOUTawq5G8i1oQejrWwtawZn5dmNNhT0kJXC8vSNC0X+SaGJksfIXUJxsI+JhegwjuEfR0TRr5O9nqc6xyu6tB9LUIEyWC0iPPFsUdcqmgNXioqqjMOcB1VFIBo7GNSv/UokHBmC8JXF4Q+m+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709550032; c=relaxed/simple;
	bh=RtjJ8Nu7nutEphvr6j4jJpWQHz1wofhGTzXUGwile8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kzEoGdNMHOm19dH0/BmoM2hBT59LWP6M4uDJmAE4dl94/8eN0E4fFysaqGAN037/IEvqAricUSEvQrZ8Nf1Wey30dqFVB8TTOhoO50hjKCixxQ+zYlSZcYXpDDhffI0Fz3CckcVyzSu2rGsifeZftqUM9Oq9kHjL42dfDV0TZJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fyF88FIL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fyF88FIL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709550029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=m6rHXejQytid7/DpUvKPcTAyxbtdi/p0U6lUfb2OZTM=;
	b=fyF88FILgozZv+fUlfDIcTqt8RjEugwB4eQLhAjPmkBYSXrWt2Dl62He+RqugzqaYnusGW
	UkglrQjZuU3grzlKe//8KyQbrj2AFO/U5i/Mk+CVWikzr+KqpMDbDETnLq+cqbI3F0GzOu
	jC/bo8kJvKCZRzq3drQTWuTNJxgIftY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-3OdPBFJ1Ndyc7ABqJyp_jQ-1; Mon, 04 Mar 2024 06:00:28 -0500
X-MC-Unique: 3OdPBFJ1Ndyc7ABqJyp_jQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-412c9e3c9b9so13268445e9.0
        for <linux-lvm@lists.linux.dev>; Mon, 04 Mar 2024 03:00:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709550027; x=1710154827;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m6rHXejQytid7/DpUvKPcTAyxbtdi/p0U6lUfb2OZTM=;
        b=o83jaJ25rY3alqIO6FPdsSuqmGsOGEHlMuyHO9sn6AqcOTliYvM/HJZ3ALbkfm/2ZU
         t9QdgWBW9TEUGM8AK5rktqWcf+bPyE8vDk45nfqW0TS9vLiJsh/DHajNXEHBDWdiwScu
         kxQ9Kuu7Hu1vg9EMLeU79+JAVDWrV9KhaynSSOCkzZ7ruDoM2fJBMSZLiDmcE7MzDOxR
         rVv9guyekHAq+YPeR38VyyiqOcPoSnp6m34b2+JUArXTnikuHkiIOuC9INEZ4ZAiUT/B
         6Ibh3wUYg0SVxi1Cmp/8WCMughyDS8MO0C3B0PqQFshmxAc/OXgljLsrfBbf7OjfrIJf
         EmRQ==
X-Gm-Message-State: AOJu0YxlKau8cxmfCH0ZQYYh2hISb02UNACoJk5YHsitnB7ajY/oxI/s
	sri+hgvCAFrvFL8sJc8EuwZOTmHvGULMUIC+coTkYcwE8PCXGi1ChIPTm4bov+8/eHd52u66/DW
	ZKn4cgm7soeaNqH8ZtqP7xxREUsYbxjhrtqCaqEwSNX10LFyB0cyL1rR/5g==
X-Received: by 2002:a05:600c:3b96:b0:412:e555:ff1e with SMTP id n22-20020a05600c3b9600b00412e555ff1emr1304681wms.0.1709550027211;
        Mon, 04 Mar 2024 03:00:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETnEjEQtS83EgiUITr3HQ3qUE8jKpwRKG/0JkU+cK1SYnsTf68g7JoJvpwP6YdS6vO0HYrAA==
X-Received: by 2002:a05:600c:3b96:b0:412:e555:ff1e with SMTP id n22-20020a05600c3b9600b00412e555ff1emr1304650wms.0.1709550026860;
        Mon, 04 Mar 2024 03:00:26 -0800 (PST)
Received: from [10.43.17.192] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id v14-20020a05600c470e00b004129ed6f9cbsm14381680wmo.4.2024.03.04.03.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 03:00:26 -0800 (PST)
Message-ID: <2b6bfa53-dfcb-4fe8-859c-8d99a5eadcbf@redhat.com>
Date: Mon, 4 Mar 2024 12:00:25 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/7] dm udev rules: don't export and save DM_SUSPENDED
To: Martin Wilck <martin.wilck@suse.com>, Zdenek Kabelac
 <zkabelac@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>,
 David Teigland <teigland@redhat.com>
Cc: linux-lvm@lists.linux.dev, dm-devel@lists.linux.dev,
 Martin Wilck <mwilck@suse.com>, Hannes Reinecke <hare@suse.de>
References: <20240301224011.11117-1-mwilck@suse.com>
 <20240301224011.11117-6-mwilck@suse.com>
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
In-Reply-To: <20240301224011.11117-6-mwilck@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/1/24 23:40, Martin Wilck wrote:
> DM_SUSPENDED is a device-mapper internal flag, which is not intended to be
> used by other rules, and which is determined by 10-dm.rules from sysfs for
> every uevent. Rename it to ".DM_SUSPENDED", so that it won't be saved in the
> udev database.
> 
> Known consumers of DM_SUSPENDED are 66-kpartx.rules (from multipath-tools) and
> 99-systemd.rules (from systemd). These will have to be adapted.
> 11-dm-mpath.rules will be changed to use .DM_SUSPENDED.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  udev/10-dm.rules.in          | 15 +++++++++------
>  udev/12-dm-permissions.rules |  2 +-
>  udev/13-dm-disk.rules.in     |  4 ++--
>  3 files changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/udev/10-dm.rules.in b/udev/10-dm.rules.in
> index ef36209..d30f663 100644
> --- a/udev/10-dm.rules.in
> +++ b/udev/10-dm.rules.in
> @@ -11,7 +11,7 @@
>  # for use in later rules:
>  #   DM_NAME - actual DM device's name
>  #   DM_UUID - UUID set for DM device (blank if not specified)
> -#   DM_SUSPENDED - suspended state of DM device (0 or 1)
> +#   .DM_SUSPENDED - suspended state of DM device (0 or 1)
>  #   DM_UDEV_RULES_VSN - DM udev rules version
>  #
>  # These rules cover only basic device-mapper functionality in udev.
> @@ -114,15 +114,18 @@ LABEL="dm_no_coldplug"
>  # The "suspended" item was added even later (kernels >= 2.6.31),
>  # so we also have to call dmsetup if the kernel version used
>  # is in between these releases.
> -TEST=="dm", ENV{DM_NAME}="$attr{dm/name}", ENV{DM_UUID}="$attr{dm/uuid}", ENV{DM_SUSPENDED}="$attr{dm/suspended}"
> +TEST=="dm", ENV{DM_NAME}="$attr{dm/name}", ENV{DM_UUID}="$attr{dm/uuid}", ENV{.DM_SUSPENDED}="$attr{dm/suspended}"
>  TEST!="dm", IMPORT{program}="(DM_EXEC)/dmsetup info -j %M -m %m -c --nameprefixes --noheadings --rows -o name,uuid,suspended"
> -ENV{DM_SUSPENDED}!="?*", IMPORT{program}="(DM_EXEC)/dmsetup info -j %M -m %m -c --nameprefixes --noheadings --rows -o suspended"
>  
> +ENV{.DM_SUSPENDED}=="?*", GOTO="dm_suspended_set"
> +TEST=="dm", IMPORT{program}="(DM_EXEC)/dmsetup info -j %M -m %m -c --nameprefixes --noheadings --rows -o suspended"
>  # dmsetup tool provides suspended state information in textual
>  # form with values "Suspended"/"Active". We translate it to
>  # 0/1 respectively to be consistent with sysfs values.
> -ENV{DM_SUSPENDED}=="Active", ENV{DM_SUSPENDED}="0"
> -ENV{DM_SUSPENDED}=="Suspended", ENV{DM_SUSPENDED}="1"
> +ENV{DM_SUSPENDED}=="Active", ENV{.DM_SUSPENDED}="0"
> +ENV{DM_SUSPENDED}=="Suspended", ENV{.DM_SUSPENDED}="1"
> +ENV{DM_SUSPENDED}=""
> +LABEL="dm_suspended_set"
>  
>  # This variable provides a reliable way to check that device-mapper
>  # rules were installed. It means that all needed variables are set
> @@ -140,7 +143,7 @@ ENV{DM_UDEV_DISABLE_DM_RULES_FLAG}!="1", ENV{DM_NAME}=="?*", SYMLINK+="(DM_DIR)/
>  # Avoid processing and scanning a DM device in the other (foreign)
>  # rules if it is in suspended state. However, we still keep 'disk'
>  # and 'DM subsystem' related rules enabled in this case.
> -ENV{DM_SUSPENDED}=="1", ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}="1"
> +ENV{.DM_SUSPENDED}=="1", ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}="1"
>  
>  GOTO="dm_end"
>  
> diff --git a/udev/12-dm-permissions.rules b/udev/12-dm-permissions.rules
> index a9d4c32..6a69d2f 100644
> --- a/udev/12-dm-permissions.rules
> +++ b/udev/12-dm-permissions.rules
> @@ -14,7 +14,7 @@
>  #   DM_UDEV_RULES_VSN - DM udev rules version
>  #   DM_NAME - actual DM device's name
>  #   DM_UUID - UUID set for DM device (blank if not specified)
> -#   DM_SUSPENDED - suspended state of DM device (0 or 1)
> +#   .DM_SUSPENDED - suspended state of DM device (0 or 1)
>  #   DM_LV_NAME - logical volume name (not set if LVM device not present)
>  #   DM_VG_NAME - volume group name (not set if LVM device not present)
>  #   DM_LV_LAYER - logical volume layer (not set if LVM device not present)
> diff --git a/udev/13-dm-disk.rules.in b/udev/13-dm-disk.rules.in
> index eaad972..cb2ce2d 100644
> --- a/udev/13-dm-disk.rules.in
> +++ b/udev/13-dm-disk.rules.in
> @@ -17,9 +17,9 @@ ENV{DM_UDEV_DISABLE_DISK_RULES_FLAG}=="1", GOTO="dm_end"
>  SYMLINK+="disk/by-id/dm-name-$env{DM_NAME}"
>  ENV{DM_UUID}=="?*", SYMLINK+="disk/by-id/dm-uuid-$env{DM_UUID}"
>  
> -ENV{DM_SUSPENDED}=="1", ENV{DM_UDEV_PRIMARY_SOURCE_FLAG}=="1", GOTO="dm_import"
> +ENV{.DM_SUSPENDED}=="1", ENV{DM_UDEV_PRIMARY_SOURCE_FLAG}=="1", GOTO="dm_import"
>  ENV{DM_NOSCAN}=="1", ENV{DM_UDEV_PRIMARY_SOURCE_FLAG}=="1", GOTO="dm_import"
> -ENV{DM_SUSPENDED}=="1", GOTO="dm_end"
> +ENV{.DM_SUSPENDED}=="1", GOTO="dm_end"
>  ENV{DM_NOSCAN}=="1", GOTO="dm_watch"
>  
>  (BLKID_RULE)

OK, makes sense. But I haven't looked at what implications this might
have for 99-systemd.rules yet, but we surely need to have that covered
somehow.

Maybe, now, I would probably even remove the mention about DM_SUSPENDED
in 12-dm-permissions.rules, it looks superfluous there. We normally set
perms based on names, not on DM_SUSPENDED state. I'm not sure why we
mentioned it there before.

Do mpath rules still need to look at DM_SUSPENDED?

-- 
Peter

