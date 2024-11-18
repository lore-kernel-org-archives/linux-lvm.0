Received: from plutone.assyoma.it (cloud.assyoma.it [212.237.56.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546C11C07CA
	for <linux-lvm@lists.linux.dev>; Mon, 18 Nov 2024 15:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.237.56.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731942284; cv=none; b=RxWSzA/NSKo5iQ2DTHlNuLlMx6NwF/31Vb8Ld1Sci/C1yOQLXOAgXOmlgldJF4wheEbDOB3eR2spY/apF3cfiAfE1taRDQa8pfFCMNr6GmRxzhcLCWW/zU9KkYKiBXsieWcsBk4NZOjQg1ZSEGNJchw4lNieNoYBNRi2fUt4ScE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731942284; c=relaxed/simple;
	bh=8OOfuafbDxjGf6wK6B7L6eCQa8KsMPr5tyyc5qc3E8M=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=LsEntA+JYOXhsRXEJ421os6N7VV89+QxSe8oXpirHtH1SvtF9h/RwNSLMidIcrGEWccFZ5edReRWxpqCu8aC7dMD4zYRgvKPXeTH9mwfsOVyuDo0fQwYSVAxWbqNJhYm6ZRdXFF5b/Wnc6pO1abT1hFE0nW+/H7zdOIGK7SFxqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=assyoma.it; spf=pass smtp.mailfrom=assyoma.it; arc=none smtp.client-ip=212.237.56.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=assyoma.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=assyoma.it
Received: from webmail.assyoma.it (localhost [IPv6:::1])
	by plutone.assyoma.it (Postfix) with ESMTP id 889FC14AC183;
	Mon, 18 Nov 2024 16:04:30 +0100 (CET)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 18 Nov 2024 16:04:30 +0100
From: Gionatan Danti <g.danti@assyoma.it>
To: Erwin van Londen <erwin@erwinvanlonden.net>
Cc: Zdenek Kabelac <zdenek.kabelac@gmail.com>, linux-lvm@lists.linux.dev
Subject: Re: Import duplicate VG from a read-only device
In-Reply-To: <aec40095-abbc-43d0-910c-2b001fb1e29b@erwinvanlonden.net>
References: <65d1cd8d1b9189ffcd7eb919c91c1b59@assyoma.it>
 <218e6c33-c5d3-473b-9f5b-3c5684563b30@gmail.com>
 <aec40095-abbc-43d0-910c-2b001fb1e29b@erwinvanlonden.net>
Message-ID: <8b43f9dfec91899a859d42342a44b94d@assyoma.it>
X-Sender: g.danti@assyoma.it
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Il 2024-11-18 14:38 Erwin van Londen ha scritto:
> On 18/11/24 19:53, Zdenek Kabelac wrote:
>> PS: I think ATM lvm2 is already complicated enough to creating some 
>> 'overlay'
>> level of referencing  lvm2 names in the system through some 'abstract'
>> mechanism to solve the issue that can be easily eliminated ahead makes 
>> not
>> much sense to implement....
>> 
>> 
> Do I agree with the above sentence!!!!.  I've seen major issues where
> administrators have created a massively complex system out of LVM to 
> the
> extend they dug themselves a rabithole from which they couldn't escape
> anymore. ALWAYS keep it as simple as possible and only use what you
> actually need. Try to stay away from bells and whistles if you don't
> needs them....
> 
> Cheers
> 
> Erwin

Sure, I completely agree with both.
I was just curious to know if I was missing something obvious.

Thanks.
