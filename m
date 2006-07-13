Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6D8ZxhS012013
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 04:35:59 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6D8Zq1a024609
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 04:35:52 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id 5EBEF1F41F5
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 10:35:45 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05200-07 for <linux-lvm@redhat.com>;
	Thu, 13 Jul 2006 10:35:28 +0200 (CEST)
Message-ID: <44B605D0.7070904@conterra.de>
Date: Thu, 13 Jul 2006 10:35:28 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM question on move and resize
References: <20060713012417.80370.qmail@web50705.mail.yahoo.com>
In-Reply-To: <20060713012417.80370.qmail@web50705.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

John Koshi wrote:
> Hello,
> 
> I have the following setup:
> 
> HP dv1000 laptop with an 80G hard disk laid out as follows:
> 1)70Gb NTFS, WinXP primary
> 2)100Mb ext3 primary Fedora 4 /boot
> 3)10Gb Extd primary, containing logical(8E) LVM Fedora 4 root
> 
> Since the Linux root is getting full, I want to expand it,
> by reducing the NTFS partition, and moving all the Linux
> partitions down, and then expand the LVM root outwards.
> 
> With Partition Magic 8.0, I can resize the NTFS disk, and
> move the ext3 boot partition (after removing it's features
> resize_inode, dir_index, and ext_attr using e2fsprogs),
> and resize the Extended partition to the left as needed.
> 
> The problem now is how to move and expand the LVM root as
> mentioned above. Partition Magic and Qtparted can't do it.
> 
> Is it possible to do this? If so, what are the steps?

can you send us a "fdisk -l" of your partition layout?

Why moving your LVM?

After you shrunk the leading partitions, you should get a gap
below your LVM partition. Can you fit a new partition into this gap?
There after you format this new partition as an additional PV
using "pvcreate" and extend your VG using vgextend.

Now your VG extends over both partitions, and you may use the new
space to extend any LV within your VG. LVM does not care about
how the available disk spaces (its PVs) is organized nor has it
to be contiguous. It may even spread over several disks.

This is the reason why LVM is much more flexible than DOS partitions
and Partition Magic will ever be.

Dieter.
