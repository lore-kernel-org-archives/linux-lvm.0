Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4233DA27A2
	for <linux-lvm@redhat.com>; Thu, 13 Apr 2017 13:52:21 +0000 (UTC)
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8D0BE81F07
	for <linux-lvm@redhat.com>; Thu, 13 Apr 2017 13:52:19 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.signet.nl (Postfix) with ESMTP id C83DE762D8
	for <linux-lvm@redhat.com>; Thu, 13 Apr 2017 15:52:17 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Thu, 13 Apr 2017 15:52:17 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <ece5d455-87e7-5d7c-18a4-a51355f28307@gathman.org>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
	<fe625ba1be451139dd871982a24fb9ba@assyoma.it>
	<58E7992A.4030000@tlinx.org>
	<dc7ab70743a92705e6be6fefab2d29d0@assyoma.it>
	<ece5d455-87e7-5d7c-18a4-a51355f28307@gathman.org>
Message-ID: <7732cbebfc561db0d8749310f1ba010f@xenhideout.nl>
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

Stuart Gathman schreef op 13-04-2017 14:59:

> If you are going to keep snapshots around indefinitely, the thinpools
> are probably the way to go.  (What happens when you fill up those?
> Hopefully it "freezes" the pool rather than losing everything.)

My experience is that the system crashes.

I have not tested this with a snapshot but a general thin pool overflow 
crashes the system.

Within half a minute, I think.

It is irrelevant whether the volumes had anything to do with the 
operation of the system; ie. some mounted volumes that you write to that 
are in no other use will crash the system.
