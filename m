Date: Fri, 21 Jan 2000 01:15:12 +0000 (GMT)
From: James Pattinson <jamesp@aethos.co.uk>
Subject: [linux-lvm] extending a striped LV
Message-ID: <Pine.LNX.4.10.10001210110090.2815-100000@fuse.aethos.co.uk>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi...

Just ran into a problem trying to extend /opt on my system. /opt is
/dev/vg00/lvol5 (yeah I work with HPUX!! :) ) and it's currently striped
across 2 disks on my system that has 4 disks total (8GB 4GB 4GB 6GB).

When I tried to extend it from 512MB to 640MB, the command failed because
one of the discs that /opt resides on is full. However there is over 10GB
free in the entire VG so is it possible to tell lvextend to use a
different disk, or can it only be extended on the same two disks?

Cheers

James
