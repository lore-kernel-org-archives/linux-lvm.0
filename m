Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90AF3839F
	for <linux-lvm@lists.linux.dev>; Mon,  4 Mar 2024 11:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709551951; cv=none; b=P477JMk9EHmJjOx/nirQ1GXSpLcfY3RDMQ1FWZZZfnG98Gqe+s+18TsOrBLTbVRdL2YPcg6AxwoeDINIvStBEsYrqCFMUpUFfQIYHNWzRMf+8NUyEfCAj97IpMee0mJKMOevFzq/GZeOFcIeucg+ac1+QvW0xj8Z6U4uYJ4FCPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709551951; c=relaxed/simple;
	bh=NGYyyTSQnjBEMXs2vRYcHkLT9Y5nRoosDCA5vAwPckU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=K0T962Q/KOXBdEwGVuqB0V0VZWIztbmzGesm6nq25NuzlK0H8qQ7dpYHFJEx86KIaTD5An5IVlYWcA9LhJBawPtIsozp+aK6Z+zfZmHTozL0tBG82fNubH3iRarHUT6lOfwumY2gEUTo1orO2Kc1lKr5tiIeYP0TF0rzzJi1U6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fp0STbo+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fp0STbo+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709551948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FBVMATWuYOy7BS4nCbh49sh86+ikOBmanBKXv+e6/Dg=;
	b=fp0STbo+k5yjVVw9UzBQj5pVUtVNkkxUigK0sUuyAK7HYXx7LjKAl1eMUoQpACZ0nPlajJ
	j5R+utz9egV17PKOoX5sAqgq7HXW222Gv/bT0Mq456hAj/Uvb3zac+e1NiOJRtGIQVV3+l
	gOUWhVOj5cEF/Y+rO05wsiDTIdqO3tM=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-r_qVOFgTNNGjBEuY2f2yLw-1; Mon, 04 Mar 2024 06:32:27 -0500
X-MC-Unique: r_qVOFgTNNGjBEuY2f2yLw-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2d33e6f838dso29131391fa.0
        for <linux-lvm@lists.linux.dev>; Mon, 04 Mar 2024 03:32:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709551635; x=1710156435;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FBVMATWuYOy7BS4nCbh49sh86+ikOBmanBKXv+e6/Dg=;
        b=IqFch2KBKRGP6kAx1kFTtwEkiIVUni8nySFRTpkXMg2xw3cpb6dNIL2ZJwEOXpQzZA
         Xlsqo0DBH3jM2I3PBChyQdf0rRuErdFbU908cCpuDflP2Ca3b2hw9Zu6Um10mkkoancF
         qmcvdFGR2SeY/wZ02iLJLpPsNLpAvxov8remNMcxZLAVrRpWNh6pgINqj7hrfGHNvd9C
         vmlcJIDOD759Iclzy/UdZuN8Hdcj61gFKXUo8NQzaxk3ig9sxlq9cDXzyNJHLYQVkEi8
         7hq/rF7dvCi0eETNdvrNFWWY2/oyLNs9Cl/gGye5mWjX4Uwu1sLPZUd8j08DrihEuu+h
         URPg==
X-Gm-Message-State: AOJu0Yxdd1VtxwHWMFHk7OU3pGedpKtuUprmoTP9bcVe1QCZvY8nGHHO
	ftHC4StPFXO0ou5yWWc6pCNm792KKWtuUOR7QLVekcoHG9ePKGsECZij63e5RNXcmuP0lSQu/DB
	PewwJ/63eq9smTF4TVD9tOrxCbmyCueXGLjLFpzT3LL97jTCWZTuRKfjeaw==
X-Received: by 2002:a2e:b179:0:b0:2d2:4160:bb73 with SMTP id a25-20020a2eb179000000b002d24160bb73mr6025032ljm.3.1709551634880;
        Mon, 04 Mar 2024 03:27:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8d2VEQZM5fT5mLQC9gGOpmQKdcm5iS9b1fRhXM5JwNM6koNEwx+a36Qjq3VlIlDnoNMviKA==
X-Received: by 2002:a2e:b179:0:b0:2d2:4160:bb73 with SMTP id a25-20020a2eb179000000b002d24160bb73mr6025022ljm.3.1709551634534;
        Mon, 04 Mar 2024 03:27:14 -0800 (PST)
Received: from [10.43.17.192] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id fa10-20020a05600c518a00b00412e17d5f83sm3797046wmb.14.2024.03.04.03.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 03:27:14 -0800 (PST)
Message-ID: <9c68e2b7-64e6-4e3d-83ea-5229ea7eff60@redhat.com>
Date: Mon, 4 Mar 2024 12:27:13 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/7] 10-dm.rules: don't deactivate devices for
 DISK_RO=1
From: Peter Rajnoha <prajnoha@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>, Zdenek Kabelac
 <zkabelac@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>,
 David Teigland <teigland@redhat.com>
Cc: linux-lvm@lists.linux.dev, dm-devel@lists.linux.dev,
 Martin Wilck <mwilck@suse.com>, Hannes Reinecke <hare@suse.de>
References: <20240301224011.11117-1-mwilck@suse.com>
 <20240301224011.11117-3-mwilck@suse.com>
 <b884374b-2f6f-4c7f-acba-b4c730ae03ff@redhat.com>
 <537880de-21ad-4dcc-92a7-a80092757ba7@redhat.com>
Autocrypt: addr=prajnoha@redhat.com; keydata=
 xjMEY7QY9hYJKwYBBAHaRw8BAQdADIHZn5yeZYFV18ewwf4iudpl1ARfj4rnxX5xiSoJ15vN
 I1BldGVyIFJham5vaGEgPHByYWpub2hhQHJlZGhhdC5jb20+wpYEExYKAD4CGwMFCwkIBwIC
 IgIGFQoJCAsCBBYCAwECHgcCF4AWIQQhe3cZL8e9dSzFIwXndmZANt+EqwUCY7QZ9wIZAQAK
 CRDndmZANt+EqzosAQDXhWudIjLSGoWGPKgluEWw5B5LtAX+kW2OG7loCDzI2AD/fp3Xec8K
 JY7HrSqO98YMPbT98+YRjiopJSk75TcAogzOOARjtBj2EgorBgEEAZdVAQUBAQdALfG8fuls
 uqLPtrJ5tYb36UtqNlu6Bw9ME/Ou+FRGG1cDAQgHwngEGBYKACAWIQQhe3cZL8e9dSzFIwXn
 dmZANt+EqwUCY7QY9gIbDAAKCRDndmZANt+Eq22lAQDXlKMGQxkD0FZes94uihIZlhFwGjrX
 dVfZsxfwEvuJfAD/XLGDegnKVERbF6YTfdsbVngSlOX/Tu/fxAFTg0JfdQU=
In-Reply-To: <537880de-21ad-4dcc-92a7-a80092757ba7@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/4/24 12:19, Peter Rajnoha wrote:
> On 3/4/24 11:48, Peter Rajnoha wrote:
>> On 3/1/24 23:40, Martin Wilck wrote:
>>> DISK_RO=1 is set in the environment of a block-device uevent if and only if
>>> the device has just been set read-only by a driver by calling set_disk_ro().
>>> It is not synoymous with the "ro" sysfs attribute; the device could very well
>>> be write-protected if DISK_RO is not set. Probing should be possible even if
>>> this flag is set, because blkid and friends usually don't write to the
>>> device. Upper-layer subsystems that do need to write would need to check the
>>> "ro" sysfs attribute rather than DISK_RO.
>>>
>>> Skip the DISK_RO check in 10-dm.rules.
>>>
>>> Signed-off-by: Martin Wilck <mwilck@suse.com>
>>> ---
>>>  udev/10-dm.rules.in | 3 ---
>>>  1 file changed, 3 deletions(-)
>>>
>>> diff --git a/udev/10-dm.rules.in b/udev/10-dm.rules.in
>>> index 4ffd3e2..c08d829 100644
>>> --- a/udev/10-dm.rules.in
>>> +++ b/udev/10-dm.rules.in
>>> @@ -50,9 +50,6 @@ ACTION!="add|change", GOTO="dm_end"
>>>  # kernels >= 2.6.31 only. Cookie is not decoded for remove event.
>>>  ENV{DM_COOKIE}=="?*", IMPORT{program}="(DM_EXEC)/dmsetup udevflags $env{DM_COOKIE}"
>>>  
>>> -# Rule out easy-to-detect inappropriate events first.
>>> -ENV{DISK_RO}=="1", GOTO="dm_disable"
>>> -
>>>  # There is no cookie set nor any flags encoded in events not originating
>>>  # in libdevmapper so we need to detect this and try to behave correctly.
>>>  # For such spurious events, regenerate all flags from current udev database content
>>
>>
>> Yes, I'd like to get rid of this rule, but, unfortunately, there's one
>> issue during the DM device creation/activation.
>>
>> For example, if I try:
>>
>>   dmsetup create --readonly --table "0 1 zero"
>>
>> Then I get these uevents:
>>
>> 1)
>> ACTION=add
>> DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
>> DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
>> DM_UDEV_DISABLE_DISK_RULES_FLAG=1
>> SYSTEMD_READY=0
>>
>>
>> 2)
>> ACTION=change
>> DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
>> DM_UDEV_DISABLE_DISK_RULES_FLAG=1
>> DM_UDEV_DISABLE_OTHER_RULES_FLAG=
>>
>>
>> 3)
>> ACTION=change
>> DM_COOKIE=6335392
>> DM_COOKIE_DISABLE_OTHER_RULES_FLAG=
>>
>>
>> The uevent 3) coming with the DM_COOKIE is the actual event when the
>> device is ready for use (that's the uevent notifying the DM device
>> resume/activation).
>>
>> If we remove the DISK_RO rule, then the DM_UDEV_DISABLE_OTHER_RULES_FLAG
>> is unset for uevent 2), which in turn causes the SYSTEMD_READY=0 to get
>> dropped, which in turn will start all the systemd hooks because the
>> device is considered "ready" for systemd then.
>>
>> But the DM dev is ready only after uevent 3) that comes with the
>> DM_COOKIE. So we still need to cover this scenario.
>>
> 
> Hmm, this doesn't even work with original rules!
> 
> The 99-systemd.rules has:
> 
> SUBSYSTEM=="block", ACTION=="add",
> ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}=="1", ENV{SYSTEMD_READY}="0"
> 
> which applies only to "add" uevent, not "change". This means that
> SYSTEMD_READY="0" is even dropped for the DISK_RO="1" uevent even if it
> is marked as DM_UDEV_DISABLE_OTHER_RULES_FLAG="1".
> 
> This is actually a bug. But a minor one, because here we always have the
> change uevent with DM_COOKIE coming right after the DISK_RO change
> uevent. So there's almost no window practically.
> 
> Now, I'm asking myself why we have the 'ACTION="add"' in the systemd
> rule at all. Why is it not just checking  DM_UDEV_DISABLE_OTHER_RULES_FLAG?
> 

Oh! :)

https://github.com/systemd/systemd/commit/35a6750d9e26b26b423fbe815bead7d750210d8d

-- 
Peter

