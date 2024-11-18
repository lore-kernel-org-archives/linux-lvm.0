Received: from mail.gathman.org (mail.gathman.org [174.64.33.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D03DDC1
	for <linux-lvm@lists.linux.dev>; Mon, 18 Nov 2024 19:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=174.64.33.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731957862; cv=none; b=R/Rh7LVYifnKqBQRn8aGHDpBE4fRYJYWG6MOY1X8Iigq3slZyhb3sGSRSxe+2ElZQ7+j2Wqpn5zT7/USbzbTF5WP6H+1ZnIbMsWxF4egy8WCGN16xF0MG7/ohr1majU1n+WVwAOjvyBNLw+ZekzlUz/HtWJV8m31tHPRP7ocszw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731957862; c=relaxed/simple;
	bh=39DCj8OQevewMpnTcFTDcCPCaZq77hFjCb/6ABjOYV8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WRqgrunYnXQsKNDpJbJ/XtP7JsFMQEwi0BDFXByxJ7dSln8KbIVNeAoXlZirl47QQ8AUv6Ij+dHrltLxHnAQmN0rJdieqAdXuPLTQj+zhmTtDLC9ZHWIJ3ublkgGUcfJRCcb0TJ/e3j5+AEM463XAtRIHgebCMVUAyGRDeCfPOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gathman.org; spf=pass smtp.mailfrom=gathman.org; dkim=pass (1024-bit key) header.d=gathman.org header.i=@gathman.org header.b=DQOQxkYx; arc=none smtp.client-ip=174.64.33.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gathman.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gathman.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gathman.org header.i=@gathman.org header.b="DQOQxkYx"
Authentication-Results: mail.gathman.org; iprev=pass policy.iprev="2001:470:8:809::1010" (wiki.gathman.org); auth=pass (CRAM-MD5 sslbits=256) smtp.auth=stuart
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gathman.org; 
 i=@gathman.org; q=dns/txt; s=default; t=1731954320; 
 h=date : from : to : cc : subject : in-reply-to : 
 message-id : references : mime-version : content-type : 
 date : from : subject; 
 bh=39DCj8OQevewMpnTcFTDcCPCaZq77hFjCb/6ABjOYV8=; 
 b=DQOQxkYxrePNGIZc6bAlcPozfv02kCjp7cnDd2Y3kPJMTglhdvDkZXPQ
 vm1JLaUM41cXDp2m8tTq6xI8oHkdmaisSAUVVkwaS8oR4J06jfXmGWQaJM
 TeESWFoTXS+OpblWvbiMsfGJmIi/AN3vUF5Ts0qrbdfPCUsSdVfxnBJXQ=
Received: from mail.gathman.org (wiki.gathman.org [IPv6:2001:470:8:809::1010])
	(authenticated bits=0)
	by mail.gathman.org (8.14.7/8.14.7) with ESMTP id 4AIIPGNn012226
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 18 Nov 2024 13:25:20 -0500
Date: Mon, 18 Nov 2024 13:25:16 -0500 (EST)
From: Stuart D Gathman <stuart@gathman.org>
To: Gionatan Danti <g.danti@assyoma.it>
cc: Erwin van Londen <erwin@erwinvanlonden.net>,
        Zdenek Kabelac <zdenek.kabelac@gmail.com>, linux-lvm@lists.linux.dev
Subject: Re: Import duplicate VG from a read-only device
In-Reply-To: <8b43f9dfec91899a859d42342a44b94d@assyoma.it>
Message-ID: <a3b56de0-848-5f7-ae6e-269d2a257cb8@gathman.org>
References: <65d1cd8d1b9189ffcd7eb919c91c1b59@assyoma.it> <218e6c33-c5d3-473b-9f5b-3c5684563b30@gmail.com> <aec40095-abbc-43d0-910c-2b001fb1e29b@erwinvanlonden.net> <8b43f9dfec91899a859d42342a44b94d@assyoma.it>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Mon, 18 Nov 2024, Gionatan Danti wrote:

> Sure, I completely agree with both.
> I was just curious to know if I was missing something obvious.

I would use device mapper to create a writable overlay block device
of the readonly block device (like Live media does) and rename that to
import.  No monkeying about with namespaces.
