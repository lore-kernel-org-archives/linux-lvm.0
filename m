Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAQHuRr15302
	for <linux-lvm@redhat.com>; Fri, 26 Nov 2004 12:56:27 -0500
Received: from office.labsysgrp.com (wsip-68-14-253-125.ph.ph.cox.net
	[68.14.253.125])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAQHuL2x028003
	for <linux-lvm@redhat.com>; Fri, 26 Nov 2004 12:56:22 -0500
Received: from [127.0.0.1] (helo=localhost)
	by office.labsysgrp.com with esmtp (Exim 4.34) id 1CXkKO-0006nD-AD
	for linux-lvm@redhat.com; Fri, 26 Nov 2004 10:56:16 -0700
Received: from office.labsysgrp.com ([127.0.0.1])
	by localhost (office.lsg.internal [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26096-01 for <linux-lvm@redhat.com>;
	Fri, 26 Nov 2004 10:56:15 -0700 (MST)
Received: from jeeves.kpf.internal ([192.168.170.1] helo=jeeves.homelinux.org)
	by office.labsysgrp.com with esmtp (Exim 4.34) id 1CXkKN-0006n8-F9
	for linux-lvm@redhat.com; Fri, 26 Nov 2004 10:56:15 -0700
Received: from [192.168.172.107] (helo=[192.168.172.107])
	by jeeves.homelinux.org with esmtp (Exim 4.05) id 1CXkKM-0002yb-00
	for linux-lvm@redhat.com; Fri, 26 Nov 2004 10:56:14 -0700
Message-ID: <41A76E48.3060308@backtobasicsmgmt.com>
Date: Fri, 26 Nov 2004 10:56:24 -0700
From: "Kevin P. Fleming" <kpfleming@backtobasicsmgmt.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] problem with LVM and fstab...bug?
References: <6E9EA468-3F7D-11D9-8E13-003065F94C4C@static.net>
In-Reply-To: <6E9EA468-3F7D-11D9-8E13-003065F94C4C@static.net>
Content-Transfer-Encoding: 7bit
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

Armen Babikyan wrote:

> After this, both drives are mounted:
> 
> # df
> Filesystem           1K-blocks      Used Available Use% Mounted on
> [my other partitions]
> /dev/mapper/vg0-www   30237648  10572760  18128888  37% /www
> /dev/mapper/vg0-uml   10079084    945240   8621844  10% /uml

Please show us the contents of your /proc/mounts after successfully 
mounting them... I suspect your vg0-www does not contain an ext3 
filesystem (but is instead ext2 or some other type), even though you 
think it does.
