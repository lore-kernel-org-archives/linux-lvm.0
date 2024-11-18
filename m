Received: from plutone.assyoma.it (cloud.assyoma.it [212.237.56.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440DE13E8AE
	for <linux-lvm@lists.linux.dev>; Mon, 18 Nov 2024 20:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.237.56.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731962706; cv=none; b=oDr69KOHSEKXKzF1o1tDZNUkVScMHRHcsy0NWLKOiHrfdkcoE3NQrj5Acpe7W38ki2PuIb2TTmdLLDUxOBAIjPeU0ZRN5/Kv4Sbh50xUYWi8SLkfno4c4J/CWQwgX4Q1GK6OvsOyglCyUZeeiq0KSYhKrGmHPz06Bt6IUDaDSVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731962706; c=relaxed/simple;
	bh=3Kicth9RDJGRdHi+bzT5SsPrayhLQA5/pUbR+A53ZbU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=DdxlQfVPmAQ/1U1yKdAl1LFuKhVks51E1RSCKCQ3ht7M1tFuXa3j8q7RlOdZyg2CnH0madKq3CU6gHqF2jAlgF9VhbSYthWhyeNUknEbR/VLpijaQGTjjYM01J5zJg6sPdwaxsuyBxOrT5t73smTV5LwG0mqcDAQzrCZBD9riak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=assyoma.it; spf=pass smtp.mailfrom=assyoma.it; arc=none smtp.client-ip=212.237.56.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=assyoma.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=assyoma.it
Received: from webmail.assyoma.it (localhost [IPv6:::1])
	by plutone.assyoma.it (Postfix) with ESMTP id 3843414AD3D3;
	Mon, 18 Nov 2024 21:44:58 +0100 (CET)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 18 Nov 2024 21:44:58 +0100
From: Gionatan Danti <g.danti@assyoma.it>
To: Stuart D Gathman <stuart@gathman.org>
Cc: Erwin van Londen <erwin@erwinvanlonden.net>, Zdenek Kabelac
 <zdenek.kabelac@gmail.com>, linux-lvm@lists.linux.dev
Subject: Re: Import duplicate VG from a read-only device
In-Reply-To: <a3b56de0-848-5f7-ae6e-269d2a257cb8@gathman.org>
References: <65d1cd8d1b9189ffcd7eb919c91c1b59@assyoma.it>
 <218e6c33-c5d3-473b-9f5b-3c5684563b30@gmail.com>
 <aec40095-abbc-43d0-910c-2b001fb1e29b@erwinvanlonden.net>
 <8b43f9dfec91899a859d42342a44b94d@assyoma.it>
 <a3b56de0-848-5f7-ae6e-269d2a257cb8@gathman.org>
Message-ID: <3926950228f7dd0f8552aa53cc01c61c@assyoma.it>
X-Sender: g.danti@assyoma.it
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Il 2024-11-18 19:25 Stuart D Gathman ha scritto:
> I would use device mapper to create a writable overlay block device
> of the readonly block device (like Live media does) and rename that to
> import.  No monkeying about with namespaces.

Yes, it would probably be the only solution with a real read-only 
device.

Still, I remember the good old advice to not touch the dm table when 
using LVM (to avoid doing something wrong with the LVM-managed tables) - 
so I would probably be more comfortable using a live media to rename the 
duplicate VG.

Thanks.
