Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j86EMfV09245
	for <linux-lvm@redhat.com>; Tue, 6 Sep 2005 10:22:41 -0400
Received: from host1.appws.com (host1.appws.com [216.136.72.3])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j86EMart002278
	for <linux-lvm@redhat.com>; Tue, 6 Sep 2005 10:22:40 -0400
Received: from grandmother.littlebald.com (localhost.localdomain [127.0.0.1])
	by grandmother.littlebald.com (8.13.1/8.13.1) with ESMTP id
	j86ELnQ3020342
	for <linux-lvm@redhat.com>; Tue, 6 Sep 2005 10:21:49 -0400
Received: (from david@localhost)
	by grandmother.littlebald.com (8.13.1/8.13.1/Submit) id j86ELnom020341
	for linux-lvm@redhat.com; Tue, 6 Sep 2005 10:21:49 -0400
Subject: RE: [linux-lvm] Moving space between logical volumes?
From: David Johnston <david@littlebald.com>
In-Reply-To: <3BED18D345FC9245B8B26F4273CFFBAF0333FD33@IOWAEVS02.iowa.uiowa.edu>
References: <3BED18D345FC9245B8B26F4273CFFBAF0333FD33@IOWAEVS02.iowa.uiowa.edu>
Content-Transfer-Encoding: 7bit
Date: Tue, 06 Sep 2005 10:21:47 -0400
Message-Id: <1126016508.18965.34.camel@grandmother.littlebald.com>
Mime-Version: 1.0
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

On Thu, 2005-09-01 at 10:28 -0500, Meadows, Howard T wrote:
> The logical volumes in question are ext3 filesystems. I did read the
> man page for lvreduce and its warning about possible loss of data was
> what originally prompted me to ask for help.
> 
> I am wondering if e2fsadm might do the trick? It looks like you can shrink
> (and expand) logical volumes using e2fsadm with the restriction that
> shrinking only works on unmounted filesystems (if I'm reading the man
> page correctly). So... my current thought is as follows:
> 
>     * unmount the filesystems in question.
>     * use 'tune2fs -O ^has_journal /dev/sda5' to turn off journaling
>     * use 'e2fsadm -L -100G /dev/vg/lv1' to reduce lv1 by 100GB
>     * use 'e2fsadm -L +100G /dev/vg/lv2' to increase lv2 by 100GB
>     * use 'e2fsck -f /dev/sda5' to check the filesystems
>     * use 'tune2fs -j /dev/sda5' to turn journaling back on
>     * re-mount the filesystems
> 
>     It seems (from the man page for e2fsadm) that lvreduce/lvextend would
> then not be needed. Is this true?

e2fsadm is a front end for the LVM tools.  It simplifies things by doing
the math for you, and by doing the steps in the correct order (which
changes depending on whether you are growing or shrinking).

If /dev/vg/lv1 and /dev/vg/lv2 are logical volumes, and you have ext3
filesystems on them, all you need to do is this:

# Shrink lv1
umount /dev/vg/lv1
e2fsadm -L -100G /dev/vg/lv1
mount /dev/vg/lv1

# Expand lv2
umount /dev/vg/lv2
e2fsadm -L +100G /dev/vg/lv2
mount /dev/vg/lv2

That's it.

I'm concerned about your reference to /dev/sda5.  Is that your LVM
partition?  If so, leave it alone.  From its name, it's clear that it is
not a logical partition, so you can't use LVM tools to manipulate it.
What's special about /dev/sda5 that makes you think you need to turn
journaling off before you can resize /dev/vg/lv1?

-DJ

LVM vocabulary in newbie terms:
	physical volume = a disk
	logical volume  = a partition
By extention,
	lvresize = fdisk

In reality, it's not that simple, but until you're comfortable with LVM,
these simple definitions will steer you well.
