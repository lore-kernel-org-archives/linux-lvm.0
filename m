Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30E8378340
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2017 15:18:00 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C78FE31F3E0
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2017 15:17:56 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.signet.nl (Postfix) with ESMTP id 0D06040D25C3
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2017 17:17:55 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 14 Apr 2017 17:17:55 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <alpine.LRH.2.20.1704131329360.15402@fairfax.gathman.org>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
	<fe625ba1be451139dd871982a24fb9ba@assyoma.it>
	<58E7992A.4030000@tlinx.org>
	<dc7ab70743a92705e6be6fefab2d29d0@assyoma.it>
	<ece5d455-87e7-5d7c-18a4-a51355f28307@gathman.org>
	<7732cbebfc561db0d8749310f1ba010f@xenhideout.nl>
	<dd14a71d-3d35-6c75-698e-25cda1ff2d44@redhat.com>
	<016916bc-b369-5efa-d48d-bd49cc7fd57b@gathman.org>
	<759c96fae2344adff733ded154bfdd16@xenhideout.nl>
	<alpine.LRH.2.20.1704131329360.15402@fairfax.gathman.org>
Message-ID: <6b9518b7eaebc3574661390199599594@xenhideout.nl>
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

Stuart D. Gathman schreef op 13-04-2017 19:32:
> On Thu, 13 Apr 2017, Xen wrote:
> 
>> Stuart Gathman schreef op 13-04-2017 17:29:
>> 
>>>  IMO, the friendliest thing to do is to freeze the pool in read-only 
>>> mode
>>>  just before running out of metadata.
>> 
>> It's not about metadata but about physical extents.
>> 
>> In the thin pool.
> 
> Ok.  My understanding is that *all* the volumes in the same thin-pool
> would have to be frozen when running out of extents, as writes all
> pull from
> the same pool of physical extents.

Yes, I simply tested with a small thin pool not used for anything else.

The volumes were not more than a few hundred megabytes big, so easy to 
fill up.

Putting a file copy to one of the volumes that the pool couldn't handle, 
the system quickly crashed.

Upon reboot it was neatly filled 100% and I could casually remove the 
volumes or whatever.
