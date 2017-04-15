Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0C5D5C54F
	for <linux-lvm@redhat.com>; Sat, 15 Apr 2017 21:23:03 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6604CC04B32C
	for <linux-lvm@redhat.com>; Sat, 15 Apr 2017 21:23:00 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.signet.nl (Postfix) with ESMTP id BE79440F38BD
	for <linux-lvm@redhat.com>; Sat, 15 Apr 2017 23:22:58 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 15 Apr 2017 23:22:58 +0200
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
Message-ID: <5dd89d176b5a90c73920c91c3ba466c7@xenhideout.nl>
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

I actually think it is enough if 225 extents get written. The snapshot 
is 924 MB or 250-25 extents.

I think it only needs to write in 225 different places on the disk (225 
different 4MB sectors) to fill the snapshot up.

Cause there is no way in hell that an actual 924 MB would be written, 
because the entire system is not more than 5GB and the entire systemd 
journal is not more than maybe 28 MB :p.
