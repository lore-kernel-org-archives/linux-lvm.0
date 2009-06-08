Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n58FmM3A023319
	for <linux-lvm@redhat.com>; Mon, 8 Jun 2009 11:48:22 -0400
Received: from smtp.l00-bugdead-prods.de
	(cpe-000024c3891c.ip-pool.rftonline.net [212.37.172.123])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n58Fm7D0027475
	for <linux-lvm@redhat.com>; Mon, 8 Jun 2009 11:48:08 -0400
Received: from localhost (localhost.ds9 [127.0.0.1])
	by smtp.l00-bugdead-prods.de (Postfix) with ESMTP id 86B36A4DB5
	for <linux-lvm@redhat.com>; Mon,  8 Jun 2009 17:48:05 +0200 (CEST)
Received: from smtp.l00-bugdead-prods.de ([127.0.0.1])
	by localhost (communicator.ds9 [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DB+BRWpu1333 for <linux-lvm@redhat.com>;
	Mon,  8 Jun 2009 17:47:42 +0200 (CEST)
Received: from sre (unknown [194.25.44.218])
	by smtp.l00-bugdead-prods.de (Postfix) with ESMTPS id 36AFFA4DB1
	for <linux-lvm@redhat.com>; Mon,  8 Jun 2009 17:47:42 +0200 (CEST)
From: Sebastian Reitenbach <sebastia@l00-bugdead-prods.de>
Date: Mon, 8 Jun 2009 17:48:01 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200906081748.01937.sebastia@l00-bugdead-prods.de>
Subject: [linux-lvm] read only filesystem on LVM device after changing path
	in SAN
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
To: linux-lvm@redhat.com

Hi,

I hope I am right here, if not, please let me know where would be a better 
place to ask. I have observed a problem on LVM based partitions when I change 
the paths through the SAN. 

Here my setup: I have a 3TB partition, coming from a SAN IBM DS4700, the same 
but smaller, for the operating system partition. Both presented to a xen 
host. On the data partition I have a LVM configured. There are four paths 
through the SAN for each of the disks. The host type on the DS4700 for the 
server is configured as LNXCLVMWARE, which as for the documentation should be 
the right one.

# multipath -ll
Pilot-Project-VMs (3600a0b800048b31000000ffd4a10fd7e) dm-1 IBM,1814      FAStT
[size=280G][features=1 queue_if_no_path][hwhandler=1 rdac][rw]
\_ round-robin 0 [prio=2][enabled]
 \_ 4:0:1:0 sdf 8:80  [active][ghost]
 \_ 3:0:1:0 sdg 8:96  [active][ghost]
\_ round-robin 0 [prio=12][active]
 \_ 3:0:0:0 sdb 8:16  [active][ready]
 \_ 4:0:0:0 sdc 8:32  [active][ready]
Pilot-Project-Data (3600a0b800048b31000000fbe49f962e5) dm-3 IBM,1814      
FAStT
[size=3.0T][features=1 queue_if_no_path][hwhandler=1 rdac][rw]
\_ round-robin 0 [prio=2][enabled]
 \_ 4:0:1:1 sdh 8:112 [active][ghost]
 \_ 3:0:1:1 sdi 8:128 [active][ghost]
\_ round-robin 0 [prio=12][enabled]
 \_ 3:0:0:1 sdd 8:48  [active][ready]
 \_ 4:0:0:1 sde 8:64  [active][ready]

When I run a dd copy job, creating a file on the Operating system partition, 
e.g. dd if=7dev/zero of=/data/file then everything seems to be fine. I change 
the path through the SAN via the DS4700 management GUI, and the dd job keeps 
running as expected, so no problem without LVM.
When I do the same on the LVM partition, then after some seconds, after I 
switch the preferred path through the SAN, then the LVM partiton becomes 
read-only, and the dd job dies. Then on the dom0, a 
fdisk -l /dev/mapper/3TB-Partion still shows output, but 
fdisk -l /dev/mapper/3TB--Partion-1 on the LVM device, just shows nothing.
When I then shutdown the xen host, and do a:
/etc/init.d/boot.lvm restart
then fdisk -l /dev/mapper/3TB--Partion-1 on the LVM device, produces output 
again. However, the startup of the xen domU may still spit out errors, and 
the mounting of the device in the domU may still not work. I had to reboot 
the dom0 physical host to get the partition back in a working state. 

I do not have any kind of special configuration for the LVM device, I created 
it via yast2. 

Is there anything what I can do to prevent the LVM based partition to become 
read-only when a path in the SAN switches? 
If I need to provide more information let me know whats needed.

kind regards
Sebastian
