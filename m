Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DAB0C05D0
	for <linux-lvm@redhat.com>; Thu, 13 Apr 2017 15:43:21 +0000 (UTC)
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B14A166CB9
	for <linux-lvm@redhat.com>; Thu, 13 Apr 2017 15:43:19 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.signet.nl (Postfix) with ESMTP id 472BCEFEC2
	for <linux-lvm@redhat.com>; Thu, 13 Apr 2017 17:43:18 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Thu, 13 Apr 2017 17:43:18 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <016916bc-b369-5efa-d48d-bd49cc7fd57b@gathman.org>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
	<fe625ba1be451139dd871982a24fb9ba@assyoma.it>
	<58E7992A.4030000@tlinx.org>
	<dc7ab70743a92705e6be6fefab2d29d0@assyoma.it>
	<ece5d455-87e7-5d7c-18a4-a51355f28307@gathman.org>
	<7732cbebfc561db0d8749310f1ba010f@xenhideout.nl>
	<dd14a71d-3d35-6c75-698e-25cda1ff2d44@redhat.com>
	<016916bc-b369-5efa-d48d-bd49cc7fd57b@gathman.org>
Message-ID: <759c96fae2344adff733ded154bfdd16@xenhideout.nl>
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

Stuart Gathman schreef op 13-04-2017 17:29:

> IMO, the friendliest thing to do is to freeze the pool in read-only 
> mode
> just before running out of metadata.

It's not about metadata but about physical extents.

In the thin pool.

> While still involving application
> level data loss (the data it was just trying to write), and still
> crashing the system (the system may be up and pingable and maybe even
> sshable, but is "crashed" for normal purposes)

Then it's not crashed. Only some application that may make use of the 
data volume may be crashed, but not the entire system.

The point is that errors and some filesystem that has errors=remount-ro, 
is okay.

If a regular snapshot that is mounted fills up, the mount is dropped.

System continues operating, as normal.

> , it is simple to
> understand and recover.   A sysadmin could have a plain LV for the
> system volume, so that logs and stuff would still be kept, and admin
> logins work normally.  There is no panic, as the data is there 
> read-only.

Yeah a system panic in terms of some volume becoming read-only is 
perfectly acceptable.

However the kernel going entirely mayhem, is not.
