Message-ID: <B14BF8753E65D211ABCA00104B301EF5015BAFE8@cairn-gorm.cragtech.com>
From: Rochelle Lakey <RLakey@Connex.com>
Subject: [linux-lvm] LVM and XFS
Date: Mon, 6 Nov 2000 15:54:35 -0800 
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "LVM Mailing List (E-mail)" <linux-lvm@msede.com>

Hello All,

Is there a set of comprehensive patches that will allow LVM and XFS to work
together?
I am using kernel 2.4.0-20con while trying to get this to work.  I've
applied two patches
so far and recompiled LVM but PVCREATE command continues to say my partition

does not exist.

Here are the patches I've applied:

http://linux.msede.com/lvm/mlist/archive/2000/06/att-0063/01-lvm_dir_cache.c
-xfs-patch
http://innominate.org/~graichen/projects/xfs/lvm.patch

Thanks in advance,
Rochelle Lakey
Connex, Inc.
