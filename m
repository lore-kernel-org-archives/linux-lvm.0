Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9EGWMr04013
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 12:32:22 -0400
Received: from hotmail.com (bay17-f41.bay17.hotmail.com [64.4.43.91])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i9EGWF2I032059
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 12:32:16 -0400
From: "Kai Leibrandt" <k_leibrandt@hotmail.com>
Date: Thu, 14 Oct 2004 18:31:07 +0200
Mime-Version: 1.0
Message-ID: <BAY17-F41JPv00J6gX2000169b9@hotmail.com>
Subject: [linux-lvm] Creating snapshot on / hangs machine
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi all,

I am not sure if this should even be possible, but in order to take 
consistent backups I would like to take a snapshot of my / filesystem, and 
then use dump for the backup, but this consistently hangs my machine. My box 
is Fedora Core 2, kernel 2.6.8-1.521, lvm2-2.00.15-2, the filesystems are:

/boot: ext3 on /dev/md0
/: ext3 on /dev/VG00/RootLV on /dev/md1
/export: ext3 on /dev/VG00/ExportLV on /dev/md1
swap: swap on /dev/VG00/SwapLV on /dev/md1

VG00 has 500Mb free, and the snapshots I create are of the right size 
(lvcreate -L500M -s -n BackupLV /dev/VG00/ExportLV for instance). Taking 
snapshots  on /export is fine, and I have done some stress testing on this, 
repeatedly creating snapshots, dumping the snapshot to file, removing 
snapshot, etc. As soon as I create a snapshot on / however, the machine 
hangs, although X still works (well, the mouse still moves), it is no longer 
possible to open a new shell, switch consoles, or even <CTRL>C the lvcreate.

I have tried this with ext2 as well as with xfs, including doing xfs_freeze 
before taking the snapshot, so I don't think it's a filesys related matter.

Is there anything I am missing here? Is it even supported to do / snapshots?

Many thanks for any help,

Kai.

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today it's FREE! 
http://messenger.msn.com/
