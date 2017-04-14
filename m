Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7269C17A67
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2017 15:53:23 +0000 (UTC)
Received: from mr001msb.fastweb.it (mr001msb.fastweb.it [85.18.95.85])
	by mx1.redhat.com (Postfix) with ESMTP id 3F7CA8123A
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2017 15:53:20 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 14 Apr 2017 17:53:18 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <783965ccb392bea2faded10436cdaf39@xenhideout.nl>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
	<fe625ba1be451139dd871982a24fb9ba@assyoma.it>
	<58E7992A.4030000@tlinx.org>
	<dc7ab70743a92705e6be6fefab2d29d0@assyoma.it>
	<ece5d455-87e7-5d7c-18a4-a51355f28307@gathman.org>
	<062fccc39afe128ef5950634309a01ea@assyoma.it>
	<783965ccb392bea2faded10436cdaf39@xenhideout.nl>
Message-ID: <0658b33a7d4e5494de71231b7343a514@assyoma.it>
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

Il 14-04-2017 17:23 Xen ha scritto:
> A thin snapshot won't be dropped. It is allocated with the same size
> as the origin volume and hence can never fill up.
> 
> Only the pool itself can fill up but unless you have some monitoring
> software in place that can intervene in case of anomaly and kill the
> snapshot, your system will or may simply freeze and not drop anything.
> 

Yeah, I understand that. In that sentence, I was speaking about classic 
LVM snapshot.

The dilemma is:
- classic LVM snapshots have low performance (but adequate for backup 
purpose) and, if growing too much, snapshot activation can be 
problematic (especially on boot);
- thin-snapshots have much better performance but does not always fail 
gracefully (ie: pool full).

For nightly backups, what you would pick between the two?
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
