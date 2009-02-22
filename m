Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1M17hd9027092
	for <linux-lvm@redhat.com>; Sat, 21 Feb 2009 20:07:43 -0500
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n1M17PcU021874
	for <linux-lvm@redhat.com>; Sat, 21 Feb 2009 20:07:26 -0500
Received: from [192.168.1.2] ([96.255.155.44]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KFG004JR0FUMXBT@vms173019.mailsrvcs.net> for
	linux-lvm@redhat.com; Sat, 21 Feb 2009 19:07:07 -0600 (CST)
Message-id: <49A0A252.30803@smart.net>
Date: Sat, 21 Feb 2009 19:54:42 -0500
From: "Daniel B." <dsb@smart.net>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Subject: [linux-lvm] re --corelog: does synchronization re-copy all data?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

In the LVM Administrator's Guide, at least the one at
http://www.centos.org/docs/5/html/Cluster_Logical_Volume_Manager/LV_create.html ,
it says:"

   LVM maintains a small log which it uses to keep track of which regions
   are in sync with the mirror or mirrors. By default, this log is kept
   on disk, which keeps it persistent across reboots. You can specify
   instead that this log be kept in memory with the --corelog argument;
   this eliminates the need for an extra log device, but it requires that
   the entire mirror be resynchronized at every reboot.

Does that last sentence mean that _all_ the data is recopied, or just
that all _regions_ are checked and not all the data necessarily has
to be copied (perhaps only change regions have to be copied, but
unchanged regions don't)?



More generally, can LVM perform RAID1-style mirroring with only
two disks (without having to re-copy everything each boot)
(and, of course, being recoverable in case either disk fails)?



Thanks,
Daniel
-- 
Daniel B.
dsb@smart.net
