Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A841C25B1C5
	for <linux-lvm@lists.linux.dev>; Thu,  7 Aug 2025 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754576787; cv=none; b=XMnvz0juzHsKDNt+xaKX3Vs/v+P9aeK2Gvdtqj/ShmPkm+Hy9Q2jZI9BtmrfZlA00vCU88SxEu3xwKvH6IuWc4TRJJ89slVONnfdEK8Nq1q5GU7gEfvV2dZbB094x69/SDewgfrAdgtPxOrWR1hlchA6/VXjGNgiZ1YebmjJINc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754576787; c=relaxed/simple;
	bh=rYxTBAKF459iV1yKczsdNjkr2Yv6j2ABP4lfpFL72u4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d2e0NgdrP3x4SrdKaYXgfLnBb2l9UfTjxECBukXlZf9SVHWnMuiawPIpI6uH++NrLXQCQwTYlwELoZWQfayWwbvpXgKe1L6Ewsp4HmVweoV9DXPE4Kacff5hS2c5Wp1sQneqS/2jE0rA1Nv+xSuIVp4nMf8uzcx6+WzRLvnMIPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P6U33P0Y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P6U33P0Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754576784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=96iJhQZzc9yhAvF63R9GN2n/jrYZQf2lXMcI/gjbm9Q=;
	b=P6U33P0Yskh9Yf3InUVt3Vjrh3LWiRrx2iZ05ImI5U1KOpPk3k3INZt6lurzjgQi6I+BTJ
	dWuSPB+LJfz9zPojZCr+48zLMfE+MsDcqFoSQ+29P/j4r2X7JiPPqBczhfV8vT9wRq1g0d
	xZ13/QvkZVI9Us1um4sS6XaflE+r5tg=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-X46ooHzNPNmmg6BoYJq4qA-1; Thu, 07 Aug 2025 10:26:21 -0400
X-MC-Unique: X46ooHzNPNmmg6BoYJq4qA-1
X-Mimecast-MFC-AGG-ID: X46ooHzNPNmmg6BoYJq4qA_1754576781
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-71838151744so15715907b3.3
        for <linux-lvm@lists.linux.dev>; Thu, 07 Aug 2025 07:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754576781; x=1755181581;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96iJhQZzc9yhAvF63R9GN2n/jrYZQf2lXMcI/gjbm9Q=;
        b=SNv+enYbqFHXvzFbMQ4ALGVIZ+Wa4PkJJAcqIiJQVO1xOCwLWSh0lBNPWVHDSxl2K2
         l1x1PBvuW38c/GqbF3xa0x4Qmws/aibT4QSZKxq3zdBlkx1vWr/Xk58O05oh9ntjRoOn
         +OSlTNV5jqep8BQNY+G2IMiRk5fYIafBrIdgoeoK1o6ojHf+kbtP3tNzgt8hsPprbXQ4
         G3i9lzFvb0ipVTA0DWM2hH9C7KiOiUY7j8Y37flsdZBJlVxhlxbn2YWRw4eVsAuCj85j
         8kebjKizZplKP/rF+L8K1k/utHGhgzwLPjmfQm8avcTusxW/W+0/rt8IkyF6ZcGzG9zA
         QmsA==
X-Forwarded-Encrypted: i=1; AJvYcCV5QxSS72SId0tjauRja2qtiDNyFpE4M1PMaBLEpnAyQ1sLV47PIuzVcpTUHbNPLeJ6tZpvjXI5P+k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw427UDt8Gzb6XDg1HUCBxUGq4vNmf+WUFC4eK+OYebvfRLeTqH
	hU9/ZEKIfMpVpjBCXTHKXlSyxzHxzApYz3MiVW7xXAfO/1caHPmppMlNiwmtlqjbL/ujLcznguh
	r87Fk4mg8R+TUegohekGrtO0FxwNkuuMzzRtlMaxdjMqtPSm1WJTNT+Xy4VIY8g==
X-Gm-Gg: ASbGncu8ALcFR6H4+hxpJvCk4UWFNTfSdxhzKsmVejam0ojUzm18lDeOAbBFb1DGGl4
	mVrPqYrtBgw5vYYcli41iXH5/bOYJkqgzQMC2cuIus8pM0iT1kSRRsAYLIEjyr3F4DMpbXUvKz8
	3jk3cyQKVU/XH3CpqsfgU46DwrrmxO/LUoN/h69rqq7eHmRIVZej8QS4vQx+EcpDEP6ETnc4mon
	xt5mNS4pQBV4gOVA8PHySc0QUIyhh5PBeJG/pJdShjXE6wVxD7CwRU2x2ULCMWbyt7uFc9Pvgj1
	Lp+Nn4n27DL48W/ruw==
X-Received: by 2002:a05:690c:620f:b0:719:e1cf:ea8d with SMTP id 00721157ae682-71bc977a9damr81230567b3.11.1754576780784;
        Thu, 07 Aug 2025 07:26:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGERbKGQIWQmitfkmsmGES56uxh3hKzAIMSSCir6DSVMZMTzjRDf6k+Kf351fz61j1Uz0NHCg==
X-Received: by 2002:a05:690c:620f:b0:719:e1cf:ea8d with SMTP id 00721157ae682-71bc977a9damr81230207b3.11.1754576780240;
        Thu, 07 Aug 2025 07:26:20 -0700 (PDT)
Received: from [192.168.8.164] ([46.188.135.63])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71bd21323c8sm9456527b3.23.2025.08.07.07.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 07:26:19 -0700 (PDT)
Message-ID: <8ca3f1aa-b3fc-4270-aa61-3f7cfdcaf157@redhat.com>
Date: Thu, 7 Aug 2025 16:26:04 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fix random failures in shell/integrity.sh
To: Mikulas Patocka <mpatocka@redhat.com>,
 Stuart D Gathman <stuart@gathman.org>
Cc: John Stoffel <john@stoffel.org>, Peter Rajnoha <prajnoha@redhat.com>,
 Heinz Mauelshagen <heinzm@redhat.com>, David Teigland <teigland@redhat.com>,
 linux-lvm@lists.linux.dev, lvm-devel@lists.linux.dev
References: <06d25902-7239-1fc7-ec3b-1798332c3315@redhat.com>
 <26771.51188.491376.658337@quad.stoffel.home>
 <65919799-842c-9428-8bfc-5c1c0671338@gathman.org>
 <36d044e7-75f0-9b53-8969-0423fade7ea7@redhat.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Organization: RedHat
In-Reply-To: <36d044e7-75f0-9b53-8969-0423fade7ea7@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e7v5igaK5dVTYimHexpEbi99tO0MZTrDdEr22VcLTRU_1754576781
X-Mimecast-Originator: redhat.com
Content-Language: en-US, cs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 07. 08. 25 v 16:07 Mikulas Patocka napsal(a):
> 
> 
> On Thu, 7 Aug 2025, Stuart D Gathman wrote:
> 
>> On Wed, 6 Aug 2025, John Stoffel wrote:
>>
>>>>>>>> "Mikulas" == Mikulas Patocka <mpatocka@redhat.com> writes:
>>>
>>>> The problem is that the raid1 implementation may freely choose which leg
>>>> to read from. If it chooses to read from the non-corrupted leg, the
>>>> corruption is not detected, the number of mismatches is not incremented
>>>> and the test reports this as a failure.
>>>
>>> So wait, how is integrity supposed to work in this situation then?  In
>>> real life?  I understand the test is hard, maybe doing it in a loop
>>> three times?  Or configure the RAID1 to prefer one half over another
>>> is the way to make this test work?
> 
> If you want to make sure that you detect (and correct) all mismatches, you
> have to scrub the raid array.
> 
>> Linux needs an optional parameter to read() syscall that is "leg index"
>> for the blk interface.  Thus, btrfs scrub can check all legs, and this
>> test can check all legs.  Filesystems with checks can repair corruption
>> by rewriting the block after finding a leg with correct csum.
>>
>> This only needs a few bits (how many legs can there be?), so can go in
>> the FLAGS argument.
> 
> I think that adding a new bit for the read syscalls is not a workable
> solition. There are so many programs using the read() syscall and teaching
> them to use this new bit is impossible.

I believe the idea of the test is to physically check the proper leg is 
reporting an error.

So instead of this proposed patch - we should actually enforce reading leg 
with lvchange --writemostly to select the preferred leg among other legs.

The bigger question is though - that user doesn't have normally a single 
workable leg - as  'reading' is spread across all legs - thus when one leg 
goes away - it could have happen that other legs have also some 'errors' 
spread around...


Zdenek

