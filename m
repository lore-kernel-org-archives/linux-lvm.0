Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2794260A9D
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2017 18:59:06 +0000 (UTC)
Received: from mr001msb.fastweb.it (mr001msb.fastweb.it [85.18.95.85])
	by mx1.redhat.com (Postfix) with ESMTP id 8B8498553F
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2017 18:59:03 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 14 Apr 2017 20:59:01 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <88a2badd9b77546407bba31778c00699@xenhideout.nl>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
	<fe625ba1be451139dd871982a24fb9ba@assyoma.it>
	<58E7992A.4030000@tlinx.org>
	<dc7ab70743a92705e6be6fefab2d29d0@assyoma.it>
	<ece5d455-87e7-5d7c-18a4-a51355f28307@gathman.org>
	<062fccc39afe128ef5950634309a01ea@assyoma.it>
	<783965ccb392bea2faded10436cdaf39@xenhideout.nl>
	<0658b33a7d4e5494de71231b7343a514@assyoma.it>
	<88a2badd9b77546407bba31778c00699@xenhideout.nl>
Message-ID: <341979ccda1b2ee7cb5242006f1b03c8@assyoma.it>
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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
Cc: Xen <list@xenhideout.nl>

Il 14-04-2017 19:36 Xen ha scritto:
> The thing is just dismounted apparently; I don't even know what causes 
> it.
> 

Maybe running "iotop -a" for some hours can point you to the right 
direction?

> The other volumes are thin. I am just very afraid of the thing filling
> up due to some runaway process or an error on my part.
> 
> If I have a 30GB volume and a 30GB snapshot of that volume, and if
> this volume is nearly empty and something starts filling it up, it
> will do twice the writes to the thin pool. Any damage done is doubled.
> 
> The only thing that could save you (me) at this point is a process
> instantly responding to some 90% full message and hoping it'd be in
> time. Of course I don't have this monitoring in place; everything
> requires work.

There is something similar already in place: when pool utilization is 
over 95%, lvmthin *should* try a (lazy) umount. Give a look here: 
https://www.redhat.com/archives/linux-lvm/2016-May/msg00042.html

Monitoring is a great thing; anyway, a safe fail policy would be *very* 
nice...

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
