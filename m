Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k05I8I109223
	for <linux-lvm@redhat.com>; Thu, 5 Jan 2006 13:08:18 -0500
Received: from desktopmusicindustry.desktopmusicindustry.com
	(desktopmusicindustry.desktopmusicindustry.com [66.70.153.192])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k05I8BxX010539
	for <linux-lvm@redhat.com>; Thu, 5 Jan 2006 13:08:15 -0500
Received: from support (adsl-69-227-240-142.dsl.pltn13.pacbell.net
	[69.227.240.142]) (authenticated bits=0)
	by desktopmusicindustry.desktopmusicindustry.com (8.12.10/8.12.10) with
	ESMTP id k05I5j2D020000
	for <linux-lvm@redhat.com>; Thu, 5 Jan 2006 10:05:46 -0800
From: "Dan Elder" <dan@absolutelynew.com>
Date: Thu, 5 Jan 2006 10:08:01 -0800
Message-ID: <POEPJKKIACNHGGMFNPNPGEIFGLAA.dan@absolutelynew.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Any way to recover "logical volumes"
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

Hi All, yesterday my main system drive crashed, leaving me with two 400GB
LVM drives with data on them that I need to access. When I run pvscan I get
the following info on a brand new system install with the LVM drives
attached:

 PV /dev/sda1   VG VolGroup00   lvm2 [372.59 GB / 372.59 GB free]
 PV /dev/sdb1   VG VolGroup00   lvm2 [372.59 GB / 372.59 GB free]
 Total: 2 [745.19 GB] / in use: 2 [745.19 GB] / in no VG: 0 [0   ]


so I'm guessing(and hoping) that the data is still there, but I can't figure
out the proper way to access or mount this. The VG says there are 0 logical
volumes, is there a way to add the existing disks to this VG as logical
volumes? I've been reading all of the howto's & forums & haven't found
anything that works yet.

Thanks in advance
