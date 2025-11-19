Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D728C2FF653
	for <linux-lvm@lists.linux.dev>; Wed, 19 Nov 2025 16:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763571581; cv=none; b=YI5og8wVR3nyJgOV4F+ZKeKwZodjWKWwrRdQvED08R6iD8oZ6Cswwd/V+drhsIB2D3w6mimHv5vJPvI3rlrkWinQfTKf9A2JD7/8eKyGJQQAjygPp29p+xREeRZpsQiQMiSMH2JTZY83ib7k6f5UeRp3HlC5S/yvNYM2YdHpip0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763571581; c=relaxed/simple;
	bh=VIOYkcpSn6jNMWXMYBLjTM4Eh41ZG0d2a8WGBa+/kKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PrNNhAOcjSrKYWrCoz6Ja1EzxxYnWQhGDCqEiBcqfKsuNHs5ZkENmDIksGjkg3smMI7+OJSPUUHv/WdhD+B+1I5VPPYzr25P/f6HGjDlNEhW3IHJhKl+z6qwCGFckDi62SGQzTRywCXvVC8cBNvoOe7Ng/VzDXTteURLJ5pjBDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rr2+/fce; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rr2+/fce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763571578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=42tkbGs/biOntAucj8op28B6lCAd8PL7xQXulvfp9LY=;
	b=Rr2+/fcec7gIhGpkIpI3XjaSE48hxd1bPZj84z9ZVdIMmDhXoMj5Jx3D/i5KFYig0OJRrm
	dPNIywPDnXz4wwUdkO2o9YfiDRVKyMvlGTki4CDpha1KBl079cike1m+Wi7RGfz97eQXSC
	mIvPzveJQcuQ8AdUyevVivk0cbOnL6c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54--JN7SNHOMyWVzSjX2Cw6yA-1; Wed, 19 Nov 2025 11:59:37 -0500
X-MC-Unique: -JN7SNHOMyWVzSjX2Cw6yA-1
X-Mimecast-MFC-AGG-ID: -JN7SNHOMyWVzSjX2Cw6yA_1763571576
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4779b432aecso23542325e9.0
        for <linux-lvm@lists.linux.dev>; Wed, 19 Nov 2025 08:59:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763571576; x=1764176376;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42tkbGs/biOntAucj8op28B6lCAd8PL7xQXulvfp9LY=;
        b=pbto9Fc6Gh31XCPhRpU4DVpoLNcjXFa7CSz/sK3LZEsQhBRNTTseX30tT/KpcbiH7r
         f+lZGCYeyjkf6DrdB1Vzp8Zwk18RAockH53xtg4LNKptpewZlH3mMrmiAa0uEjmP9te2
         uCdITNH3eZHVLYQL6szda0e9joMAakLYEhQmCtNL845AWfaVXimCUmTjlUQfgwa/4CEv
         HDun2jYqtx0tkzZzwPp1TpRr5mBOg7N7Hp3QugpFFGSQAo0TTCF6J4QZVav5tUSe8DNx
         ag9KG3TQtY5Qf2jB0IXQ8OUtovaUMvm+47CqwZrAIhtw+H6DLv8abiknQnieFo3QGUhm
         gX5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6wwlYT3szu3tN4KXRFUC8AqvsqBtatFqhqu3WsqyBbvkEt/hlPPwfknqasTfKIStNVGNlyYEdQso=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBL6jzfmoHsQts4se+33qUKpqt4RNBh3bihNq6QPqDdhVTm6R0
	6cSXx2tiUq3npxIP94MqMIaNrjOq8m8H0Fn0fG6+h6avvOr4ZxsnFO4+2LH9k257i7iI3xTeFxI
	nhMMwr0BVMvBrEG1UM3RRhFmtA+UNVvbOK9Px8hpwaOcbmWp6SHRfHUJFsqdTHg==
X-Gm-Gg: ASbGnctC0s787Iut3WNLLIVNtUEmqSIlxAwUtTxW7Cjh5z7ecoAwumobT6bV4TSdn46
	r9plFSTt6NBM7n13xwo5lV+6bsy8T4VSNjjw1jPwfevCuxR5pCTYc8IXJ+XdJOCnNiD1lX6OzcC
	5aYJOVhUIsfDTIMl2B7MFvPgKHyFl8RmQ3n7BTKrsXCsFMk46oOHkbIdBAtpSOx7iOna5i0U/ki
	lAw+DTtr2eD3GECyQXnYzNLDoQkBwmXDDbJYVDAoQW6vdjxSTrPWp1xYKA+D3cusObk0X7MnTSG
	HYvAe3+9KazxxsFs/FfpDZtJ/drHqSMC6ee55klgA+Q8EjLpwk5m9SlwqA==
X-Received: by 2002:a05:600c:35c1:b0:477:54f9:6ac2 with SMTP id 5b1f17b1804b1-4778fe1170fmr250290135e9.0.1763571573914;
        Wed, 19 Nov 2025 08:59:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFY2qn8JZvfVjbBGD4uBeeVDFUVE7ahK+V8MrGiXXls/OR1NmKScPO+twF7MGs7Uip9yeORpA==
X-Received: by 2002:a05:600c:35c1:b0:477:54f9:6ac2 with SMTP id 5b1f17b1804b1-4778fe1170fmr250289855e9.0.1763571573485;
        Wed, 19 Nov 2025 08:59:33 -0800 (PST)
Received: from [192.168.0.111] ([212.20.115.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477aa387473sm44073645e9.4.2025.11.19.08.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 08:59:33 -0800 (PST)
Message-ID: <79169cc8-9166-4b65-9c59-d490512d46e6@redhat.com>
Date: Wed, 19 Nov 2025 17:59:32 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pvmove thin volume doesn't move
To: "Brian J. Murrell" <brian@interlinx.bc.ca>, linux-lvm@lists.linux.dev
References: <be9db13beb543be237fa069e3c72e22e1df2446c.camel@interlinx.bc.ca>
 <1b6fb117-7283-4ba9-91ee-7412a2d77b3d@gmail.com>
 <29209080-c09b-40df-86c3-f22c1d7f6520@interlinx.bc.ca>
 <5067ec8d-991b-4b90-ad3b-f9dbbb0472d5@gmail.com>
 <81e51a5ad8f9c32610b8262447af635da81d53c3.camel@interlinx.bc.ca>
 <3620fc27-e54b-472d-bc82-be01f7b2739b@gmail.com>
 <6D706D06-AB0F-4C55-9F68-E8E07926A511@yahoo.com>
 <9c2a15d0-0d7d-4462-af43-83221c2ecbdd@gmail.com>
 <319f6df36c43e3c62e8edc9730e2d1f8065586ed.camel@interlinx.bc.ca>
From: Zdenek Kabelac <zkabelac@redhat.com>
Organization: RedHat
In-Reply-To: <319f6df36c43e3c62e8edc9730e2d1f8065586ed.camel@interlinx.bc.ca>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ti2lOCqxEKS-MaqCeOTTogkNawCOnhcT61ghBJYxgCc_1763571576
X-Mimecast-Originator: redhat.com
Content-Language: en-US, cs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 19. 11. 25 v 17:36 Brian J. Murrell napsal(a):
>> lvm2  ATM does not support any sort of 'extraction' of a thinLV out
>> of the
>> thin-pool.
> 
> Maybe that's an explanation that goes over my head with me not being an
> LVM2 engineer but rather just a general jack-of-all-trades sysadmin.
> 
> But that said, I'm not sure what kind of operation "extraction" is
> supposed to be implying but I suppose what I was thinking (hoping for,
> now it seems) was that in order to be able to move the blocks of an LV
> in a thin-pool from one PV to another one would of course have to
> extend the thin-pool to the new device, in the same way that any LV can
> span devices.

Ok - now I start to see - where we need to enhance our documentation.

So here - 'adding' different space to thin-pool wouldn't not be a good idea.
We will likely need to add at least 'prompt' protection if user would try to 
extend  'hdd'  based LV used for thin-pool data with i.e. non-rotational
(we are in planning phase for new allocation - which will be dealing with this 
- but we should add some protection to existing code base).

thin-pool does it's own decision where it allocates 'chunks' for thin LV and 
for thin-pool itself given space is 'one big device'


> 
>> As far as for documentation - I'm pretty sure we never mentioned any
>> support
>> of such operation within our lvm2 man pages.
> 
> pvmove's manpage does describe the ability to move LVs among PVs.
> That, IMO, implies thin-LVs without any kind of disclaimer saying
> otherwise.
> 

Ok - I'll try to add more details about 'virtual LVs' - which are thinLVs and 
vdoLVs  (and we have even combination of both)

Here we surely can add more disclaimers about the major difference between 
virtual and real LVs.


>> Blocks in a standard LV are allocated (during creation) from the
>> Volume Group
>> (VG), but blocks in a thin LV  are  allocated  (during  use)
>> from a "thin pool".  The thin pool contains blocks of physical
>> storage, and
>> thin LV blocks reference blocks in the thin pool.
> 
> That sounds like a good description for an LVM2 software engineer
> onboarding to thin provisioning.  I don't think that description is
> suitable to express the limitations (that are becoming apparent in this
> thread) to general jack-of-all-trades system administrators as it
> implies more knowledge of LVM2 than such a person could/would generally
> have IMO.

We surely always try to add the best details we can.
But there is also some 'expectancy' user is somewhat knowledgeable.
The performance of thin-pool ain't for free - so there are some drawbacks when 
user settles with thin-pools.

> Again, much too technically detailed to express these limitations to a
> general sysadmin that has to employ literally dozens of technologies in
> one's administrative scope and therefore cannot possibly try understand
> all of the underlying design decisions of every one of those dozens of
> technologies.

Like our error messaging - in case it makes no good explanation to the user 
should be always reported and requested for enhancement.

Regards

Zdenek



