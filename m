Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAAN5g6m017500
	for <linux-lvm@redhat.com>; Fri, 10 Nov 2006 18:05:42 -0500
Received: from amsfep20-int.chello.nl (amsfep20-int.chello.nl [62.179.120.15])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kAAN5fs2032724
	for <linux-lvm@redhat.com>; Fri, 10 Nov 2006 18:05:41 -0500
Received: from laguna.nwhq.nl ([24.132.125.161]) by amsfep20-int.chello.nl
	(InterMail vM.6.01.04.04 201-2131-118-104-20050224) with ESMTP
	id <20061110230535.SHGB7198.amsfep20-int.chello.nl@laguna.nwhq.nl>
	for <linux-lvm@redhat.com>; Sat, 11 Nov 2006 00:05:35 +0100
Received: from laguna.nwhq.nl (laguna.nwhq.nl [127.0.0.1])
	by laguna.nwhq.nl (8.13.8/8.12.11) with ESMTP id kAAN5YOO020647
	for <linux-lvm@redhat.com>; Sat, 11 Nov 2006 00:05:34 +0100
Subject: Re: [linux-lvm] LVM groups not visible
From: "J.L. Blom" <jlblom@neuroweave.nl>
In-Reply-To: <200611101222.30052.peregrine@openbrainstem.net>
References: <1163152099.2961.68.camel@laguna.nwhq.nl>
	<02ac015d0526931d1024f1549d98a49c@redhat.com>
	<1163174415.2961.95.camel@laguna.nwhq.nl>
	<200611101222.30052.peregrine@openbrainstem.net>
Date: Sat, 11 Nov 2006 00:05:34 +0100
Message-Id: <1163199934.2961.118.camel@laguna.nwhq.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: jlblom@neuroweave.nl,
	LVM general discussion and development <linux-lvm@redhat.com>
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

On Fri, 2006-11-10 at 12:22 -0700, Lamont R. Peterson wrote:

> 
> Looks like the USB device wasn't plugged in when the box was booted, perhaps?
> 
Lamont,
Thanks very much for your detailed explanation.
Yes, I did plug it in after I had started 
> Standard thing to see.  It's a mostly stupid warning these days, as every 
> desktop & notebook motherboard made in the past 8 years (or so) has LBA 
> support out of the box, so it isn't an issue.  In other words, you can just 
> ignore that.

I agree. It's a very old remark. Apparently nobody bothers to remove it
when upgrading the package.
> 
> > Warning: invalid flag 0x0000 of partition table 4 will be corrected by
> > w(rite)
> 
> That sometimes happens when the partition table was initially created by some 
> other tool (like Windows, or Partition Magic), as they don't all do exactly 
> the same thing with some parts of it.  Given that the "offending" flag's 
> value was 0x0000, I think it be that it was just never set by the other tool.
> 
> However, that's not why this is happening in this case (read the next bit to 
> see what's up).
> 

> This is blank because you are trying to read a partition table from the 1st 
> partition.  You ran "fdisk /dev/sda1" not "fdisk /dev/sda" as it should have 
> been.  I hate it when I do that :) .
> 
Yes! Sorry my own stupidity. 

> Since it's a USB disk, I would guess that it wasn't inserted when you booted 
> your box.  So, when LVM was being set up by /etc/rc.sysinit, it didn't find 
> that device.  If you did another "pvscan" after inserting the USB disk, it 
> might find it.
> 
Well, no. When I did a pvscan it reported only the already installed
devices but pvscan -n gave what I think is the culprit:
______________________
 pvscan -n
  WARNING: only considering physical volumes in no volume group
  Couldn't find device with uuid
'G6vIxd-bp54-0zd0-PKzf-WI31-xPmr-qoeFAT'.
  No matching physical volumes found
___________________________________________
Apparently the mentioned uuid is from the pv on the USB disk and for
some reason he cannot see it.
What would happen if I unmount the device and then do a pvscan? 
> I already covered the problem with fdisk.
> 

> 
> OK.  Overall, I wouldn't bother trying to use LVM with a removable drive 
> (USB/Firewire hard drives, keychain drives, etc.).  I can think of one 
> possibly viable way of doing it, but I still probably wouldn't even in that 
> case, because it wouldn't really give you any benefits.
> 
I understand and had thought it would better to remove it.
> So, if you have already included the USB drive into your VG(s), get everything 
> plugged in, make sure pvdisplay, vgdisplay, lvscan and friends are all happy, 
> then run "pvmove /dev/sda1".  This will move any data you may have on there 
> to other drives (the one built in to your box).
But isn't that a problem as the removable disks has > 100 GB backup data
and the fixed disks together are smaller (and have > 50 % occupied)
> 
> In this thread, everyone has been *assuming* that your USB disk is /dev/sda.  
> If your main hard drive is SATA or SCSI, it very well could be /dev/sda and 
> your USB drive could be /dev/sdb or some other device; i.e., the last letter 
> in the device name could be 'a', 'b', 'c', etc.  Run "fdisk -l" to see a list 
> of all the hard drives your system currently sees without the USB drive 
> plugged in, then plug it in and re-run "fdisk -l" and the extra one the 
> second time is your USB drive.  Make sure you use the correct device name in 
> your pvmove command.
> 
> Once the pvmove command is finished, you can safely "redo" your USB device.  
> If it's a hard drive, format it with ext3 or reiserfs or jfs or xfs (as you 
> prefer).  If it's a flash device, I would recommend that you look at using 
> JFFS2 for the filesystem.  Either way, make sure that the "type" (i.e. System 
> ID) of the partition on your USB device is "83" (for regular Linux 
> filesystems) and not "8e" (which is for Linux LVM PVs).
> 
My fixed disks are IDE so the USB disk is /dev/sda.
I have had a look at JFFS but haven't used it do I have to know more of
it before I can use it.
One curious point when I run fdisk -l it gives my logical volumes
as /dev/dm-(1-5) but cannot find any meaningful information (which I
think is understandable).
Lamont, thanks again for your explanation and maybe you can clarify the
pvmove in this case as I think I don't have enough diskspace for that
exercise.
Joep 
> np.  HTH.
> 
> [snip]
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
