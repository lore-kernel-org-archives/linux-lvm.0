Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1A7C17CD6
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2017 19:20:58 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3C0ABC04B30E
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2017 19:20:55 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.signet.nl (Postfix) with ESMTP id 87C0F40D25D3
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2017 21:20:53 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 14 Apr 2017 21:20:53 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <341979ccda1b2ee7cb5242006f1b03c8@assyoma.it>
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
	<341979ccda1b2ee7cb5242006f1b03c8@assyoma.it>
Message-ID: <3e09a763ff22db4c39ae376760f5cd73@xenhideout.nl>
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

Gionatan Danti schreef op 14-04-2017 20:59:
> Il 14-04-2017 19:36 Xen ha scritto:
>> The thing is just dismounted apparently; I don't even know what causes 
>> it.
>> 
> 
> Maybe running "iotop -a" for some hours can point you to the right 
> direction?
> 
>> The other volumes are thin. I am just very afraid of the thing filling
>> up due to some runaway process or an error on my part.
>> 
>> If I have a 30GB volume and a 30GB snapshot of that volume, and if
>> this volume is nearly empty and something starts filling it up, it
>> will do twice the writes to the thin pool. Any damage done is doubled.
>> 
>> The only thing that could save you (me) at this point is a process
>> instantly responding to some 90% full message and hoping it'd be in
>> time. Of course I don't have this monitoring in place; everything
>> requires work.
> 
> There is something similar already in place: when pool utilization is
> over 95%, lvmthin *should* try a (lazy) umount. Give a look here:
> https://www.redhat.com/archives/linux-lvm/2016-May/msg00042.html

I even forgot about that. I have such bad memory.

Checking back, the host that I am now on uses LVM 111 (Debian 8). The 
next update is to... 111 ;-).

That was almost a year ago. You were using version 130 back then. I am 
still on 111 on Debian ;-).

Zdenek recommended 142 back then.

I could take it out of testing though. Version 168.


> Monitoring is a great thing; anyway, a safe fail policy would be *very* 
> nice...

A lazy umount does not invalidate any handles by processes for example 
having a directory open.

I believe there was an issue with the remount -o ro call? Taking too 
much resources for the daemon?

Anyway I am very happy that it happens if it happens; the umount.

I just don't feel comfortable about the system at all. I just don't want 
it to crash :p.
