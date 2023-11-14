Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61711947E
	for <linux-lvm@lists.linux.dev>; Tue, 14 Nov 2023 07:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e4hTNCuI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699948543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=A1/Nmj71SoyIJnJ81ysUHpKGHky6kJu7A1N0TDWocaI=;
	b=e4hTNCuIPBt9DG2oXmCnwD0P0OTdnTBqocbdZcP7Y+nZHm9CxFCBUBLIsk1cJR2gsd1Aag
	QlhAXrppsazRNyTodqWIoaONa6U7oSFWqOI5Lam5SKAzZjfb+vUUf4RMf2meZB7fYKEkpc
	o1irHVD4UfnuLxPLqe5RobjzR0Ov/rQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-VJI54bqaMfamXF9J0Jrf6A-1; Tue, 14 Nov 2023 02:55:41 -0500
X-MC-Unique: VJI54bqaMfamXF9J0Jrf6A-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9e649334131so226182466b.2
        for <linux-lvm@lists.linux.dev>; Mon, 13 Nov 2023 23:55:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699948541; x=1700553341;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1/Nmj71SoyIJnJ81ysUHpKGHky6kJu7A1N0TDWocaI=;
        b=PRBI7VCciRMeU4AcflYM1ADCbtMIHTs8cSgKwJgYId7e4g+x5608Oqejm9NGVyxMV0
         D9BALXzu3ewS+XION6m2+PmKj/DzUaIr3XQDdCijZrdqkC4YTBiuA4k74trCIeY9Xa1P
         n9L3uOugPZaStNDvYSh+83qQpCmS2l03buT/PM1+tihqerv/YAH7k4kMf6h5tpOED4h5
         51XKRsynAWlFoqsZBo+ViM9vGDKmTRiG0WCBk9Ooxth3lGDXEKjcafR+JwVjo+9hh5BL
         u+1+d926Mt862xjxeJj39m0JfpdiQOJCrDR0ECDp7ZOhkWzYi11T4Gkbk69weGTQpR3z
         X53A==
X-Gm-Message-State: AOJu0Yyq0s2DWqxIH603mevKobiw4d0iG0DHLMKyTI44WGGk8N9HVk8J
	c7kVUBNAwrssYZCjKEIibG/IW+Ardh0NDkOpv0n1XCHilHOvLykwNGhlqR9FVqeBMe9k4ET2YkH
	uzjlsWTkDFC+PZphgalu+
X-Received: by 2002:a17:906:c56:b0:9de:4007:d676 with SMTP id t22-20020a1709060c5600b009de4007d676mr6004349ejf.16.1699948540844;
        Mon, 13 Nov 2023 23:55:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpwDZXUSjy3wvRFEy1XpHap4k9c69fFSnBIXYzNgcspifG3G4s//EjwpgasE/f5p7jEOWVMg==
X-Received: by 2002:a17:906:c56:b0:9de:4007:d676 with SMTP id t22-20020a1709060c5600b009de4007d676mr6004336ejf.16.1699948540562;
        Mon, 13 Nov 2023 23:55:40 -0800 (PST)
Received: from [10.43.17.245] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id lc25-20020a170906f91900b009e621705878sm5215221ejb.147.2023.11.13.23.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 23:55:40 -0800 (PST)
Message-ID: <177c4b2f-3b4b-44e0-9391-3df007cafe36@redhat.com>
Date: Tue, 14 Nov 2023 08:55:39 +0100
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
In-Reply-To: <ZVJtCxq7XeCg_G-g@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/23 19:38, David Teigland wrote:
> On Mon, Nov 13, 2023 at 02:52:39PM +0100, Peter Rajnoha wrote:
>> On 11/13/23 12:52, Martin Wilck wrote:
>>> I can't stress enough that this is *the only mechanism* that works
>>> correctly. udev serves as central hub to retrieve device properties
>>> from, and this is how it ought to be.
>>
>> Indeed, that was exactly one of the primary reasons the
>> 'external_device_info_source="udev"' was added. Reimplementing other
>> subsystem's logic is wrong because there's always some intrinsic logic
>> there that may be omitted. Sooner or later, such approach will fail.
>>
>> I agree with you here.
>>
>> If not sharing information through udev due to various kinds of hatred
>> about this part of the system, then alternatively, at least, calling a
>> multipath library function from LVM to do the job.
> 
> Hi, a number of things haven't been mentioned or noticed:
> 
> - In general, it's old versions of lvm that we're discussing here.
> Current lvm uses system.devices by default, where none of this is
> relevant.  We can just turn off a number of filters when system.devices is
> in use, including filter-mpath and filter-md.  It may still be interesting
> to look at improvements, but the context for that is older stable,
> released versions.

Hmm, but to generate or update the system.devices file and to add a new
entry there, we still need to check first whether it's a suitable device
or not, right? Like not being a multipath component...

-- 
Peter

