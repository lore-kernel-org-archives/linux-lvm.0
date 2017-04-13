Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B5C29FDF7
	for <linux-lvm@redhat.com>; Thu, 13 Apr 2017 14:47:45 +0000 (UTC)
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7F633F823
	for <linux-lvm@redhat.com>; Thu, 13 Apr 2017 14:47:43 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.signet.nl (Postfix) with ESMTP id CEAE95299F
	for <linux-lvm@redhat.com>; Thu, 13 Apr 2017 16:47:41 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Thu, 13 Apr 2017 16:47:41 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <dd14a71d-3d35-6c75-698e-25cda1ff2d44@redhat.com>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
	<fe625ba1be451139dd871982a24fb9ba@assyoma.it>
	<58E7992A.4030000@tlinx.org>
	<dc7ab70743a92705e6be6fefab2d29d0@assyoma.it>
	<ece5d455-87e7-5d7c-18a4-a51355f28307@gathman.org>
	<7732cbebfc561db0d8749310f1ba010f@xenhideout.nl>
	<dd14a71d-3d35-6c75-698e-25cda1ff2d44@redhat.com>
Message-ID: <ac4455cae4f85e8a60ab0e872ab0977e@xenhideout.nl>
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
To: linux-lvm@redhat.com

Zdenek Kabelac schreef op 13-04-2017 16:33:

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

Yes that's what I said. If your thin pool runs out, your system will 
crash.

Thanks for alluding that this will also happen if a thin snapshot causes 
this (obviously).

Regards.
