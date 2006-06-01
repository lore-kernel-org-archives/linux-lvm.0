Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k51HJPUb007093
	for <linux-lvm@redhat.com>; Thu, 1 Jun 2006 13:19:25 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k51HJN7R000464
	for <linux-lvm@redhat.com>; Thu, 1 Jun 2006 13:19:23 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id F28541F41F0
	for <linux-lvm@redhat.com>; Thu,  1 Jun 2006 19:19:14 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 29414-06 for <linux-lvm@redhat.com>;
	Thu,  1 Jun 2006 19:19:05 +0200 (CEST)
Message-ID: <447F2188.2030700@conterra.de>
Date: Thu, 01 Jun 2006 19:19:04 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] FS labels and LVM2
References: <Pine.LNX.4.58.0605311353400.6195@picard.science-computing.de>
In-Reply-To: <Pine.LNX.4.58.0605311353400.6195@picard.science-computing.de>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Oliver Tennert wrote:
> am I wrong or does mount per FS label not work when the filesystem in 
> question is located on a logical volume? We're using a 2.6.11 kernel and a 
> SUSE 9.3 distro, so it might be just a question of using the most current 
> kernel.
> 
> At least, a "mount -a" when a "LABEL=test" entry is in fstab, leads to the 
> error:
> 
> mount: special device LABEL=test does not exist
> 
> But it exists:
> 
> localhost:/var/log # xfs_admin -l /dev/mapper/vucf0002vg-fs2
> label = "test"
> 
> Any idea?

It does not work any more :-(

mount looks into /dev/partition to find the names of the
devices to scan. Unfortunately the LV names listed here can't
be found under /dev, as they are simply enumerated like "dm-12".

On the other hand: once you have LVM, you don't need no disk
labels any more, as your LVs have expressive names already!

Dieter.
