Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A41211755B
	for <linux-lvm@redhat.com>; Fri,  7 Apr 2017 14:13:43 +0000 (UTC)
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B1E107EBB6
	for <linux-lvm@redhat.com>; Fri,  7 Apr 2017 14:13:42 +0000 (UTC)
Message-ID: <58E7992A.4030000@tlinx.org>
Date: Fri, 07 Apr 2017 06:50:34 -0700
From: L A Walsh <lvm@tlinx.org>
MIME-Version: 1.0
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
	<fe625ba1be451139dd871982a24fb9ba@assyoma.it>
In-Reply-To: <fe625ba1be451139dd871982a24fb9ba@assyoma.it>
Content-Transfer-Encoding: 7bit
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

Gionatan Danti wrote:
> I more concerned about lenghtly snapshot activation due to a big, 
> linear CoW table that must be read completely...
---
    What is 'big'?  Are you just worried about the IO time?
If that's the case, much will depend on your HW.  Are we talking
using 8T hard disks concatenated into a single volume, or in a
RAID1, or what?  W/a HW-RAID10 getting over 1GB/s isn't
difficult for a contiguous read.  So how big is the CoW table
and how fragmented is it?  Even w/fragments, with enough spindles
you could still, likely, get enough I/O Ops where I/O speed shouldn't
be a critical bottleneck...

    However, regarding performance, I used to take daily snapshots
using normal LVM (before thin was available) w/rsync creating a
a difference volume between yesterday's snapshot and today's content.
On a 1TB volume @ ~75% full, it would take 45min - 1.5 hours to
create.  Multiplied by 8...backups wouldn't just be 'nightly'.
That was using about 12 data spindles.

    Unfortunately I've never benched the thin volumes.  Also,
they were NOT for backup purposes (those were separate using
xfsdump).  Besides performance and reliability, a main reason
to use snapshots was to provide "previous versions" of files to
windows clients.  That allowed quick recoveries from file-wiping
mistakes by opening the previous version of the file or
containing directory.
