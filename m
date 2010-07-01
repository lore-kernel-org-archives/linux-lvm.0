Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o61HYdof002552
	for <linux-lvm@redhat.com>; Thu, 1 Jul 2010 13:34:39 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o61HYSbL020454
	for <linux-lvm@redhat.com>; Thu, 1 Jul 2010 13:34:29 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o61HYSRL006524
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 1 Jul 2010 13:34:28 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o61HYSIa006409
	for <linux-lvm@redhat.com>; Thu, 1 Jul 2010 13:34:28 -0400
Date: Thu, 1 Jul 2010 13:34:28 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <442999.79921.qm@web120412.mail.ne1.yahoo.com>
Message-ID: <Pine.LNX.4.64.1007011327340.6231@bmsred.bmsi.com>
References: <442999.79921.qm@web120412.mail.ne1.yahoo.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] does alignment work out of the box now
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 30 Jun 2010, Philippe Cerfon wrote:

> g) There are some howtos which say one should create PVs on partitions
> rather than whole devices, while other say it's fully ok to have them
> directly on the device.
> But I think this must also have an impact on all the alignment as I
> have 63 more 512 sectors, right? So how should I best do this?
> 
> I read $ cat /sys/block/sda/sda1/alignment_offset
> 0
> which I don't understand. I thought having the 63 sectors partition
> table in the beginning should destroy the alignment?

I can answer this one.  Using no partition table makes alignment
slightly easier, but is dangerous if the disk is ever seen by another
OS - which may think it is unformatted and do something nasty.  On
the other hand, the partition types LVM and RAID simplify reliable
booting (especially for software RAID).

When using a parition table, it must be created with a size that doesn't
destroy alignment - e.g. 128 or 256 sectors.  This is a lot of wasted space
for the useful byte (the partition type), but is trivial compared to 
disk sizes these days, and lets other Wintel OSes know there is data
on the disk.

My rule of thumb is that I skip the partition table for permanent local
LVM drives unless the drive also contains software RAID or a /boot partition.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
