Date: Mon, 19 Jun 2000 13:02:06 -0400 (EDT)
From: "Troy E. Ablan" <chaser@mewl.net>
Subject: [linux-lvm] groupship on /dev/<vg>/<lv> files
Message-ID: <Pine.LNX.4.21.0006191257040.1848-100000@frame.pinchaser.com>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Apologies if this has already been discussed on the list.  I did not find
this in the archive.

It makes sense to me if lvcreate would put the device files for new
volumes in group disk to match the disk block devices in /dev.  This
makes sense as dump utils should be run as the context of a user
with read access to the disks.

Thanks

-Troy
