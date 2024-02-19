Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6CB219FC
	for <linux-lvm@lists.linux.dev>; Mon, 19 Feb 2024 08:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708331814; cv=none; b=a0G9AX40swAX8zZpZA51PzpB/t5Nmokvz1jhositIVjNkEw3ETV5Q9zfDZkfii7spt4kAj3fTtRb0CK0mn02XSRD7rex5r+mVG1s3Na9TiDgd01nZFwocsY9JCSLErxraHGP/VERA4Vv1+QGf7fkG01T+bbE7kYJq1BvklH1fJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708331814; c=relaxed/simple;
	bh=BrpXzltbjGA+nbeqv1oqWoboeZ60CpfhH6jPRTng6dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gsQbgiiliMorXjVPpnLqkcAKC5t3i853w75W19PHu678ZTwaIHV02epSotlKMS8Xqr3sbnEKJBGcm7rjJUi/b04BAlIknqSaHVRnnnjBBuxy0GFp/4LxitSoAFHFzjRimvBUvxnA7ldUACj9zoFl+fQpIatMW7U9aAzBuNresp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FM49oTZa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FM49oTZa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708331811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fv6aRDO6Js09h9BTDicI9/jIrJAhCI1gKmwSr35xlX8=;
	b=FM49oTZaXyhTawwjFXuUVhTQt5Vnn1uudkfSoib1RFHaBw9EvEqlXNuqaHAwIx93jVjUYy
	mwUqRZ2W4KEKeyz7plqipewC7YZGgcazLbEJdl6ew3Xz1ZoxCiJ2+1nmkM3ldSpSJIZxH9
	5uUQjVGR9X30HuUTvGLO1F5wsmpr1gM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-MlX65qLqPVmG7klxSuF0XA-1; Mon, 19 Feb 2024 03:36:48 -0500
X-MC-Unique: MlX65qLqPVmG7klxSuF0XA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-33d5e518991so76949f8f.1
        for <linux-lvm@lists.linux.dev>; Mon, 19 Feb 2024 00:36:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708331807; x=1708936607;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fv6aRDO6Js09h9BTDicI9/jIrJAhCI1gKmwSr35xlX8=;
        b=H9EOtAADJOHLp3Um/DSrAgGK6117lRDgsMGv9Rbjb9LodAi7ofCTAV0+nZ8dqO62WE
         Z+20D1iYDymU3GYCGED0rX7HgkU5Mm5gluLVG0Fk7SHPRRdKz7XpFTlOFd2HRD75GFqn
         EKD1AvH3vTVJJkUpvNceXhpPtPEyBrK2Nh3JHzb24LwCDN8/8kkryQWivy9o/izJ/hoH
         FzLxag8i+WK01Pq2HLF1mp8S8oePrmVq5NTS2dMo1UqbSiQw3cPTnGnSXua5n35cCQE5
         iQoiky4WE+FSuzMtu8q50PhCc4F0YVVio52eLu7IjJ9V3mzPDvLe0+Wm7x1CODQ05O5t
         v9Iw==
X-Forwarded-Encrypted: i=1; AJvYcCU4DIPZW3pojcWvL+5PDmGQgk9bcFn+XfMe3yZ5lRPXfq63Lybd6gYY4OeT5zpidpAhRkfTNgn0Qja8tQPdmUXPZ+3PNJumWIiS
X-Gm-Message-State: AOJu0YxP1dVAGpwkVrxJuhOXiq0YrxEBDssPCCHVgXaoAv05WWqvhydi
	HgT42HkTEBqS2OGkDnOWYKX7/2GaXSR3pYeTyEClj4wZWLyqElp4L6EXqwzgazBX6Xtq+/AI13H
	Cs4SmL9d1d9Oh1hr9zeyicPLu4YxX+XQ4NvJlujpEeeIBErSUannrUa0HRw==
X-Received: by 2002:a5d:4ecb:0:b0:33d:277b:1ef1 with SMTP id s11-20020a5d4ecb000000b0033d277b1ef1mr4028588wrv.31.1708331807069;
        Mon, 19 Feb 2024 00:36:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjDG5yZB2iB5Rfe3IPkRx/ksv19bItcOgGW0WXvNG5HCP6RZfTIPjws3Qs0U6lAfEX7JWv2A==
X-Received: by 2002:a5d:4ecb:0:b0:33d:277b:1ef1 with SMTP id s11-20020a5d4ecb000000b0033d277b1ef1mr4028574wrv.31.1708331806732;
        Mon, 19 Feb 2024 00:36:46 -0800 (PST)
Received: from [10.43.17.17] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id d2-20020adfef82000000b0033b75b39aebsm9674031wro.11.2024.02.19.00.36.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 00:36:46 -0800 (PST)
Message-ID: <9d50edb0-baa4-4a01-a2f0-136dfdb79937@redhat.com>
Date: Mon, 19 Feb 2024 09:36:45 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: About DM_UDEV_DISABLE_OTHER_RULES_FLAG and DM_NOSCAN
To: Martin Wilck <martin.wilck@suse.com>,
 Benjamin Marzinski <bmarzins@redhat.com>
Cc: Zdenek Kabelac <zkabelac@redhat.com>, David Teigland
 <teigland@redhat.com>, linux-lvm@lists.linux.dev, dm-devel@lists.linux.dev,
 Heming Zhao <heming.zhao@suse.com>
References: <61638dc821c08cd97f6ac53150c5b0120f732deb.camel@suse.com>
 <4a9e62ec-f93a-4739-a406-2c6d2138258a@redhat.com>
 <9b1475e2fa5982dd508d58975b8e6eb58cad95e2.camel@suse.com>
 <f3e3db2b-8077-48b6-b507-4a9c4793affb@redhat.com>
 <8e7a574fffaded39825a01bf33482cea94507289.camel@suse.com>
 <Zc6UEKsce2ppaP62@bmarzins-01.fast.eng.rdu2.dc.redhat.com>
 <b38d9ae7b49ec1569b25c5f5a55afbc47df4b09d.camel@suse.com>
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
In-Reply-To: <b38d9ae7b49ec1569b25c5f5a55afbc47df4b09d.camel@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/16/24 15:29, Martin Wilck wrote:
> On Thu, 2024-02-15 at 17:45 -0500, Benjamin Marzinski wrote:
>> On Mon, Feb 12, 2024 at 03:16:27PM +0100, Martin Wilck wrote:
>>> On Mon, 2024-02-12 at 13:32 +0100, Peter Rajnoha wrote:
>>>
>>>>
>>>> What do you think about keeping a single
>>>> DM_UDEV_DISABLE_OTHER_RULES_FLAG for this, just having a
>>>> different
>>>> value, say "2" to denote the B case? Otherwise, we need 2
>>>> distinct
>>>> variables (which is harder for others to accept I bet).
>>>
>>> Yes, that could work, if the save / restore is implemented cleanly.
>>
>> What if we never read DM_UDEV_DISABLE_OTHER_RULES_FLAG from the
>> database. Instead how about, if DM_UDEV_DISABLE_OTHER_RULES_FLAG is
>> set
>> by "dmsetup udevflags", we save it as something like
>> DM_IGNORE_DEVICE.
>> Otherwise, if it's a spurious event, we read DM_IGNORE_DEVICE from
>> the
>> database. After "dm_flags_done", if DM_IGNORE_DEVICE is set, we set
>> DM_UDEV_DISABLE_OTHER_RULES_FLAG. This leaves the other rules free to
>> mess with DM_UDEV_DISABLE_OTHER_RULES_FLAG all they want.
> 
> That sounds good and aligns with what I'd thought by myself. But we
> should use a less suggestive name. DM_IGNORE_DEVICE would again make
> users think that they should consume this variable, like DM_NOSCAN.
> 

Yup, that looks reasonable and clean.

Though, the DM_UDEV_DISABLE_OTHER_RULES_FLAG is only one flag from the
whole set. To avoid handling only a single selected flag in a special
way and to avoid issues raising from that, we might as well apply that
logic to all the other flags decoded by `dmsetup udevflags`.

-- 
Peter

