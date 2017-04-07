Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F02E69EAF0
	for <linux-lvm@redhat.com>; Fri,  7 Apr 2017 16:33:52 +0000 (UTC)
Received: from mr002msb.fastweb.it (mr002msb.fastweb.it [85.18.95.86])
	by mx1.redhat.com (Postfix) with ESMTP id 5CB3680510
	for <linux-lvm@redhat.com>; Fri,  7 Apr 2017 16:33:49 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 07 Apr 2017 18:33:47 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <58E7992A.4030000@tlinx.org>
References: " <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>"
	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
	<fe625ba1be451139dd871982a24fb9ba@assyoma.it>
	<58E7992A.4030000@tlinx.org>
Message-ID: <dc7ab70743a92705e6be6fefab2d29d0@assyoma.it>
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
Cc: Mark Mielke <mark.mielke@gmail.com>, L A Walsh <lvm@tlinx.org>

Il 07-04-2017 15:50 L A Walsh ha scritto:
> Gionatan Danti wrote:
>> I more concerned about lenghtly snapshot activation due to a big, 
>> linear CoW table that must be read completely...
> ---
>    What is 'big'?  Are you just worried about the IO time?
> If that's the case, much will depend on your HW.  Are we talking
> using 8T hard disks concatenated into a single volume, or in a
> RAID1, or what?  W/a HW-RAID10 getting over 1GB/s isn't
> difficult for a contiguous read.  So how big is the CoW table
> and how fragmented is it?  Even w/fragments, with enough spindles
> you could still, likely, get enough I/O Ops where I/O speed shouldn't
> be a critical bottleneck...

For the logical volume itself, I target a 8+ TB size. However, what 
worries me is *not* LV size by itself (I know that LVM can be used on 
volume much bigger than that), rather the snapshot CoW table. In short, 
from reading this list and from first-hand testing, big snapshots (20+ 
GB) require lenghtly activation, due to inefficiency in how classic 
metadata (ie: non thinly-provided) are layed out/used. However, I read 
that this was somewhat addressed lately. Do you have any insight?

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
