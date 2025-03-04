Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F4827CCF7
	for <linux-lvm@lists.linux.dev>; Tue,  4 Mar 2025 17:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741108442; cv=none; b=czzR5YG7wYff0KBSBss/LN09dIuAJWdC5Man4d8WwMc2zqvXkZsUloY4pmnMur9+UtIc99JMDDCA9o/VEpSmsu4i3Q14Y6qwpJ89oOWhDHPt5UktrN3ompsT8t/glE8YPKCElVd/VYAjazb7khroLyQ7fnpsTVqYlEJnuXyUAOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741108442; c=relaxed/simple;
	bh=lHsqqeORCvGWYPIaXcDfJxDP4fN9VCPh9Lt0Mlxy5Nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oc40W53JhOB2T/URyvz0HrmmicsjzGt2cQRrEg1vZFBkWg62DvKpldMm/cDHXuYP4v+VKN8dRVoMjkeWULiFl+rezCDO75IELFptcFbpDzsutKkQFH1vs6je5gt6G7mLXWcSm31QxstL/FUxLjMWnwlzghSWZDCBzc6oZdQyhac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+Q0CdEF; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+Q0CdEF"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43bc4b1603fso15229055e9.0
        for <linux-lvm@lists.linux.dev>; Tue, 04 Mar 2025 09:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741108439; x=1741713239; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Etb710gKsobzI4shYgTzHJbe2+xG24OK0rBbCLOfzZo=;
        b=c+Q0CdEFhrPBNDMCPnCYaMt0+2d8C5c2liJINsGlQqvJ8B7tTRYwkhYKpckOK+fhTf
         fcTlZR2K2aMWWCkg1RKbxx5xBBae3bRr4rQ0xoslxScuvV5WbMH/LUN65VD3XRAM97Gb
         U8Wg2jLLElMg+W3Q9IPufdeFKbdCbiCz0ZP1Kl4cq3LjG9SywI9lkEqOnhK35gz/UGNc
         5SJn8dKqtBdkNgXegpIKRrxsq6nDW25/YfKeEf05AVEjyqyXuOYNTi4b4tdqa0ikjGvH
         Yl+b8fiCBIMBGM8X5cJzJGbsa04NoorlVIoj5xWcEDFPzxDD8BR/wOkNfQWdS+LFtGEX
         yCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741108439; x=1741713239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Etb710gKsobzI4shYgTzHJbe2+xG24OK0rBbCLOfzZo=;
        b=lBGYb4+eKlQMgD8tx33fSCayq7u51fL72IrlzHDGTJkVUpDdTeeG96J56qOtE2eaTr
         rLpQEUptj/OCteZft//xKboN1VwjVbkV/j8AjWnwL+hqInLElTuMXecct6ar9s0OIkqV
         wFMZf4xSymkLdKKUYC6GwT+Ev0iE1LZjSzajCZB9DphHxO1XVe+Dgsqj0l6hE3S0gJz5
         X9SiyKa8U3FvOvrAz0QLxcPPu45rlZEV8gMmkNy2GScty6b92H8jXjDmjtuV201EDauj
         oSJnllsTCQCgEhSi2xSQC7CNMrhy9+W2VP/uxvdoacPBMxcktN9BnF1RdJeN7HXhuRw4
         T3Yw==
X-Forwarded-Encrypted: i=1; AJvYcCV6C2v6Ptfiu8H8GQgX9AGZt64EFpgdVA7BEC/oTH86BR/rIpkJLVhnJK09W2pNSGuF7t7iK4+VBuU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwC/6i5TH/Dcr+WDYVnya7qkUomgA2PoBgXnr56/fiIfb6Qhc2e
	ngmgE+//HeeFCcmT0yrEDvGWSc532Shw4E4k4zUmtGZP15LSDUWNtcWGy7auZGA=
X-Gm-Gg: ASbGncusyPwgqLVGUzVxBlc1CA5YXF4uVIK1nRj5rMcqO+Eql0oTXLbxnjbcRtLEtn5
	5c7DcLsTNUqSSppB/OMQNNYIO6d//JNN7kM9xUVbFTR5hMeg9vNREmywsNdXMzS50l2rUFtzfYC
	0D8F/84ZoQmgBRo2vMvpTEOgCAaWSWYQtjJZ3m7CD6TC21Lf4FNP6vXdnOebjCJOUjf9TUQAHb/
	Kd9SB8UQqHtaRscAQRuayhiA7RoOMI5flpNfKe+P+FyAQw6+UqkMcmVw8AF16289UY1sxHRM1Pc
	nOpgZB8zpsjY0K1xS4X0YpBORMUo7M0IE3VP69ZRWVQgSCjdvhLk
X-Google-Smtp-Source: AGHT+IEM85aFs05tiSIXjdRrJZbIwxdGLiYq1kfxy40I29FhuLmjnPnF7GFDDr1lIsBGyNV/PdhiJQ==
X-Received: by 2002:a05:600c:4f86:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-43bca3972d7mr49956645e9.16.1741108437360;
        Tue, 04 Mar 2025 09:13:57 -0800 (PST)
Received: from [192.168.1.212] ([188.129.249.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bbe676b41sm91006665e9.11.2025.03.04.09.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 09:13:57 -0800 (PST)
Message-ID: <31296432-4239-4daf-a0a4-58fdc7c2d955@gmail.com>
Date: Tue, 4 Mar 2025 21:13:54 +0400
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: LVM2 headers
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>, linux-lvm@lists.linux.dev
References: <825942ec-5b4f-48aa-bac2-02198d2a2733@gmail.com>
 <0755fea5-22f3-4a90-aec7-07ddb88c2253@gmail.com>
Content-Language: en-US
From: DeCay <decayhonor@gmail.com>
In-Reply-To: <0755fea5-22f3-4a90-aec7-07ddb88c2253@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Interesting, thank you for your answer! Yes, DBus should work for my 
use-case.

At the same time, I'm looking into lvm2cmd.h right now, but it seems to 
be designed for the CLI `lvm` you mentioned.

On 3/4/25 6:25 PM, Zdenek Kabelac wrote:
> Dne 04. 03. 25 v 9:29 DeCay napsal(a):
>> Hello!
>>
>> I came across a rust library (https://crates.io/crates/lvm-sys) which 
>> depends on lvm2app.h. This header doesn't exist anymore, as far as I 
>> was able to find.
>>
>> What's the right way to interact with LVM2 programmatically at the 
>> moment ?
>>
>
> There is either DBus API or just simple good old fashioned 'exec(lvm)' 
> of lvm2 command.
>
> We were unable to provide and maintain the C API - as there are simply 
> too many restriction which cannot be easily satisfied with any random 
> binary.
>
> So easiest is to simply run lvm2 command or if you are able to consume 
> DBus API - you can try to go this path - however than there are many 
> limitations.
>
> Regards
>
> Zdenek 

