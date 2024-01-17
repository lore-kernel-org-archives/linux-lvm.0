Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C791DFF2
	for <linux-lvm@lists.linux.dev>; Wed, 17 Jan 2024 14:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705500617; cv=none; b=lzWOmIQLh4Zs/w1Xhoj7mKeUlXYPvqJ4OiUSOTB/IA/jA8fDmWqg3kNI3lJtsZbcBBLR35rAE59Z1DUAn8nq3sCqcewXBczeE9uswcEHKHqXj6BwpLVy876dXkoD5yls38QH+fv3ML2FJ/CA+RY4zAXh8MH8jSgXlUbttE0PQCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705500617; c=relaxed/simple;
	bh=XuXApmX9OBuY2ZqXCClksqxQw+rx0dK3ZdWrlB30TnA=;
	h=Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding; b=qxCefWdBHSaiB3WbtPZmOJFyWjsyZzTRpHNJN3J7KGNdIU2AsJX+8Jl8VAPorHWVnx2yKxMl49RmgWYQG+5pEgdM/eZ2msUNZgPrWhZPWElDzJx3fQ+xaGI60bpwOYvwM/MhQggOxSuvEFmM8AzBw77WB7+EnyDHE7BA8kkXlt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thesusis.net; spf=pass smtp.mailfrom=thesusis.net; arc=none smtp.client-ip=34.202.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thesusis.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thesusis.net
Received: by vps.thesusis.net (Postfix, from userid 1000)
	id B9F8D153B1E; Wed, 17 Jan 2024 09:10:15 -0500 (EST)
From: Phillip Susi <phill@thesusis.net>
To: Andy Smith <andy@strugglers.net>
Cc: linux-lvm@lists.linux.dev
Subject: Re: Any way in LVM to deal with 512e vs 4Kn physical devices?
In-Reply-To: <ZaeAJtE+0Gmp2b0E@mail.bitfolk.com>
References: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
 <87y1cp9lwi.fsf@vps.thesusis.net> <ZabjW4HWOSfy8sRN@mail.bitfolk.com>
 <ZaeAJtE+0Gmp2b0E@mail.bitfolk.com>
Date: Wed, 17 Jan 2024 09:10:15 -0500
Message-ID: <87frywcapk.fsf@vps.thesusis.net>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Andy Smith <andy@strugglers.net> writes:

> So, the actual problem here is something about the MBR partition
> table. Off-topic now for this list but I wonder if there is a safe
> and reliable way to modify such a partition table after sync to
> allow this to work=E2=80=A6

Like I said before, as long as the start and length of each partition is
an even multiple of 8, just divide them by 8 and recreate the partition
table using those values.

