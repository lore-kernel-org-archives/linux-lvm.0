Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q9TE92ed015994
	for <linux-lvm@redhat.com>; Mon, 29 Oct 2012 10:09:02 -0400
Received: from mailhost.ankh.org (ammut.ankh.org [46.65.25.30])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q9TE8xjf026516
	for <linux-lvm@redhat.com>; Mon, 29 Oct 2012 10:09:00 -0400
Received: from [172.22.131.27] (helo=smail.ankh.org)
	by mailhost.ankh.org with esmtp (Exim 4.63)
	(envelope-from <oolon@ankh.org>) id 1TSpUx-0006bT-DK
	for linux-lvm@redhat.com; Mon, 29 Oct 2012 13:35:23 +0000
Message-ID: <73174f8bcbb44d62139eff5fcd851635.squirrel@smail.ankh.org>
In-Reply-To: <CAMcVf+o=RAvK9=E_khXBzVLWrY3vD9FeWwKuQC=BRoACc7nHwA@mail.gmail.com>
References: <CAMcVf+o=RAvK9=E_khXBzVLWrY3vD9FeWwKuQC=BRoACc7nHwA@mail.gmail.com>
Date: Mon, 29 Oct 2012 14:08:57 -0000
From: "James Hawtin" <oolon@ankh.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Error: Doesn't contain a valid partition table
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is to be expected. because it is possible to have partition tables on
logical volumes created by LVM. if you don't like this use the "filter"
line in /etc/lvm/lvm.conf to include/exclude what you want to be searched.
This is also useful if you want to exclude multipathed/mirrored devices.

James

> Dear All,
>
> I am trying to build a new linux VM using RHEL6.2. I have created the
> partitions using lvm. Everything works fine, but when I execute "fdisk -l"
> I am getting the below errors. Is this expected? If so, how to fix the
> errors?
>
> Disk /dev/mapper/vg00-root doesn't contain a valid partition table
> Disk /dev/mapper/vg00-opt doesn't contain a valid partition table
> Disk /dev/mapper/vg00-tmp doesn't contain a valid partition table
> Disk /dev/mapper/vg00-var doesn't contain a valid partition table
> Disk /dev/mapper/vg00-usr doesn't contain a valid partition table
> Disk /dev/mapper/vg00-home doesn't contain a valid partition table
>
> Complete output of fdisk -l is given below:
>
> Disk /dev/sda: 26.8 GB, 26843545600 bytes
> 64 heads, 32 sectors/track, 25600 cylinders
> Units = cylinders of 2048 * 512 = 1048576 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disk identifier: 0x7bed667d
>
>    Device Boot      Start         End      Blocks   Id  System
> /dev/sda1   *           1        1026     1050608   83  Linux
> /dev/sda2            1027        3076     2099200   82  Linux swap /
> Solaris
> /dev/sda3            3077       25600    23064576   8e  Linux LVM
>
> Disk /dev/sdb: 53.7 GB, 53687091200 bytes
> 64 heads, 32 sectors/track, 51200 cylinders
> Units = cylinders of 2048 * 512 = 1048576 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disk identifier: 0xd5310289
>
>    Device Boot      Start         End      Blocks   Id  System
> /dev/sdb1               1       51200    52428784   8e  Linux LVM
>
> Disk /dev/mapper/vg00-root: 1073 MB, 1073741824 bytes
> 255 heads, 63 sectors/track, 130 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disk identifier: 0x00000000
>
> Disk /dev/mapper/vg00-root doesn't contain a valid partition table
>
> Disk /dev/mapper/vg00-opt: 1073 MB, 1073741824 bytes
> 255 heads, 63 sectors/track, 130 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disk identifier: 0x00000000
>
> Disk /dev/mapper/vg00-opt doesn't contain a valid partition table
>
> Disk /dev/mapper/vg00-tmp: 2147 MB, 2147483648 bytes
> 255 heads, 63 sectors/track, 261 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disk identifier: 0x00000000
>
> Disk /dev/mapper/vg00-tmp doesn't contain a valid partition table
>
> Disk /dev/mapper/vg00-var: 3221 MB, 3221225472 bytes
> 255 heads, 63 sectors/track, 391 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disk identifier: 0x00000000
>
> Disk /dev/mapper/vg00-var doesn't contain a valid partition table
>
> Disk /dev/mapper/vg00-usr: 4294 MB, 4294967296 bytes
> 255 heads, 63 sectors/track, 522 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disk identifier: 0x00000000
>
> Disk /dev/mapper/vg00-usr doesn't contain a valid partition table
>
> Disk /dev/mapper/vg00-home: 1073 MB, 1073741824 bytes
> 255 heads, 63 sectors/track, 130 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disk identifier: 0x00000000
>
> Disk /dev/mapper/vg00-home doesn't contain a valid partition table
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
