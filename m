Message-Id: <4.2.2.19991121094946.00a59400@mail.iname.com>
Date: Sun, 21 Nov 1999 09:56:18 -0600
From: Daniel Whicker <heimdall@mail.org>
Subject: [linux-lvm] Problem with possible failed disk...
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hey Gang,
	I was hoping that someone might be able to help.  I just recently moved 
and found that one of my systems wouldn't be, hanging  at single user after 
trying to fsck an LVM filesystem.  Further checking resulted in the 
discovery that LVM hadn't found any volume groups.  At that point I did a 
"vgscan -d 2>&1 | tee /tmp/out" and dug through /tmp/out and found that one 
of my two LVM disks (/dev/hdd) was being skipped.  A bit more checking and 
I found that /dev/ide/hdd/geometry was reporting that this disk had a 
NEGATIVE number of cylinders.  This brings me to two questions;  does 
anyone know how to remove a disk from a volume group when you can't get the 
system to see the VG?  (/dev/hdb and /dev/hdd are both members of vg00)  I 
know that there was no data on that disk yet, I had just added it, so 
removing it shouldn't affect any file systems.  Also, would anyone have 
ideas why Linux would see a negative number of cylinders for that 
disk?  The BIOS seems to see it just fine, and before I moved, Linux had 
seen that disk fine.  I assume that the disk is bad, but it seems strange 
that the BIOS and Linux aren't jiving on the geometry of the disk.

Any help would be greatly appreciated.

Thanks,
Daniel
									-Daniel
		------------------------------------------
		Daniel Whicker  (heimdall@mail.org)
