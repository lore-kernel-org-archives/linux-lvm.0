Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8CDt4r09343
	for <linux-lvm@redhat.com>; Sun, 12 Sep 2004 09:55:04 -0400
Received: from office.labsysgrp.com (wsip-68-14-253-125.ph.ph.cox.net
	[68.14.253.125])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i8CDswWh010542
	for <linux-lvm@redhat.com>; Sun, 12 Sep 2004 09:54:58 -0400
Received: from [127.0.0.1] (helo=localhost)
	by office.labsysgrp.com with esmtp (Exim 4.34) id 1C6Uoe-0000PD-Q4
	for linux-lvm@redhat.com; Sun, 12 Sep 2004 06:54:52 -0700
Received: from office.labsysgrp.com ([127.0.0.1])
	by localhost (office.lsg.internal [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 01304-03 for <linux-lvm@redhat.com>;
	Sun, 12 Sep 2004 06:54:51 -0700 (MST)
Received: from jeeves.kpf.internal ([192.168.170.1] helo=jeeves.homelinux.org)
	by office.labsysgrp.com with esmtp (Exim 4.34) id 1C6Uod-0000P7-SF
	for linux-lvm@redhat.com; Sun, 12 Sep 2004 06:54:51 -0700
Received: from [192.168.180.109] (helo=[192.168.180.109])
	by jeeves.homelinux.org with esmtp (Exim 4.05) id 1C6Uoc-0002hH-00
	for linux-lvm@redhat.com; Sun, 12 Sep 2004 06:54:50 -0700
Message-ID: <4144552C.6020904@backtobasicsmgmt.com>
Date: Sun, 12 Sep 2004 06:54:52 -0700
From: "Kevin P. Fleming" <kpfleming@backtobasicsmgmt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM2 tools infinite loop if "sg" driver is loaded
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

I just set up some new systems, and loaded both the "sd" and "sg" 
drivers, so I can access their SCSI disks and the SCSI backplane (with 
monitoring software).

However, I find that if the sg driver is loaded, the LVM2 tools 
(LVM2.2.00.22) get stuck in an infinite loop scanning the /sys hierarchy 
(witnessed using strace):

/sys/block/sda/device/generic/device/generic/device...

Removing the sg driver from the kernel is a workaround, but I'd like to 
be able to add it back at some point.
