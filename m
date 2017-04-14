Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CA6C785FD
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2017 07:27:22 +0000 (UTC)
Received: from mr003msb.fastweb.it (mr003msb.fastweb.it [85.18.95.87])
	by mx1.redhat.com (Postfix) with ESMTP id 3B9C03D978
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2017 07:27:21 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 14 Apr 2017 09:27:20 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <dd14a71d-3d35-6c75-698e-25cda1ff2d44@redhat.com>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
	<fe625ba1be451139dd871982a24fb9ba@assyoma.it>
	<58E7992A.4030000@tlinx.org>
	<dc7ab70743a92705e6be6fefab2d29d0@assyoma.it>
	<ece5d455-87e7-5d7c-18a4-a51355f28307@gathman.org>
	<7732cbebfc561db0d8749310f1ba010f@xenhideout.nl>
	<dd14a71d-3d35-6c75-698e-25cda1ff2d44@redhat.com>
Message-ID: <b3a5b2c8c1e84174c44267c7dede1f24@assyoma.it>
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

Il 13-04-2017 16:33 Zdenek Kabelac ha scritto:
> 
> Hello
> 
> Just let's repeat.
> 
> Full thin-pool is NOT in any way comparable to full filesystem.
> 
> Full filesystem has ALWAYS room for its metadata - it's not pretending
> it's bigger - it has 'finite' space and expect this space to just BE
> there.
> 
> Now when you have thin-pool - it cause quite a lot of trouble across
> number of layers.  There are solvable and being fixed.
> 
> But as the rule #1 still applies - do not run your thin-pool out of
> space - it will not always heal easily without losing date - there is
> not a simple straighforward way how to fix it (especially when user
> cannot ADD any new space he promised to have)
> 
> So monitoring pool and taking action ahead in time is always superior
> solution to any later  postmortem systems restores.
> 

If I remember correctly, EXT4 with error=remount-ro should freeze the 
filesystem as soon as write errors are detected. Is this configuration 
safer than standard behavior? Do you know if XFS (RHEL *default* 
filesystem) supports something similar?

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
