Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBM56w125363
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 00:06:58 -0500
Received: from highlab.com (ecae158-153-dhcp.colorado.edu [128.138.158.153])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBM56qBo012081
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 00:06:52 -0500
Date: Wed, 21 Dec 2005 22:07:15 -0700
From: Sebastian Kuzminsky <seb@highlab.com>
Message-Id: <E1EpIfb-0001e2-GR@highlab.com>
Subject: [linux-lvm] more info on the hang with 2.6.15-rc5
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-raid@vger.kernel.org, linux-lvm@redhat.com

Now it works, but I dont trust it one bit.

I had been seeing almost immediate, perfectly repeatable hard lockups
in 2.6.15-rc5 and 2.6.15-rc5-mm3, when using sata_mv, RAID, and LVM
together.  Nothing in the syslog or on the console, and the system is
totally unresponsive to the keyboard & network.

My hardware setup is: four Seagate Barracuda 500 GB disks, on a Marvell
MV88SX6081 8-port SATA-II PCI-X controller, on a PCI-X bus (64/66).

The disks work great when accessed directly.  They work great when used
as four PVs for LVM, and when assembled into a 4-disk RAID-6.

But when I make a RAID-6 array out of them, and use the array as a PV,
the system would hang completely, within seconds.  (This is with LVM
2.02.01, libdevicemapper 1.02.02, and dm-driver 4.5.0.)

I turned on all the debugging options in the kernel config hoping to get
some insight, but this "debug" kernel doesnt crash.  It's running fine,
and I'm pounding on it.  A timing problem in the interaction between
LVM and RAID?  Some kind of wierd heisenbug....


I'd be happy to do any debugging tests people suggest.


-- 
Sebastian Kuzminsky
