From: Andrew Sutton <ansutton@sep.com>
Date: Thu, 2 Sep 1999 09:42:19 -0500
Subject: [linux-lvm] question about lvm
Message-ID: <EXECMAIL.9909020919.B4883@crow.sep.com>
MIME-Version: 1.0
Content-Type: Text/Plain; charset="us-ascii"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

i'm not really certain if this is the appropriate place to air a 
question about lvm problems, but since i couldn't find any other 
documented support - i figured i'd just go to the source.

i'm fairly new at using lvm (yesterday) so this is probably just a 
newbie question... anyway, i installed lvm, rebuilt my kernel (with lvm
in the kernel), compiled the utilities, the whole thing. i then 
proceeded to drop 2 pv's into a volume group (vda) and allocate one 
logical volume (lvol1) consisting of all my disk space. and it worked 
(at which point i was ecstatic). so i built an ext2fs on the lv and 
mounted it, and again it worked fine. i then put a line in my fstab to 
mount it on boot, and rebooted.

when the machine came back up, the drive was not mounted. when i tried 
mounting it by hand, i kept getting a "/dev/vda/lvol1 is not a valid 
block driver" error. using some of the lvm utils, i uncovered the fact 
that the entire volume group was "inactive".

i'm not entirely certain what went wrong or where, but i couldn't find 
any documentation about this particular problem. does anybody have any 
idea where i might have gone wrong?

thanks in advance,

-------------------
Andrew Sutton
	ansutton@sep.com
