Message-ID: <39D093AC.54E9D40A@rds.ro>
Date: Tue, 26 Sep 2000 15:16:44 +0300
From: Florin Andrei <fandrei@rds.ro>
MIME-Version: 1.0
Subject: [linux-lvm] lvm and fibre channel
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com


	We have a big Web project, involving several disk arrays (over 3 TB total
storage space) and around 24 Linux servers.
	On the disk arrays, we need to create aprox. 2600 partitions, which may be
mounted by the Linux servers (but no server can mount more than 16 partitions
at any given moment).
	So here is the problem: the Fibre Channel devices are seen as SCSI devices,
but Linux doesn't support more than 2048 partitions on SCSI disks (max 128
disks, max 16 partitions each).

	Does LVM works over Fibre Channel?
	Does it solves our problem?

-- 
Florin Andrei
mailto:florin@linuxstart.com	http://members.linuxstart.com/~florin/
tel: +40-93-261162
