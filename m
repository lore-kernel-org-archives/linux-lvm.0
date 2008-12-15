Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBFJfsSP009975
	for <linux-lvm@redhat.com>; Mon, 15 Dec 2008 14:41:54 -0500
Received: from email.skywaywest.net (tweedledee.skywaywest.net
	[216.251.128.22])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBFJehd6014746
	for <linux-lvm@redhat.com>; Mon, 15 Dec 2008 14:40:43 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by email.skywaywest.net (Postfix) with ESMTP id D79F98B5FA5
	for <linux-lvm@redhat.com>; Mon, 15 Dec 2008 11:40:42 -0800 (PST)
Received: from email.skywaywest.net ([127.0.0.1])
	by localhost (tweedledee.skywaywest.net [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id I0E-1ih+pEMK for <linux-lvm@redhat.com>;
	Mon, 15 Dec 2008 11:40:42 -0800 (PST)
Received: from [192.168.1.25] (unknown [216.251.146.74])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by email.skywaywest.net (Postfix) with ESMTP id AB6D14102DA
	for <linux-lvm@redhat.com>; Mon, 15 Dec 2008 11:40:42 -0800 (PST)
Message-ID: <4946B2B8.2000801@skywaywest.com>
Date: Mon, 15 Dec 2008 12:40:40 -0700
From: Greg Varga <gvarga@skywaywest.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Large disk problem with LVM2...
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

I have a 3.09TB Hardware Raid 5 drive setup with, and I have already
used about 1TB worth of space on the volume group.

Today I tried to add another 500GB logical volume and it failed with:

[root@bill ~]# lvcreate -L500G -ntest VolGroup01
  device-mapper: reload ioctl failed: Invalid argument
  Aborting. Failed to activate new LV to wipe the start of it.


dmesg shows this:

device-mapper: table: device 8:3 too small for target
device-mapper: table: 253:7: linear: dm-linear: Device lookup failed
device-mapper: ioctl: error adding target to table


I have googled for the message and have read to run pvs like:

[root@bill ~]# pvs -o +dev_size
  PV         VG         Fmt  Attr PSize  PFree DevSize
  /dev/sda2  VolGroup00 lvm2 a-   99.97G    0  100.00G
  /dev/sda3  VolGroup01 lvm2 a-    3.09T 2.05T   1.09T


So my question is, how do I fix this?  I'm running the most current
(CentOS 5.2) versions of Device-Mapper and LVM and Kernel:

lvm2-2.02.32-4.el5_2.1
lvm2-cluster-2.02.32-4.el5
device-mapper-1.02.24-1.el5
device-mapper-event-1.02.24-1.el5
device-mapper-multipath-0.4.7-17.el5
kernel-2.6.18-92.1.18.el5

Anyone have any ideas why pvs shows the DevSize of 1.09TB?

--Greg

-- 
----------------------------------------------------------------------
Greg Varga
Systems Engineer & Development


Skyway West
  Phone: (604) 482-1128
  Email: gvarga@skywaywest.com
  WebSite: www.skywaywest.com
----------------------------------------------------------------------

This communication contains confidential information intended only
for the person to whom it is addressed.  Any unauthorized disclosure,
copying, other distribution of this communication or taking any action
on its contents is strictly prohibited. If you have received this
message in error, please notify immediately and delete this message
without reading, copying or forwarding it to anyone.
