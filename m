Message-ID: <C36362694EDCD2119D8D00805FEA666A01D49CA1@NTEXG13>
From: "Alpha Lau (HTHK - Senior Manager - Infrastructure & Development, IIDV)"
	 <ALPHAL@hthk.com>
Subject: [linux-lvm] LVM and ext2fs
Date: Fri, 12 May 2000 09:37:11 +0800
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@msede.com'" <linux-lvm@msede.com>

I have a SuSE 6.3 running with 1 IDE Disk and 4 SCSI Disk. The core system
(and Swap Device) is installed in the partition (hda1 and hda2). While other
data files are installed in the LVM. The details are shown as below.

/dev/vg01/lv01		4GB
/dev/vg01/lv02		4GB

These two LV are resided in the same physical SCSI disks. I have built an
ext2fs on these LVs (the fs01 and fs02). I put Oracle data files (i.e.
tablespaces, total file usage is 2GB in each filesystem) on these
filesystems. 

After couple days, I experienced filesystem corruption in the fs01 and fs02.
fsck reported that there is so-much corruption in the inode table. The only
solution is to re-build the filesystems. However, the scenario happens again
after couple days. Finally, I create the LV and ext2fs up to 2GB limit.
Everything then goes fine.

Could anyone give me a help on the capacity limitation on the LVM, ext2fs
and VFS. Your kind help is much appreciated (since I plan to put the stuffs
into production environment).

Regards,
Alfa.
