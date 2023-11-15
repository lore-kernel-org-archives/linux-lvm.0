Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4405D2E838
	for <linux-lvm@lists.linux.dev>; Wed, 15 Nov 2023 08:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Adb4cEaJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700038284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UpA/Io2ZXZh5qPWJ0r0BTnwKlhAD8BTP/YudVUKJEy8=;
	b=Adb4cEaJQPN4aizcq3rsqGZKpZmEQwJZXpg9BhOcWrzj0OTgdqCTG1wtv12jsj+JP2LDv7
	fEowPkC6hL+gGh4Rjvt0TsusXlTu/mPhnYob7UZa0gEUwg9Kiy5Tf4qtzSJPEY1pIpC/au
	YsalghdD01V7maG8Ap6nJGszpjy3/Nc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-XZzkBsRhOPSJ189YhZex0A-1; Wed, 15 Nov 2023 03:51:22 -0500
X-MC-Unique: XZzkBsRhOPSJ189YhZex0A-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-778999c5f1dso807655385a.2
        for <linux-lvm@lists.linux.dev>; Wed, 15 Nov 2023 00:51:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700038282; x=1700643082;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpA/Io2ZXZh5qPWJ0r0BTnwKlhAD8BTP/YudVUKJEy8=;
        b=PSjv+/HYCMPH6+4cUe+iudXTl0xt2Fgo2Jpzn17HBxLZ1JemZ6AkvTOZ6G22pCW1CX
         sZkKEB2dKYYyakL5G1Ts98zUqcnzwCK1e4VSjvVorIIy1ecvqOBH8DA1/BXaZ4KIXAOh
         YAzIWgCJjRZxQ51/CcSvYbwFXuIvXuG+B6ZKbXWwf51lIaVDPhazzfmKya7idsKqPI03
         s3TcJGugV2O2HxqxVZf3droS7m+kS7ygk1/i/YKGCRFPBCtEmcnRIVLosF5OpfZORmr7
         CGnAHKKfz2C6yYWTSOKUUEp6/zmcR4bXBr8YwA7pLjuypXHkyJv1UmArmti5ptFrLZQ8
         R6ng==
X-Gm-Message-State: AOJu0YzLCBBDJ7LALZfBRqR6CvRSR8kJ4/FyIw616RZ4SE5VjRcS6sVo
	cgDWYWxP2F2ipPcYrFJ5ko9xvAykOhXWpTZ+LCNrf3gGyUS/agOWiEvIdEEAvB/iz29omhZ59oJ
	T6m33VJtlrnd7LkKVZbJK
X-Received: by 2002:a05:620a:24c7:b0:76e:f3a3:4ac6 with SMTP id m7-20020a05620a24c700b0076ef3a34ac6mr5333385qkn.35.1700038282498;
        Wed, 15 Nov 2023 00:51:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH74pTkmtu4822ebCraW9r5umWnm3ydBGpjMWwaf0JT1U0DIWcEpDV9o3EAoVanyqZaQxv7wg==
X-Received: by 2002:a05:620a:24c7:b0:76e:f3a3:4ac6 with SMTP id m7-20020a05620a24c700b0076ef3a34ac6mr5333373qkn.35.1700038282206;
        Wed, 15 Nov 2023 00:51:22 -0800 (PST)
Received: from [10.43.17.245] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id p12-20020a05620a22ec00b0076cc4610d0asm3306614qki.85.2023.11.15.00.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 00:51:21 -0800 (PST)
Message-ID: <194d20b7-e3b0-43d6-95e1-1a7d56eab506@redhat.com>
Date: Wed, 15 Nov 2023 09:51:19 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
To: David Teigland <teigland@redhat.com>
Cc: Martin Wilck <martin.wilck@suse.com>, Heming Zhao <heming.zhao@suse.com>,
 "zkabelac@redhat.com" <zkabelac@redhat.com>,
 "bmarzins@redhat.com" <bmarzins@redhat.com>,
 "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>,
 Glass Su <glass.su@suse.com>, "hare@suse.de" <hare@suse.de>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
 <ZVJtCxq7XeCg_G-g@redhat.com>
 <177c4b2f-3b4b-44e0-9391-3df007cafe36@redhat.com>
 <ZVOgmGx-EIpMF54F@redhat.com>
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
In-Reply-To: <ZVOgmGx-EIpMF54F@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/14/23 17:30, David Teigland wrote:
> On Tue, Nov 14, 2023 at 08:55:39AM +0100, Peter Rajnoha wrote:
>> On 11/13/23 19:38, David Teigland wrote:
>>> - In general, it's old versions of lvm that we're discussing here.
>>> Current lvm uses system.devices by default, where none of this is
>>> relevant.  We can just turn off a number of filters when system.devices is
>>> in use, including filter-mpath and filter-md.  It may still be interesting
>>> to look at improvements, but the context for that is older stable,
>>> released versions.
>>
>> Hmm, but to generate or update the system.devices file and to add a new
>> entry there, we still need to check first whether it's a suitable device
>> or not, right? Like not being a multipath component...
> 
> If they know what they're doing, a user won't add a multipath/md component
> to system.devices (or other unusable devices.)  However, it makes sense to
> apply these checks when a device is added to system.devices to catch user
> mistakes.  Also for vgimportdevices -a where a specific device is not
> named.  The checks become a one-time thing, done when adding the device.
> The checks are not needed by ordinary lvm commands, and are not being run
> at tricky times like boot or for event handling.

Sure, if we already have that in the devices file, we don't need to
rerun the filters again and again. But I think that for the very first
check we do when inserting new entry to the devices file, we should
really be using information that is *shared* by the other subsystem that
owns it. In case of multipath, we shouldn't be reading any of their
config or trying to reimplement subset of their logic (the config can
change format, the logic can change, new features can be added, various
settings can be applied which we omit in our own internal simplified
version of the logic).

If I would need to compare the situation to something, imagine that some
subsystem, MD for example, would be parsing our system.devices file to
check if it can or can not access certain device. Then checking
multipath config, then other config and so on... So that way we would
have each subsystem checking other subsystems by reimplementing these
checks again and again (with the risk of not even being correct).

We should be using dedicated APIs or udev to share the information among
various subsystems. Or, if nothing else, even calling out to the
subsystem's binary if it doesn't provide the API yet.

I don't see an issue with the devices file as such, I see the issue in
the way we gather information, reimplementing the logic that is simply
not in our domain.

I think that's also what Martin and Heming have in mind.

-- 
Peter

