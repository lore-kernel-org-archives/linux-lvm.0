Received: from plutone.assyoma.it (cloud.assyoma.it [212.237.56.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AC31DFE6
	for <linux-lvm@lists.linux.dev>; Wed, 20 Dec 2023 18:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=assyoma.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=assyoma.it
Received: from webmail.assyoma.it (localhost [IPv6:::1])
	by plutone.assyoma.it (Postfix) with ESMTPSA id B79EDE13E396;
	Wed, 20 Dec 2023 19:28:32 +0100 (CET)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 20 Dec 2023 19:28:32 +0100
From: Gionatan Danti <g.danti@assyoma.it>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: Wolf480pl <wolf480@interia.pl>, linux-lvm@lists.linux.dev
Subject: Re: lvmcache not promoting blocks when there's free RAM
In-Reply-To: <1c2a0807-848d-4c2f-89b7-04b28b4031dc@gmail.com>
References: <cd95e52c-1f72-4dd3-b7b1-3581fb76a7b3@interia.pl>
 <1c2a0807-848d-4c2f-89b7-04b28b4031dc@gmail.com>
Message-ID: <e78e6204c7a32fa0b85eb3683856f702@assyoma.it>
X-Sender: g.danti@assyoma.it
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Il 2023-12-20 16:42 Zdenek Kabelac ha scritto:
> dm-cache target (ATM) is focusing on figuring out 'hotspot' areas of
> your disk readings.

Hi Zdenek,
back in the mq days, read_promote_adjustment and 
write_promote_adjustment could be tuned to get more aggressive caching.

Does smq have something similar? I can not find anything in the docs...

Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
