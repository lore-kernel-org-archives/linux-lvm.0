Message-Id: <m12LGs8-0000cIC@duffy1.franken.de>
From: Rolf Jakob <rjakob@duffy1.franken.de>
Subject: [linux-lvm] migration to lvm
Date: Thu, 17 Feb 2000 03:40:52 +0100 (MET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hello,

as I'm currently try to migrate to lvm, I'm searching for the least
destructive way.
What may work is :
Assume you have one or more partitions in use for Linux and at least
one free to use. You add the free one to a volume group and create
a limited system on it or just copy your existing depending on the
available space. With the help of initrd you can start the system out of
the volume group (this is the stage where I am currently). As soon as
you are sure you do not need your old partition(s), you add it to the
volume group and move your logical volume to the new physical volume.
Then you remove the cronological first, physical last partition from the
volume group. Now the critical thing : If it is possible to change the
first partition so that it spans also the space of the second you finally
have one partition to use in the vg and can create more lv to your liking.
The partition change should be possible without data loss, as there
is no filesystem size change to take care of. Would parted do that ?
Or even fdisk alone ?
This procedure would allow the migration without the need of another server
to hold your data or a second hard disk and reinstalling the machine
in question. (Of course only if there is space enough to do that.)

Only a dream or possible ?

Thanks for any comments,
Rolf
-- 
Rolf Jakob at home (rjakob@duffy1.franken.de)
WWW : http://www.franken.de/users/duffy1/rjakob (KDE-Utils and CCS)
