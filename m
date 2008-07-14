Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6ELDLq7002680
	for <linux-lvm@redhat.com>; Mon, 14 Jul 2008 17:13:21 -0400
Received: from eastrmmtao106.cox.net (eastrmmtao106.cox.net [68.230.240.48])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6ELD8ww003330
	for <linux-lvm@redhat.com>; Mon, 14 Jul 2008 17:13:09 -0400
Received: from eastrmimpo01.cox.net ([68.1.16.119]) by eastrmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20080714211304.FEHP4226.eastrmmtao106.cox.net@eastrmimpo01.cox.net>
	for <linux-lvm@redhat.com>; Mon, 14 Jul 2008 17:13:04 -0400
From: Gene Czarcinski <gene@czarc.net>
Subject: Re: [linux-lvm] sector zero on a Logical Volume
Date: Mon, 14 Jul 2008 17:14:37 -0400
References: <200807131751.57651.gene@czarc.net> <487B2BA0.8010501@redhat.com>
In-Reply-To: <487B2BA0.8010501@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200807141714.38312.gene@czarc.net>
Content-Transfer-Encoding: 8bit
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
To: linux-lvm@redhat.com

On Monday 14 July 2008 06:34:08 Bryn M. Reeves wrote:
> Gene Czarcinski wrote:
> > I am hoping that someone on this mailing list is expert enough to answer
> > my question:
> >
> > Is there any reason that sector 0 on a Logical Volume should not be all
> > zeros?
>
> All depends what you are doing with it. Many file systems and other
> block device users avoid using this sector because it may be "shared"
> with the firmware on x86 but there's no requirement for it to be
> reserved like this. Ext2/3 are fine (they start in the 1st sector) as
> would be LVM2 - e.g. if you were using the LV to provide a physical
> volume for a virtualised system.
>
> > My problem occurred when I effectively dd'ed a real disk partition on
> > which grub is installed to a Logical Volume.  When grub in installed into
> > a partition, it not only installs it's boot code but also makes sector 0
> > on that partition have a fake "msdos" partition table and the kernel (and
> > other software) does not like that at all!!
>
> It is not a "fake" msdos partition table, it's a real one. The
> conventions for x86 boot loaders require a partition table since the MBR
> (master boot record) consists of a 512 byte sector containing 446 bytes
> of executable code followed by the four-entry primary partition table.

If the partition table was defined in an MBR ... yes, that is a real one.  But 
this is installed in a partition.  I suspect that grub does not "know" if it 
is installing in a partition or the MBR for a real disk.

I do note (just looked) and both ntfs and fat32 disks step on sector 0 of a 
partition with a skelaton partition table and "msdos" partition table 
signature.

>
> You can't install grub without an MBR/partition table so when you
> attempt to install it to a device that lacks one grub will lay down a
> skeleton MBR on the device.

device==yes but this was a partition.

One thing I want to try is to zap the "signature" and see if grub will still 
boot.

>
> > My solution was to use dd to zero sector 0 and then everything worked ...
> > could mount the Logical Volume, etc.
>
> Shouldn't be a problem for anything that doesn't store data in this
> sector. Just be sure to limit the command to only wipe sector 0.

Thanks for the reply.

From what you said, I understand that most linux filesystems stay away from 
sector 0.  I have verified this for ext2/ext3 and xfs.  It is unlikely that 
any native use of a Logical Volume will use sector 0.

But, there could be a situation with a virtual machine where a Logical Volume 
was being used as a virtual physical volume.  Furthermore, with grub, ntfs, 
and fat32 put a partition table in sector 0 of a partition.

Gene
