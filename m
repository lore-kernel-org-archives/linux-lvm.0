From: mschout@gkg.net
Date: Tue, 2 Nov 1999 15:34:39 -0600 (CST)
Subject: [linux-lvm] raid0145 + lvm 0.7 woes..
Message-ID: <Pine.LNX.4.10.9911021529400.2208-100000@cdm-24-019.tca.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi.

I am trying to get LVM to work on top of a software raid5 volume (/dev/md0).

I am using Andreas patch from http://www.mtg.co.at/projects/lvm_raid_tools/ to
pristine 2.2.12 kernel sources.  I am using the raidtools and LVM package also
provided at that url.

I was successful in getting LVM to do pvcreate / vgcreate / lvcreate operations
on the /dev/md0 device.

I found that if I create a single lv in the vg, then that appears to work, and
I can write to it fine.

But if I create *multiple* lv's in the vg (e.g.: lvol1, lvol2), then I have
been successful in doing mke2fs on lvol1, but halfway through the mke2fs on the
second lv, mke2fs freezes the machine.  The only way out is to send the SysRq-b
to reset the machine on the console.

So it would appear that at current it is not possible to use LVM 0.7 on top of
a raid5 device using raid0145-19990824.  Is this correct?  Has anyone been
following up on this?   I would love to get this working :).

Thanks for any info anyone has on this matter.

Regards,
Mike
