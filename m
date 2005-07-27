Received: from aeon.coker.com.au (sebastian-int.corp.redhat.com
	[172.16.52.221])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6RBWeV07088
	for <linux-lvm@redhat.com>; Wed, 27 Jul 2005 07:32:40 -0400
From: Russell Coker <russell@coker.com.au>
Date: Wed, 27 Jul 2005 21:32:34 +1000
References: <42E4B322.6070600@dsvr.co.uk>
	<200507252245.13317.russell@coker.com.au>
	<42E76159.5050808@dsvr.co.uk>
In-Reply-To: <42E76159.5050808@dsvr.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200507272132.37423.russell@coker.com.au>
Subject: [linux-lvm] Re: Linux LVM snmp MIB.
Reply-To: russell@coker.com.au,
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
To: Ceri Storey <ceri.storey@dsvr.co.uk>
Cc: linux-lvm@redhat.com

On Wednesday 27 July 2005 20:26, Ceri Storey <ceri.storey@dsvr.co.uk> wrote:
> Here's a preliminary suggestion (LVM standing for 1.3.6.1.4.1.9586.100.1)
> NAME
> LVM.physicalVolume			LVM.1
> LVM.volumeGroup				LVM.2
> LVM.volumeGroup.groupName		LVM.2.1
> LVM.volumeGroup.extentSize		LVM.2.2		The size of each extent in bytes
> LVM.volumeGroup.extentCount		LVM.2.3
> LVM.volumeGroup.extentFree		LVM.2.4
> LVM.volumeGroup.writable		LVM.2.5
> LVM.volumeGroup.resizeable		LVM.2.6
> LVM.volumeGroup.exported		LVM.2.7
> LVM.volumeGroup.partial			LVM.2.8
> LVM.logicalVolume			LVM.3		A table of devices
> LVM.logicalVolume.volumeName		LVM.3.1
> LVM.logicalVolume.volumeGroup		LVM.3.2
> LVM.logicalVolume.extentCount		LVM.3.3		the number of extents in this
> volume LVM.logicalVolume.reads			LVM.3.4		the number of extents in this
> volume LVM.logicalVolume.writes		LVM.3.5		the number of extents in this
> volume
>
> Comments? Suggestions?

I think it would be nicer to have the LV entries under the VG trees.  That's 
the way things are done conceptually.

Also as PVs are assigned to a VG then maybe we should have the PV entries for 
assigned PVs under the VG entries as well and just have a separate tree for 
unassigned PVs.

But your design will work.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page
