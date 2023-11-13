Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964C320B02
	for <linux-lvm@lists.linux.dev>; Mon, 13 Nov 2023 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MbNmQzyH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699883563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WmHzOGx3afO/mXo/HNLXQ8pZbYVv3LWiAmpOhrBzdOM=;
	b=MbNmQzyHdyRGjAqv/3dRd6cAJViAIaVNmgPReF1bfohAKDgf+AQtDHD0aa+FZuFQp+htH8
	px7YGIa7yyU/RZPsG3u3eCtmbQ1x0YBrQjoYsBDiTNgvWtQllMpYL5sq+Cq+OHsdK9Mf1f
	c/wVGV97YuPy+W/2lfJMzp4G18ezehM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-E2AaY5cLN7iFJe7DAd0NFA-1; Mon, 13 Nov 2023 08:52:42 -0500
X-MC-Unique: E2AaY5cLN7iFJe7DAd0NFA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9e304dd4856so284816766b.0
        for <linux-lvm@lists.linux.dev>; Mon, 13 Nov 2023 05:52:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699883561; x=1700488361;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmHzOGx3afO/mXo/HNLXQ8pZbYVv3LWiAmpOhrBzdOM=;
        b=hWQkFrYqjmhU2B5gJKhN4UeUkpSooT2tRyD8srz8IGLMD42r4dsAFjdlTQl2rWAVuv
         yu9inHIc5a5YUwNCr7XYdjsSPlCLaGt9Q3IU7KK3tQAhOMyLobsZEQzt2WecoOfZ3rgy
         yf6Htpt05uKRE3C3bclvuvojFV2yzqiDabZ3B9I9hEPipPNaOsrMnFSaz/kOUbBrvBqX
         1T94sfgmcLGzfnL2cor/FxxeLDtj4IabuPI6cgCeAPsSZ8OjghnqanaG1810uX5owfib
         I9owsLOAeNwiPA93RxKB+hoJOZmRGBbffLGSM5n/t866mquR38DbAPeWbr3FbpVq1jj1
         2ucA==
X-Gm-Message-State: AOJu0Yyo6cOZFP9gGA9H3V3hqmfA2zPcjZbPGxqGcFf3t8DeZI4RP44L
	6mTKW4czz3WoWssqOufnkCVii1gngCoU4cAM4LeNcx3gYpJnRa9E9dyYDi5idgqXSdG2CEXKPXN
	/hZtu7M/4yRnz0avHSbJT
X-Received: by 2002:a17:906:4908:b0:9ae:6a08:6f53 with SMTP id b8-20020a170906490800b009ae6a086f53mr5061777ejq.63.1699883560985;
        Mon, 13 Nov 2023 05:52:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG20IzVITQ+8BQ1B4BBmGYayZarIYohb83NCi8OI8zaJIByZBtj5U4XOA/LGIovVwCCbpXi0A==
X-Received: by 2002:a17:906:4908:b0:9ae:6a08:6f53 with SMTP id b8-20020a170906490800b009ae6a086f53mr5061768ejq.63.1699883560662;
        Mon, 13 Nov 2023 05:52:40 -0800 (PST)
Received: from [10.43.17.245] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id gy7-20020a170906f24700b009b2d46425absm4035261ejb.85.2023.11.13.05.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 05:52:40 -0800 (PST)
Message-ID: <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
Date: Mon, 13 Nov 2023 14:52:39 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
To: Martin Wilck <martin.wilck@suse.com>, Heming Zhao <heming.zhao@suse.com>,
 "zkabelac@redhat.com" <zkabelac@redhat.com>,
 "teigland@redhat.com" <teigland@redhat.com>,
 "bmarzins@redhat.com" <bmarzins@redhat.com>,
 "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Cc: Glass Su <glass.su@suse.com>, "hare@suse.de" <hare@suse.de>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
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
In-Reply-To: <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/23 12:52, Martin Wilck wrote:
> I can't stress enough that this is *the only mechanism* that works
> correctly. udev serves as central hub to retrieve device properties
> from, and this is how it ought to be.

Indeed, that was exactly one of the primary reasons the
'external_device_info_source="udev"' was added. Reimplementing other
subsystem's logic is wrong because there's always some intrinsic logic
there that may be omitted. Sooner or later, such approach will fail.

I agree with you here.

If not sharing information through udev due to various kinds of hatred
about this part of the system, then alternatively, at least, calling a
multipath library function from LVM to do the job.

-- 
Peter

