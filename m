From: pbmonday@imation.com
Subject: [linux-lvm] LVM Partition Dependency
Date: Mon, 30 Oct 2000 10:01:09 -0600
Message-ID: <OF8DC01629.AB96EF23-ON86256988.00577766@imation.com>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


I'm trying to construct an LVM solution with block devices that are not
located in the partition table (becuase they are not a local fixed physical
disk).  I'm curious how deep the dependency on being in the partition goes
with the LVM.

For example, I know the /proc/partitions file is checked during
pvcreate...if I rewrote pvcreate to get around this check would I encounter
other dependencies on actually being a drive partition located on the local
machine later?

Or, if I added my block device to the partitions table, would that be
enough to fulfill all requirements of being a local partition that are
required by the LVM?

Would the problems be only with the user space tools, or would there also
be problems in the kernel module?

Just curious on how far I would have to go to "trick" or "modify" the LVM
to accept something other than a local hard drive partition.

Thank you,
Paul Monday
pbmonday@imation.com
