Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7H0Na5E025926
	for <linux-lvm@redhat.com>; Wed, 16 Aug 2006 20:23:36 -0400
Received: from ylpvm12.prodigy.net (ylpvm12-ext.prodigy.net [207.115.57.43])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7H0NTvg029328
	for <linux-lvm@redhat.com>; Wed, 16 Aug 2006 20:23:29 -0400
Received: from [68.125.219.169] (adsl-68-125-219-169.dsl.irvnca.pacbell.net
	[68.125.219.169])
	by ylpvm12.prodigy.net (8.13.7 out spool5000 dk/8.13.7) with ESMTP id
	k7H0NSlu002598
	for <linux-lvm@redhat.com>; Wed, 16 Aug 2006 20:23:29 -0400
Message-ID: <44E3B6F8.3000207@pacbell.net>
Date: Wed, 16 Aug 2006 17:23:20 -0700
From: Duane Clark <duane_clark@pacbell.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Howto suggestion: Reducing a logical volume
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
To: linux-lvm@redhat.com

I just recently finished reducing a logical volume, and thought I would 
pass along some suggested steps. I had found the HOWTO and referred to 
it, and it helped with a couple of critical steps. But it was not 
sufficient because, well, I only have a single large root partition, and 
that was the one I wanted to shrink. And fundamental to doing the 
reduction is that one needs to be able to unmount the partition. If you 
have another machine around to stick the disk in, that is easy. But it 
turned out to not be terribly difficult without that.

Of course it may be that I did things the hard way, and that would be 
worth knowing too ;)

Mainly, the reason for this was that I wanted to install another OS 
version in a separate logical volume on an existing disk. The disk had 
the (FC4) default layout of two volumes, one for / and one for swap, 
occupying most of the disk in a single group. So without further ado, my 
suggestions for the howto (Section 11.10.)...

If the volume to be reduced is the root partition that you currently 
have booted, then you won't be able to unmount, and a somewhat more 
involved procedure is needed. If you already have another bootable 
harddisk, then perhaps the easiest thing to do is boot that disk with 
the disk to be modified as a secondary disk, and then just modify the 
volume using the above mentioned steps.

If you don't have another bootable harddisk, presumably you have a 
bootable OS installation cdrom/dvd, which can be booted in linux rescue 
mode. That is, allow the CD to boot, and at the first prompt, type 
"linux rescue". If that works, you are on your way. When a prompt is 
given asking whether you want it to find and mount partitions, select 
"skip". I found that if I allowed it to mount the root partition, I 
could not unmount it. After a few more moments, it should finish and 
drop you to a prompt.

In rescue mode, the vgscan, etc commands are not directly present, but 
the executable lvm is, which can do all those things. When you run lvm, 
you will get a new prompt, where you type lvm commands. In the 
following, the linux prompt is '#' and the lvm prompt is '>'. And I have 
used the default group/volume names supplied by Fedora, since presumably 
a newbie reading this will have used the defaults, and anyone else will 
be able to figure out what to change.

When we skipped allowing linux rescue to find and mount the logical 
volumes, it also did not create device files we will need to use. So the 
first task to be accomplished is to use lvm to create those device files.
# lvm
 > vgscan
It should should show the existing group or groups. The first task 
required is to activate the group.
 > vgchange -a y VolGroup00
Then generate the device files.
 > vgmknodes
 > exit
Now shrink the existing filesystem to something a bit smaller than what 
you want the final filesystem size to be. You will first need to run 
fsck on the filesystem. For example, I wanted a 36GByte final size, so I 
used:
# e2fsck -f /dev/mapper/VolGroup00-LogVol00
# resize2fs /dev/mapper/VolGroup00-LogVol00 35G
Now we can shrink the volume to the desired size. Yes, the lvreduce 
command uses a different device file name.
# lvm
 > lvreduce -L36G /dev/VolGroup00/LogVol00
 > exit
Now expand the filesystem to the full size of the volume. Notice that no 
size parameter is used in the resize command this time.
# resize2fs /dev/mapper/VolGroup00-LogVol00
Now you can try to mount and look at it.
# mkdir /mnt/sysimage
# mount /dev/mapper/VolGroup00-LogVol00 /mnt/sysimage
# df
# ls /mnt/sysimage
It should show up with the right 36GByte size, and everything intact.
