Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6JGSBa14577
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2004 12:28:11 -0400
Received: from mail.net4all.be (mxrelay.net4all.be [81.89.102.60])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6JGS5Xn002579
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2004 12:28:05 -0400
Received: from 84-118.a2f.dsl.net4all.net (84-118.a2f.dsl.net4all.net
	[81.89.118.84]) by mail.net4all.be (GMS
	9.02.3180/NT8786.00.c190c459) with ESMTP id efwgycaa for
	linux-lvm@redhat.com; Mon, 19 Jul 2004 18:27:55 +0200
Date: Mon, 19 Jul 2004 18:26:16 +0200
From: Pieter Jelle <lvm@statik.be>
Message-ID: <83101265.20040719182616@mooo.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] recover data after crash?
Reply-To: Pieter Jelle <lvm@statik.be>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi all

I'm running Debian Sarge (kernel 2.4.26, i686) with 4 HD's, each 160GB,
and I'm using the LVM.
The first HD has a root partition, swap partition and contains the first 
partition of the only logical volume in the LVM, while the other 3 drives 
make up for the rest of the logical volume, like this:

/dev/hda1       root
/dev/hda5       swap
/dev/hda6       lvm 1
/dev/hdc1       lvm 2
/dev/hde1       lvm 3
/dev/hdf1       lvm 4

All of these are ext3.

During a recent reboot, the machine started doing an fsck on all drives,
and while checking the disks, the power went down. When I booted the machine
again, it would mount both the root and swap partition, but it didn't want
to mount the logical volume, as it seemed that /dev/hda6 was damaged. I got
the following error in the syslog:

LVM version 1.0.8(17/11/2003) module loaded
hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hda: dma_intr: error=0x40 { UncorrectableError }, LBAsect=7356687,
high=0, low=7356687, sector=7356624
end_request; I/O error, dev 03:01 (hda), sector 7356624

Since that moment, I haven't succeeded in remounting the logical volume. Every
possible vg* command gives me the same error as above, so I can't vgck or
vgcfgrestore, or remove  physical volumes from the logical volume (hdc, hde and 
hdf are most likely to be without errors).

Most of the data on these disks has been backed up, but there's still a lot that
is really quite important to me and I'd like to recover. Since the last 3 HD's have
not been affected, the data on at least these drives should be recoverable I suppose.
Has anyone got an idea on how to go about or who I should turn to to get my data back?

Thanks a lot in advance for any help!

Pieter Jelle
