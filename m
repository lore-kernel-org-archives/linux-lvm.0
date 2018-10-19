Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CC0F19808
	for <linux-lvm@redhat.com>; Fri, 19 Oct 2018 20:54:32 +0000 (UTC)
Received: from mr013msb.fastweb.it (mr013msb.fastweb.it [85.18.95.104])
	by mx1.redhat.com (Postfix) with ESMTP id DA77A76554
	for <linux-lvm@redhat.com>; Fri, 19 Oct 2018 20:54:28 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 19 Oct 2018 22:54:26 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <c6043f6f-f10a-5e6f-19ba-b50508e48ee0@redhat.com>
References: <de207689-775b-5c36-1443-e035f19ff65f@izyk.ru>
	<06b65c62-8ca2-0d29-b98d-1a1585141f81@redhat.com>
	<8ecbd3c8-4819-9ff2-40b1-315e6ae03c97@izyk.ru>
	<36f0f734-c49f-eaf9-7ff5-8aedfd7345b3@redhat.com>
	<707aafdc-cfd2-3bdd-13bb-1bfdc08c6ad9@assyoma.it>
	<c6043f6f-f10a-5e6f-19ba-b50508e48ee0@redhat.com>
Message-ID: <17a367c7043400e4890738b00afcb011@assyoma.it>
Subject: Re: [linux-lvm]
	=?utf-8?q?Why_doesn=27t_the_lvmcache_support_the_disc?=
	=?utf-8?q?ard_=28trim=29_command=3F?=
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Ilia Zykov <mail@izyk.ru>

Il 19-10-2018 15:08 Zdenek Kabelac ha scritto:
> Hi
> 
> It's rather about different workload takes benefit from different
> caching approaches.
> 
> If your system is heavy on writes -  dm-writecache is what you want,
> if you mostly reads - dm-cache will win.
> 
> That's why there is  dmstats to also help identify hotspots and overal 
> logic.
> There is nothing to win always in all cases - so ATM 2 different
> targets are provided -  NVDIMMs already seems to change game a lot...
> 
> dm-writecache could be seen as 'extension' of your page-cache to held
> longer list of dirty-pages...
> 
> Zdenek

Thanks for these information. Reading a bit the commit which provide 
dm-writeback, it seems a sort of "L2 pagecache", right? It should be 
*very* interesting for use with NVDIMMs and/or fast NVME devices...

Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
