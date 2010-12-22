Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oBMJtaB9023490
	for <linux-lvm@redhat.com>; Wed, 22 Dec 2010 14:55:36 -0500
Received: from biostat.ucsf.edu (upstrm185.psg-ucsf.org [38.99.193.74])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oBMJtOio013519
	for <linux-lvm@redhat.com>; Wed, 22 Dec 2010 14:55:24 -0500
From: Ross Boylan <ross@biostat.ucsf.edu>
Date: Wed, 22 Dec 2010 11:55:16 -0800
Message-Id: <1293047716.10784.28.camel@corn.betterworld.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] dealing with a failing drive (esp pvmove)
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

I have a volume group made from 3 partitions on 2 different physical
disks.  One of the disks is failing.  I have a new disk connected via
USB; it is large but a bit slow (5400RPM, though the USB might be
temporary).  It is large enough to hold the entire contents of the
existing VG.

I am looking for suggestions about how to  approach this.  The pvmove
command looks promising, but the docs warn that things are in a delicate
state during the migration (and advise backups).  Since it seems almost
certain there will be I/O errors on the old drive, I'm not sure if
pvmove is a good idea.  Is it?

Alternately, I could do a file system level rsync, but I would probably
need to boot into an alternate system for the last step and there are
quite a few LVs.

Would any kind of RAID/mirroring be an option?  My impression is I need
to set that up on initial creation of the VG.

BTW, any advice on partitioning the new drive?  I know I could just use
the whole physical device, but I'm concerned that if I want to boot
using the disk, or install another (non-Linux) OS that I'll need more
traditional partitions on the drive.  My first cut was to create a GPT
partitioning scheme with a 1G blank paritition and partition 2 holding
the rest of the 2TB for LVM.  Linux is my primary OS.

Thanks.
Ross Boylan
