Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l717w8rr002273
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2007 03:58:09 -0400
Received: from dubh.id.au ([202.45.122.140])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l717w5Mm006841
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2007 03:58:06 -0400
Date: Wed, 1 Aug 2007 15:27:38 +0800
From: Nigel Duff <nigel-lvm@dubh.id.au>
Message-ID: <20070801072738.GA9466@dubh.id.au>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Missing logical volume
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

Hi,

The following is on an Ubuntu 7.04 server running LVM2 that I have remote access to. I
have put the output of vgscan, vgdisplay etc, various logs and a copy the
archive and backup directories at http://www.dubh.id.au/lvm/ with more
details of the problem in 00-notes. 

I had a lvm volume that held a cryptsetup encrypted volume[1]. The server was
rebooted without unmounting the encrypted volume. On reboot the lvm volume
wasn't present in /dev/mapper.

Vgdisplay displayed an error saying something similar to "UUID
Z1tlHa-60OU-iymQ-nQJu-z9OD-abno-PkxUC5 not found" (sorry the original error
wasn't recorded, but the UUID string is correct).

At the time it was noted that the boot order of the drives had changed and
was thought we were just missing a small partition off one of the disks.
'vgreduce --removemissing lvm_vol_grp_1' was run. This stopped the error
from occurring but the volume still wasn't present in /dev/mapper.

We have since realised that one of the drives (/dev/sdd) isn't being
recognised on boot. All other drives and partitions are shown correctly in
the output of pvscan.

Would someone be able to please look at the information provided and point
me in the direction of a solution. 

Many thanks,

Nigel

[1] I mention this in case cryptsetup is somehow involved.

Here is the output from various scans;

vgscan:
    Logging initialised at Wed Aug  1 15:19:05 2007

        Set umask to 0077
	vgscan    Wiping cache of LVM-capable devices
	vgscan    Wiping internal VG cache
	vgscan  Reading all physical volumes.  This may take a while...
	vgscan    Finding all volume groups
	vgscan    Finding volume group "lvm_vol_grp_1"
	vgscan  Found volume group "lvm_vol_grp_1" using metadata type lvm2
	vgscan    Wiping internal VG cache

lvscan:
    Logging initialised at Wed Aug  1 15:19:20 2007

        Set umask to 0077
	lvscan    Finding all logical volumes
	lvscan    Wiping internal VG cache

pvscan:
  Logging initialised at Wed Aug  1 15:19:45 2007

  Set umask to 0077
  pvscan    Wiping cache of LVM-capable devices
  pvscan    Wiping internal VG cache
  pvscan    Walking through all physical volumes
  pvscan  PV /dev/hde    VG lvm_vol_grp_1   lvm2 [465.76 GB / 465.76 GB free]
  pvscan  PV /dev/hdg    VG lvm_vol_grp_1   lvm2 [465.76 GB / 465.76 GB free]
  pvscan  PV /dev/hdi    VG lvm_vol_grp_1   lvm2 [465.76 GB / 465.76 GB free]
  pvscan  PV /dev/hdk    VG lvm_vol_grp_1   lvm2 [465.76 GB / 465.76 GB free]
  pvscan  PV /dev/hdm    VG lvm_vol_grp_1   lvm2 [298.09 GB / 298.09 GB free]
  pvscan  PV /dev/hdo    VG lvm_vol_grp_1   lvm2 [465.76 GB / 465.76 GB free]
  pvscan  PV /dev/hdq    VG lvm_vol_grp_1   lvm2 [298.09 GB / 298.09 GB free]
  pvscan  PV /dev/hds    VG lvm_vol_grp_1   lvm2 [298.09 GB / 298.09 GB free]
  pvscan  PV /dev/sdc    VG lvm_vol_grp_1   lvm2 [465.76 GB / 465.76 GB free]
  pvscan  PV /dev/sda    VG lvm_vol_grp_1   lvm2 [465.76 GB / 465.76 GB free]
  pvscan  PV /dev/sdb3   VG lvm_vol_grp_1   lvm2 [287.83 GB / 287.83 GB free]
  pvscan  Total: 11 [4.34 TB] / in use: 11 [4.34 TB] / in no VG: 0 [0 ] 
  pvscan Wiping internal VG cache
	
