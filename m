Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 201CFAACC5
	for <linux-lvm@redhat.com>; Fri,  7 Apr 2017 09:12:30 +0000 (UTC)
Received: from mr003msb.fastweb.it (mr003msb.fastweb.it [85.18.95.87])
	by mx1.redhat.com (Postfix) with ESMTP id BE12619CF96
	for <linux-lvm@redhat.com>; Fri,  7 Apr 2017 09:12:27 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 07 Apr 2017 11:12:25 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
Message-ID: <fe625ba1be451139dd871982a24fb9ba@assyoma.it>
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
Cc: Mark Mielke <mark.mielke@gmail.com>

Il 07-04-2017 10:19 Mark Mielke ha scritto:
> 
> I found classic LVM snapshots to suffer terrible performance. I
> switched to BTRFS as a result, until LVM thin pools became a real
> thing, and I happily switched back.

So you are now on lvmthin? Can I ask on what pool/volume/filesystem 
size?

> 
> I expect this depends on exactly what access patterns you have, how
> many accesses will happen during the time the snapshot is held, and
> whether you are using spindles or flash. Still, even with some attempt
> to be objective and critical... I think I would basically never use
> classic LVM snapshots for any purpose, ever.
> 

Sure, but for nightly backups reduced performance should not be a 
problem. Moreover, increasing snapshot chunk size (eg: from default 4K 
to 64K) gives much faster write performance.

I more concerned about lenghtly snapshot activation due to a big, linear 
CoW table that must be read completely...

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
