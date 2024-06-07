Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3491C15B143
	for <linux-lvm@lists.linux.dev>; Fri,  7 Jun 2024 09:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717752374; cv=none; b=r7GRwl5jbPyU+NXhE6cmT0wdvDph627QVnJHjwVBGBOaYLfB14ver9nub7J2e8LIY0+C6ml+OKJp/cHiFJp4wWnG9ZHGq4WfkkGVe2aUr0B3RyHjT/RhyX7/zbAwJrtbE3a4JLQMfjSVXbRLY4scsaIgc6S+SwWLiz+fRyQZP+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717752374; c=relaxed/simple;
	bh=mvzDr3S1to8IPN7jFUr7pjuDivxo3IQ6BppDBZwOfro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J8D1Xnk/a7AJUSvwgaGALIKreet8b0H23lfpTVRKq/FTlVu8WpddG7lgetPwqeQHnqJtGw8qIf0fiO0uZ2COnhRko7gmvYVpsN9P5tPatYdH6PFvY418WAWksds8tbnIf6jJcUf3kVzAn5vv07B8TqUFqWuB2VSGwENyhopFPBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJJxrimN; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJJxrimN"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52b83225088so2276355e87.3
        for <linux-lvm@lists.linux.dev>; Fri, 07 Jun 2024 02:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717752371; x=1718357171; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QcOWhdDQZlTa0G6f7hddIJb87dDS+zTl2Nt82/osUuo=;
        b=UJJxrimNxamWPTToYUM1DFQIbCgdXQA4j+tTOZAZItOg13ddXLw0kgeddnwRSNb6pu
         1+83lIHGyT5kZn3fhsRThs10gPXC2KhBrbrjZbHKj8zLcGvSsKkPJsJBsxvBd+7xF1IZ
         Mic/oBFQHplN15R70O/VPl0z85CS8rh/9hHh9gr66q9kQL3F2unpRhOMPQq7whKjhedd
         HujvlUGSPFgn5jdRdb67uoHYEsORfg4YHv7gPIRi++JbP3lI6MJ+ZvjuayZ6UYxe7Lsi
         0c4rCqhqibCIUpz6eYHP23BP/lCy3QopNuTtxyxL1QMdwDvzQHF0/gE8Ykff40DNKT2P
         mFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717752371; x=1718357171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QcOWhdDQZlTa0G6f7hddIJb87dDS+zTl2Nt82/osUuo=;
        b=RNSzRpfKRWZlEhIPFB7R8OIMlEHx1/E62tWGaqH+J05uaxGpWRt26BwLarNGHd1ztz
         O0fuarnsPn4W0KneCVJTlZ53ZcdRViYlA8cFBbbQmWAbfLS2Tl4EvaspnCR2Cc6WlQXG
         M4GcUejJIE1x9PsKDp4SyfoiAGYvBRCdqd5qIOLOaeDBPwkSYUBvIJLo0AN0SXb3gnyV
         fnts+cJSNf/rS3zNZpbvRwH4ooRRbsR6FN98Ox5uKNgtxibYFyyBSFx6kQnTzbvxkfc/
         kc6YlW8wArup170ey1F7XYtWQs81BuzXYtdO9SlcQzgpOVU5LUre/HbHchytLbzYuvHZ
         vUIw==
X-Gm-Message-State: AOJu0YzvnZG6Qtxte5WzSQU6bXW8mS/yrXK4dHWAkTjQxkNoOxd9D3f9
	Oh0D5ug/4sWnJemeorC+YCWzcvp9MQlnrnC4DCdqtdCpxm5epMKexTQj1Q==
X-Google-Smtp-Source: AGHT+IF4JIHoMObtumr4q8oafKqGu7BpJKQio5FwP88tul1iHu24BL/3YPECVTRqsLW656u4oIDPMw==
X-Received: by 2002:a05:6512:746:b0:52b:79d9:b084 with SMTP id 2adb3069b0e04-52bb9fc5a5amr1171742e87.43.1717752370937;
        Fri, 07 Jun 2024 02:26:10 -0700 (PDT)
Received: from [10.43.17.8] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c2d7935sm45946485e9.48.2024.06.07.02.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 02:26:10 -0700 (PDT)
Message-ID: <52f4696f-9c03-4fea-b265-97448fbab24d@gmail.com>
Date: Fri, 7 Jun 2024 11:26:09 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: lvm2 deadlock
To: Jaco Kroon <jaco@uls.co.za>, Roger Heflin <rogerheflin@gmail.com>
Cc: "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
References: <c828486f-46d1-45b6-8477-ed390553f4dd@uls.co.za>
 <a6c24173-d138-49dc-afb0-f48d41128477@gmail.com>
 <9bac4556-bdf8-4034-9322-522277ff311e@uls.co.za>
 <b77c19de-48b4-4a7d-9174-0d42414ce920@gmail.com>
 <66d9e7cf-b654-4476-b1e2-e3bdf4444280@uls.co.za>
 <CAAMCDed2n+wvQTySx8GRsekfrsdeO+vdwXd289bWZ_sk1WbqXA@mail.gmail.com>
 <5aa7f229-aef5-4f63-acb5-1e130c6c5296@uls.co.za>
 <de91140b-d29b-4885-8d1f-be172babb4be@gmail.com>
 <77882d4d-91e4-4625-ab98-97738d13da8b@uls.co.za>
 <67629722-b281-4ee9-b832-08e85c09efd5@gmail.com>
 <e15546bf-dd1c-4a54-92bc-b9604194ffcd@gmail.com>
 <8627b66a-1774-4828-aae6-e5d31356fe10@uls.co.za>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <8627b66a-1774-4828-aae6-e5d31356fe10@uls.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 07. 06. 24 v 11:03 Jaco Kroon napsal(a):
> Hi,
> 
> On 2024/06/07 00:17, Zdenek Kabelac wrote:
>> Dne 07. 06. 24 v 0:14 Zdenek Kabelac napsal(a):
>>> Dne 05. 06. 24 v 10:59 Jaco Kroon napsal(a):
>>>> Hi,
>>>
>> 
> I'm guessing your "simple way" is workable for the generic case as well, 
> towards that end, is a relatively simple change to the lvm2 tools not perhaps 
> to add an syncfs() call to lvcreate *just prior* to freezing? The hard part is 
> probably to figure out if the LV is mounted somewhere, and if it is, to open() 
> that path in order to have a file-descriptor to pass to syncfs()?  Obviously 
> if the LV isn't mounted none of this is a concern and we can just proceed.
>


Hi

There is no simple answer here -

a) 'sync' flushes all io for all disk in the system - user can play with tools 
like hdparm -F /dev/xxxx  - so still everything in range of 'admin's hand'...

b) it's about the definition of the 'snapshot' moment - do you want to take 
snapshot as of 'now'  or after possibly X minutes where everything has been 
flushed and meanwhile new data flown-in ??

c) lvm2 needs some 'multi LV' atomic snapshot support...

d) with thin-pool and out-of-space potential it gets more tricky....


> What would be more interesting is if cluster-lvm is in play and the origin LV 
> is active/open on an alternative node?  But that's well beyond the scope of 
> our requirements (for now).

Clearly in the cluster case user can use multi-node active LV only in the case 
there is something that is able to 'manage' this storage - i.g. gfs2.   Surely 
use of ext4/xfs this way is out of question...

Regards

Zdenek


