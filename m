Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r99LnuB7012187
	for <linux-lvm@redhat.com>; Wed, 9 Oct 2013 17:49:56 -0400
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe005.messaging.microsoft.com [216.32.181.185])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r99LntPx005080
	for <linux-lvm@redhat.com>; Wed, 9 Oct 2013 17:49:55 -0400
Received: from mail83-ch1 (localhost [127.0.0.1])	by mail83-ch1-R.bigfish.com
	(Postfix) with ESMTP id 346C4160082	for <linux-lvm@redhat.com>;
	Wed,  9 Oct 2013 21:49:55 +0000 (UTC)
Received: from CH1EHSMHS033.bigfish.com (snatpool3.int.messaging.microsoft.com
	[10.43.68.226])	by mail83-ch1.bigfish.com (Postfix) with ESMTP id
	C972D48004E
	for <linux-lvm@redhat.com>; Wed,  9 Oct 2013 21:49:52 +0000 (UTC)
Message-ID: <5255CF7F.5030709@tekcomms.com>
Date: Wed, 9 Oct 2013 16:49:51 -0500
From: Joe Harvell <joe.harvell@tekcomms.com>
MIME-Version: 1.0
References: <5255CAB1.5050606@tekcomms.com>
In-Reply-To: <5255CAB1.5050606@tekcomms.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] pvs complains of missing PVs that are not missing
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

> As part of moving disks from one system to another, somehow LVM thinks 
> PVS are missing in the new system but they are not.  Before I explain 
> the relevant chain of events related to moving the disks, here is the 
> problem as it manifests in the new system:
>
> [snip]
>

I forgot to mention the LVM version info:

joey@akita /dev/disk/by-id $ sudo lvm version
   LVM version:     2.02.103(2) (2013-10-04)
   Library version: 1.02.82 (2013-10-04)
   Driver version:  4.25.0
j
