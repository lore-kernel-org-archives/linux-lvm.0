Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1BJhuO31915
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 14:43:56 -0500
Received: from ln-bas07.csfb.com (ln-bas07.csfb.com [198.240.128.80])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j1BJhtJD019660
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 14:43:56 -0500
Received: from slon11p30743.csfb.cs-group.com (slon11p30743.csfb.mail
	[166.12.210.65])
	by ln-bas07.csfb.com (Postfix) with ESMTP id 858AD68E7
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 19:43:45 +0000 (GMT)
Message-ID: <0B834CEE3453504B82AB821DFB7047C1FF0487@enyc11p32003.corpny.csfb.com>
From: "Rosenstrauch, David" <david.rosenstrauch@csfb.com>
Subject: RE: [linux-lvm] waah waah - disaster recovery
Date: Fri, 11 Feb 2005 19:43:39 -0000
MIME-Version: 1.0
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>



> Does anyone have any ideas on how I might be able to restore/mount
> the /dev/md2 partition - even if it is just enough to copy the data
> elsewhere??
> 
> thanks
> 
> pantz


I just last week had a HD die on me - although in a non-raid/non-lvm setup.
Still, some of these techniques might work for you.

First off, since you just had 2 drives die, I would think you now have carte
blanche to go buy 2 new disks, so do that.  How many drives can your machine
hold?

* If only 2 drives, then install one of the new disks, and the bad disk.
Create 2 partitions on the new disk: 1 for the OS, and 1 for the recovery data
(i.e., the recovery partition needs to be at least the size of the partition
you're trying to recover.)

* If it can hold more than 2 drives, then just install both new disks and the
bad disk.  Put the OS on one of the new disks and a partition for the recovery
data on the other new one.

Install the OS onto one of the new disks.  Now, since you have a bootable
system with an OS, you can install LVM onto it.  Plus you'll now have access
to dd, which you can use to do the recovery.  (Trying to recover from a dd'ed
copy of a bad disk can often give better results than trying to recover from
the actual disk.)

Basically just dd the data from the partition on the bad disk to the partition
on the new disk (e.g., "dd if=/dev/hda2 of=/dev/hdb3").  Theoretically, you've
now got a copy of the original partition, and theoretically LVM should be able
to use it just like the old one.  Do fsck's on all the relevant partitions
and/or LV's once you're done with this, as there could be glitches that
occurred.

Assuming all goes well, you then clean up:  take out the bad disk, set up the
new data disk properly, etc.

I can't guarantee this'll work of course.  The partition could be really hosed
and unable to be recovered by dd, it might not pass a fsck, partitions/lv's
might not be able to be mounted, etc.  But this did work for me last week.  If
there were glitches in any of the recovered data, I haven't found them yet,
and it passed the fsck without a problem.


One other option to consider:  perhaps you can use Knoppix as a rescue disk
here.  IIRC, the Knoppix Live CD only has LVM 1, but I think I heard about a
Knoppix DVD available somewhere that has LVM 2.  This might make the process
easier, as you wouldn't have to worry about getting the OS installed and
running on one of the HD's first.  You'd could just run the OS off of the
CD/DVD and do your recovery that way, and deal with installing the OS
afterwards.

HTH, and that my limited of knowledge on LVM and RAID hasn't led me to
misunderstand the situation or give you any bad advice.

Good luck!

DR

==============================================================================
This message is for the sole use of the intended recipient. If you received
this message in error please delete it and notify us. If this message was
misdirected, CSFB does not waive any confidentiality or privilege. CSFB
retains and monitors electronic communications sent through its network.
Instructions transmitted over this system are not binding on CSFB until they
are confirmed by us. Message transmission is not guaranteed to be secure.
==============================================================================
