Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0NMxoO30620
	for <linux-lvm@redhat.com>; Sun, 23 Jan 2005 17:59:50 -0500
Received: from leviathan.ele.uri.edu (leviathan.ele.uri.edu [131.128.51.64])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0NMxoSv027643
	for <linux-lvm@redhat.com>; Sun, 23 Jan 2005 17:59:50 -0500
Received: from [127.0.0.1] (leviathan [131.128.51.64])
	by leviathan.ele.uri.edu (8.12.9/8.12.9) with ESMTP id j0NMxkrQ009357
	for <linux-lvm@redhat.com>; Sun, 23 Jan 2005 17:59:47 -0500 (EST)
From: Ming Zhang <mingz@ele.uri.edu>
Message-Id: <1106521186.3130.109.camel@localhost.localdomain>
Mime-Version: 1.0
Date: Sun, 23 Jan 2005 17:59:46 -0500
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] can data be found after cleaning the first sector by
	mistake? (tears in my eyes)
Reply-To: mingz@ele.uri.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

I have 2 disk sda and sdb, build a md0 on them, and create vg and lv on
top of md0.

when i upgraded my system from fedora 2 to 3, it reported my sda and sdb
contain uninitialized partition table and need to clean. i mad a stupid
error by pressing yes!

now no matter what command i execute, it reports.

[root@localhost ~]# lvscan
  Logical volume (vol1) contains an incomplete mapping table.
  Volume group "datavg" not found
[root@localhost ~]# pvscan -P
  Partial mode. Incomplete volume groups will be activated read-only.
  Logical volume (vol1) contains an incomplete mapping table.
  No matching physical volumes found
[root@localhost ~]# vgmknodes
  Logical volume (vol1) contains an incomplete mapping table.
  Volume group "datavg" not found

i wonder if there is any way to get my personal data back. thanks so
much if anybody can give a hint!



these are my system information

[root@localhost ~]# fdisk /dev/sda -l
 
Disk /dev/sda: 164.6 GB, 164696555520 bytes
255 heads, 63 sectors/track, 20023 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
 
   Device Boot      Start         End      Blocks   Id  System

[root@localhost ~]# fdisk /dev/sdb -l
 
Disk /dev/sdb: 164.6 GB, 164696555520 bytes
255 heads, 63 sectors/track, 20023 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
 
   Device Boot      Start         End      Blocks   Id  System

[root@localhost ~]# more /proc/mdstat
Personalities : [raid1]
md0 : active raid1 sda[0] sdb[1]
      160836416 blocks [2/2] [UU]
       
unused devices: <none>
