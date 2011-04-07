Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p378W5kT012355
	for <linux-lvm@redhat.com>; Thu, 7 Apr 2011 04:32:05 -0400
Received: from mail.ynet.co.nz (mail.ynet.co.nz [210.48.92.21])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p378W1l3024363
	for <linux-lvm@redhat.com>; Thu, 7 Apr 2011 04:32:01 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.ynet.co.nz (Postfix) with ESMTP id 2EFB12721A3
	for <linux-lvm@redhat.com>; Thu,  7 Apr 2011 20:32:00 +1200 (NZST)
Received: from mail.ynet.co.nz ([127.0.0.1])
	by localhost (mail.ynet.co.nz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L2eX1q6pGRPi for <linux-lvm@redhat.com>;
	Thu,  7 Apr 2011 20:31:56 +1200 (NZST)
Received: from [10.10.10.10] (unknown [210.48.92.11])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: omiha@ynet.co.nz)
	by mail.ynet.co.nz (Postfix) with ESMTPSA id 02811272104
	for <linux-lvm@redhat.com>; Thu,  7 Apr 2011 20:31:55 +1200 (NZST)
Message-ID: <4D9D7678.20906@omiha.com>
Date: Thu, 07 Apr 2011 20:31:52 +1200
From: Jan Bakuwel <jan.bakuwel@omiha.com>
MIME-Version: 1.0
References: <4D9A9E2A.7070106@diala.gl3>	<1302079983.27047.454.camel@localhost>	<4D9CDC03.9020507@omiha.com>	<4D9CE08C.2010202@cox.net>
	<4D9D1C2D.5040907@omiha.com> <1302155264.27047.469.camel@localhost>
In-Reply-To: <1302155264.27047.469.camel@localhost>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM corruption/diagnosis
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi Radu,


> I don't think that mapping the partitions with kpartx could affect the
> VM (that reads/writes to the LV directly).

I don't think so either but then I didn't think that not zeroing
unallocated block might make a difference either :-)

> But what I know for sure is that when you map a block device with
> kpartx, the "partition" devices that kpartx creates under /dev/mapper
> have different read/write caches than the original block device (the LV
> in your case).
>
> One issue that I experienced is that when you write data to a kpartx
> mapped device (partition) and some (or all) of the blocks that you write
> happen to be in the read cache of the original block device (the LV),
> then you'll read "old" data from the LV, even if you first unmap the
> partitions with kpartx -d.


The VM is the only entity accessing the LV.


> This issue can be simply addressed by using "blockdev --flushbufs" on
> the LV, after you do "kpartx -d" and before you use the LV (start the VM
> for instance).
>
> What type of image are you restoring? The whole LV (including its
> partition table) or just the partition inside the LV (perhaps with
> ntfsclone)? Because if you're restoring the partition (and not using
> "kpartx -d" and "blockdev --flushbufs", it's very likely that you ran
> into caching issues.


A full disc image including the partition table, boot block etc.

Will let you know how it goes.

best regards,
Jan
