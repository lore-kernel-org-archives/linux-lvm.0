From: Michael Lausch <mla@1012surf.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <14734.36981.572856.926128@loki.1012internet.at>
Date: Mon, 7 Aug 2000 12:33:25 +0200 (CEST)
Subject: [linux-lvm] dual adapter machine
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com


We are going to use linux LVM on some servers using 2 FCAL adapters
per machine, since our RAID System (HP XP256) has two FCAL
channels. So in order to have no single point of failure, we want to
use 2 FCAL adapters in each machine, connected to the same (virttual)
disks. This means i see the same partition on two controlers.

For example: controller 1, SCSIID 3, LUN 1, Partition 1
and          controller 2, SCSIID 3, LUN 1, Partition 1

refer to the same blocks.

So when everything is okay i'll talk to the disk through c1d3l1s1 (in
solaris notation). When this FCAL has an error, i want to talk to the
same disk via c2d3l1s1. How can this be done with linux LVM?

Anybody got any ideas? 

thanks in advance.
-- 
michael lausch
