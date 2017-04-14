Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3F167E2D7
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2017 15:23:42 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D001CC0467CF
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2017 15:23:41 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.signet.nl (Postfix) with ESMTP id 80BC540D25C3
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2017 17:23:40 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 14 Apr 2017 17:23:40 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <062fccc39afe128ef5950634309a01ea@assyoma.it>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
	<fe625ba1be451139dd871982a24fb9ba@assyoma.it>
	<58E7992A.4030000@tlinx.org>
	<dc7ab70743a92705e6be6fefab2d29d0@assyoma.it>
	<ece5d455-87e7-5d7c-18a4-a51355f28307@gathman.org>
	<062fccc39afe128ef5950634309a01ea@assyoma.it>
Message-ID: <783965ccb392bea2faded10436cdaf39@xenhideout.nl>
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

Gionatan Danti schreef op 14-04-2017 9:23:
> Il 13-04-2017 14:59 Stuart Gathman ha scritto:
>> Using a classic snapshot for backup does not normally involve 
>> activating
>> a large CoW.  I generally create a smallish snapshot (a few gigs),  
>> that
>> will not fill up during the backup process.   If for some reason, a
>> snapshot were to fill up before backup completion, reads from the
>> snapshot get I/O errors (I've tested this), which alarms and aborts 
>> the
>> backup.  Yes, keeping a snapshot around and activating it at boot can 
>> be
>> a problem as the CoW gets large.
>> 
>> If you are going to keep snapshots around indefinitely, the thinpools
>> are probably the way to go.  (What happens when you fill up those?
>> Hopefully it "freezes" the pool rather than losing everything.)
>> 
> 
> Hi, no need to keep snapshot around. If so, the classic LVM solution
> would be completely inadequate.
> 
> I simply worry that, with many virtual machines, even the temporary
> backup snapshot can fill up and cause some problem. When the snapshot
> fills, apart from it being dropped, there is anything I need to be
> worried about?

A thin snapshot won't be dropped. It is allocated with the same size as 
the origin volume and hence can never fill up.

Only the pool itself can fill up but unless you have some monitoring 
software in place that can intervene in case of anomaly and kill the 
snapshot, your system will or may simply freeze and not drop anything.
