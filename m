Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0CAoSr22502
	for <linux-lvm@redhat.com>; Wed, 12 Jan 2005 05:50:28 -0500
Received: from main.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0CAoQ3b017388
	for <linux-lvm@redhat.com>; Wed, 12 Jan 2005 05:50:27 -0500
Received: from root by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1Cog4z-0008BJ-00
	for <linux-lvm@redhat.com>; Wed, 12 Jan 2005 11:50:21 +0100
Received: from 195.25.40.253 ([195.25.40.253])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 12 Jan 2005 11:50:21 +0100
Received: from bonfils by 195.25.40.253 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 12 Jan 2005 11:50:21 +0100
From: Bruno Bonfils <bonfils@fimasys.fr>
Date: Wed, 12 Jan 2005 11:24:12 +0100
Message-ID: <87zmzfq71v.fsf@mononoke.fimasys.fr>
Mime-Version: 1.0
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Trouble with LVM and snaphot
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


Hello,

I'm trying to use the snapshot feature, but i have trouble. I don't
have error message (kernel or others), i don't know how to check if
lvcreate still running..


My first try was with a volume group of ~ 580 GB (hardware raid 5)
I created a logical volume 50GB, create a XFS Filesystem, put some
data (~1GB) and run the following commands :

$ xfs_freeze -f <mount point>
$ lvcreate -v -s -L 2GB -n snapshot <device>

I have high load average, small io (~ 170 blk_wrtn/s), but nothings
happens after more than hour, lvcreate is still running, i can't kill
him, i can't do a software reboot, etc..

My second try has the same config, except i tried to set the -c
argument to 6 (which correspond to the chunk_size of the raid 5, 64K) if i
understand correctly how to use this options, same result than the first.

My third and last try was with a simple volume of 60 GB, a logicial
volume of 1G, !50M of data put in the fs, and the command :

$ xfs_freeze -f <mount point> 
$ lvcreate -v -s -L 500M -n <name> <device>

And still the same problem. I hard reboot the computer after one hour
lvcreate running.. I don't think the system need more 1h to copy 500M

So my question, are there some know wells trouble about the snapshot
features ? Do you think that work better with LVM 1 ? How can i check
the state/progress of lvcreate ?

Thanks for your help.

-- here my hard/software configuration --

SCSI AACRAID Controler with a lot of disk (11 x 68GB)
Linux Kernel 2.6.10 with dm-snapshot, dm-mirror, etc.. (running debian sarge)
XFS (xfsprogs version 2.6.20)
LVM 2.00.24-1 (Debian Sarge Version)

-- 
Bruno Bonfils
Fimasys
