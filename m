Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2TBYGrf013392
	for <linux-lvm@redhat.com>; Sat, 29 Mar 2008 07:34:16 -0400
Received: from server.onart.com.tr (dsl.static81214109175.ttnet.net.tr
	[81.214.109.175] (may be forged))
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2TBY1GW026578
	for <linux-lvm@redhat.com>; Sat, 29 Mar 2008 07:34:05 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by server.onart.com.tr (Postfix) with ESMTP id 54F1656FC1B2
	for <linux-lvm@redhat.com>; Sat, 29 Mar 2008 13:29:47 +0200 (EET)
Received: from server.onart.com.tr ([127.0.0.1])
	by localhost (server.onart.com.tr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 94qfezePkGGx for <linux-lvm@redhat.com>;
	Sat, 29 Mar 2008 13:29:45 +0200 (EET)
Received: from [10.0.0.12] (unknown [10.0.0.12])
	(using SSLv3 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server.onart.com.tr (Postfix) with ESMTP id 8D7F356FC1B1
	for <linux-lvm@redhat.com>; Sat, 29 Mar 2008 13:29:45 +0200 (EET)
Message-ID: <47EE2926.3020201@onart.com.tr>
Date: Sat, 29 Mar 2008 13:33:58 +0200
From: Mufit Eribol <hme@onart.com.tr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problem with partition table on LV
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

Hello,

After loosing all the data on my production server by issuing wrong lvm 
commands in restoring the logical volume, I have worked for weeks to 
setup my server again from scratch up. Now, today I noticed another 
problem, but scared to death to touch it.

This time I have to ask you before issuing any commands as obviously I 
haven't learned LVM internals.

Please find the details below. I would appreciate any help.

Thanks,
Mufit

Problem:
The system works but fdisk -l gives the following error:

[root@server ~]# fdisk -l
...
    Device Boot      Start         End      Blocks   Id  System

Disk /dev/sdc: 799.9 GB, 799937658880 bytes
255 heads, 63 sectors/track, 97253 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

Disk /dev/sdc doesn't contain a valid partition table

Specs:
RHEL 5.1

/dev/sdc is a hardware raid array

/dev/raid_vg0/raid_lv0 -> /dev/mapper/raid_vg0-raid_lv0

[root@server ~]vi /etc/fstab
...
/dev/raid_vg0/raid_lv0  /mnt/raid               ext3    defaults        0 0

[root@server ~]# pvdisplay
  --- Physical volume ---
  PV Name               /dev/sdc
  VG Name               raid_vg0
  PV Size               745.00 GB / not usable 27.67 MB
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              23839
  Free PE               15
  Allocated PE          23824
  PV UUID               cyjzuJ-34VJ-l1S6-5Wcj-Qtw7-8Zcb-TR36bV

[root@server ~]# vgdisplay
  --- Volume group ---
  VG Name               raid_vg0
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  6
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               1
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               744.97 GB
  PE Size               32.00 MB
  Total PE              23839
  Alloc PE / Size       23824 / 744.50 GB
  Free  PE / Size       15 / 480.00 MB
  VG UUID               8XRQX4-g3bN-yaRB-RAG4-9qpx-7uXJ-p7VxYS

[root@server ~]# lvdisplay
  --- Logical volume ---
  LV Name                /dev/raid_vg0/raid_lv0
  VG Name                raid_vg0
  LV UUID                bYKncb-bUAW-FkFn-rYUr-O7RI-KL3y-18R0Oc
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                744.50 GB
  Current LE             23824
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:0

[root@server ~]# pvscan
  PV /dev/sdc   VG raid_vg0   lvm2 [744.97 GB / 480.00 MB free]
  Total: 1 [744.97 GB] / in use: 1 [744.97 GB] / in no VG: 0 [0   ]

[root@server ~]# vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "raid_vg0" using metadata type lvm2

[root@server ~]# lvscan
  ACTIVE            '/dev/raid_vg0/raid_lv0' [744.50 GB] inherit
