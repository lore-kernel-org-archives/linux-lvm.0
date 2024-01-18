Received: from plutone.assyoma.it (cloud.assyoma.it [212.237.56.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C174B2E626
	for <linux-lvm@lists.linux.dev>; Thu, 18 Jan 2024 19:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.237.56.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705607413; cv=none; b=W9gwJqx1Tarulk8LnJOkgO5BI1k9OI6paQIG5T5piD2RvRXera8Wacbp5FwwynSLO2+uEXqboWcLY1weCvuaKbsMEEBQlD7Ij9QoVNAPzllOG32QmemWhchN9bzphhIose2vAPHEd/ySuB/fRTuWcmJ5VSjohllJoLb4/AedT/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705607413; c=relaxed/simple;
	bh=XWOkEaFj/waxk2IwgmbwuwE10SIMHxLFm/7dR6MrF0k=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Hy+dC3GxppUticQIqnEOl5U4VCmfD7GMzk4IcQXTclJ5WnkDKxDXGVJ6zmaBUWhWak3cgj+MbFPiGongdPeb+VW/7WX0wL4VZ9SFMIkqVlLKianYhkXQwqyucAKpVkBRsyLEDNMrx3np1queNht7f0dLm1KKIdt5IKdRCigxJeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=assyoma.it; spf=pass smtp.mailfrom=assyoma.it; arc=none smtp.client-ip=212.237.56.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=assyoma.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=assyoma.it
Received: from webmail.assyoma.it (localhost [IPv6:::1])
	by plutone.assyoma.it (Postfix) with ESMTPSA id 8E4E9E03BFDF;
	Thu, 18 Jan 2024 20:50:06 +0100 (CET)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 18 Jan 2024 20:50:06 +0100
From: Gionatan Danti <g.danti@assyoma.it>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: lists.linux.dev@frank.fyi, linux-lvm@lists.linux.dev
Subject: Re: add volatile flag to PV/LVs (for cache) to avoid degraded state
 on reboot
In-Reply-To: <3d1e18f3-a79f-4e0d-8b6c-7f10e5c8debf@gmail.com>
References: <pyftyueewc6bobclhkb2eqnbjnhsem3fk3euhjmqrxz5d7eevn@ejymv4rlmb5m>
 <5848cefc-bc5e-4f23-8278-d1654607398f@gmail.com>
 <498260979ce52ebe20da0c0a36a4342e@assyoma.it>
 <3d1e18f3-a79f-4e0d-8b6c-7f10e5c8debf@gmail.com>
Message-ID: <a20030d9127e3d799111c5aab4e1ed88@assyoma.it>
X-Sender: g.danti@assyoma.it
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Il 2024-01-18 16:40 Zdenek Kabelac ha scritto:
> But it further needs some lvm2 metadata update to maintain the 'state'
> of metadata - so if there is again some 'reboot' and PV with cache
> appears back - it will not interfere with the system (aka providing
> some historical cached blocks,  so just like mirrored leg needs some
> care...)

Hi Zdenek,
yes, this is a valid point: if the cache device reappears and starts 
providing old blocks, then data corruption can happen.

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
