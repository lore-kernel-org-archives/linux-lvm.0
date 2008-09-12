Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8C7GhCB015965
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2008 03:16:43 -0400
Received: from yw-out-2324.google.com (yw-out-2324.google.com [74.125.46.28])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8C7GXhS017446
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2008 03:16:33 -0400
Received: by yw-out-2324.google.com with SMTP id 5so254598ywb.81
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2008 00:16:33 -0700 (PDT)
Message-ID: <fbe022af0809120016l13bee5ak957d8e3084dcdac2@mail.gmail.com>
Date: Fri, 12 Sep 2008 00:16:32 -0700
From: Vikas <kedia.vikas@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Cannot create a logical volume
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

Objective: Be able to take snapshots of XEN disk images for backup.

Problem: lvcreate is failing

The environment:

[root@localhost ~]# pvscan
  PV /dev/md3   VG gt_vg   lvm2 [909.91 GB / 909.91 GB free]
  Total: 1 [909.91 GB] / in use: 1 [909.91 GB] / in no VG: 0 [0   ]

[root@localhost ~]# vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "gt_vg" using metadata type lvm2

[root@localhost ~]# vgdisplay gt_vg
  --- Volume group ---
  VG Name               gt_vg
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  7
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               909.91 GB
  PE Size               32.00 MB
  Total PE              29117
  Alloc PE / Size       0 / 0
  Free  PE / Size       29117 / 909.91 GB
  VG UUID               j4aEP0-PCwG-Qyub-DCxw-aVVp-VyCK-EkZUsN

[root@localhost ~]# lvcreate -L 5G -n data gt_vg
  Not enough PVs with free space available for parallel allocation.
  Consider --alloc anywhere if desperate.

Any feedback would be very much appreciated,

Thanks for your time,

-- 
Vikas
