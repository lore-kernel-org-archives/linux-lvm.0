Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBFMGjlZ017023
	for <linux-lvm@redhat.com>; Mon, 15 Dec 2008 17:16:45 -0500
Received: from email.skywaywest.net (tweedledee.skywaywest.net
	[216.251.128.22])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBFMG2Em015167
	for <linux-lvm@redhat.com>; Mon, 15 Dec 2008 17:16:02 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by email.skywaywest.net (Postfix) with ESMTP id D47758B6810
	for <linux-lvm@redhat.com>; Mon, 15 Dec 2008 14:16:01 -0800 (PST)
Received: from email.skywaywest.net ([127.0.0.1])
	by localhost (tweedledee.skywaywest.net [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id Hcwr69wZkh1M for <linux-lvm@redhat.com>;
	Mon, 15 Dec 2008 14:16:01 -0800 (PST)
Received: from [192.168.1.25] (unknown [216.251.146.74])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by email.skywaywest.net (Postfix) with ESMTP id 98AEA8B681D
	for <linux-lvm@redhat.com>; Mon, 15 Dec 2008 14:16:01 -0800 (PST)
Message-ID: <4946D71F.30806@skywaywest.com>
Date: Mon, 15 Dec 2008 15:15:59 -0700
From: Greg Varga <gvarga@skywaywest.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Large disk problem with LVM2...
References: <4946B2B8.2000801@skywaywest.com>
In-Reply-To: <4946B2B8.2000801@skywaywest.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Another note about this...

I am able to create about a 40G logical volume but anything above 50G 
fails with the below error. (Which makes sense because DevSize is 
reporting that it only has 0.04 TB left.

Thanks,
  --Greg

Greg Varga wrote:
> I have a 3.09TB Hardware Raid 5 drive setup with, and I have already
> used about 1TB worth of space on the volume group.
>
> Today I tried to add another 500GB logical volume and it failed with:
>
> [root@bill ~]# lvcreate -L500G -ntest VolGroup01
>  device-mapper: reload ioctl failed: Invalid argument
>  Aborting. Failed to activate new LV to wipe the start of it.
>
>
> dmesg shows this:
>
> device-mapper: table: device 8:3 too small for target
> device-mapper: table: 253:7: linear: dm-linear: Device lookup failed
> device-mapper: ioctl: error adding target to table
>
>
> I have googled for the message and have read to run pvs like:
>
> [root@bill ~]# pvs -o +dev_size
>  PV         VG         Fmt  Attr PSize  PFree DevSize
>  /dev/sda2  VolGroup00 lvm2 a-   99.97G    0  100.00G
>  /dev/sda3  VolGroup01 lvm2 a-    3.09T 2.05T   1.09T
>
>
> So my question is, how do I fix this?  I'm running the most current
> (CentOS 5.2) versions of Device-Mapper and LVM and Kernel:
>
> lvm2-2.02.32-4.el5_2.1
> lvm2-cluster-2.02.32-4.el5
> device-mapper-1.02.24-1.el5
> device-mapper-event-1.02.24-1.el5
> device-mapper-multipath-0.4.7-17.el5
> kernel-2.6.18-92.1.18.el5
>
> Anyone have any ideas why pvs shows the DevSize of 1.09TB?
>
> --Greg
>

-- 
----------------------------------------------------------------------
Greg Varga
Systems Engineer & Development

[ LPIC-1&2 | CCNA | MCSE | MCSA | VCP-3 ]
[ VoIP Specialist | Virtualization Specialist ]


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
