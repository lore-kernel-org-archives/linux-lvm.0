Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4CKBEfe004141
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 16:11:14 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4CKB4cc017914
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 16:11:04 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m4CKAwLL028285
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 16:10:58 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m4CKAucn022300
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 16:10:58 -0400
Date: Mon, 12 May 2008 16:10:56 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] lvm partition on ramdisk
In-Reply-To: <1c748a490805120823w1673e2f4u91b8cc43c0f818df@mail.gmail.com>
Message-ID: <Pine.LNX.4.44.0805121557010.22122-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 12 May 2008, Larry Dickson wrote:

> I'm trying to set up a logical volume over a 256MB ramdisk and a 1TB raid
> array partition. My ramdisk (set up in grub.conf with ramdisk_size=262144
> ramdisk_blocksize=4096) fails to make a type 8e partition either in fdisk or
> sfdisk. The error in fdisk is

You can't and don't need to set a partition type for a ramdisk.  It
already is a partition.

> Can anyone give me some guidance here? Is it choking on the 4K blocksize? I
> wanted that for efficiency, as suggested by MrMichaelWill on his blog,
> but his base case seems to be a file system mounted directly on the
> unpartitioned device, and I need LVM.

No, just as you can make a disk device like /dev/sda a PV without any
partition table, you don't need a partition table for a ramdisk.

HOWEVER: you REALLY REALLY don't want to mix volatile and non-volatile
PVs in the same volume group.  When you reboot, and the ramdisk PV is
missing, the volume group won't activate automatically.  Furthermore,
you could accidentally end up with real data on the ramdisk - and it goes
bye bye on reboot.

Let me guess - you wanted to use the ramdisk for a snapshot?  Yes, some
other people have tried that (see the thread here a week or so ago).  You will
be very unhappy when the system reboots and the ramdisk is missing.

The real way to put snapshots on a ramdisk is a "temporary snapshot" -
a feature which could in theory be done via device-mapper, but needs
utility support.

If your root fs is not on the VG you are adding the ramdisk to, you
could probably get away with it.  Add the ramdisk, snapshot, make your
backup, delete snapshot, reduce ramdisk from VG.  If the system crashes
while the ramdisk is still in the VG metadata, then you'll need to manually
recover the VG to activate - but hopefully that will be rare.

There is also an option you could add to initrd to activate a VG even
with missing PVs.  But that makes all LVs read-only until the VG is repaired.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
